package pe.edu.utp.femisalud.servlet;

import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import pe.edu.utp.femisalud.dao.PatientDAO;

import java.io.IOException;

@WebServlet(name = "AddAmbassador", value = "/add-ambassador")
public class AddAmbassador extends HttpServlet {

    @Inject
    private PatientDAO patientDAO;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String dni = (String) session.getAttribute("USER_DNI");
        patientDAO.addAmbassador(dni, req.getParameter("name"), req.getParameter("dni"), req.getParameter("tel"), req.getParameter("email"));
        resp.sendRedirect(req.getContextPath() + "/u/home");
    }
}
