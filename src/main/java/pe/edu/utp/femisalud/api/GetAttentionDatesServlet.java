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
import java.util.List;

@WebServlet(name = "GetAttentionDatesServlet", value = "/get-attention-dates")
public class GetAttentionDatesServlet extends HttpServlet {

    @Inject
    private AdminDAO adminDAO;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String dni = req.getParameter("dni");

        if (dni == null || dni.isEmpty()) {
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            resp.getWriter().write("DNI no proporcionado");
            return;
        }

        List<LocalDate> attentionDates = adminDAO.getAttentionDateByDni(dni);

        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");

        var gson = new GsonBuilder()
                .registerTypeAdapter(LocalDate.class, new LocalDateAdapter())
                .create();
        resp.getWriter().print(gson.toJson(attentionDates));
    }
}
