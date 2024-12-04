package pe.edu.utp.femisalud.config;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class RedirectPageByRole {

    public static void redirectByRole(String role, HttpServletRequest req, HttpServletResponse resp) throws IOException {
        switch (role) {
            case "PATIENT" -> resp.sendRedirect(req.getContextPath() + "/u/home");
            case "ADMIN" -> resp.sendRedirect(req.getContextPath() + "/admin/home");
            case "CALL_CENTER" -> resp.sendRedirect(req.getContextPath() + "/call/message");
            default -> resp.sendRedirect(req.getContextPath() + "/login");
        }
    }

}
