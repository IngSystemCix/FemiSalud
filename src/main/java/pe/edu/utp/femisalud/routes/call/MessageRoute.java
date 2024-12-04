package pe.edu.utp.femisalud.routes.call;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pe.edu.utp.femisalud.security.AuthUserSecurity;

import java.io.IOException;

@WebServlet(name = "MessageRouteCall", value = "/call/message")
public class MessageRoute extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (AuthUserSecurity.authUserCallCenter(req, resp)) return;

        req.getRequestDispatcher("/private/call/message.jsp").forward(req, resp);
    }
}
