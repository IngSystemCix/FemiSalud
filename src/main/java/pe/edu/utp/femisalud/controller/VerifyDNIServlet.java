package pe.edu.utp.femisalud.controller;

import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pe.edu.utp.femisalud.dao.UserDAO;

import java.io.IOException;

@WebServlet("/verify_dni")
public class VerifyDNIServlet extends HttpServlet {
    @Inject
    private UserDAO userDAO;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String dni = req.getParameter("dni");
        String message;

        try {
            if (userDAO.findByDni(dni)) {
                message = "El DNI ya se encuentra registrado";
            } else {
                message = "El DNI no se encuentra registrado";
            }
        } catch (Exception e) {
            message = "Error al verificar el DNI";
        }

        req.setAttribute("message", message);
        req.getRequestDispatcher("/").forward(req, resp);
    }
}
