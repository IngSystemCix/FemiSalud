package pe.edu.utp.femisalud.model;

import jakarta.persistence.*;

@Entity
@Table(name = "AMBASSADOR_ANSWER", schema = "femisalud_db")
public class AmbassadorAnswer {
    @EmbeddedId
    private AmbassadorAnswerId id;

    @MapsId("dniPatient")
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "dni_patient", nullable = false)
    private Patient dniPatient;

    @MapsId("idAmbassador")
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "id_ambassador", nullable = false)
    private Ambassador idAmbassador;

    public AmbassadorAnswerId getId() {
        return id;
    }

    public void setId(AmbassadorAnswerId id) {
        this.id = id;
    }

    public Patient getDniPatient() {
        return dniPatient;
    }

    public void setDniPatient(Patient dniPatient) {
        this.dniPatient = dniPatient;
    }

    public Ambassador getIdAmbassador() {
        return idAmbassador;
    }

    public void setIdAmbassador(Ambassador idAmbassador) {
        this.idAmbassador = idAmbassador;
    }

}