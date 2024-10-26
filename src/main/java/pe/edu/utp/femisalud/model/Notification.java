package pe.edu.utp.femisalud.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import org.hibernate.annotations.ColumnDefault;

import java.time.Instant;

@Entity
@Table(name = "NOTIFICATION", schema = "femisalud_db")
public class Notification {
    @Id
    @Column(name = "id_notification", nullable = false)
    private Long id;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "id_user", nullable = false)
    private User idUser;

    @NotNull
    @Lob
    @Column(name = "notification_type", nullable = false)
    private String notificationType;

    @Size(max = 255)
    @NotNull
    @Column(name = "content", nullable = false)
    private String content;

    @ColumnDefault("0")
    @Column(name = "read_status")
    private Boolean readStatus;

    @NotNull
    @ColumnDefault("current_timestamp()")
    @Column(name = "sent_at", nullable = false)
    private Instant sentAt;

    @Column(name = "read_at")
    private Instant readAt;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public User getIdUser() {
        return idUser;
    }

    public void setIdUser(User idUser) {
        this.idUser = idUser;
    }

    public String getNotificationType() {
        return notificationType;
    }

    public void setNotificationType(String notificationType) {
        this.notificationType = notificationType;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Boolean getReadStatus() {
        return readStatus;
    }

    public void setReadStatus(Boolean readStatus) {
        this.readStatus = readStatus;
    }

    public Instant getSentAt() {
        return sentAt;
    }

    public void setSentAt(Instant sentAt) {
        this.sentAt = sentAt;
    }

    public Instant getReadAt() {
        return readAt;
    }

    public void setReadAt(Instant readAt) {
        this.readAt = readAt;
    }

}