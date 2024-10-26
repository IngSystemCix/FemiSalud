package pe.edu.utp.femisalud.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import org.hibernate.annotations.ColumnDefault;

import java.time.Instant;

@Entity
@Table(name = "MESSAGE", schema = "femisalud_db")
public class Message {
    @Id
    @Column(name = "id_message", nullable = false)
    private Long id;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "sender_id", nullable = false)
    private User sender;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "receiver_id", nullable = false)
    private User receiver;

    @Size(max = 200)
    @NotNull
    @Column(name = "content", nullable = false, length = 200)
    private String content;

    @NotNull
    @ColumnDefault("current_timestamp()")
    @Column(name = "send_date_time", nullable = false)
    private Instant sendDateTime;

    @Column(name = "read_date_time")
    private Instant readDateTime;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public User getSender() {
        return sender;
    }

    public void setSender(User sender) {
        this.sender = sender;
    }

    public User getReceiver() {
        return receiver;
    }

    public void setReceiver(User receiver) {
        this.receiver = receiver;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Instant getSendDateTime() {
        return sendDateTime;
    }

    public void setSendDateTime(Instant sendDateTime) {
        this.sendDateTime = sendDateTime;
    }

    public Instant getReadDateTime() {
        return readDateTime;
    }

    public void setReadDateTime(Instant readDateTime) {
        this.readDateTime = readDateTime;
    }

}