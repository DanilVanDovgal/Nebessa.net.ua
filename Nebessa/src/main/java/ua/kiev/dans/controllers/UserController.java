package ua.kiev.dans.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import ua.kiev.dans.model.Album;
import ua.kiev.dans.model.CustomUser;
import ua.kiev.dans.model.Storage;
import ua.kiev.dans.services.AlbumService;
import ua.kiev.dans.services.CustomUserService;
import ua.kiev.dans.services.DataContainerService;
import java.util.List;


@Controller
public class UserController {

    static final int ITEMS_PER_PAGE = 5;

    @Autowired
    private CustomUserService userService;

    @Autowired
    private AlbumService albumService;

    @Autowired
    private DataContainerService dataService;

    @RequestMapping("/")
    public String index(Model model) {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if(principal instanceof UserDetails) {
            model.addAttribute("email", true);
            return "index";
        }
        else
            return "index";
    }
    @RequestMapping("/login")
    public String login() {
        return "login";
    }

    @RequestMapping("/register")
    public String register() {
        return "register";
    }

    @RequestMapping("/unauthorized")
    public String unauthorized(Model model) {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        model.addAttribute("email", user.getUsername());
        return "unauthorized";
    }

    @RequestMapping(value = "/newUser", method = RequestMethod.POST)
    public String newUser(@RequestParam String email,
                          @RequestParam String login,
                          @RequestParam String password,
                          Model model) {
        return userService.addUserIfNotExists(email, login, password, Storage.MAX_SPACE, model);
    }

    @RequestMapping("/myCabinet")
    public String myCabinet(Model model) {
        CustomUser customUser = getUser();
        long usedSpace = usingSpace(customUser.getId());
        model.addAttribute("login", customUser.getLogin());
        model.addAttribute("percent", (long) (usedSpace * 1.0 / customUser.getMaxMemory() * 100));
        model.addAttribute("usingSpace", usedSpace / 1024 / 1024);
        model.addAttribute("freeSpace", (customUser.getMaxMemory() - usedSpace) / 1024 / 1024);
        return "myCabinet";
    }

    @RequestMapping("/myProfile")
    public String myProfile(Model model) {
        CustomUser customUser = getUser();
        model.addAttribute("user", customUser);
        return "myProfile";
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String update(@RequestParam(required = false) String firstName,
                         @RequestParam(required = false) String lastName,
                         @RequestParam(required = false) String birthday,
                         @RequestParam(required = false) String phone) {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String email = user.getUsername();
        userService.getByEmailAndUpdate(email, firstName, lastName, birthday, phone);

        return "redirect:/myProfile";
    }

    @RequestMapping(value = "/update/date")
    public String updateDate() {
        CustomUser customUser = getUser();
        customUser.setBirthDate(null);
        userService.updateUser(customUser);
        return "redirect:/myProfile";
    }

    @RequestMapping("/admin")
    public String admin(Model model, @RequestParam(required = false, defaultValue = "0") Integer pages){
        if(pages < 0)
            pages = 0;
        List<CustomUser> allUser = userService.getAllUsers(new PageRequest(pages, ITEMS_PER_PAGE, Sort.Direction.ASC, "id"));
        model.addAttribute("users", allUser);
        model.addAttribute("pages", getPageCount());
        return "admin";
    }

    @RequestMapping("/admin/statistics")
    public String statistics(Model model){
        model.addAttribute("users", userService.countAll());
        model.addAttribute("albums", albumService.countAllAlbums());
        Long totalUsingSpace = dataService.sumSize();
        model.addAttribute("usingSpace", totalUsingSpace / 1024 / 1024);
        return "statistics";
    }

    private CustomUser getUser() {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String email = user.getUsername();
        return userService.getUserByEmail(email);
    }

    private long usingSpace(long userId) {
        List<Album> albumList = albumService.getAllAlbum(userId, null);
        return albumList.stream()
                        .mapToLong(a -> dataService.sumSizeByAlbumId(a.getId()))
                        .sum();
    }

    private long getPageCount() {
        long totalCount = userService.countAll();
        return (totalCount / ITEMS_PER_PAGE) + ((totalCount % ITEMS_PER_PAGE > 0) ? 1 : 0);
    }
}
