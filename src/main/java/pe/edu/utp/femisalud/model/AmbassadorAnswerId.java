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
    private static final long serialVersionUID = -5917263948477383217L;
    @Size(max = 8)
    @NotNull
    @Column(name = "dni_patient", nullable = false, length = 8)
    private String dniPatient;

    @NotNull
    @Column(name = "id_ambassador", nullable = false)
    private Long idAmbassador;

    public String getDniPatient() {
        return dniPatient;
    }

    public void setDniPatient(String dniPatient) {
        this.dniPatient = dniPatient;
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
                Objects.equals(this.dniPatient, entity.dniPatient);
    }

    @Override
    public int hashCode() {
        return Objects.hash(idAmbassador, dniPatient);
    }

}