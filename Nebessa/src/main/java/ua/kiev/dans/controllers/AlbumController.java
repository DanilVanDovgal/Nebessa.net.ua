package ua.kiev.dans.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import ua.kiev.dans.model.Album;
import ua.kiev.dans.model.CustomUser;
import ua.kiev.dans.model.DataContainer;
import ua.kiev.dans.services.AlbumService;
import ua.kiev.dans.services.CustomUserService;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.sql.Date;
import java.util.List;
import java.util.stream.Collectors;

@Controller
public class AlbumController {

    static final int ITEMS_PER_PAGE = 5;

    @Autowired
    private AlbumService albumService;

    @Autowired
    private CustomUserService userService;

    @RequestMapping("/albums")
    public String listAlbums(Model model, @RequestParam(required = false, defaultValue = "0") Integer page) {
        CustomUser customUser = getUser();
        if(page < 0)
            page = 0;
        List<Album> albumList = albumService.getAllAlbum(customUser.getId(),
                new PageRequest(page, ITEMS_PER_PAGE, Sort.Direction.ASC, "id"));
        model.addAttribute("albums", albumList);
        model.addAttribute("allPages", getPageCount(customUser.getId()));
        return "listAlbums";
    }

    @RequestMapping(value = "/newAlbum", method = RequestMethod.POST)
    public String addAlbum(@RequestParam String name, @RequestParam(required = false) String note) {
        CustomUser customUser = getUser();
        String storagePath = customUser.getStoragePath();
        long time = System.currentTimeMillis();
        File albumFolder = new File(storagePath + "/" + time);
        albumFolder.mkdir();
        Album album = new Album(name, new Date(time), note, customUser, albumFolder.getPath());
        albumService.addAlbum(album);
        return "redirect:/albums";
    }

    @RequestMapping("/albumAddPage")
    public String albumAddPage() {
        return "albumAddPage";
    }

    @RequestMapping(value = "/album/delete", method = RequestMethod.POST)
    public ResponseEntity<Void> deleteAlbum(@RequestParam(value = "toDelete[]", required = false) long delete[]) throws IOException {
        if(delete != null) {
            Album a;
            for(long i : delete) {
                a = albumService.getAlbumById(i);
                deletePhotoByAlbum(a);
                Files.delete(new File(a.getAlbumPath()).toPath());
                albumService.delAlbum(i);
            }
        }
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @RequestMapping(value = "/search", method = RequestMethod.POST)
    public String search(Model model, @RequestParam String pattern) {
        CustomUser user = getUser();
        List<Album> albumList = user.getAlbumList().stream()
                                    .filter(a -> a.getName().toLowerCase().contains(pattern.toLowerCase()))
                                    .collect(Collectors.toList());
        model.addAttribute("albums", albumList);
        return "listAlbums";
    }

    private CustomUser getUser() {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String email = user.getUsername();
        return userService.getUserByEmail(email);
    }

    private long getPageCount(long id) {
        long totalCount = albumService.countAlbumByUserId(id);
        return (totalCount / ITEMS_PER_PAGE) + ((totalCount % ITEMS_PER_PAGE > 0) ? 1 : 0);
    }

    private void deletePhotoByAlbum(Album a) throws IOException {
        List<DataContainer> photoList = a.getFileList();
        if(photoList.size() > 0) {
            for (DataContainer b : photoList) {
                Files.delete(new File(b.getPath()).toPath());
            }
        }
    }
}
