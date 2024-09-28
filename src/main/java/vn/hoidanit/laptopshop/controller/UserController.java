package vn.hoidanit.laptopshop.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.service.UserService;

@Controller

public class UserController {
    UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping()
    public String HelloUser(Model model) {
        return "index";
    }

    @RequestMapping("/admin/user")
    public String getUser(Model model) {
        List<User> users = userService.getAllUsers();
        model.addAttribute("users", users);
        return "admin/user/user";
    }

    // show module
    @RequestMapping("/admin/user/{id}")
    public String getDetailUser(@PathVariable Long id, Model model) {
        User userDetail = userService.getUserById(id);
        model.addAttribute("userDetail", userDetail);
        return "admin/user/detail";
    }

    // create module
    @RequestMapping(value = "/admin/user/create", method = RequestMethod.GET)
    public String getCreateUser(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    @RequestMapping(value = "/admin/user/create", method = RequestMethod.POST)
    public String handleCreateUser(Model model, @ModelAttribute("newUser") User newUser) {
        userService.handleSaveUser(newUser);
        return "redirect:/admin/user";
    }

    // update module
    @RequestMapping(value = "/admin/user/update/{id}", method = RequestMethod.GET)
    public String getUpdateUser(Model model, @PathVariable Long id) {
        User user = userService.getUserById(id);
        System.out.println(user);
        model.addAttribute("user", user);
        return "admin/user/update";
    }

    @RequestMapping(value = "/admin/user/update", method = RequestMethod.POST)
    public String handleUpdateUser(Model model, @ModelAttribute("user") User user) {
        User currentUser = userService.handleUpdateUser(user);
        System.out.println(currentUser);
        return "redirect:/admin/user";
    }
}
