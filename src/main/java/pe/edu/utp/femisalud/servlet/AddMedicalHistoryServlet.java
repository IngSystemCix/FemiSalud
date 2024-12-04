package pe.edu.utp.femisalud.servlet;

import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pe.edu.utp.femisalud.dao.AdminDAO;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "AddMedicalHistoryServlet", urlPatterns = "/add-medical-history")
public class AddMedicalHistoryServlet extends HttpServlet {

    @Inject
    private AdminDAO adminDAO;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String dni = req.getParameter("dni");
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate dateStartPregnancy = LocalDate.parse(req.getParameter("date_start_pregnancy"), formatter);
        LocalDate dateEndPregnancy = LocalDate.parse(req.getParameter("date_end_pregnancy"), formatter);
        int amountBaby = Integer.parseInt(req.getParameter("amount_baby"));
        String typePregnancy = req.getParameter("type_pregnancy");

        List<Integer> babyGenres = new ArrayList<>();
        for (int i = 0; i < amountBaby; i++) {
            String genreParam = req.getParameter("baby_genre_" + i);
            if (genreParam != null) {
                try {
                    babyGenres.add(Integer.parseInt(genreParam));
                } catch (NumberFormatException e) {
                    throw new ServletException("Valor inválido para el género del bebé: " + genreParam, e);
                }
            }
        }

        adminDAO.addMedicalHistory(dni, dateStartPregnancy, dateEndPregnancy, amountBaby, typePregnancy, babyGenres);
        resp.sendRedirect(req.getContextPath() + "/admin/medical-history");
    }
}
