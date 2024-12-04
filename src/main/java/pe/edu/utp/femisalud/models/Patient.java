package pe.edu.utp.femisalud.models;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

@Entity
@Table(name = "PATIENT", schema = "femisalud_db", indexes = {
        @Index(name = "id", columnList = "id")
})
public class Patient {
    @Id
    @Size(max = 8)
    @Column(name = "dni", nullable = false, length = 8)
    private String dni;

    @Size(max = 25)
    @NotNull
    @Column(name = "name", nullable = false, length = 25)
    private String name;

    @Size(max = 25)
    @NotNull
    @Column(name = "paternal_surname", nullable = false, length = 25)
    private String paternalSurname;

    @Size(max = 25)
    @NotNull
    @Column(name = "maternal_surname", nullable = false, length = 25)
    private String maternalSurname;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "id", nullable = false)
    private User id;

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPaternalSurname() {
        return paternalSurname;
    }

    public void setPaternalSurname(String paternalSurname) {
        this.paternalSurname = paternalSurname;
    }

    public String getMaternalSurname() {
        return maternalSurname;
    }

    public void setMaternalSurname(String maternalSurname) {
        this.maternalSurname = maternalSurname;
    }

    public User getId() {
        return id;
    }

    public void setId(User id) {
        this.id = id;
    }

}