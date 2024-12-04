package pe.edu.utp.femisalud.report;

import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pe.edu.utp.femisalud.DTO.ReportConsultAttentionDTO;
import pe.edu.utp.femisalud.dao.AdminDAO;
import pe.edu.utp.femisalud.util.GeneratorExcelUtil;

import java.io.IOException;
import java.io.OutputStream;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.logging.Logger;

@WebServlet(name = "ReportConsultServlet", value = "/report/report-consult")
public class ReportConsultServlet extends HttpServlet {

    private static final Logger LOGGER = Logger.getLogger("pe.edu.utp.femisalud");

    @Inject
    private AdminDAO adminDAO;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Obtén la fecha y hora actual
        LocalDateTime now = LocalDateTime.now();

        // Formatea la fecha en un formato seguro para nombres de archivo
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd_HHmmss");
        String timestamp = now.format(formatter);

        resp.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        resp.setHeader("Content-Disposition", "attachment; filename=report-consult__"+ timestamp +".xlsx");

        try {
            List<ReportConsultAttentionDTO[]> patientReportConsult = adminDAO.getReportConsultAttention();
            try (OutputStream outputStream = resp.getOutputStream()) {
                GeneratorExcelUtil generatorExcelUtil = new GeneratorExcelUtil();
                generatorExcelUtil.generateExcel(
                        "Reporte de consultas",
                        List.of("Nombre de la paciente", "DNI de la paciente", "Nombre del personal de call center", "DNI del usuario de call center", "Estado", "Fecha y hora de la atención"),
                        patientReportConsult,
                        outputStream
                );
                outputStream.flush();
            }
        }catch (Exception e){
            LOGGER.severe("Error al generar el reporte de consultas: " + e.getMessage());
        }
    }
}
