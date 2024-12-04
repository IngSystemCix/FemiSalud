package pe.edu.utp.femisalud.api;

import com.google.gson.Gson;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pe.edu.utp.femisalud.DTO.ConsultDTO;
import pe.edu.utp.femisalud.dao.AdminDAO;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "GetConsultsByPatientServlet", value = "/api/get-consults-by-patient")
public class GetConsultsByPatientServlet extends HttpServlet {

    @Inject
    private AdminDAO adminDAO;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        List<ConsultDTO[]> consults = adminDAO.getConsultsByPatient();

        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");

        Gson gson = new Gson();
        String consultsJson = gson.toJson(consults);

        resp.getWriter().write(consultsJson);
    }
}
