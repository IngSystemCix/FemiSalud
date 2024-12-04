package pe.edu.utp.femisalud.models;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;

@Entity
@Table(name = "BABY_REVELATION", schema = "femisalud_db", indexes = {
        @Index(name = "id_baby", columnList = "id_baby")
})
public class BabyRevelation {
    @Id
    @Column(name = "id", nullable = false)
    private Long id;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "id_baby", nullable = false)
    private Baby idBaby;

    @NotNull
    @Column(name = "ammount", nullable = false)
    private Integer ammount;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Baby getIdBaby() {
        return idBaby;
    }

    public void setIdBaby(Baby idBaby) {
        this.idBaby = idBaby;
    }

    public Integer getAmmount() {
        return ammount;
    }

    public void setAmmount(Integer ammount) {
        this.ammount = ammount;
    }

}