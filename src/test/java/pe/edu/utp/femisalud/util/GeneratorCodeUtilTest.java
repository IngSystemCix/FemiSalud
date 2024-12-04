package pe.edu.utp.femisalud.util;

import org.junit.jupiter.api.Test;

/**
 * Unit tests for the GeneratorCode class.
 */
public class GeneratorCodeUtilTest {

    /**
     * Tests the generateSixDigitCode method.
     * Ensures that the generated code is a six-digit number.
     */
    @Test
    void testGeneratorCode() {
        String code = GeneratorCodeUtil.generateSixDigitCode();
        assert code.length() == 6;
        assert code.matches("\\d{6}");
    }
}