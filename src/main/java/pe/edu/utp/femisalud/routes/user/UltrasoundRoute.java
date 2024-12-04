package pe.edu.utp.femisalud.routes.user;

import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import pe.edu.utp.femisalud.dao.PatientDAO;
import pe.edu.utp.femisalud.security.AuthUserSecurity;

import java.io.IOException;

@WebServlet(name = "UltrasoundRoute", value = "/u/ultrasound")
public class UltrasoundRoute extends HttpServlet {

    @Inject
    private PatientDAO patientDAO;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (AuthUserSecurity.authUserPatient(req, resp)) return;

        HttpSession session = req.getSession(false);
        String dni = (String) session.getAttribute("USER_DNI");

        Long ultrasoundCount = patientDAO.getUltrasoundCount(dni);
        req.setAttribute("ultrasoundCount", ultrasoundCount);

        Integer surveyCount = patientDAO.getSurveyCount(dni);
        req.setAttribute("surveyCount", surveyCount);

        req.getRequestDispatcher("/private/ultrasound.jsp").forward(req, resp);
    }
}
