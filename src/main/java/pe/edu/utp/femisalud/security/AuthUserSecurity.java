package pe.edu.utp.femisalud.security;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

public class AuthUserSecurity {
    public static boolean authUserAdmin(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        HttpSession session = req.getSession(false);

        if(session == null || session.getAttribute("AUTH_USER") == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return true;
        }

        Object userRole = session.getAttribute("USER_ROLE");

        if (userRole == null || !userRole.equals("ADMIN")) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return true;
        }
        return false;
    }

    public static boolean authUserCallCenter(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        HttpSession session = req.getSession(false);

        if(session == null || session.getAttribute("AUTH_USER") == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return true;
        }

        Object userRole = session.getAttribute("USER_ROLE");

        if (userRole == null || !userRole.equals("CALL_CENTER")) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return true;
        }
        return false;
    }

    public static boolean authUserPatient(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        HttpSession session = req.getSession(false);

        if(session == null || session.getAttribute("AUTH_USER") == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return true;
        }

        Object userRole = session.getAttribute("USER_ROLE");

        if (userRole == null || !userRole.equals("PATIENT")) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return true;
        }
        return false;
    }
}
