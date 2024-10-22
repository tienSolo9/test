package vn.hoidanit.laptopshop.util;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

public class imageUtil {
    public static String getImageFromSession(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        String result = (String) session.getAttribute("avatar");
        return result;
    }

}
