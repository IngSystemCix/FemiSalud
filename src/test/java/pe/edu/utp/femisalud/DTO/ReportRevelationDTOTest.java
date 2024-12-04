package pe.edu.utp.femisalud.DTO;

import nl.jqno.equalsverifier.EqualsVerifier;
import org.junit.jupiter.api.Test;

public class ReportRevelationDTOTest {
    @Test
    void testEquals() {
        EqualsVerifier.simple().forClass(ReportRevelationDTO.class).verify();
    }
}
