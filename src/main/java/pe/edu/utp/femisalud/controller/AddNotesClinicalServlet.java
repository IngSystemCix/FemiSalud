package pe.edu.utp.femisalud.controller;

import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pe.edu.utp.femisalud.dao.UltrasoundDAO;

import java.io.IOException;

@WebServlet("/add_notes_clinical")
public class AddNotesClinicalServlet extends HttpServlet {

    @Inject
    private UltrasoundDAO ultrasoundDAO;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String dniPaciente = req.getParameter("dniPaciente");
        String idEcografia = req.getParameter("idEcografia");
        String notaClinica = req.getParameter("notaClinica");
        ultrasoundDAO.addClinicalNotes(dniPaciente, Long.parseLong(idEcografia), notaClinica);
        resp.sendRedirect("/femisalud/notes_clinical");
    }
}
