package vn.hoidanit.laptopshop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import vn.hoidanit.laptopshop.service.UserService;

@RestController
public class UserController {

    UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    // lam sao de tim ra duoc method nay ? -> @Getmapping
    @GetMapping("/")
    public String getHomePage() {
        return this.userService.handleHello();
    }
}
