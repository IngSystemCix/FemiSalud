package pe.edu.utp.femisalud.DTO;

import nl.jqno.equalsverifier.EqualsVerifier;
import org.junit.jupiter.api.Test;

public class UltrasoundAndClinicalNotesDTOTest {
    @Test
    void testEquals() {
        EqualsVerifier.simple().forClass(UltrasoundAndClinicalNotesDTO.class).verify();
    }
}
