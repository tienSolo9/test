package vn.hoidanit.laptopshop.controller.admin;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;
import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.service.UploadFileService;
import vn.hoidanit.laptopshop.service.UserService;

@Controller

public class UserController {
    private final UserService userService;
    private final UploadFileService uploadFileService;

    public UserController(UserService userService,
            UploadFileService uploadFileService) {
        this.userService = userService;
        this.uploadFileService = uploadFileService;

    }

    @GetMapping("/admin/user")
    public String getUser(Model model) {
        List<User> users = userService.getAllUsers();
        model.addAttribute("users", users);
        return "admin/user/user";
    }

    // show module
    @GetMapping("/admin/user/{id}")
    public String getDetailUser(@PathVariable long id, Model model) {
        User userDetail = userService.getUserById(id);
        model.addAttribute("userDetail", userDetail);
        return "admin/user/detail";
    }

    // create module
    @GetMapping("/admin/user/create")
    public String getCreateUser(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    @PostMapping("/admin/user/create")
    public String handleCreateUser(Model model,
            @ModelAttribute("newUser") @Valid User newUser,
            BindingResult newUserBindingResult,
            @RequestParam("hoidanitFile") MultipartFile file) {

        List<FieldError> objectErrors = newUserBindingResult.getFieldErrors();
        for (FieldError it : objectErrors) {
            System.out.println(it.getObjectName() + it.getField() + " - " + it.getDefaultMessage());
        }

        if (newUserBindingResult.hasErrors()) {
            return "admin/user/create";
        }
        userService.handleCreateUser(newUser, file);
        return "redirect:/admin/user";
    }

    // update module
    @GetMapping("/admin/user/update/{id}")
    public String getUpdateUser(Model model, @PathVariable Long id) {
        User user = userService.getUserById(id);
        model.addAttribute("user", user);
        return "admin/user/update";
    }

    @PostMapping("/admin/user/update")
    public String handleUpdateUser(Model model,
            @ModelAttribute("user") @Valid User user,
            BindingResult userBindingResult,
            @RequestParam("avatarFile") MultipartFile file,
            HttpServletRequest request) {

        // validation
        List<FieldError> objectErrors = userBindingResult.getFieldErrors();
        boolean check = false;
        for (FieldError it : objectErrors) {
            System.out.println(it.getObjectName() + it.getField() + " - " + it.getDefaultMessage());
            if (!it.getField().equals("email") && !it.getField().equals("password")) {
                check = true;
            }
        }

        // neu co error nao khac ngoai email va password thi bao loi
        if (check == true) {
            return "admin/user/update";
        }
        //

        userService.handleUpdateUser(user, file, request);
        return "redirect:/admin/user";
    }

    @GetMapping("/admin/user/delete/{id}")
    public String getDeleteUser(@PathVariable long id, Model model) {
        model.addAttribute("id", id);
        model.addAttribute("user", new User());
        return "admin/user/delete";
    }

    @PostMapping("/admin/user/delete")
    public String handleDelete(@ModelAttribute("user") User user) {
        userService.handleDeleteUser(user.getId());
        return "redirect:/admin/user";
    }

}
