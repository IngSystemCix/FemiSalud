package pe.edu.utp.femisalud.routes.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pe.edu.utp.femisalud.security.AuthUserSecurity;

import java.io.IOException;

@WebServlet(name = "AttentionMedicalRoute", urlPatterns = "/u/attention-medical")
public class AttentionMedicalRoute extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (AuthUserSecurity.authUserPatient(req, resp)) return;

        req.getRequestDispatcher("/private/attentionMedical.jsp").forward(req, resp);
    }
}
