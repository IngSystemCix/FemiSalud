package pe.edu.utp.femisalud.util;

import org.apache.poi.ss.usermodel.*;

public class ApachePOIUtil {
    public static void createCell(
            Workbook wb, Row row, int column, Object value,
            HorizontalAlignment alignment,
            VerticalAlignment verticalAlignment
    ) {
        CreationHelper createHelper = wb.getCreationHelper();
        Cell cell = row.createCell(column);
        CellStyle cellStyle = wb.createCellStyle();
        cellStyle.setAlignment(alignment);
        cellStyle.setVerticalAlignment(verticalAlignment);

        if (value instanceof String) {
            cell.setCellValue((String) value);
        } else if (value instanceof Double) {
            cell.setCellValue((Double) value);
        } else if (value instanceof Integer) {
            cell.setCellValue((Integer) value);
        } else if (value instanceof Boolean) {
            cell.setCellValue((Boolean) value);
        } else if (value instanceof java.util.Date) {
            cellStyle.setDataFormat(createHelper.createDataFormat().getFormat("dd/MM/yyyy"));
            cell.setCellValue((java.util.Date) value);
        } else {
            cell.setCellValue(value.toString());
        }
        cell.setCellStyle(cellStyle);
    }

    public static void createCell(Workbook workbook, Row row, int columnIndex, String value) {
        Cell cell = row.createCell(columnIndex);
        cell.setCellValue(value); // Establece el valor de la celda

        // Aplicar estilo si es necesario
        CellStyle cellStyle = workbook.createCellStyle();
        Font font = workbook.createFont();

        // Si quieres un estilo específico para encabezados, puedes usar:
        if (row.getRowNum() == 0) { // Si es la fila de encabezado
            font.setBold(true);
            cellStyle.setFont(font);
        }

        // Puedes agregar más estilos aquí (alineación, color de fondo, etc.)

        cell.setCellStyle(cellStyle); // Aplica el estilo a la celda
    }
}
