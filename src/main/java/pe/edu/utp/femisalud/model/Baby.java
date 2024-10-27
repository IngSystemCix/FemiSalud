package pe.edu.utp.femisalud.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import org.hibernate.annotations.ColumnDefault;

import java.io.Serializable;
import java.time.Instant;

@Entity
@Table(name = "BABY", schema = "femisalud_db")
public class Baby implements Serializable {
    @Id
    @Column(name = "id_baby", nullable = false)
    private Long id;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "id_patient", nullable = false)
    private Patient idPatient;

    @Size(max = 50)
    @NotNull
    @Column(name = "full_name", nullable = false, length = 50)
    private String fullName;

    @NotNull
    @Column(name = "genre", nullable = false)
    private Boolean genre = false;

    @NotNull
    @Column(name = "sex_verified", nullable = false)
    private Boolean sexVerified = false;

    @NotNull
    @ColumnDefault("current_timestamp()")
    @Column(name = "date", nullable = false)
    private Instant date;

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

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public Boolean getGenre() {
        return genre;
    }

    public void setGenre(Boolean genre) {
        this.genre = genre;
    }

    public Boolean getSexVerified() {
        return sexVerified;
    }

    public void setSexVerified(Boolean sexVerified) {
        this.sexVerified = sexVerified;
    }

    public Instant getDate() {
        return date;
    }

    public void setDate(Instant date) {
        this.date = date;
    }

}