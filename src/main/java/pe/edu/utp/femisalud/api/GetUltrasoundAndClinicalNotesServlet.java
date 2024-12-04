package pe.edu.utp.femisalud.api;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import pe.edu.utp.femisalud.DTO.UltrasoundAndClinicalNotesDTO;
import pe.edu.utp.femisalud.config.LocalDateTimeAdapter;
import pe.edu.utp.femisalud.dao.PatientDAO;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;

@WebServlet(name = "GetUltrasoundAndClinicalNotesServlet", value = "/api/ultrasound-and-clinical-notes")
public class GetUltrasoundAndClinicalNotesServlet extends HttpServlet {

    @Inject
    private PatientDAO patientDAO;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        String dni = (String) session.getAttribute("USER_DNI");
        List<UltrasoundAndClinicalNotesDTO[]> ultrasoundAndClinicalNotes = patientDAO.getAllUltrasoundLinksAndClinicalNotes(dni);
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        Gson gson = new GsonBuilder()
                .registerTypeAdapter(LocalDateTime.class, new LocalDateTimeAdapter())
                .create();
        String json = gson.toJson(ultrasoundAndClinicalNotes);
        resp.getWriter().write(json);
    }
}
