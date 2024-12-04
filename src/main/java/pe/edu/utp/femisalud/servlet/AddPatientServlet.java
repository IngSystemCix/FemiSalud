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
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "AddPatientServlet", value = "/add-patient")
public class AddPatientServlet extends HttpServlet {
    @Inject
    private AdminDAO adminDAO;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Map<String, String> errorMessages = new HashMap<>();

        // Recolectar datos del formulario
        String dni = req.getParameter("dni");
        String name = SanitizationSecurity.sanitizeForSQL(req.getParameter("name_patient"));
        String paternalSurname = SanitizationSecurity.sanitizeForSQL(req.getParameter("paternal_surname_patient"));
        String maternalSurname = SanitizationSecurity.sanitizeForSQL(req.getParameter("maternal_surname_patient"));
        String email = SanitizationSecurity.sanitizeForSQL(req.getParameter("email_patient"));
        String phoneNumber = req.getParameter("tel_patient");

        // Validar fechas
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate birthDate = null, dateStartPregnancy = null, dateEndPregnancy = null;
        try {
            birthDate = LocalDate.parse(req.getParameter("date"), formatter);
        } catch (Exception e) {
            errorMessages.put("birthDateError", "Fecha de nacimiento inválida.");
        }
        try {
            dateStartPregnancy = LocalDate.parse(req.getParameter("date_start_pregnancy"), formatter);
        } catch (Exception e) {
            errorMessages.put("dateStartPregnancyError", "Fecha de inicio del embarazo inválida.");
        }
        try {
            dateEndPregnancy = LocalDate.parse(req.getParameter("date_end_pregnancy"), formatter);
        } catch (Exception e) {
            errorMessages.put("dateEndPregnancyError", "Fecha de fin del embarazo inválida.");
        }

        // Otros parámetros
        int amountBaby = 0;
        try {
            amountBaby = Integer.parseInt(req.getParameter("amount_baby"));
            if (amountBaby <= 0) {
                errorMessages.put("amountBabyError", "El número de bebés debe ser mayor a 0.");
            }
        } catch (NumberFormatException e) {
            errorMessages.put("amountBabyError", "Número de bebés inválido.");
        }
        String typePregnancy = req.getParameter("type_pregnancy");

        // Géneros de los bebés
        List<Integer> babyGenres = new ArrayList<>();
        for (int i = 0; i < amountBaby; i++) {
            String genreParam = req.getParameter("baby_genre_" + i);
            if (genreParam != null) {
                try {
                    babyGenres.add(Integer.parseInt(genreParam));
                } catch (NumberFormatException e) {
                    errorMessages.put("babyGenreError", "Género del bebé inválido.");
                }
            }
        }

        // Validaciones de campos
        if (dni == null || dni.isEmpty() || !dni.matches("\\d{8}")) {
            errorMessages.put("dniError", "El DNI debe contener exactamente 8 dígitos.");
        }
        if (name == null || name.trim().isEmpty()) {
            errorMessages.put("nameError", "El nombre no puede estar vacío.");
        }
        if (paternalSurname == null || paternalSurname.trim().isEmpty()) {
            errorMessages.put("paternalSurnameError", "El apellido paterno no puede estar vacío.");
        }
        if (maternalSurname == null || maternalSurname.trim().isEmpty()) {
            errorMessages.put("maternalSurnameError", "El apellido materno no puede estar vacío.");
        }

        boolean isExistEmail = adminDAO.checkExistenceEmail(email);

        if (email.isEmpty()) {
            errorMessages.put("emailError", "Por favor, ingrese un correo electrónico.");
        } else if (!email.matches("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$")) {
            errorMessages.put("emailError", "Por favor, ingrese un correo electrónico válido.");
        } else if (isExistEmail) {
            errorMessages.put("emailError", "Este correo electrónico ya está registrado.");
        }
        if (phoneNumber == null || phoneNumber.isEmpty() || !phoneNumber.matches("\\d{9}")) {
            errorMessages.put("phoneError", "El teléfono debe contener exactamente 9 dígitos.");
        }

        // Si hay errores, guardarlos en la sesión y reenviar al formulario
        if (!errorMessages.isEmpty()) {
            session.setAttribute("errorMessages", errorMessages);
            resp.sendRedirect(req.getContextPath() + "/admin/register-patient");
            return;
        }

        // Llamar al método del DAO si todo es válido
        adminDAO.addPatient(dni, name, paternalSurname, maternalSurname, email, phoneNumber, birthDate, dateStartPregnancy, dateEndPregnancy, amountBaby, typePregnancy, babyGenres);

        // Eliminar mensajes de error y redirigir basado en el rol del usuario
        session.removeAttribute("errorMessages");
        RedirectPageByRole.redirectByRole((String) session.getAttribute("USER_ROLE"), req, resp);
    }

}
