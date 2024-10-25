package pe.edu.utp.femisalud.model;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import org.hibernate.Hibernate;

import java.io.Serializable;
import java.util.Objects;

@Embeddable
public class AmbassadorAnswerId implements Serializable {
    private static final long serialVersionUID = -1689154635950360442L;
    @Size(max = 8)
    @NotNull
    @Column(name = "id_patient", nullable = false, length = 8)
    private String idPatient;

    @NotNull
    @Column(name = "id_ambassador", nullable = false)
    private Long idAmbassador;

    public String getIdPatient() {
        return idPatient;
    }

    public void setIdPatient(String idPatient) {
        this.idPatient = idPatient;
    }

    public Long getIdAmbassador() {
        return idAmbassador;
    }

    public void setIdAmbassador(Long idAmbassador) {
        this.idAmbassador = idAmbassador;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || Hibernate.getClass(this) != Hibernate.getClass(o)) return false;
        AmbassadorAnswerId entity = (AmbassadorAnswerId) o;
        return Objects.equals(this.idAmbassador, entity.idAmbassador) &&
                Objects.equals(this.idPatient, entity.idPatient);
    }

    @Override
    public int hashCode() {
        return Objects.hash(idAmbassador, idPatient);
    }

}