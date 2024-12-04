package pe.edu.utp.femisalud.servlet;

import com.google.common.base.Preconditions;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pe.edu.utp.femisalud.dao.AdminDAO;
import pe.edu.utp.femisalud.security.SanitizationSecurity;

import java.io.IOException;

@WebServlet(name = "AddClinicalNotesServlet", value = "/add-clinical-notes")
public class AddClinicalNotesServlet extends HttpServlet {

    @Inject
    private AdminDAO adminDAO;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String dni = req.getParameter("dni");
        Long idUltrasound = Long.parseLong(req.getParameter("id_eco"));
        String clinicalNotes = SanitizationSecurity.sanitizeForSQL(req.getParameter("note"));
        Preconditions.checkNotNull(dni, "DNI no proporcionado");
        Preconditions.checkNotNull(idUltrasound, "ID de ecografía no proporcionado");
        Preconditions.checkNotNull(clinicalNotes, "Notas clínicas no proporcionadas");
        adminDAO.addClinicalNotes(dni, idUltrasound, clinicalNotes);
        resp.sendRedirect(req.getContextPath() + "/admin/clinical-notes");
    }
}
