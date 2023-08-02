package filter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class SessionUserAdmin {
    public static boolean checkUser(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("role") != null) {
            if (session.getAttribute("role").equals("admin")) {
                return true;
            }
        }
        return false;
    }
}