package pe.edu.utp.femisalud.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

import java.io.Serializable;

@Entity
@Table(name = "AMBASSADOR", schema = "femisalud_db")
public class Ambassador implements Serializable {
    @Id
    @Column(name = "id_ambassador", nullable = false)
    private Long id;

    @Size(max = 120)
    @NotNull
    @Column(name = "name", nullable = false, length = 120)
    private String name;

    @Size(max = 8)
    @NotNull
    @Column(name = "dni_patient", nullable = false, length = 8)
    private String dniPatient;

    @Size(max = 9)
    @NotNull
    @Column(name = "phone", nullable = false, length = 9)
    private String phone;

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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDniPatient() {
        return dniPatient;
    }

    public void setDniPatient(String dniPatient) {
        this.dniPatient = dniPatient;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

}