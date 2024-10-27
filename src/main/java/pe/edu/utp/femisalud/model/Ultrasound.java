package pe.edu.utp.femisalud.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import org.hibernate.annotations.ColumnDefault;

import java.io.Serializable;
import java.time.Instant;

@Entity
@Table(name = "ULTRASOUND", schema = "femisalud_db")
public class Ultrasound implements Serializable {
    @Id
    @Column(name = "id_ultrasound", nullable = false)
    private Long id;

    @NotNull
    @Column(name = "execution_date", nullable = false)
    private Instant executionDate;

    @Size(max = 30)
    @NotNull
    @Column(name = "name", nullable = false, length = 30)
    private String name;

    @NotNull
    @Lob
    @Column(name = "type_of_assessment", nullable = false)
    private String typeOfAssessment;

    @NotNull
    @Lob
    @Column(name = "type_ultrasound", nullable = false)
    private String typeUltrasound;

    @NotNull
    @Column(name = "upload_date", nullable = false)
    private Instant uploadDate;

    @Size(max = 2000)
    @NotNull
    @Column(name = "ultrasound_url", nullable = false, length = 2000)
    private String ultrasoundUrl;

    @Size(max = 2000)
    @ColumnDefault("'Sin observación'")
    @Column(name = "clinical_notes", length = 2000)
    private String clinicalNotes;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "dni_patient", nullable = false, referencedColumnName = "dni")
    private Patient dniPatient;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Instant getExecutionDate() {
        return executionDate;
    }

    public void setExecutionDate(Instant executionDate) {
        this.executionDate = executionDate;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTypeOfAssessment() {
        return typeOfAssessment;
    }

    public void setTypeOfAssessment(String typeOfAssessment) {
        this.typeOfAssessment = typeOfAssessment;
    }

    public String getTypeUltrasound() {
        return typeUltrasound;
    }

    public void setTypeUltrasound(String typeUltrasound) {
        this.typeUltrasound = typeUltrasound;
    }

    public Instant getUploadDate() {
        return uploadDate;
    }

    public void setUploadDate(Instant uploadDate) {
        this.uploadDate = uploadDate;
    }

    public String getUltrasoundUrl() {
        return ultrasoundUrl;
    }

    public void setUltrasoundUrl(String ultrasoundUrl) {
        this.ultrasoundUrl = ultrasoundUrl;
    }

    public String getClinicalNotes() {
        return clinicalNotes;
    }

    public void setClinicalNotes(String clinicalNotes) {
        this.clinicalNotes = clinicalNotes;
    }

    public Patient getDniPatient() {
        return dniPatient;
    }

    public void setDniPatient(Patient dniPatient) {
        this.dniPatient = dniPatient;
    }

}