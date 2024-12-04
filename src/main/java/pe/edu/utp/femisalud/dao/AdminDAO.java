package pe.edu.utp.femisalud.dao;

import pe.edu.utp.femisalud.DTO.*;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

public interface AdminDAO {
    void addCallCenter(String dni, String name, String paternalSurname, String maternalSurname, String email, String phoneNumber, LocalDate birthDate);
    void addPatient(
            String dni,
            String name,
            String paternalSurname,
            String maternalSurname,
            String email,
            String phoneNumber,
            LocalDate birthDate,
            LocalDate dateStartPregnancy,
            LocalDate dateEndPregnancy,
            int amountBaby,
            String typePregnancy,
            List<Integer> babyGenres
    );
    List<CallCenterUserDTO> getCallCenterDniList();
    List<PatientUserDTO> getPatientDniList();
    List<MedicalHistoryDTO> getMedicalHistoryList(String dni);
    void addMedicalHistory(String dni, LocalDate dateStartPregnancy, LocalDate dateEndPregnancy, int amountBaby, String typePregnancy, List<Integer> babyGenres);
    void addUltrasound(String dni, LocalDate dateAttention, LocalDateTime dateUltrasound, String typeEvaluation, String typeUltrasound, String linkUltrasound, String doctorName);
    List<LocalDate> getAttentionDateByDni(String dni);
    List<UltrasoundDTO> getUltrasoundList();
    List<String[]> getPatientWithClinicalNotes();
    List<String> getPatientWithUltrasound();
    List<Long> getUltrasoundIDsByDni(String dni);
    void addClinicalNotes(String dni, Long idUltrasound, String clinicalNotes);
    List<ClinicalNotesDTO> getClinicalNotesListByDNI(String dni);
    UltrasoundStatisticsDTO getUltrasoundStatistics();
    UltrasoundStatisticsPercentagesDTO getUltrasoundStatisticsPercentages();
    List<ConsultDTO[]> getConsultsByPatient();
    Long getTotalConsults();
    List<RevelationDTO[]> getRevelationsByPatient();
    List<PatientReportUltrasoundInfoDTO[]> getPatientReportUltrasoundInfo();
    List<ReportConsultAttentionDTO[]> getReportConsultAttention();
    List<ReportRevelationDTO[]> getReportRevelation();
    Boolean checkExistenceEmail(String email);
}