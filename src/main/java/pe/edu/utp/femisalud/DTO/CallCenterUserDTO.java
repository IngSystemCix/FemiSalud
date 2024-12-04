package pe.edu.utp.femisalud.DTO;

import java.time.LocalDate;
import java.util.Objects;

public class CallCenterUserDTO {
    private String dni;
    private String name;
    private String paternalSurname;
    private String maternalSurname;
    private String email;
    private String phoneNumber;
    private LocalDate birthDate;

    public CallCenterUserDTO(String dni, String name, String paternalSurname, String maternalSurname, String email, String phoneNumber, LocalDate birthDate) {
        this.dni = dni;
        this.name = name;
        this.paternalSurname = paternalSurname;
        this.maternalSurname = maternalSurname;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.birthDate = birthDate;
    }

    public CallCenterUserDTO() {
    }

    public String getDni() {
        return dni;
    }

    public String getName() {
        return name;
    }

    public String getPaternalSurname() {
        return paternalSurname;
    }

    public String getMaternalSurname() {
        return maternalSurname;
    }

    public String getEmail() {
        return email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public LocalDate getBirthDate() {
        return birthDate;
    }

    @Override
    public boolean equals(Object o) {
        if (o == null || getClass() != o.getClass()) return false;
        CallCenterUserDTO that = (CallCenterUserDTO) o;
        return Objects.equals(dni, that.dni) && Objects.equals(name, that.name) && Objects.equals(paternalSurname, that.paternalSurname) && Objects.equals(maternalSurname, that.maternalSurname) && Objects.equals(email, that.email) && Objects.equals(phoneNumber, that.phoneNumber) && Objects.equals(birthDate, that.birthDate);
    }

    @Override
    public int hashCode() {
        return Objects.hash(dni, name, paternalSurname, maternalSurname, email, phoneNumber, birthDate);
    }

    @Override
    public String toString() {
        return String.format("{dni='%s', name='%s', paternalSurname='%s', maternalSurname='%s', email='%s', phoneNumber='%s', birthDate='%s'}",
                dni, name, paternalSurname, maternalSurname, email, phoneNumber, birthDate);
    }
}
