package filter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class SessionUserMember {
    public static boolean checkUser(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("role") != null) {
            if (session.getAttribute("role").equals("member")) {
                return true;
            }
        }
        return false;
    }
}