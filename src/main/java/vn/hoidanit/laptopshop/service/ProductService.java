package vn.hoidanit.laptopshop.service;

import java.util.List;

import org.springframework.boot.web.servlet.server.Session;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpSession;
import vn.hoidanit.laptopshop.domain.Cart;
import vn.hoidanit.laptopshop.domain.CartDetail;
import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.repository.CartDetailRepository;
import vn.hoidanit.laptopshop.repository.CartRepository;
import vn.hoidanit.laptopshop.repository.ProductRepository;
import vn.hoidanit.laptopshop.repository.UserRepository;

@Service
public class ProductService {
    private ProductRepository productRepository;
    private UploadFileService uploadFileService;
    private CartRepository cartRepository;
    private CartDetailRepository cartDetailRepository;
    private UserRepository userRepository;

    public ProductService(ProductRepository productRepository,
            UploadFileService uploadFileService,
            CartRepository cartRepository,
            CartDetailRepository cartDetailRepository,
            UserRepository userRepository) {
        this.productRepository = productRepository;
        this.uploadFileService = uploadFileService;
        this.cartRepository = cartRepository;
        this.cartDetailRepository = cartDetailRepository;
        this.userRepository = userRepository;
    }

    public void handleCreate(MultipartFile file, Product product) {
        if (!file.getOriginalFilename().equals("")) {
            String image = uploadFileService.handleSaveFile(file, "laptop");
            product.setImage(image);
        }
        productRepository.save(product);
    }

    public List<Product> fetchProducts() {
        return productRepository.findAll();
    }

    public Product findProductById(long id) {
        return productRepository.findOneById(id);
    }

    public void handleUpdate(MultipartFile file, Product product) {
        Product temProduct = productRepository.findOneById(product.getId());
        if (!file.getOriginalFilename().equals("")) {
            String image = uploadFileService.handleSaveFile(file, "laptop");
            product.setImage(image);
        } else {
            product.setImage(temProduct.getImage());
        }
        productRepository.save(product);
    }

    public void handleDelete(long id) {
        productRepository.deleteById(id);
    }

    public void handleAddProductToCart(long productId, String email, HttpSession session) {

        User user = this.userRepository.findByEmail(email);

        if (user != null) {
            Cart cart = this.cartRepository.findByUser(user);

            // check cart have in database
            if (cart == null) {
                Cart newCart = new Cart();
                newCart.setUser(user);
                newCart.setSum(0);
                cart = newCart;
                cartRepository.save(cart);
            }
            // kiem tra xem san pham chuan bi them vao co trong cartDetail chua
            Product product = this.findProductById(productId);

            CartDetail oldCartDetail = cartDetailRepository.findByProductAndCart(product, cart);
            if (oldCartDetail == null) {
                CartDetail cartDetail = new CartDetail();
                cartDetail.setCart(cart);
                cartDetail.setPrice(product.getPrice());
                cartDetail.setQuantity(1);
                cartDetail.setProduct(product);
                // update lai tong so product co trong cart
                int s = cart.getSum() + 1;
                cart.setSum(s);
                cartRepository.save(cart);
                session.setAttribute("sum", s);

                this.cartDetailRepository.save(cartDetail);
            } else {
                oldCartDetail.setQuantity(oldCartDetail.getQuantity() + 1);
                this.cartDetailRepository.save(oldCartDetail);
            }
            // them moi gio hang

        }

    }
}
