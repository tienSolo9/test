package vn.hoidanit.laptopshop.controller.client;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.jms.JmsProperties.Listener.Session;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.repository.UserRepository;
import vn.hoidanit.laptopshop.service.ProductService;
import vn.hoidanit.laptopshop.service.UserService;
import vn.hoidanit.laptopshop.util.imageUtil;

@Controller
public class HomePageController {

    private final ProductService productService;
    private final UserRepository userRepository;

    public HomePageController(ProductService productService,
            UserRepository userRepository) {
        this.productService = productService;
        this.userRepository = userRepository;
    }

    @GetMapping("/")
    public String getHomePage(Model model, HttpServletRequest request) {
        model.addAttribute("products", productService.fetchProducts());
        System.out.println(productService.fetchProducts());
        return "client/homepage/show";
    }

}
