package vn.hoidanit.laptopshop.controller.admin;

import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.repository.ProductRepository;
import vn.hoidanit.laptopshop.service.ProductService;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.*;

@Controller
public class ProductController {

    private ProductRepository productRepository;
    private ProductService productService;

    public ProductController(ProductRepository productRepository, ProductService productService) {
        this.productRepository = productRepository;
        this.productService = productService;
    }

    @GetMapping("/admin/product")
    public String getProductPage(Model model) {
        model.addAttribute("products", productRepository.findAll());
        return "admin/product/show";
    }

    @GetMapping("/admin/product/{id}")
    public String getProductDetailPage(Model model, @PathVariable long id) {
        model.addAttribute("productDetail", productService.findProductById(id));
        return "admin/product/detail";
    }

    @GetMapping("/admin/product/update/{id}")
    public String getProductUpdatePage(Model model, @PathVariable long id) {
        model.addAttribute("productDetail", productService.findProductById(id));
        return "admin/product/update";
    }

    @GetMapping("/admin/product/create")
    public String getProductUpdatePage(Model model) {
        model.addAttribute("newProduct", new Product());
        return "admin/product/create";
    }

    @PostMapping("/admin/product/create")
    public String handleCreate(Model model,
            @ModelAttribute("newProduct") @Valid Product newProduct,
            BindingResult bindingResult,
            @RequestParam("productFile") MultipartFile file) {

        List<FieldError> fieldErrors = bindingResult.getFieldErrors();
        for (FieldError it : fieldErrors) {
            System.out.println(it.getField() + "-" + it.getDefaultMessage());
        }

        if (bindingResult.hasErrors()) {
            return "admin/product/create";
        }

        productService.handleCreate(file, newProduct);
        return "redirect:/admin/product";
    }

    @PostMapping("/admin/product/update")
    public String handleUpdate(Model model,
            @ModelAttribute("productDetail") @Valid Product productDetail,
            BindingResult bindingResult,
            @RequestParam("productFile") MultipartFile file) {

        List<FieldError> fieldErrors = bindingResult.getFieldErrors();
        for (FieldError it : fieldErrors) {
            System.out.println(it.getField() + "-" + it.getDefaultMessage());
        }

        if (bindingResult.hasErrors()) {
            productDetail.setImage(productService.findProductById(productDetail.getId()).getImage());
            return "admin/product/update";
        }

        productService.handleUpdate(file, productDetail);
        return "redirect:/admin/product";
    }

    @GetMapping("/admin/product/delete/{id}")
    public String getProductDeletePage(Model model, @PathVariable long id) {
        Product product = productService.findProductById(id);
        model.addAttribute("productDetail", product);
        return "admin/product/delete";
    }

    @PostMapping("/admin/product/delete")
    public String handleDelete(@ModelAttribute("productDetail") Product product) {
        productService.handleDelete(product.getId());
        return "redirect:/admin/product";
    }

    @GetMapping("/cart")
    public String getCart() {

        return "client/cart/show";
    }

    @PostMapping("/add-product-to-cart/{id}")
    public String addProductToCard(@PathVariable long id, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        String email = (String) session.getAttribute("email");
        productService.handleAddProductToCart(id, email, session);
        return "redirect:/";
    }

}
