package pe.edu.utp.femisalud.DTO;

import nl.jqno.equalsverifier.EqualsVerifier;
import org.junit.jupiter.api.Test;

public class ReportConsultAttentionDTOTest {
    @Test
    void testEquals() {
        EqualsVerifier.simple().forClass(ReportConsultAttentionDTO.class).verify();
    }
}
