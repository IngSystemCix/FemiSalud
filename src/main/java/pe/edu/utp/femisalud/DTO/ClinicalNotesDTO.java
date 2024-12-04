package pe.edu.utp.femisalud.DTO;

import java.time.LocalDateTime;
import java.util.Objects;

public class ClinicalNotesDTO {
    private final String dni;
    private final Long idUltrasound;
    private final LocalDateTime ultrasoundDate;
    private final String clinicalNotes;

    public ClinicalNotesDTO(String dni, Long idUltrasound, LocalDateTime ultrasoundDate, String clinicalNotes) {
        this.dni = dni;
        this.idUltrasound = idUltrasound;
        this.ultrasoundDate = ultrasoundDate;
        this.clinicalNotes = clinicalNotes;
    }

    public String getDni() {
        return dni;
    }

    public Long getIdUltrasound() {
        return idUltrasound;
    }

    public LocalDateTime getUltrasoundDate() {
        return ultrasoundDate;
    }

    public String getClinicalNotes() {
        return clinicalNotes;
    }

    @Override
    public boolean equals(Object o) {
        if (o == null || getClass() != o.getClass()) return false;
        ClinicalNotesDTO that = (ClinicalNotesDTO) o;
        return Objects.equals(dni, that.dni) && Objects.equals(idUltrasound, that.idUltrasound) && Objects.equals(ultrasoundDate, that.ultrasoundDate) && Objects.equals(clinicalNotes, that.clinicalNotes);
    }

    @Override
    public int hashCode() {
        return Objects.hash(dni, idUltrasound, ultrasoundDate, clinicalNotes);
    }

    @Override
    public String toString() {
        return "ClinicalNotesDTO{" +
                "dni='" + dni + '\'' +
                ", idUltrasound=" + idUltrasound +
                ", ultrasoundDate=" + ultrasoundDate +
                ", clinicalNotes='" + clinicalNotes + '\'' +
                '}';
    }
}
