package pe.edu.utp.femisalud.DTO;

import java.time.LocalDateTime;
import java.util.Objects;

public class MessageDTO {
    private final String contentOfTheMessage;
    private final LocalDateTime dateOfTheMessage;

    public MessageDTO(String contentOfTheMessage, LocalDateTime dateOfTheMessage) {
        this.contentOfTheMessage = contentOfTheMessage;
        this.dateOfTheMessage = dateOfTheMessage;
    }

    public String getContentOfTheMessage() {
        return contentOfTheMessage;
    }

    public LocalDateTime getDateOfTheMessage() {
        return dateOfTheMessage;
    }

    @Override
    public boolean equals(Object o) {
        if (o == null || getClass() != o.getClass()) return false;
        MessageDTO that = (MessageDTO) o;
        return Objects.equals(contentOfTheMessage, that.contentOfTheMessage) && Objects.equals(dateOfTheMessage, that.dateOfTheMessage);
    }

    @Override
    public int hashCode() {
        return Objects.hash(contentOfTheMessage, dateOfTheMessage);
    }

    @Override
    public String toString() {
        return "MessageDTO{" +
                "contentOfTheMessage='" + contentOfTheMessage + '\'' +
                ", dateOfTheMessage=" + dateOfTheMessage +
                '}';
    }
}
