package pe.edu.utp.femisalud.api;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pe.edu.utp.femisalud.DTO.ClinicalNotesDTO;
import pe.edu.utp.femisalud.config.LocalDateTimeAdapter;
import pe.edu.utp.femisalud.dao.AdminDAO;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;

@WebServlet(name = "GetClinicalNotesByDNIServlet", value = "/get-clinical-notes-by-dni")
public class GetClinicalNotesByDNIServlet extends HttpServlet {

    @Inject
    private AdminDAO adminDAO;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String dni = req.getParameter("patient");
        List<ClinicalNotesDTO> clinicalNotesList = adminDAO.getClinicalNotesListByDNI(dni);

        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");

        Gson gson = new GsonBuilder()
                .registerTypeAdapter(LocalDateTime.class, new LocalDateTimeAdapter())
                .create();
        resp.getWriter().print(gson.toJson(clinicalNotesList));
    }
}
