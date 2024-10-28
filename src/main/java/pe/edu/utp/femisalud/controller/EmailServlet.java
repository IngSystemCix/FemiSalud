package pe.edu.utp.femisalud.controller;

import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.commons.mail.EmailException;
import pe.edu.utp.femisalud.dao.PatientDAO;
import pe.edu.utp.femisalud.service.EmailService;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/verify_dni")
public class EmailServlet extends HttpServlet {

    private static final Logger LOGGER = Logger.getLogger("pe.edu.utp.femisalud");

    @Inject
    private PatientDAO patientDAO;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        EmailService emailService = new EmailService();
        String dni = req.getParameter("dni");

        String email = patientDAO.getEmail(dni);
        String names = patientDAO.getNames(dni);
        try {
            emailService.sendEmail(email, names);
        } catch (EmailException e) {
            LOGGER.log(Level.SEVERE, "Error al enviar el correo", e);
            throw new RuntimeException(e);
        }
        resp.setStatus(HttpServletResponse.SC_OK);
    }
}
