package pe.edu.utp.femisalud.DTO;

import java.time.LocalDateTime;
import java.util.Objects;

public class ReportConsultAttentionDTO {
    private final String patientName;
    private final String DNIPatient;
    private final String callCenterName;
    private final String DNICallCenter;
    private final String status;
    private final LocalDateTime dateAttention;

    public ReportConsultAttentionDTO(String patientName, String DNIPatient, String callCenterName, String DNICallCenter, String status, LocalDateTime dateAttention) {
        this.patientName = patientName;
        this.DNIPatient = DNIPatient;
        this.callCenterName = callCenterName;
        this.DNICallCenter = DNICallCenter;
        this.status = status;
        this.dateAttention = dateAttention;
    }

    public String getPatientName() {
        return patientName;
    }

    public String getDNIPatient() {
        return DNIPatient;
    }

    public String getCallCenterName() {
        return callCenterName;
    }

    public String getDNICallCenter() {
        return DNICallCenter;
    }

    public String getStatus() {
        return status;
    }

    public LocalDateTime getDateAttention() {
        return dateAttention;
    }

    @Override
    public boolean equals(Object o) {
        if (o == null || getClass() != o.getClass()) return false;
        ReportConsultAttentionDTO that = (ReportConsultAttentionDTO) o;
        return Objects.equals(patientName, that.patientName) && Objects.equals(DNIPatient, that.DNIPatient) && Objects.equals(callCenterName, that.callCenterName) && Objects.equals(DNICallCenter, that.DNICallCenter) && Objects.equals(status, that.status) && Objects.equals(dateAttention, that.dateAttention);
    }

    @Override
    public int hashCode() {
        return Objects.hash(patientName, DNIPatient, callCenterName, DNICallCenter, status, dateAttention);
    }

    @Override
    public String toString() {
        return "ReportConsultAttentionDTO{" +
                "patientName='" + patientName + '\'' +
                ", DNIPatient='" + DNIPatient + '\'' +
                ", callCenterName='" + callCenterName + '\'' +
                ", DNICallCenter='" + DNICallCenter + '\'' +
                ", status='" + status + '\'' +
                ", dateAttention=" + dateAttention +
                '}';
    }
}
