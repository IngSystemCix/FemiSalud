package pe.edu.utp.femisalud.controller;

import com.google.common.collect.ImmutableList;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pe.edu.utp.femisalud.dao.PatientDAO;

import java.io.IOException;
import java.util.List;

public class RoutesPages extends HttpServlet {
    @Inject
    private PatientDAO patientDAO;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getServletPath();

        switch (path) {
            case "/":
            case "/login":
                forwardToPage(req, resp, "/index.jsp");
                break;
            case "/home":
                forwardToPage(req, resp, "/home.jsp");
                break;
            case "/profile":
                forwardToPage(req, resp, "/editProfile.jsp");
                break;
            case "/ambassador":
                forwardToPage(req, resp, "/ambassadorsForm.jsp");
                break;
            case "/message":
                forwardToPage(req, resp, "/message.jsp");
                break;
            case "/ultrasound":
                forwardToPage(req, resp, "/ultrasound.jsp");
                break;
            case "/baby":
                forwardToPage(req, resp, "/baby.jsp");
                break;
            case "/attention_form":
                forwardToPage(req, resp, "/attentionForm.jsp");
                break;
            case "/dashboard_admin":
                forwardToPage(req, resp, "/dashboardAdmin.jsp");
                break;
            case "/notes_clinical":
                handleClinicalNotes(req, resp);
                break;
            default:
                forwardToPage(req, resp, "/404.jsp");
                break;
        }
    }

    private void forwardToPage(HttpServletRequest req, HttpServletResponse resp, String page) throws ServletException, IOException {
        req.getRequestDispatcher(page).forward(req, resp);
    }

    private void handleClinicalNotes(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            List<String> patients = patientDAO.getAllPatients();
            req.setAttribute("patients", patients);
            forwardToPage(req, resp, "/clinicalNoteAdmin.jsp");
        } catch (Exception e) {
            req.setAttribute("errorMessage", "No se pudieron cargar los pacientes.");
            forwardToPage(req, resp, "/error.jsp");
        }
    }
}
