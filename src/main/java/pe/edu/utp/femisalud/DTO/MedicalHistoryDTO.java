package pe.edu.utp.femisalud.DTO;

import java.time.LocalDate;
import java.util.Objects;

public class MedicalHistoryDTO {
    private final String dni;
    private final String fullName;
    private final int amountBaby;
    private final LocalDate dateAttention;

    public MedicalHistoryDTO(String dni, String fullName, int amountBaby, LocalDate dateAttention) {
        this.dni = dni;
        this.fullName = fullName;
        this.amountBaby = amountBaby;
        this.dateAttention = dateAttention;
    }

    public String getDni() {
        return dni;
    }

    public String getFullName() {
        return fullName;
    }

    public int getAmountBaby() {
        return amountBaby;
    }

    public LocalDate getDateAttention() {
        return dateAttention;
    }

    @Override
    public boolean equals(Object o) {
        if (o == null || getClass() != o.getClass()) return false;
        MedicalHistoryDTO that = (MedicalHistoryDTO) o;
        return amountBaby == that.amountBaby && Objects.equals(dni, that.dni) && Objects.equals(fullName, that.fullName) && Objects.equals(dateAttention, that.dateAttention);
    }

    @Override
    public int hashCode() {
        return Objects.hash(dni, fullName, amountBaby, dateAttention);
    }

    @Override
    public String toString() {
        return "MedicalHistoryDTO{" +
                "dni='" + dni + '\'' +
                ", fullName='" + fullName + '\'' +
                ", amountBaby=" + amountBaby +
                ", dateAttention=" + dateAttention +
                '}';
    }
}
