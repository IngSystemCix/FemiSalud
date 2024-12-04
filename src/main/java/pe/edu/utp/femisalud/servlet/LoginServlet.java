package pe.edu.utp.femisalud.servlet;

import com.google.common.base.Preconditions;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import pe.edu.utp.femisalud.dao.UserDAO;

import java.io.IOException;

@WebServlet("/login_auth")
public class LoginServlet extends HttpServlet {

    @Inject
    private UserDAO userDAO;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String dni = req.getParameter("dni");
        String authCode = req.getParameter("code-1") + req.getParameter("code-2") + req.getParameter("code-3") + req.getParameter("code-4") + req.getParameter("code-5") + req.getParameter("code-6");
        Preconditions.checkNotNull(dni, "dni cannot be null");
        Preconditions.checkNotNull(authCode, "authCode cannot be null");
        HttpSession session = req.getSession(false);
        String CODE_VERIFIED = (String) session.getAttribute("AUTH_CODE");
        if (authCode.equals(CODE_VERIFIED)) {
            session.setAttribute("USER_DNI", dni);
            String role = userDAO.getRole(dni);
            Preconditions.checkNotNull(role, "role cannot be null");
            session.setAttribute("USER_ROLE", role);
            switch (role) {
                case "PATIENT" -> {
                    resp.sendRedirect(req.getContextPath() + "/u/home");
                    session.setAttribute("AUTH_USER", true);
                    session.removeAttribute("AUTH_CODE");
                    session.removeAttribute("SEND_CODE_USER");
                }
                case "ADMIN" -> {
                    resp.sendRedirect(req.getContextPath() + "/admin/home");
                    session.setAttribute("AUTH_USER", true);
                    session.removeAttribute("AUTH_CODE");
                    session.removeAttribute("SEND_CODE_USER");
                }
                case "CALL_CENTER" -> {
                    resp.sendRedirect(req.getContextPath() + "/call/message");
                    session.setAttribute("AUTH_USER", true);
                    session.removeAttribute("AUTH_CODE");
                    session.removeAttribute("SEND_CODE_USER");
                }
                default -> {
                    resp.sendRedirect(req.getContextPath() + "/login");
                    session.removeAttribute("AUTH_CODE");
                    session.removeAttribute("SEND_CODE_USER");
                }
            }
        } else {
            resp.sendRedirect(req.getContextPath() + "/login");
        }
    }
}
