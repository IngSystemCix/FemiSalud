package pe.edu.utp.femisalud.routes;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "LoginRoute", value = "/login")
public class LoginRoute extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();

        if (session.getAttribute("AUTH_USER") != null) {
            String role = (String) session.getAttribute("USER_ROLE");
            switch (role) {
                case "PATIENT" -> resp.sendRedirect(req.getContextPath() + "/u/home");
                case "ADMIN" -> resp.sendRedirect(req.getContextPath() + "/admin/home");
                case "CALL_CENTER" -> resp.sendRedirect(req.getContextPath() + "/call/message");
                default -> {
                    session.removeAttribute("AUTH_USER");
                    session.removeAttribute("USER_ROLE");
                    resp.sendRedirect(req.getContextPath() + "/login");
                }
            }
        }

        req.getRequestDispatcher("/public/login.jsp").forward(req, resp);
    }
}
