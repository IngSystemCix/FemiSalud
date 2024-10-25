package pe.edu.utp.femisalud.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import java.time.Instant;

@Entity
@Table(name = "ULTRASOUND_VIEW", schema = "femisalud_db")
public class UltrasoundView {
    @Id
    @Column(name = "id_view", nullable = false)
    private Long id;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "id_ultrasound", nullable = false)
    private Ultrasound idUltrasound;

    @NotNull
    @ColumnDefault("current_timestamp()")
    @Column(name = "view_date", nullable = false)
    private Instant viewDate;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "id_user", nullable = false)
    private User idUser;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Ultrasound getIdUltrasound() {
        return idUltrasound;
    }

    public void setIdUltrasound(Ultrasound idUltrasound) {
        this.idUltrasound = idUltrasound;
    }

    public Instant getViewDate() {
        return viewDate;
    }

    public void setViewDate(Instant viewDate) {
        this.viewDate = viewDate;
    }

    public User getIdUser() {
        return idUser;
    }

    public void setIdUser(User idUser) {
        this.idUser = idUser;
    }

}