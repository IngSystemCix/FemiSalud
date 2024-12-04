package pe.edu.utp.femisalud.util;

import org.apache.poi.ss.usermodel.*;
import org.apache.poi.ss.util.WorkbookUtil;

/**
 * Utility class for creating cells in Apache POI workbooks.
 */
public class ApachePOIUtil {

    /**
     * Creates a cell in the specified row with the given value and styles.
     *
     * @param wb the workbook to which the cell belongs
     * @param row the row in which the cell is created
     * @param column the column index of the cell
     * @param value the value to set in the cell
     * @param alignment the horizontal alignment of the cell
     * @param verticalAlignment the vertical alignment of the cell
     */
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

    /**
     * Creates a cell in the specified row with the given string value.
     * If the cell is in the first row, the font is set to bold.
     *
     * @param workbook the workbook to which the cell belongs
     * @param row the row in which the cell is created
     * @param columnIndex the column index of the cell
     * @param value the string value to set in the cell
     */
    public static void createCell(Workbook workbook, Row row, int columnIndex, String value, CellStyle style) {
        Cell cell = row.createCell(columnIndex);
        cell.setCellValue(value);
        cell.setCellStyle(style);
    }
}
