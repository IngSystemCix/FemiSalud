package pe.edu.utp.femisalud.dao;

import com.google.gson.JsonArray;
import pe.edu.utp.femisalud.DTO.GenreAndTypePregnancyDTO;
import pe.edu.utp.femisalud.DTO.PatientNotificationDTO;
import pe.edu.utp.femisalud.DTO.UltrasoundAndClinicalNotesDTO;

import java.util.List;

public interface PatientDAO {
    String getPublicationPostActuality(String dni);
    List<UltrasoundAndClinicalNotesDTO[]> getAllUltrasoundLinksAndClinicalNotes(String dni);
    Long getUltrasoundCount(String dni);
    List<PatientNotificationDTO> getPatientNotifications(String dni);
    Integer getPatientNotificationsCount(String dni);
    void registerFavoritesNamesBaby(String dni, String name);
    boolean isFavoriteNameBaby(String name, String dni);
    void deleteFavoriteNameBaby(String name, String dni);
    void addAmbassador(String dni_patient, String ambassadorFullName, String ambassadorDNI, String ambassadorNumberPhone, String ambassadorEmail);
    void responseSurvey(String dni, JsonArray responses);
    Integer getSurveyCount(String dni);
    String getNameByDNI(String dni);
    List<GenreAndTypePregnancyDTO> getGenreAndTypePregnancy(String dni);
}
