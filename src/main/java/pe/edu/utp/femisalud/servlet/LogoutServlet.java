package pe.edu.utp.femisalud.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "LogoutServlet", value = "/logout")
public class LogoutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        session.removeAttribute("AUTH_USER");
        session.removeAttribute("USER_DNI");
        session.removeAttribute("USER_ROLE");
        session.removeAttribute("ERROR_MESSAGE");
        resp.sendRedirect(req.getContextPath() + "/login");
    }
}
