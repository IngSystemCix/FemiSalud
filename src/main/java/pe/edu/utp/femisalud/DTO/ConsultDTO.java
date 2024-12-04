package pe.edu.utp.femisalud.DTO;

import java.util.Objects;

public class ConsultDTO {
    private final String dni;
    private final String status;
    private final Long totalMessagesAttended;

    public ConsultDTO(String dni, String status, Long totalMessagesAttended) {
        this.dni = dni;
        this.status = status;
        this.totalMessagesAttended = totalMessagesAttended;
    }

    public String getDni() {
        return dni;
    }

    public String getStatus() {
        return status;
    }

    public Long getTotalMessagesAttended() {
        return totalMessagesAttended;
    }

    @Override
    public boolean equals(Object o) {
        if (o == null || getClass() != o.getClass()) return false;
        ConsultDTO that = (ConsultDTO) o;
        return Objects.equals(dni, that.dni) && Objects.equals(status, that.status) && Objects.equals(totalMessagesAttended, that.totalMessagesAttended);
    }

    @Override
    public int hashCode() {
        return Objects.hash(dni, status, totalMessagesAttended);
    }

    @Override
    public String toString() {
        return "ConsultDTO{" +
                "dni='" + dni + '\'' +
                ", status='" + status + '\'' +
                ", totalMessagesAttended=" + totalMessagesAttended +
                '}';
    }
}
