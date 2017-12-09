package ua.kiev.dans.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import ua.kiev.dans.services.GroupService;

@Controller
public class GroupController {

    @Autowired
    private GroupService groupService;

    @RequestMapping("/globalGroup")
    public String globalGroup() {
        return "globalGroup";
    }
}
