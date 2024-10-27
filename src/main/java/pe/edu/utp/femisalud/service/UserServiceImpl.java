package pe.edu.utp.femisalud.service;

import com.google.common.collect.ImmutableList;
import jakarta.ejb.Stateless;
import jakarta.inject.Inject;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.ss.util.WorkbookUtil;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import pe.edu.utp.femisalud.dao.UserDAO;

import java.io.FileOutputStream;
import java.io.IOException;

import static pe.edu.utp.femisalud.util.ApachePOIUtil.createCell;

@Stateless
public class UserServiceImpl implements UserService {

    @Inject
    private UserDAO userDao;

    @Override
    public void generateReport(String name) {
        String fileName = "src/main/resources/reports/reporte_femisalud.xlsx";

        try (Workbook wb = new XSSFWorkbook();
             FileOutputStream fos = new FileOutputStream(fileName)) {

            String safeName = WorkbookUtil.createSafeSheetName("Femisalud");
            Sheet sheet = wb.createSheet(safeName);

            Row row = sheet.createRow(0);
            createCell(wb, row, 0, "DNI", HorizontalAlignment.CENTER, VerticalAlignment.CENTER);
            createCell(wb, row, 1, "ID de la ecografía", HorizontalAlignment.CENTER, VerticalAlignment.CENTER);
            createCell(wb, row, 2, "Fecha y hora de la ecografía", HorizontalAlignment.CENTER, VerticalAlignment.CENTER);
            createCell(wb, row, 3, "Nota clínica", HorizontalAlignment.CENTER, VerticalAlignment.CENTER);

            int rowIdx = 1;

            ImmutableList<Object[]> data = userDao.generateReportUltrasound(name);

            for (Object[] obj : data) {
                row = sheet.createRow(rowIdx++);
                createCell(wb, row, 0, obj[0], HorizontalAlignment.CENTER, VerticalAlignment.CENTER);
                createCell(wb, row, 1, obj[1], HorizontalAlignment.CENTER, VerticalAlignment.CENTER);
                createCell(wb, row, 2, obj[2], HorizontalAlignment.CENTER, VerticalAlignment.CENTER);
                createCell(wb, row, 3, obj[3], HorizontalAlignment.CENTER, VerticalAlignment.CENTER);
            }

            wb.write(fos);

        } catch (IOException e) {
            throw new RuntimeException("Error al escribir el archivo de reporte", e);
        } catch (Exception e) {
            throw new RuntimeException("Error al ejecutar la consulta", e);
        }
    }
}
