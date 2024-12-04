package pe.edu.utp.femisalud.api;

import com.google.gson.Gson;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pe.edu.utp.femisalud.DTO.UltrasoundStatisticsPercentagesDTO;
import pe.edu.utp.femisalud.dao.AdminDAO;

import java.io.IOException;

@WebServlet(name = "GetUltrasoundStatisticsServlet", value = "/api/ultrasound-statistics")
public class GetUltrasoundStatisticsServlet extends HttpServlet {

    @Inject
    private AdminDAO adminDAO;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UltrasoundStatisticsPercentagesDTO ultrasoundStatisticsPercentagesDTO = adminDAO.getUltrasoundStatisticsPercentages();
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        Gson gson = new Gson();
        String json = gson.toJson(ultrasoundStatisticsPercentagesDTO);
        resp.getWriter().write(json);
    }
}
