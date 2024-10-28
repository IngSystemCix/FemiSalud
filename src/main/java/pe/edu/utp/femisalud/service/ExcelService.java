package pe.edu.utp.femisalud.service;

import jakarta.ejb.Stateless;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.WorkbookUtil;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.IOException;
import java.io.OutputStream;
import java.util.Date;
import java.util.List;
import java.util.logging.Logger;

import static pe.edu.utp.femisalud.util.ApachePOIUtil.createCell;

@Stateless
public class ExcelService {

    private static final Logger LOGGER = Logger.getLogger("pe.edu.utp.femisalud");

    public void generateExcel(List<Object[]> data, OutputStream outputStream) throws IOException {
        try (Workbook workbook = new XSSFWorkbook()) {
            String safeName = WorkbookUtil.createSafeSheetName("REPORTE");
            Sheet sheet = workbook.createSheet(safeName);

            // Crear fila de encabezado
            Row headerRow = sheet.createRow(0);
            createCell(workbook, headerRow, 0, "DNI de la paciente");
            createCell(workbook, headerRow, 1, "ID de la ecografía");
            createCell(workbook, headerRow, 2, "Fecha y hora de la ecografía");
            createCell(workbook, headerRow, 3, "Notas clínicas");

            // Llenar el contenido
            int rowIdx = 1;
            for (Object[] row : data) {
                Row rowItem = sheet.createRow(rowIdx++);
                for (int colIdx = 0; colIdx < row.length; colIdx++) {
                    if (row[colIdx] instanceof String) {
                        createCell(workbook, rowItem, colIdx, (String) row[colIdx]);
                    } else if (row[colIdx] instanceof Integer) {
                        createCell(workbook, rowItem, colIdx, String.valueOf((Integer) row[colIdx]));
                    } else if (row[colIdx] instanceof Date) {
                        createCell(workbook, rowItem, colIdx, row[colIdx].toString());
                    } else {
                        createCell(workbook, rowItem, colIdx, row[colIdx] != null ? row[colIdx].toString() : "");
                    }
                }
            }

            workbook.write(outputStream);
        }catch (IOException e){
            LOGGER.severe("Error al generar el archivo Excel");
            throw e;
        }
    }
}
