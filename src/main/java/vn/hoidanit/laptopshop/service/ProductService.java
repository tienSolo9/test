package vn.hoidanit.laptopshop.service;

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
        String image = uploadFileService.handleSaveFile(file, "laptop");
        product.setImage(image);
        productRepository.save(product);
    }

    public Product findProductById(long id) {
        return productRepository.findOneById(id);
    }

    public void handleUpdate(MultipartFile file, Product product) {
        String image = uploadFileService.handleSaveFile(file, "laptop");
        product.setImage(image);
        productRepository.save(product);
    }

    public void handleDelete(long id) {
        productRepository.deleteById(id);
    }
}
