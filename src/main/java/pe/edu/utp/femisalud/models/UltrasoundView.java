package pe.edu.utp.femisalud.models;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;

import java.time.Instant;

@Entity
@Table(name = "ULTRASOUND_VIEW", schema = "femisalud_db", indexes = {
        @Index(name = "id_ultrasound", columnList = "id_ultrasound")
})
public class UltrasoundView {
    @Id
    @Column(name = "id", nullable = false)
    private Long id;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "id_ultrasound", nullable = false)
    private Ultrasound idUltrasound;

    @NotNull
    @Column(name = "ammount", nullable = false)
    private Integer ammount;

    @NotNull
    @Column(name = "datetime", nullable = false)
    private Instant datetime;

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

    public Integer getAmmount() {
        return ammount;
    }

    public void setAmmount(Integer ammount) {
        this.ammount = ammount;
    }

    public Instant getDatetime() {
        return datetime;
    }

    public void setDatetime(Instant datetime) {
        this.datetime = datetime;
    }

}