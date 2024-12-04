package pe.edu.utp.femisalud.servlet;

import com.google.common.base.Preconditions;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.apache.commons.mail.EmailException;
import pe.edu.utp.femisalud.dao.UserDAO;
import pe.edu.utp.femisalud.util.GeneratorCodeUtil;
import pe.edu.utp.femisalud.util.SendEmailUtil;

import java.io.IOException;
import java.util.logging.Logger;

@WebServlet("/send-email")
public class SendEmailServlet extends HttpServlet {
    private static final Logger LOGGER = Logger.getLogger("pe.edu.utp.femisalud");

    @Inject
    private UserDAO userDAO;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();

        // Generar el código de autenticación
        String authCode = GeneratorCodeUtil.generateSixDigitCode();
        session.setAttribute("AUTH_CODE", authCode);

        // Obtener el DNI del usuario
        String dni = req.getParameter("dni");
        Preconditions.checkNotNull(dni, "DNI cannot be null");
        session.setAttribute("USER_DNI", dni);

        // Validar y obtener el email asociado al DNI
        String email = userDAO.getEmail(dni);
        if (email == null) {
            // Log del problema
            LOGGER.warning("No se encontró un email asociado al DNI: " + dni);

            // Redirigir al login con un mensaje de error
            session.setAttribute("ERROR_MESSAGE", "No se encontró un email asociado al DNI proporcionado.");
            resp.sendRedirect(req.getContextPath() + "/login");
            return; // Termina la ejecución del método
        }

        // Validar y obtener el nombre completo asociado al DNI
        String fullName = userDAO.getFullName(dni);
        if (fullName == null) {
            LOGGER.warning("No se encontró un nombre completo asociado al DNI: " + dni);
            session.setAttribute("ERROR_MESSAGE", "No se encontró un nombre completo asociado al DNI proporcionado.");
            resp.sendRedirect(req.getContextPath() + "/login");
            return; // Termina la ejecución del método
        }

        // Enviar el correo
        SendEmailUtil sendEmailUtil = new SendEmailUtil();
        try {
            sendEmailUtil.sendEmail(email, fullName, authCode);
            session.setAttribute("SEND_CODE_USER", true);
            resp.sendRedirect(req.getContextPath() + "/login_auth_user");
        } catch (EmailException e) {
            LOGGER.severe("Error al enviar el correo: " + e.getMessage());
            session.setAttribute("ERROR_MESSAGE", "Ocurrió un error al enviar el email. Intente de nuevo más tarde.");
            resp.sendRedirect(req.getContextPath() + "/login");
        }
    }


}
