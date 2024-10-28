package pe.edu.utp.femisalud.controller;

import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pe.edu.utp.femisalud.dao.UltrasoundDAO;
import pe.edu.utp.femisalud.service.ExcelService;

import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import java.util.logging.Logger;

@WebServlet("/export_clinical_notes")
public class ExportClinicalNotesServlet extends HttpServlet {

    private static final Logger LOGGER = Logger.getLogger("pe.edu.utp.femisalud");

    @Inject
    private ExcelService excelService;

    @Inject
    private UltrasoundDAO ultrasoundDAO;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String dni = req.getParameter("dni");

        // Configura el tipo de contenido y el encabezado para la descarga de archivo .xlsx
        resp.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        resp.setHeader("Content-Disposition", "attachment; filename=\"reporte.xlsx\"");

        try {
            // Obtener datos de las notas clínicas del paciente
            List<Object[]> clinicalNotes = ultrasoundDAO.getClinicalNotesByPatient(dni);

            // Generar el archivo Excel y enviarlo como respuesta
            try (OutputStream out = resp.getOutputStream()) {
                excelService.generateExcel(clinicalNotes, out);
                out.flush(); // Asegura que todo el contenido se envíe al cliente
            }
        } catch (Exception e) {
            LOGGER.severe("Error al exportar las notas clínicas: " + e.getMessage());
            resp.getWriter().println("Error al exportar las notas clínicas");
        }
    }
}
