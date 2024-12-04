package pe.edu.utp.femisalud.util;

import java.security.SecureRandom;

public class GeneratorCodeUtil {
    public static String generateSixDigitCode() {
        SecureRandom random = new SecureRandom();
        int code = 100000 + random.nextInt(900000);
        return String.valueOf(code);
    }
}
