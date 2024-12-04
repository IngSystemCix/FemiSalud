package pe.edu.utp.femisalud.DTO;

import java.util.Objects;

public class ReportRevelationDTO {
    private final String dni;
    private final String name;
    private final String paternalSurname;
    private final String maternalSurname;
    private final String month;

    public ReportRevelationDTO(String dni, String name, String paternalSurname, String maternalSurname, String month) {
        this.dni = dni;
        this.name = name;
        this.paternalSurname = paternalSurname;
        this.maternalSurname = maternalSurname;
        this.month = month;
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

    public String getMonth() {
        return month;
    }

    @Override
    public boolean equals(Object o) {
        if (o == null || getClass() != o.getClass()) return false;
        ReportRevelationDTO that = (ReportRevelationDTO) o;
        return Objects.equals(dni, that.dni) && Objects.equals(name, that.name) && Objects.equals(paternalSurname, that.paternalSurname) && Objects.equals(maternalSurname, that.maternalSurname) && Objects.equals(month, that.month);
    }

    @Override
    public int hashCode() {
        return Objects.hash(dni, name, paternalSurname, maternalSurname, month);
    }

    @Override
    public String toString() {
        return "ReportRevelationDTO{" +
                "dni='" + dni + '\'' +
                ", name='" + name + '\'' +
                ", paternalSurname='" + paternalSurname + '\'' +
                ", maternalSurname='" + maternalSurname + '\'' +
                ", month='" + month + '\'' +
                '}';
    }
}
