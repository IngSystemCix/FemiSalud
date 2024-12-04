package pe.edu.utp.femisalud.models;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;

import java.time.LocalDate;

@Entity
@Table(name = "PREGNANCY", schema = "femisalud_db", indexes = {
        @Index(name = "DNI_patient", columnList = "DNI_patient")
})
public class Pregnancy {
    @Id
    @Column(name = "id", nullable = false)
    private Long id;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "DNI_patient", nullable = false)
    private Patient dniPatient;

    @NotNull
    @Column(name = "date_start", nullable = false)
    private LocalDate dateStart;

    @NotNull
    @Column(name = "date_end", nullable = false)
    private LocalDate dateEnd;

    @NotNull
    @Column(name = "amount_baby", nullable = false)
    private Integer amountBaby;

    @NotNull
    @Lob
    @Column(name = "type_of_pregnancy", nullable = false)
    private String typeOfPregnancy;

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

    public LocalDate getDateStart() {
        return dateStart;
    }

    public void setDateStart(LocalDate dateStart) {
        this.dateStart = dateStart;
    }

    public LocalDate getDateEnd() {
        return dateEnd;
    }

    public void setDateEnd(LocalDate dateEnd) {
        this.dateEnd = dateEnd;
    }

    public Integer getAmountBaby() {
        return amountBaby;
    }

    public void setAmountBaby(Integer amountBaby) {
        this.amountBaby = amountBaby;
    }

    public String getTypeOfPregnancy() {
        return typeOfPregnancy;
    }

    public void setTypeOfPregnancy(String typeOfPregnancy) {
        this.typeOfPregnancy = typeOfPregnancy;
    }

}