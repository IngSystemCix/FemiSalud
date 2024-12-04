package pe.edu.utp.femisalud.routes.user;

import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import pe.edu.utp.femisalud.DTO.PatientNotificationDTO;
import pe.edu.utp.femisalud.dao.PatientDAO;
import pe.edu.utp.femisalud.security.AuthUserSecurity;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "HomeRoute", value = "/u/home")
public class HomeRoute extends HttpServlet {

    @Inject
    private PatientDAO patientDAO;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (AuthUserSecurity.authUserPatient(req, resp)) return;

        HttpSession session = req.getSession();
        String dni = (String) session.getAttribute("USER_DNI");

        String url = patientDAO.getPublicationPostActuality(dni);

        req.setAttribute("url", url);
        List<PatientNotificationDTO> notifications = patientDAO.getPatientNotifications(dni);
        req.setAttribute("notifications", notifications);
        Integer notificationsCount = patientDAO.getPatientNotificationsCount(dni);
        req.setAttribute("notificationsCount", notificationsCount);
        Long ultrasoundCount = patientDAO.getUltrasoundCount(dni);
        req.setAttribute("ultrasoundCount", ultrasoundCount);

        req.getRequestDispatcher("/private/home.jsp").forward(req, resp);
    }
}
