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

@WebServlet(name = "EmailServlet", value = "/verify_dni")
public class EmailServlet extends HttpServlet {
    @Inject
    private PatientDAO patientDAO;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String dni = req.getParameter("dni");
        boolean exists = patientDAO.verifyDni(dni);
        if (exists) {
            try {
                new EmailService().sendEmail(patientDAO.getEmail(dni), patientDAO.getNames(dni));
            } catch (EmailException e) {
                throw new RuntimeException(e);
            }
        } else {
            resp.sendRedirect("/");
        }
    }
}
