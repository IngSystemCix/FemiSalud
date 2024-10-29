package pe.edu.utp.femisalud.controller;

import com.google.common.base.Preconditions;
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

@WebServlet("/send_code")
public class EmailServlet extends HttpServlet {

    private static final Logger LOGGER = Logger.getLogger("pe.edu.utp.femisalud");

    @Inject
    private PatientDAO patientDAO;

    @Inject
    private EmailService emailService;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String dni = req.getParameter("dni");

        // Obtener el correo y los nombres desde el DAO
        String email = patientDAO.getEmail(dni);
        String names = patientDAO.getNames(dni);

        // Verificar que los valores no sean nulos
        Preconditions.checkNotNull(email, "El correo no puede ser nulo");
        Preconditions.checkNotNull(names, "El nombre no puede ser nulo");

        try {
            // Enviar el correo
            emailService.sendEmail(email, names);
            // Respuesta con estado 200 OK
            resp.setStatus(HttpServletResponse.SC_OK);
        } catch (EmailException e) {
            // Log del error y respuesta con estado 500
            LOGGER.log(Level.SEVERE, "Error al enviar el correo", e);
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al enviar el correo");
        }
    }
}
