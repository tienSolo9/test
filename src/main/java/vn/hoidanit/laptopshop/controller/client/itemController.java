package vn.hoidanit.laptopshop.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class itemController {
    @GetMapping("/detail")
    public String getMethodName() {
        return "client/product/detail";
    }
}
