package pe.edu.utp.femisalud.models;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

@Entity
@Table(name = "AMBASSADOR", schema = "femisalud_db", indexes = {
        @Index(name = "DNI_patient", columnList = "DNI_patient")
}, uniqueConstraints = {
        @UniqueConstraint(name = "email", columnNames = {"email"})
})
public class Ambassador {
    @Id
    @Column(name = "id", nullable = false)
    private Long id;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "DNI_patient", nullable = false)
    private Patient dniPatient;

    @Size(max = 150)
    @NotNull
    @Column(name = "full_names", nullable = false, length = 150)
    private String fullNames;

    @Size(max = 8)
    @NotNull
    @Column(name = "dni", nullable = false, length = 8)
    private String dni;

    @Size(max = 9)
    @NotNull
    @Column(name = "number_phone", nullable = false, length = 9)
    private String numberPhone;

    @Size(max = 100)
    @NotNull
    @Column(name = "email", nullable = false, length = 100)
    private String email;

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

    public String getFullNames() {
        return fullNames;
    }

    public void setFullNames(String fullNames) {
        this.fullNames = fullNames;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getNumberPhone() {
        return numberPhone;
    }

    public void setNumberPhone(String numberPhone) {
        this.numberPhone = numberPhone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

}