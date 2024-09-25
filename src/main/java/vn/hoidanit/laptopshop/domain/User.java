package vn.hoidanit.laptopshop.domain;

public class User {
    private long id;
    private String fullName;
    private String email;
    private String password;
    private String address;
    private String phone;

    public User() {
    };

    public User(long id, String fullName, String email, String password, String address, String phone) {
        this.id = id;
        this.fullName = fullName;
        this.email = email;
        this.password = password;
        this.address = address;
        this.phone = phone;
    }

    @Override
    public String toString() {
        return "User [id=" + id + ", fullName=" + fullName + ", email=" + email + ", password=" + password
                + ", address=" + address + ", phone=" + phone + "]";
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

}
