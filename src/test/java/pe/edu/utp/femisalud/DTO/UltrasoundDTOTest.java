package pe.edu.utp.femisalud.DTO;

import nl.jqno.equalsverifier.EqualsVerifier;
import org.junit.jupiter.api.Test;

public class UltrasoundDTOTest {
    @Test
    void testEquals() {
        EqualsVerifier.simple().forClass(UltrasoundDTO.class).verify();
    }
}
