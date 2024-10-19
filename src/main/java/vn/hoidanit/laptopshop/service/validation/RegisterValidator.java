package vn.hoidanit.laptopshop.service.validation;

import org.springframework.stereotype.Service;

import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;
import vn.hoidanit.laptopshop.DTO.RegisterDTO;
import vn.hoidanit.laptopshop.service.UserService;

@Service
public class RegisterValidator implements ConstraintValidator<RegisterChecked, RegisterDTO> {

    private final UserService userService;

    public RegisterValidator(UserService userService) {
        this.userService = userService;
    }

    @Override
    public boolean isValid(RegisterDTO registerDTO, ConstraintValidatorContext cxt) {
        boolean isValid = true;

        if (!registerDTO.getPassword().equals(registerDTO.getConfirmPassword())) {
            cxt.buildConstraintViolationWithTemplate("Password not match")
                    .addPropertyNode("confirmPassword")
                    .addConstraintViolation()
                    .disableDefaultConstraintViolation();
            isValid = false;
        }
        if (userService.checkEmailExists(registerDTO.getEmail())) {
            cxt.buildConstraintViolationWithTemplate("Email was existed")
                    .addPropertyNode("email")
                    .addConstraintViolation()
                    .disableDefaultConstraintViolation();
            isValid = false;
        }
        return isValid;
    }
}
