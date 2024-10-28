package pe.edu.utp.femisalud.controller;

import com.google.gson.Gson;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pe.edu.utp.femisalud.dao.UltrasoundDAO;

import java.io.IOException;
import java.util.List;

@WebServlet("/getUltrasounds") // Solo la ruta base sin parámetros
public class UltrasoundServlet extends HttpServlet {
    @Inject
    private UltrasoundDAO ultrasoundDAO;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String dni = req.getParameter("dni");
        if (dni == null || dni.isEmpty()) {
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            return;
        }

        List<Long> ultrasoundIds = ultrasoundDAO.getUltrasoundByPatient(dni);

        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");

        String json = new Gson().toJson(ultrasoundIds);
        resp.getWriter().write(json);
        System.out.println(json);
    }
}
