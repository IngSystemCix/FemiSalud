package pe.edu.utp.femisalud.models;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

@Entity
@Table(name = "BABY", schema = "femisalud_db", indexes = {
        @Index(name = "id_pregnancy", columnList = "id_pregnancy")
})
public class Baby {
    @Id
    @Column(name = "id", nullable = false)
    private Long id;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "id_pregnancy", nullable = false)
    private Pregnancy idPregnancy;

    @NotNull
    @Column(name = "genre", nullable = false)
    private Boolean genre = false;

    @Size(max = 25)
    @NotNull
    @Column(name = "name", nullable = false, length = 25)
    private String name;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Pregnancy getIdPregnancy() {
        return idPregnancy;
    }

    public void setIdPregnancy(Pregnancy idPregnancy) {
        this.idPregnancy = idPregnancy;
    }

    public Boolean getGenre() {
        return genre;
    }

    public void setGenre(Boolean genre) {
        this.genre = genre;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

}