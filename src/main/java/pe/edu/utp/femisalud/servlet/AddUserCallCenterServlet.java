package pe.edu.utp.femisalud.servlet;

import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import pe.edu.utp.femisalud.config.RedirectPageByRole;
import pe.edu.utp.femisalud.dao.AdminDAO;
import pe.edu.utp.femisalud.security.SanitizationSecurity;
import pe.edu.utp.femisalud.util.ValidateInputUtil;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "AddUserCallCenterServlet", urlPatterns = "/addUserCallCenter")
public class AddUserCallCenterServlet extends HttpServlet {

    @Inject
    private AdminDAO adminDAO;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        Map<String, String> errorMessagesCallCenter = new HashMap<>();

        String dni = req.getParameter("dni");
        String name = req.getParameter("name_call_center");
        String paternalSurname = SanitizationSecurity.sanitizeForSQL(req.getParameter("paternal_surname"));
        String maternalSurname = SanitizationSecurity.sanitizeForSQL(req.getParameter("maternal_surname"));
        String email = SanitizationSecurity.sanitizeForSQL(req.getParameter("email"));
        String phoneNumber = req.getParameter("tel");

        // Validación de DNI
        if (dni == null || dni.isEmpty() || !dni.matches("\\d{8}")) {
            errorMessagesCallCenter.put("dniError", "El DNI debe contener exactamente 8 dígitos.");
        }

        // Validación de nombre
        if (name == null || name.trim().isEmpty()) {
            errorMessagesCallCenter.put("nameError", "El nombre no puede estar vacío.");
        }

        // Validación de apellidos
        if (paternalSurname == null || paternalSurname.trim().isEmpty()) {
            errorMessagesCallCenter.put("paternalSurnameError", "El apellido paterno no puede estar vacío.");
        }
        if (maternalSurname == null || maternalSurname.trim().isEmpty()) {
            errorMessagesCallCenter.put("maternalSurnameError", "El apellido materno no puede estar vacío.");
        }

        boolean isExistEmail = adminDAO.checkExistenceEmail(email);

        if (email.isEmpty()) {
            errorMessagesCallCenter.put("emailError", "Por favor, ingrese un correo electrónico.");
        } else if (!email.matches("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$")) {
            errorMessagesCallCenter.put("emailError", "Por favor, ingrese un correo electrónico válido.");
        } else if (isExistEmail) {
            errorMessagesCallCenter.put("emailError", "Este correo electrónico ya está registrado.");
        }

        // Validación de teléfono
        if (phoneNumber == null || phoneNumber.isEmpty() || !phoneNumber.matches("\\d{9}")) {
            errorMessagesCallCenter.put("phoneError", "El teléfono debe contener exactamente 9 dígitos.");
        }

        // Validación de fecha de nacimiento
        LocalDate birthDate = null;
        try {
            String birthDateString = req.getParameter("date");
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            birthDate = LocalDate.parse(birthDateString, formatter);
        } catch (Exception e) {
            errorMessagesCallCenter.put("birthDateError", "La fecha de nacimiento es inválida.");
        }

        // Si hay errores, los guardamos en la sesión y redirigimos al formulario
        if (!errorMessagesCallCenter.isEmpty()) {
            session.setAttribute("errorMessagesCallCenter", errorMessagesCallCenter);
            resp.sendRedirect(req.getContextPath() + "/admin/register-call-center");
            return;
        }

        // Si todo es válido, agregar el nuevo usuario de call center
        adminDAO.addCallCenter(dni, name, paternalSurname, maternalSurname, email, phoneNumber, birthDate);

        // Eliminar mensajes de error de la sesión y redirigir según el rol del usuario
        session.removeAttribute("errorMessagesCallCenter");
        RedirectPageByRole.redirectByRole((String) session.getAttribute("USER_ROLE"), req, resp);
    }
}
