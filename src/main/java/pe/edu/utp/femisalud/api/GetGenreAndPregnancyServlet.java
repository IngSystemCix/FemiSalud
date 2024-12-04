package pe.edu.utp.femisalud.api;

import com.google.gson.Gson;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import pe.edu.utp.femisalud.DTO.GenreAndTypePregnancyDTO;
import pe.edu.utp.femisalud.dao.PatientDAO;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "GetGenreAndPregnancyServlet", value = "/api/get-genre-and-pregnancy")
public class GetGenreAndPregnancyServlet extends HttpServlet {

    @Inject
    private PatientDAO patientDAO;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();
        String dni = (String) session.getAttribute("USER_DNI");

        List<GenreAndTypePregnancyDTO> genreAndTypePregnancy = patientDAO.getGenreAndTypePregnancy(dni);

        Gson gson = new Gson();
        String json = gson.toJson(genreAndTypePregnancy);

        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");

        resp.getWriter().write(json);
    }
}
