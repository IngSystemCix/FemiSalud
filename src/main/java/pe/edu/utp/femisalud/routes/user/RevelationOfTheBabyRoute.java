package pe.edu.utp.femisalud.routes.user;

import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import pe.edu.utp.femisalud.DTO.GenreAndTypePregnancyDTO;
import pe.edu.utp.femisalud.dao.PatientDAO;
import pe.edu.utp.femisalud.security.AuthUserSecurity;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "RevelationOfTheBabyRoute", value = "/u/revelation-of-the-baby")
public class RevelationOfTheBabyRoute extends HttpServlet {

    @Inject
    private PatientDAO patientDAO;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (AuthUserSecurity.authUserPatient(req, resp)) return;

        HttpSession session = req.getSession();
        String dni = (String) session.getAttribute("USER_DNI");

        req.setAttribute("namePatient", patientDAO.getNameByDNI(dni));

        List<GenreAndTypePregnancyDTO> genreAndTypePregnancy = patientDAO.getGenreAndTypePregnancy(dni);
        req.setAttribute("genreAndTypePregnancy", genreAndTypePregnancy);

        req.getRequestDispatcher("/private/revelationOfTheBaby.jsp").forward(req, resp);
    }
}
