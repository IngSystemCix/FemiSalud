package pe.edu.utp.femisalud.model;

import jakarta.persistence.*;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

@Entity
@Table(name = "AMBASSADOR_ANSWER", schema = "femisalud_db")
public class AmbassadorAnswer {
    @EmbeddedId
    private AmbassadorAnswerId id;

    @MapsId("idPatient")
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "id_patient", nullable = false)
    private Patient idPatient;

    @MapsId("idAmbassador")
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "id_ambassador", nullable = false)
    private Ambassador idAmbassador;

    public AmbassadorAnswerId getId() {
        return id;
    }

    public void setId(AmbassadorAnswerId id) {
        this.id = id;
    }

    public Patient getIdPatient() {
        return idPatient;
    }

    public void setIdPatient(Patient idPatient) {
        this.idPatient = idPatient;
    }

    public Ambassador getIdAmbassador() {
        return idAmbassador;
    }

    public void setIdAmbassador(Ambassador idAmbassador) {
        this.idAmbassador = idAmbassador;
    }

}