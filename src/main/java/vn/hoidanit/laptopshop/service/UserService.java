package vn.hoidanit.laptopshop.service;

import org.springframework.stereotype.Service;

import java.util.*;
import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.repository.UserRepository;

@Service
public class UserService {

    public final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public List<User> getAllUsers() {
        return this.userRepository.findAll();
    }

    public List<User> getAllUsersByEmail(String email, String address) {
        return this.userRepository.findByEmailAndAddress(email, address);
    }

    public User handleSaveUser(User user) {
        return this.userRepository.save(user);
    }

    public User getUserById(long id) {
        return this.userRepository.findOneById(id);
    }

    public User handleUpdateUser(User user) {
        User currentUser = this.getUserById(user.getId());

        if (currentUser != null) {
            currentUser.setPhone(user.getPhone());
            currentUser.setFullName(user.getFullName());
            currentUser.setAddress(user.getAddress());
        }
        return this.handleSaveUser(currentUser);
    }

    public void handleDeleteUser(Long id) {
        this.userRepository.deleteById(id);
    }
}
