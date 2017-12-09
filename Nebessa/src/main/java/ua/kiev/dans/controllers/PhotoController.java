package ua.kiev.dans.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import ua.kiev.dans.Exceptions.AlbumNotFoundException;
import ua.kiev.dans.Exceptions.OrderNotFoundException;
import ua.kiev.dans.Exceptions.PhotoErrorException;
import ua.kiev.dans.Exceptions.PhotoNotFoundException;
import ua.kiev.dans.model.Album;
import ua.kiev.dans.model.CustomUser;
import ua.kiev.dans.model.DataContainer;
import ua.kiev.dans.services.AlbumService;
import ua.kiev.dans.services.CustomUserService;
import ua.kiev.dans.services.DataContainerService;
import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

@Controller
public class PhotoController {

    static final int ITEMS_PER_PAGE = 12;

    @Autowired
    private DataContainerService dataService;

    @Autowired
    private AlbumService albumService;

    @Autowired
    private CustomUserService userService;

    @RequestMapping("/photoAddPage/{albumId}")
    public String addPhotoPage(@PathVariable long albumId,
                               Model model,
                               @RequestParam(required = false) boolean full) {
        CustomUser user = getUser();
        Album album = albumService.getAlbumById(albumId);
        if(album == null || !album.getUser().getId().equals(user.getId()))
            throw new OrderNotFoundException();
        if(full)
            model.addAttribute("full", true);
        return "addPhoto";
    }

    @RequestMapping(value = "/addPhoto/{albumId}", method = RequestMethod.POST)
    public String onAddPhoto(@RequestParam MultipartFile photo[],
                             @PathVariable long albumId, Model model) {
        try {
            if(photo.length == 0)
                throw new PhotoErrorException();
            Album album = albumService.getAlbumById(albumId);
            if(album == null)
                throw new AlbumNotFoundException();
            DataContainer data;

            long size = 0;
            for(MultipartFile f : photo)
                size += f.getSize();
            CustomUser user = getUser();
            if(usingSpace(user.getId()) + size > user.getMaxMemory()) {
                model.addAttribute("full", true);
                return "redirect:/photoAddPage/" + albumId;
            }

            for(MultipartFile f : photo) {
                if(f.isEmpty())
                    throw new PhotoErrorException();
                long time = System.currentTimeMillis();
                String fileName = time + "_" + getFileName(f);
                String path = album.getAlbumPath() + "/" + fileName;

                try(FileOutputStream out = new FileOutputStream(path)) {
                    out.write(f.getBytes());
                }

                data = new DataContainer(fileName, path, album, f.getSize());
                dataService.addPhoto(data);
            }
        } catch (Exception e) {
            throw new PhotoErrorException();
        }
        return "redirect:/albums";
    }

    @RequestMapping(value = "/photo/delete", method = RequestMethod.POST)
    public ResponseEntity<Void> delete(@RequestParam(value = "toCheck[]", required = false) long id[]) throws IOException {
        if(id != null) {
            List<File> listFile = new ArrayList<>();
            for(long i : id) {
                listFile.add(new File(dataService.getDataContainerById(i).getPath()));
                dataService.deleteDataContainerById(i);
            }
            for (File f : listFile)
                Files.delete(f.toPath());
        }
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @RequestMapping("/gallery/{albumId}")
    public String gallery(@PathVariable long albumId,
                          Model model,
                          @RequestParam(required = false, defaultValue = "0") Integer page) {
        CustomUser user = getUser();
        Album album = albumService.getAlbumById(albumId);
        if(album == null || !album.getUser().getId().equals(user.getId()))
            throw new OrderNotFoundException();

        if(page < 0)
            page = 0;

        List<DataContainer> listPhoto = dataService.getAllByAlbum_Id(albumId,
                new PageRequest(page, ITEMS_PER_PAGE, Sort.Direction.ASC, "id"));
        model.addAttribute("listPhoto", listPhoto);
        model.addAttribute("albumId", albumId);
        model.addAttribute("allPages", getPageCount(albumId));
        return "gallery";
    }

    @RequestMapping("/photo/{photo_id}")
    public ResponseEntity<byte[]> onPhoto(@PathVariable("photo_id") long id) {
        return photoById(id);
    }

    @RequestMapping(value = "/photo/zip", method = RequestMethod.POST)
    public String zipPhoto(@RequestParam(value = "toCheck[]", required = false) long[] id,
                           Model model) throws IOException {
        if(id != null) {
            File file = new File("/var/www/nebessa/nebessa.net.ua/Zip/" + System.nanoTime() + ".zip");
            try (ZipOutputStream zos = new ZipOutputStream(new FileOutputStream(file))) {
                for (long i : id) {
                    DataContainer photo = dataService.getDataContainerById(i);
                    zos.putNextEntry(new ZipEntry(photo.getFileName()));
                    zos.write(photo.getData());
                    zos.closeEntry();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
            model.addAttribute("zipFile", file.getAbsolutePath());
            return "zip";
        }
        return "redirect:/";
    }

    @RequestMapping(value = "/downloads", method = RequestMethod.GET)
    public ResponseEntity<ByteArrayResource> download(@RequestParam(value = "file") String file) throws IOException {
        Path path = Paths.get(file);
        byte data[] = Files.readAllBytes(path);
        ByteArrayResource resource = new ByteArrayResource(data);
        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment;filename=" + path.getFileName().toString())
                .contentType(MediaType.parseMediaType("application/zip")).contentLength(data.length)
                .body(resource);
    }

    @RequestMapping(value = "/zip")
    public String zipPage(@RequestParam(required = false) String file, Model model) {
        model.addAttribute("zipFile", file);
        return "zip";
    }

    private static String getFileName(MultipartFile file) {
        String path = file.getOriginalFilename();
        return path.substring(path.lastIndexOf("/") + 1);
    }

    private ResponseEntity<byte[]> photoById(long id) {
        DataContainer photo = dataService.getDataContainerById(id);
        byte[] media;

        try(FileInputStream fis = new FileInputStream(photo.getPath())) {
            media = org.apache.commons.io.IOUtils.toByteArray(fis);
        } catch (IOException ex) {
            throw new PhotoNotFoundException();
        }

        HttpHeaders headers = new HttpHeaders();
        String fileName = photo.getFileName();

        if(fileName.endsWith("jpg"))
            headers.setContentType(MediaType.IMAGE_JPEG);
        else if(fileName.endsWith("png"))
            headers.setContentType(MediaType.IMAGE_PNG);
        else if(fileName.endsWith("gif"))
            headers.setContentType(MediaType.IMAGE_GIF);

        return new ResponseEntity<>(media, headers, HttpStatus.OK);
    }

    private CustomUser getUser() {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String email = user.getUsername();
        return userService.getUserByEmail(email);
    }

    private long getPageCount(long id) {
        long totalCount = dataService.countAllByAlbum_Id(id);
        return (totalCount / ITEMS_PER_PAGE) + ((totalCount % ITEMS_PER_PAGE > 0) ? 1 : 0);
    }

    private long usingSpace(long userId) {
        List<Album> albumList = albumService.getAllAlbum(userId, null);
        return albumList.stream()
                        .mapToLong(a -> dataService.sumSizeByAlbumId(a.getId()))
                        .sum();
    }
}
