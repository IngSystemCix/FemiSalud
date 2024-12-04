package pe.edu.utp.femisalud.api;

import com.google.gson.Gson;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pe.edu.utp.femisalud.DTO.RevelationDTO;
import pe.edu.utp.femisalud.dao.AdminDAO;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "GetRevelationsByPatient", value = "/api/get-revelations-by-patient")
public class GetRevelationsByPatient extends HttpServlet {

    @Inject
    private AdminDAO adminDAO;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        List<RevelationDTO[]> revelations = adminDAO.getRevelationsByPatient();

        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");

        Gson gson = new Gson();
        String revelationsJson = gson.toJson(revelations);

        resp.getWriter().write(revelationsJson);
    }
}
