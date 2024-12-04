package pe.edu.utp.femisalud.report;

import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pe.edu.utp.femisalud.DTO.ReportRevelationDTO;
import pe.edu.utp.femisalud.dao.AdminDAO;
import pe.edu.utp.femisalud.util.GeneratorExcelUtil;

import java.io.IOException;
import java.io.OutputStream;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.logging.Logger;

@WebServlet(name = "ReportRevelationServlet", value = "/report/report-revelation")
public class ReportRevelationServlet extends HttpServlet {

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
        resp.setHeader("Content-Disposition", "attachment; filename=report-revelation__"+ timestamp +".xlsx");

        try {
            List<ReportRevelationDTO[]> patientReportRevelation = adminDAO.getReportRevelation();
            try (OutputStream outputStream = resp.getOutputStream()) {
                GeneratorExcelUtil generatorExcelUtil = new GeneratorExcelUtil();
                generatorExcelUtil.generateExcel(
                        "Reporte de revelaciones",
                        List.of("DNI", "Nombre", "Apellido Paterno", "Apellido Materno", "Mes de la revelación"),
                        patientReportRevelation,
                        outputStream
                );
                outputStream.flush();
            }
        }catch (Exception e){
            LOGGER.severe("Error al generar el reporte de revelaciones: " + e.getMessage());
        }
    }
}
