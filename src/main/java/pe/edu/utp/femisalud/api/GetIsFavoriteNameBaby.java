package pe.edu.utp.femisalud.api;

import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import pe.edu.utp.femisalud.dao.PatientDAO;

import java.io.IOException;

@WebServlet(name = "GetIsFavoriteNameBaby", value = "/api/get-is-favorite-name-baby")
public class GetIsFavoriteNameBaby extends HttpServlet {

    @Inject
    private PatientDAO patientDAO;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        String dni = (String) session.getAttribute("USER_DNI");
        String name = req.getParameter("name");

        boolean isFavorite = patientDAO.isFavoriteNameBaby(name, dni);

        resp.setContentType("application/json");
        resp.getWriter().write("{\"isFavorite\": " + isFavorite + "}");
    }
}
