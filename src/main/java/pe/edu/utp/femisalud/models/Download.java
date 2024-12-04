package pe.edu.utp.femisalud.models;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;

@Entity
@Table(name = "DOWNLOAD", schema = "femisalud_db", indexes = {
        @Index(name = "DNI_patient", columnList = "DNI_patient"),
        @Index(name = "id_ultrasound", columnList = "id_ultrasound")
})
public class Download {
    @Id
    @Column(name = "id", nullable = false)
    private Long id;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "DNI_patient", nullable = false)
    private Patient dniPatient;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "id_ultrasound", nullable = false)
    private Ultrasound idUltrasound;

    @NotNull
    @Column(name = "ammount", nullable = false)
    private Integer ammount;

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

    public Ultrasound getIdUltrasound() {
        return idUltrasound;
    }

    public void setIdUltrasound(Ultrasound idUltrasound) {
        this.idUltrasound = idUltrasound;
    }

    public Integer getAmmount() {
        return ammount;
    }

    public void setAmmount(Integer ammount) {
        this.ammount = ammount;
    }

}