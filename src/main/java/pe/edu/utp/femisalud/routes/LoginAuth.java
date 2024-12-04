package pe.edu.utp.femisalud.routes;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "LoginAuthRoute", value = "/login_auth_user")
public class LoginAuth extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();

        if (session.getAttribute("SEND_CODE_USER") == null || session.getAttribute("USER_DNI") == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        session.getAttribute("USER_DNI");
        req.getRequestDispatcher("/public/loginAuth.jsp").forward(req, resp);
    }
}
