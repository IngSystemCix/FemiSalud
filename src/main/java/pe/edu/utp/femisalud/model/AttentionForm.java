package pe.edu.utp.femisalud.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

@Entity
@Table(name = "ATTENTION_FORM", schema = "femisalud_db")
public class AttentionForm {
    @Id
    @Column(name = "id_attention_form", nullable = false)
    private Long id;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "id_patient", nullable = false)
    private Patient idPatient;

    @NotNull
    @Column(name = "attention_rating", nullable = false)
    private Integer attentionRating;

    @NotNull
    @Column(name = "reception_staff", nullable = false)
    private Integer receptionStaff;

    @NotNull
    @Column(name = "communication", nullable = false)
    private Integer communication;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "id_aspects_of_care", nullable = false)
    private AspectsOfCare idAspectsOfCare;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Patient getIdPatient() {
        return idPatient;
    }

    public void setIdPatient(Patient idPatient) {
        this.idPatient = idPatient;
    }

    public Integer getAttentionRating() {
        return attentionRating;
    }

    public void setAttentionRating(Integer attentionRating) {
        this.attentionRating = attentionRating;
    }

    public Integer getReceptionStaff() {
        return receptionStaff;
    }

    public void setReceptionStaff(Integer receptionStaff) {
        this.receptionStaff = receptionStaff;
    }

    public Integer getCommunication() {
        return communication;
    }

    public void setCommunication(Integer communication) {
        this.communication = communication;
    }

    public AspectsOfCare getIdAspectsOfCare() {
        return idAspectsOfCare;
    }

    public void setIdAspectsOfCare(AspectsOfCare idAspectsOfCare) {
        this.idAspectsOfCare = idAspectsOfCare;
    }

}