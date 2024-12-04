package pe.edu.utp.femisalud.routes.admin;

import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import pe.edu.utp.femisalud.DTO.PatientUserDTO;
import pe.edu.utp.femisalud.dao.AdminDAO;
import pe.edu.utp.femisalud.security.AuthUserSecurity;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "MedicalHistoryRouteAdmin", urlPatterns = "/admin/medical-history")
public class MedicalHistoryRoute extends HttpServlet {
    @Inject
    private AdminDAO adminDAO;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (AuthUserSecurity.authUserAdmin(req, resp)) return;

        HttpSession session = req.getSession(false);
        session.removeAttribute("errorMessages");
        session.removeAttribute("errorMessagesCallCenter");

        List<PatientUserDTO> allUserPatient = adminDAO.getPatientDniList();
        req.setAttribute("allPatient", allUserPatient);

        req.getRequestDispatcher("/private/admin/medicalHistory.jsp").forward(req, resp);
    }
}
