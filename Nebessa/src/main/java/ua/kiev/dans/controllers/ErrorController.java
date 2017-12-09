package ua.kiev.dans.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;

@Controller
public class ErrorController {

    @ExceptionHandler(Exception.class)
    public String error(Exception e, Model model) {
        String error = e.getMessage();
        model.addAttribute("message", error);
        return "error";
    }
}
