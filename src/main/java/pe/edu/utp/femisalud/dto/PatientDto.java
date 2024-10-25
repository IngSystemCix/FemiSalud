package pe.edu.utp.femisalud.dto;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

import java.io.Serializable;
import java.time.Instant;
import java.time.LocalDate;
import java.util.Objects;

/**
 * DTO for {@link pe.edu.utp.femisalud.model.Patient}
 */
public class PatientDto implements Serializable {
    @Size(max = 8)
    private final String dni;
    @NotNull
    @Size(max = 25)
    @NotBlank(message = "El nombre no puede estar vacío")
    private final String fullName;
    @NotNull
    @Size(max = 25)
    @NotBlank(message = "El apellido paterno no puede estar vacío")
    private final String paternalSurname;
    @NotNull
    @Size(max = 25)
    @NotBlank(message = "El apellido materno no puede estar vacío")
    private final String maternalSurname;
    @NotNull
    private final LocalDate birthDate;
    @NotNull
    @Size(max = 100)
    @Email(message = "Escribe un correo válido", regexp = "^[\\\\w\\\\.-]+@[\\\\w\\\\.-]+\\\\.[a-zA-Z]{2,}$")
    private final String email;
    @NotNull
    @Size(max = 9)
    private final String phoneNumber;
    @NotNull
    private final String birthType;
    @NotNull
    private final Instant createdAt;
    @NotNull
    private final Instant updatedAt;

    public PatientDto(String dni, String fullName, String paternalSurname, String maternalSurname, LocalDate birthDate, String email, String phoneNumber, String birthType, Instant createdAt, Instant updatedAt) {
        this.dni = dni;
        this.fullName = fullName;
        this.paternalSurname = paternalSurname;
        this.maternalSurname = maternalSurname;
        this.birthDate = birthDate;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.birthType = birthType;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    public String getDni() {
        return dni;
    }

    public String getFullName() {
        return fullName;
    }

    public String getPaternalSurname() {
        return paternalSurname;
    }

    public String getMaternalSurname() {
        return maternalSurname;
    }

    public LocalDate getBirthDate() {
        return birthDate;
    }

    public String getEmail() {
        return email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public String getBirthType() {
        return birthType;
    }

    public Instant getCreatedAt() {
        return createdAt;
    }

    public Instant getUpdatedAt() {
        return updatedAt;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        PatientDto entity = (PatientDto) o;
        return Objects.equals(this.dni, entity.dni) &&
                Objects.equals(this.fullName, entity.fullName) &&
                Objects.equals(this.paternalSurname, entity.paternalSurname) &&
                Objects.equals(this.maternalSurname, entity.maternalSurname) &&
                Objects.equals(this.birthDate, entity.birthDate) &&
                Objects.equals(this.email, entity.email) &&
                Objects.equals(this.phoneNumber, entity.phoneNumber) &&
                Objects.equals(this.birthType, entity.birthType) &&
                Objects.equals(this.createdAt, entity.createdAt) &&
                Objects.equals(this.updatedAt, entity.updatedAt);
    }

    @Override
    public int hashCode() {
        return Objects.hash(dni, fullName, paternalSurname, maternalSurname, birthDate, email, phoneNumber, birthType, createdAt, updatedAt);
    }

    @Override
    public String toString() {
        return getClass().getSimpleName() + "(" +
                "dni = " + dni + ", " +
                "fullName = " + fullName + ", " +
                "paternalSurname = " + paternalSurname + ", " +
                "maternalSurname = " + maternalSurname + ", " +
                "birthDate = " + birthDate + ", " +
                "email = " + email + ", " +
                "phoneNumber = " + phoneNumber + ", " +
                "birthType = " + birthType + ", " +
                "createdAt = " + createdAt + ", " +
                "updatedAt = " + updatedAt + ")";
    }
}