package pe.edu.utp.femisalud.models;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

import java.time.Instant;

@Entity
@Table(name = "CLINICAL_NOTES", schema = "femisalud_db", indexes = {
        @Index(name = "id_patient", columnList = "id_patient"),
        @Index(name = "id_ultrasound", columnList = "id_ultrasound")
})
public class ClinicalNote {
    @Id
    @Column(name = "id", nullable = false)
    private Long id;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "id_patient", nullable = false, referencedColumnName = "id")
    private Patient idPatient;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "id_ultrasound", nullable = false)
    private Ultrasound idUltrasound;

    @NotNull
    @Column(name = "datetime", nullable = false)
    private Instant datetime;

    @Size(max = 500)
    @NotNull
    @Column(name = "clinical_note", nullable = false, length = 500)
    private String clinicalNote;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Patient getIdPatient() {
        return idPatient;
    }

    public void setIdPatient(Patient idPatient) {
        this.idPatient = idPatient;
    }

    public Ultrasound getIdUltrasound() {
        return idUltrasound;
    }

    public void setIdUltrasound(Ultrasound idUltrasound) {
        this.idUltrasound = idUltrasound;
    }

    public Instant getDatetime() {
        return datetime;
    }

    public void setDatetime(Instant datetime) {
        this.datetime = datetime;
    }

    public String getClinicalNote() {
        return clinicalNote;
    }

    public void setClinicalNote(String clinicalNote) {
        this.clinicalNote = clinicalNote;
    }

}