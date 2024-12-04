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
import java.time.LocalDateTime;

@WebServlet(name = "AddUltrasoundServlet", urlPatterns = "/add-ultrasound")
public class AddUltrasoundServlet extends HttpServlet {

    @Inject
    private AdminDAO adminDAO;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String dni = req.getParameter("dni");
        LocalDate dateAttention = LocalDate.parse(req.getParameter("dateAttention"));
        LocalDateTime dateUltrasound = LocalDateTime.parse(req.getParameter("date"));
        String typeEvaluation = req.getParameter("type_eva");
        String typeUltrasound = req.getParameter("type_eco");
        String linkUltrasound = req.getParameter("url");
        String doctorName = req.getParameter("doctor");
        adminDAO.addUltrasound(dni, dateAttention, dateUltrasound, typeEvaluation, typeUltrasound, linkUltrasound, doctorName);
        resp.sendRedirect(req.getContextPath() + "/admin/register-ultrasound");
    }
}
