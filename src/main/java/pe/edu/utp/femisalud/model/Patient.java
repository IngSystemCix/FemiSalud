package pe.edu.utp.femisalud.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import org.hibernate.annotations.ColumnDefault;

import java.time.Instant;
import java.time.LocalDate;

@Entity
@Table(name = "PATIENT", schema = "femisalud_db")
public class Patient {
    @Id
    @Size(max = 8)
    @Column(name = "dni", nullable = false, length = 8)
    private String dni;

    @Size(max = 50)
    @NotNull
    @Column(name = "full_name", nullable = false, length = 50)
    private String fullName;

    @Size(max = 25)
    @NotNull
    @Column(name = "paternal_surname", nullable = false, length = 25)
    private String paternalSurname;

    @Size(max = 25)
    @NotNull
    @Column(name = "maternal_surname", nullable = false, length = 25)
    private String maternalSurname;

    @NotNull
    @Column(name = "birth_date", nullable = false)
    private LocalDate birthDate;

    @Size(max = 100)
    @NotNull
    @Column(name = "email", nullable = false, length = 100)
    private String email;

    @Size(max = 9)
    @NotNull
    @Column(name = "phone_number", nullable = false, length = 9)
    private String phoneNumber;

    @NotNull
    @ColumnDefault("'UNIQUE'")
    @Lob
    @Column(name = "birth_type", nullable = false)
    private String birthType;

    @NotNull
    @ColumnDefault("current_timestamp()")
    @Column(name = "created_at", nullable = false)
    private Instant createdAt;

    @NotNull
    @ColumnDefault("current_timestamp()")
    @Column(name = "updated_at", nullable = false)
    private Instant updatedAt;

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
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

    public LocalDate getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(LocalDate birthDate) {
        this.birthDate = birthDate;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getBirthType() {
        return birthType;
    }

    public void setBirthType(String birthType) {
        this.birthType = birthType;
    }

    public Instant getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Instant createdAt) {
        this.createdAt = createdAt;
    }

    public Instant getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Instant updatedAt) {
        this.updatedAt = updatedAt;
    }

}