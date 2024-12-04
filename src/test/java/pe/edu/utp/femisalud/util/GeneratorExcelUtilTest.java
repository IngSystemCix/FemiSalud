package pe.edu.utp.femisalud.util;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

/**
 * Unit tests for the GeneratorExcelUtil class.
 */
class GeneratorExcelUtilTest {

    private GeneratorExcelUtil generatorExcelUtil;

    /**
     * Sets up the test environment before each test.
     * Initializes the GeneratorExcelUtil instance.
     */
    @BeforeEach
    void setUp() {
        generatorExcelUtil = new GeneratorExcelUtil();
    }

    /**
     * Tests the generateExcel method with non-empty data.
     * Verifies that the Excel file is generated successfully.
     *
     * @throws IOException if an I/O error occurs while generating the Excel file
     */
    @Test
    void testGenerateExcelEmptyData() throws IOException {
        // Headers para el reporte
        List<String> headers = Arrays.asList("ID", "Número", "Fecha", "Nota Clínica");

        // Datos a insertar (siguiendo el tipo Object[])
        List<Object[]> data = Arrays.asList(
                new Object[]{"12345678", 1, new Date(), "Nota clínica 1"},
                new Object[]{"87654321", 2, new Date(), "Nota clínica 2"},
                new Object[]{"11223344", 3, new Date(), "Nota clínica 3"}
        );

        // Generación del archivo Excel
        try (FileOutputStream fileOut = new FileOutputStream("C:\\Users\\furia\\Downloads\\file.xlsx")) {
            generatorExcelUtil.generateExcel("Reporte de Notas Clínicas", headers, data, fileOut);
        }
    }

}