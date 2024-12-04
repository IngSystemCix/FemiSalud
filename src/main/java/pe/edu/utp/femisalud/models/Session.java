package pe.edu.utp.femisalud.models;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;

import java.time.Instant;

@Entity
@Table(name = "SESSION", schema = "femisalud_db", indexes = {
        @Index(name = "id_user", columnList = "id_user")
})
public class Session {
    @Id
    @Column(name = "id", nullable = false)
    private Long id;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "id_user", nullable = false)
    private User idUser;

    @NotNull
    @Column(name = "datetime_start", nullable = false)
    private Instant datetimeStart;

    @NotNull
    @Column(name = "datetime_end", nullable = false)
    private Instant datetimeEnd;

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

    public Instant getDatetimeStart() {
        return datetimeStart;
    }

    public void setDatetimeStart(Instant datetimeStart) {
        this.datetimeStart = datetimeStart;
    }

    public Instant getDatetimeEnd() {
        return datetimeEnd;
    }

    public void setDatetimeEnd(Instant datetimeEnd) {
        this.datetimeEnd = datetimeEnd;
    }

}