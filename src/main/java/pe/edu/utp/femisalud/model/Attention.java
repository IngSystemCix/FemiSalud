package pe.edu.utp.femisalud.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

import java.io.Serializable;
import java.time.Instant;

@Entity
@Table(name = "ATTENTION", schema = "femisalud_db")
public class Attention implements Serializable {
    @Id
    @Size(max = 20)
    @Column(name = "attention_number", nullable = false, length = 20)
    private String attentionNumber;

    @Size(max = 10)
    @NotNull
    @Column(name = "service_type", nullable = false, length = 10)
    private String serviceType;

    @NotNull
    @Column(name = "attention_date", nullable = false)
    private Instant attentionDate;

    @Size(max = 50)
    @NotNull
    @Column(name = "doctor_name", nullable = false, length = 50)
    private String doctorName;

    @Size(max = 6)
    @NotNull
    @Column(name = "doctor_code", nullable = false, length = 6)
    private String doctorCode;

    @Size(max = 11)
    @NotNull
    @Column(name = "patient_code", nullable = false, length = 11)
    private String patientCode;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "dni_patient", nullable = false, referencedColumnName = "dni")
    private Patient dniPatient;

    public String getAttentionNumber() {
        return attentionNumber;
    }

    public void setAttentionNumber(String attentionNumber) {
        this.attentionNumber = attentionNumber;
    }

    public String getServiceType() {
        return serviceType;
    }

    public void setServiceType(String serviceType) {
        this.serviceType = serviceType;
    }

    public Instant getAttentionDate() {
        return attentionDate;
    }

    public void setAttentionDate(Instant attentionDate) {
        this.attentionDate = attentionDate;
    }

    public String getDoctorName() {
        return doctorName;
    }

    public void setDoctorName(String doctorName) {
        this.doctorName = doctorName;
    }

    public String getDoctorCode() {
        return doctorCode;
    }

    public void setDoctorCode(String doctorCode) {
        this.doctorCode = doctorCode;
    }

    public String getPatientCode() {
        return patientCode;
    }

    public void setPatientCode(String patientCode) {
        this.patientCode = patientCode;
    }

    public Patient getDniPatient() {
        return dniPatient;
    }

    public void setDniPatient(Patient dniPatient) {
        this.dniPatient = dniPatient;
    }

}