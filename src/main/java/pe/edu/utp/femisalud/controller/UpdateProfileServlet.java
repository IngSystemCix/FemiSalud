package pe.edu.utp.femisalud.controller;

import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import pe.edu.utp.femisalud.dao.PatientDAO;

import java.io.IOException;

@WebServlet("/update_profile")
public class UpdateProfileServlet extends HttpServlet {
    @Inject
    private PatientDAO patientDAO;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String dni = (String) session.getAttribute("dni");
        String phone = req.getParameter("telefono");
        String email = req.getParameter("email");

        patientDAO.updateData(dni, phone, email);

        resp.sendRedirect(req.getContextPath() + "/profile");
    }
}
