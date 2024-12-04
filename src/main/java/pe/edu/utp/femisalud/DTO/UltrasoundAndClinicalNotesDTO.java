package pe.edu.utp.femisalud.DTO;

import java.time.LocalDateTime;
import java.util.Objects;

public class UltrasoundAndClinicalNotesDTO {
    private final String ultrasoundLink;
    private final String clinicalNotes;
    private final LocalDateTime dateTime;

    public UltrasoundAndClinicalNotesDTO(String ultrasoundLink, String clinicalNotes, LocalDateTime dateTime) {
        this.ultrasoundLink = ultrasoundLink;
        this.clinicalNotes = clinicalNotes;
        this.dateTime = dateTime;
    }

    public String getUltrasoundLink() {
        return ultrasoundLink;
    }

    public String getClinicalNotes() {
        return clinicalNotes;
    }

    public LocalDateTime getDateTime() {
        return dateTime;
    }

    @Override
    public boolean equals(Object o) {
        if (o == null || getClass() != o.getClass()) return false;
        UltrasoundAndClinicalNotesDTO that = (UltrasoundAndClinicalNotesDTO) o;
        return Objects.equals(ultrasoundLink, that.ultrasoundLink) && Objects.equals(clinicalNotes, that.clinicalNotes) && Objects.equals(dateTime, that.dateTime);
    }

    @Override
    public int hashCode() {
        return Objects.hash(ultrasoundLink, clinicalNotes, dateTime);
    }

    @Override
    public String toString() {
        return "UltrasoundAndClinicalNotesDTO{" +
                "ultrasoundLink='" + ultrasoundLink + '\'' +
                ", clinicalNotes='" + clinicalNotes + '\'' +
                ", dateTime=" + dateTime +
                '}';
    }
}
