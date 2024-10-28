package pe.edu.utp.femisalud.controller;

import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pe.edu.utp.femisalud.dao.UltrasoundDAO;

import com.google.gson.Gson; // Asegúrate de tener la librería Gson

import java.io.IOException;
import java.util.List;

@WebServlet("/clinical_notes")
public class ClinicalNotesServlet extends HttpServlet {
    @Inject
    private UltrasoundDAO ultrasoundDAO;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String dni = req.getParameter("dni");
        List<Object[]> clinicalNotes = ultrasoundDAO.getClinicalNotesByPatient(dni);

        // Convertir la lista de notas clínicas a JSON
        Gson gson = new Gson();
        String json = gson.toJson(clinicalNotes);

        // Establecer el tipo de contenido y devolver el JSON
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().write(json);
    }
}
