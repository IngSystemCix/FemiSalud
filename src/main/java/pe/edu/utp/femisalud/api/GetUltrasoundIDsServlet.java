package pe.edu.utp.femisalud.api;

import com.google.gson.Gson;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pe.edu.utp.femisalud.dao.AdminDAO;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "GetUltrasoundIDsServlet", value = "/get-ultrasound-ids")
public class GetUltrasoundIDsServlet extends HttpServlet {

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

        List<Long> ultrasoundIDs = adminDAO.getUltrasoundIDsByDni(dni);

        Gson gson = new Gson();

        resp.getWriter().print(gson.toJson(ultrasoundIDs));
    }
}
