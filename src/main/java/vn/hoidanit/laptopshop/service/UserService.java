package vn.hoidanit.laptopshop.service;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import java.util.*;

import vn.hoidanit.laptopshop.DTO.RegisterDTO;
import vn.hoidanit.laptopshop.domain.Role;
import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.repository.RoleRepository;
import vn.hoidanit.laptopshop.repository.UserRepository;

@Service
public class UserService {

    public final UserRepository userRepository;
    public final RoleRepository roleRepository;
    private final PasswordEncoder passwordEncoder;
    private final UploadFileService uploadFileService;

    public UserService(UserRepository userRepository,
            RoleRepository roleRepository,
            PasswordEncoder passwordEncoder,
            UploadFileService uploadFileService) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
        this.passwordEncoder = passwordEncoder;
        this.uploadFileService = uploadFileService;
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

    public User handleCreateUser(User newUser, MultipartFile file) {
        newUser.setAvatar(this.uploadFileService.handleSaveFile(file, "avatar"));
        newUser = this.handleShowRole(newUser.getRole().getName(), newUser);
        newUser = this.handlePassword(newUser);
        this.handleSaveUser(newUser);
        return newUser;
    }

    public User handleUpdateUser(User user, MultipartFile file, HttpServletRequest request) {
        User currentUser = this.getUserById(user.getId());

        if (currentUser != null) {
            currentUser.setPhone(user.getPhone());
            currentUser.setFullName(user.getFullName());
            currentUser.setAddress(user.getAddress());
            if (!file.getOriginalFilename().equals("")) {
                currentUser.setAvatar(this.uploadFileService.handleSaveFile(file, "avatar"));
                HttpSession session = request.getSession(false);
                session.setAttribute("avatar", currentUser.getAvatar());
            }
        }
        return this.handleSaveUser(currentUser);
    }

    public void handleDeleteUser(Long id) {
        this.userRepository.deleteById(id);
    }

    public User handleShowRole(String name, User user) {
        Role role = roleRepository.findByName(name);
        user.setRole(role);
        return user;
    }

    public User handlePassword(User user) {
        String passWordEncoded = passwordEncoder.encode(user.getPassword());
        user.setPassword(passWordEncoded);
        return user;
    }

    public User RegisterDtoToUser(RegisterDTO register) {
        User user = new User();

        user.setFullName(register.getFirstName() + " " + register.getLastName());
        user.setEmail(register.getEmail());
        user.setPassword(register.getPassword());
        user = this.handlePassword(user);
        user = this.handleShowRole("user", user);
        return user;
    }

    public void handleRegister(RegisterDTO registerDTO) {
        User user = this.RegisterDtoToUser(registerDTO);
        this.handleSaveUser(user);
    }

    public boolean checkEmailExists(String email) {
        return userRepository.existsByEmail(email);
    }
}
