package pe.edu.utp.femisalud.api;

import com.google.gson.GsonBuilder;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pe.edu.utp.femisalud.config.LocalDateAdapter;
import pe.edu.utp.femisalud.dao.AdminDAO;

import java.io.IOException;
import java.time.LocalDate;

@WebServlet(name = "SearchMedicalHistoryServlet", urlPatterns = "/search-medical-history")
public class SearchMedicalHistoryServlet extends HttpServlet {
    @Inject
    private AdminDAO adminDAO;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String dni = req.getParameter("dni");
        var medicalHistory = adminDAO.getMedicalHistoryList(dni);
        // Configurar el servlet para enviar JSON
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");

        // Convertir la lista de historial médico a JSON
        var gson = new GsonBuilder()
                .registerTypeAdapter(LocalDate.class, new LocalDateAdapter())
                .create();
        resp.getWriter().write(gson.toJson(medicalHistory));
    }
}
