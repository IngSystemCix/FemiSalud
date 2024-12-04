package pe.edu.utp.femisalud.util;

import jakarta.ejb.Stateless;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.ss.util.WorkbookUtil;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import pe.edu.utp.femisalud.DTO.PatientReportUltrasoundInfoDTO;
import pe.edu.utp.femisalud.DTO.ReportConsultAttentionDTO;
import pe.edu.utp.femisalud.DTO.ReportRevelationDTO;

import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import java.util.logging.Logger;

import static pe.edu.utp.femisalud.util.ApachePOIUtil.createCell;

/**
 * Utility class for generating Excel reports.
 */
@Stateless
public class GeneratorExcelUtil {
    private static final Logger LOGGER = Logger.getLogger("pe.edu.utp.femisalud");

    /**
     * Generates an Excel report with the given data and writes it to the provided OutputStream.
     *
     * @param nameReport the name of the Excel report
     * @param headers the list of headers to be included in the Excel report
     * @param data the data to be included in the Excel report
     * @param outputStream the OutputStream to write the Excel report to
     * @throws IOException if an I/O error occurs while generating the Excel report
     */
    public <T> void generateExcel(String nameReport, List<String> headers, List<T> data, OutputStream outputStream) throws IOException {
        try (Workbook workbook = new XSSFWorkbook()) {
            String safeName = WorkbookUtil.createSafeSheetName(nameReport);
            Sheet sheet = workbook.createSheet(safeName);

            // Create header row dynamically from the headers list
            Row headerRow = sheet.createRow(0);

            // Create cell style with background and font color
            CellStyle headerStyle = workbook.createCellStyle();
            headerStyle.setFillForegroundColor(IndexedColors.DARK_BLUE.getIndex()); // #115691
            headerStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);

            // Create font with color #ddedfc
            Font headerFont = workbook.createFont();
            headerFont.setColor(IndexedColors.WHITE.getIndex()); // Font color: #ddedfc
            headerFont.setBold(true); // Optional: make header text bold
            headerStyle.setFont(headerFont);

            // Apply the style to header cells
            for (int i = 0; i < headers.size(); i++) {
                createCell(workbook, headerRow, i, headers.get(i), headerStyle);
            }

            // Fill content with data, aligning them as needed
            int rowIdx = 1;
            for (T item : data) {
                if (item instanceof PatientReportUltrasoundInfoDTO[] report) {

                    // Create a new row for each item in the data list
                    Row rowItem = sheet.createRow(rowIdx++);

                    createCell(workbook, rowItem, 0, report[0].getName(), HorizontalAlignment.CENTER, VerticalAlignment.CENTER);
                    createCell(workbook, rowItem, 1, report[0].getPaternalSurname(), HorizontalAlignment.CENTER, VerticalAlignment.CENTER);
                    createCell(workbook, rowItem, 2, report[0].getMaternalSurname(), HorizontalAlignment.CENTER, VerticalAlignment.CENTER);
                    createCell(workbook, rowItem, 3, String.valueOf(report[0].getAge()), HorizontalAlignment.CENTER, VerticalAlignment.CENTER);
                    createCell(workbook, rowItem, 4, report[0].getDateUltrasound().toString(), HorizontalAlignment.CENTER, VerticalAlignment.CENTER);
                    createCell(workbook, rowItem, 5, report[0].getDownloaded(), HorizontalAlignment.CENTER, VerticalAlignment.CENTER);
                    createCell(workbook, rowItem, 6, report[0].getViewed(), HorizontalAlignment.CENTER, VerticalAlignment.CENTER);
                } else if (item instanceof ReportConsultAttentionDTO[] report) {

                        // Create a new row for each item in the data list
                        Row rowItem = sheet.createRow(rowIdx++);

                        createCell(workbook, rowItem, 0, report[0].getPatientName(), HorizontalAlignment.CENTER, VerticalAlignment.CENTER);
                        createCell(workbook, rowItem, 1, report[0].getDNIPatient(), HorizontalAlignment.CENTER, VerticalAlignment.CENTER);
                        createCell(workbook, rowItem, 2, report[0].getCallCenterName(), HorizontalAlignment.CENTER, VerticalAlignment.CENTER);
                        createCell(workbook, rowItem, 3, report[0].getDNICallCenter(), HorizontalAlignment.CENTER, VerticalAlignment.CENTER);
                        createCell(workbook, rowItem, 4, report[0].getStatus(), HorizontalAlignment.CENTER, VerticalAlignment.CENTER);
                        createCell(workbook, rowItem, 5, report[0].getDateAttention().toString(), HorizontalAlignment.CENTER, VerticalAlignment.CENTER);
                } else if (item instanceof ReportRevelationDTO[] report) {

                        // Create a new row for each item in the data list
                        Row rowItem = sheet.createRow(rowIdx++);

                        createCell(workbook, rowItem, 0, report[0].getDni(), HorizontalAlignment.CENTER, VerticalAlignment.CENTER);
                        createCell(workbook, rowItem, 1, report[0].getName(), HorizontalAlignment.CENTER, VerticalAlignment.CENTER);
                        createCell(workbook, rowItem, 2, report[0].getPaternalSurname(), HorizontalAlignment.CENTER, VerticalAlignment.CENTER);
                        createCell(workbook, rowItem, 3, report[0].getMaternalSurname(), HorizontalAlignment.CENTER, VerticalAlignment.CENTER);
                        createCell(workbook, rowItem, 4, report[0].getMonth(), HorizontalAlignment.CENTER, VerticalAlignment.CENTER);
                } else {
                    LOGGER.warning("Skipped non-PatientReportUltrasoundInfoDTO object: " + item);
                }
            }

            // Apply auto-size to all columns
            for (int i = 0; i < headers.size(); i++) {
                sheet.autoSizeColumn(i);
            }

            workbook.write(outputStream);
        } catch (IOException e) {
            LOGGER.severe("Error al generar el archivo Excel");
            throw e;
        }
    }
}
