package vn.hoidanit.laptopshop.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.repository.ProductRepository;

@Service
public class ProductService {
    private ProductRepository productRepository;
    private UploadFileService uploadFileService;

    public ProductService(ProductRepository productRepository, UploadFileService uploadFileService) {
        this.productRepository = productRepository;
        this.uploadFileService = uploadFileService;
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
}
