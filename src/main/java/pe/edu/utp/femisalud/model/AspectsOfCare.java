package pe.edu.utp.femisalud.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import org.hibernate.annotations.ColumnDefault;

@Entity
@Table(name = "ASPECTS_OF_CARE", schema = "femisalud_db")
public class AspectsOfCare {
    @Id
    @Column(name = "id_aspects_of_care", nullable = false)
    private Long id;

    @Size(max = 200)
    @NotNull
    @Column(name = "choice", nullable = false, length = 200)
    private String choice;

    @NotNull
    @Column(name = "selected", nullable = false)
    private Boolean selected = false;

    @Size(max = 255)
    @ColumnDefault("'Sin datos'")
    @Column(name = "other")
    private String other;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getChoice() {
        return choice;
    }

    public void setChoice(String choice) {
        this.choice = choice;
    }

    public Boolean getSelected() {
        return selected;
    }

    public void setSelected(Boolean selected) {
        this.selected = selected;
    }

    public String getOther() {
        return other;
    }

    public void setOther(String other) {
        this.other = other;
    }

}