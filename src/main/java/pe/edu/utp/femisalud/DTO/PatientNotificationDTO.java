package pe.edu.utp.femisalud.DTO;

import java.time.LocalDateTime;
import java.util.Objects;

public class PatientNotificationDTO {
    private final String typeNotification;
    private final String dateNotification;
    private final String description;

    public PatientNotificationDTO(String typeNotification, String dateNotification, String description) {
        this.typeNotification = typeNotification;
        this.dateNotification = dateNotification;
        this.description = description;
    }

    public String getTypeNotification() {
        return typeNotification;
    }

    public String getDateNotification() {
        return dateNotification;
    }

    public String getDescription() {
        return description;
    }

    @Override
    public boolean equals(Object o) {
        if (o == null || getClass() != o.getClass()) return false;
        PatientNotificationDTO that = (PatientNotificationDTO) o;
        return Objects.equals(typeNotification, that.typeNotification) && Objects.equals(dateNotification, that.dateNotification) && Objects.equals(description, that.description);
    }

    @Override
    public int hashCode() {
        return Objects.hash(typeNotification, dateNotification, description);
    }

    @Override
    public String toString() {
        return "PatientNotificationDTO{" +
                "typeNotification='" + typeNotification + '\'' +
                ", dateNotification='" + dateNotification + '\'' +
                ", description='" + description + '\'' +
                '}';
    }
}
