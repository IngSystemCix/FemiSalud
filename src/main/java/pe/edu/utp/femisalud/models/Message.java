package pe.edu.utp.femisalud.models;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

import java.time.Instant;

@Entity
@Table(name = "MESSAGE", schema = "femisalud_db", indexes = {
        @Index(name = "DNI_patient", columnList = "DNI_patient"),
        @Index(name = "DNI_call_center", columnList = "DNI_call_center")
})
public class Message {
    @Id
    @Column(name = "id", nullable = false)
    private Long id;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "DNI_patient", nullable = false)
    private Patient dniPatient;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "DNI_call_center", nullable = false)
    private CallCenter dniCallCenter;

    @NotNull
    @Column(name = "datetime", nullable = false)
    private Instant datetime;

    @NotNull
    @Lob
    @Column(name = "type_message", nullable = false)
    private String typeMessage;

    @Size(max = 2000)
    @NotNull
    @Column(name = "content_of_the_message", nullable = false, length = 2000)
    private String contentOfTheMessage;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Patient getDniPatient() {
        return dniPatient;
    }

    public void setDniPatient(Patient dniPatient) {
        this.dniPatient = dniPatient;
    }

    public CallCenter getDniCallCenter() {
        return dniCallCenter;
    }

    public void setDniCallCenter(CallCenter dniCallCenter) {
        this.dniCallCenter = dniCallCenter;
    }

    public Instant getDatetime() {
        return datetime;
    }

    public void setDatetime(Instant datetime) {
        this.datetime = datetime;
    }

    public String getTypeMessage() {
        return typeMessage;
    }

    public void setTypeMessage(String typeMessage) {
        this.typeMessage = typeMessage;
    }

    public String getContentOfTheMessage() {
        return contentOfTheMessage;
    }

    public void setContentOfTheMessage(String contentOfTheMessage) {
        this.contentOfTheMessage = contentOfTheMessage;
    }

}