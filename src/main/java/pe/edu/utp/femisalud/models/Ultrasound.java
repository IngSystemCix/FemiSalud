package pe.edu.utp.femisalud.models;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

import java.time.Instant;

@Entity
@Table(name = "ULTRASOUND", schema = "femisalud_db", indexes = {
        @Index(name = "DNI_patient", columnList = "DNI_patient"),
        @Index(name = "id_pregnancy", columnList = "id_pregnancy")
})
public class Ultrasound {
    @Id
    @Column(name = "id", nullable = false)
    private Long id;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "DNI_patient", nullable = false)
    private Patient dniPatient;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "id_pregnancy", nullable = false)
    private Pregnancy idPregnancy;

    @NotNull
    @Column(name = "datetime_ultrasound", nullable = false)
    private Instant datetimeUltrasound;

    @NotNull
    @Lob
    @Column(name = "type_evaluation", nullable = false)
    private String typeEvaluation;

    @NotNull
    @Lob
    @Column(name = "type_ultrasound", nullable = false)
    private String typeUltrasound;

    @Size(max = 2000)
    @NotNull
    @Column(name = "link", nullable = false, length = 2000)
    private String link;

    @Size(max = 150)
    @NotNull
    @Column(name = "doctor", nullable = false, length = 150)
    private String doctor;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Patient getDniPatient() {
        return dniPatient;
    }

    public void setDniPatient(Patient dniPatient) {
        this.dniPatient = dniPatient;
    }

    public Pregnancy getIdPregnancy() {
        return idPregnancy;
    }

    public void setIdPregnancy(Pregnancy idPregnancy) {
        this.idPregnancy = idPregnancy;
    }

    public Instant getDatetimeUltrasound() {
        return datetimeUltrasound;
    }

    public void setDatetimeUltrasound(Instant datetimeUltrasound) {
        this.datetimeUltrasound = datetimeUltrasound;
    }

    public String getTypeEvaluation() {
        return typeEvaluation;
    }

    public void setTypeEvaluation(String typeEvaluation) {
        this.typeEvaluation = typeEvaluation;
    }

    public String getTypeUltrasound() {
        return typeUltrasound;
    }

    public void setTypeUltrasound(String typeUltrasound) {
        this.typeUltrasound = typeUltrasound;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public String getDoctor() {
        return doctor;
    }

    public void setDoctor(String doctor) {
        this.doctor = doctor;
    }

}