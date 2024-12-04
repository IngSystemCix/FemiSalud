package pe.edu.utp.femisalud.dao;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.persistence.EntityManager;
import pe.edu.utp.femisalud.DTO.GenreAndTypePregnancyDTO;
import pe.edu.utp.femisalud.DTO.PatientNotificationDTO;
import pe.edu.utp.femisalud.DTO.UltrasoundAndClinicalNotesDTO;
import pe.edu.utp.femisalud.config.HibernateConnection;

import java.nio.charset.StandardCharsets;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;
import java.util.stream.Collectors;

@ApplicationScoped
public class PatientDAOImpl implements PatientDAO{

    private static final Logger LOGGER = Logger.getLogger("pe.edu.utp.femisalud");

    @Override
    public String getPublicationPostActuality(String dni) {
        EntityManager entityManager = HibernateConnection.getEntityManagerFactory();
        entityManager.getTransaction().begin();
        String data;
        try {
            data = entityManager.createNativeQuery("CALL USP_GetLatestUltrasoundLink(:dni)")
                    .setParameter("dni", dni)
                    .getSingleResult().toString();
        }catch (Exception e){
            data = "";
        }finally {
            entityManager.getTransaction().commit();
            entityManager.close();
        }

        return data;
    }

    @Override
    public List<UltrasoundAndClinicalNotesDTO[]> getAllUltrasoundLinksAndClinicalNotes(String dni) {
        EntityManager entityManager = HibernateConnection.getEntityManagerFactory();
        entityManager.getTransaction().begin();
        List<UltrasoundAndClinicalNotesDTO[]> data = new ArrayList<>();
        try {
            List<?> rawData = entityManager.createNativeQuery("CALL USP_GetAllUltrasoundLinksAndNotes(:dni)")
                    .setParameter("dni", dni)
                    .getResultList();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.S");
            data = rawData.stream()
                    .map( row -> {
                        Object[] columns = (Object[]) row;
                        return new UltrasoundAndClinicalNotesDTO[] {
                                new UltrasoundAndClinicalNotesDTO(columns[0].toString(), columns[1].toString(), LocalDateTime.parse(columns[2].toString(), formatter)),
                        };
                    })
                    .collect(Collectors.toList());
            entityManager.getTransaction().commit();
        }catch (Exception e){
            LOGGER.severe(e.getMessage());
            data = new ArrayList<>();
        }finally {
            entityManager.close();
        }
        return data;
    }

    @Override
    public Long getUltrasoundCount(String dni) {
        EntityManager entityManager = HibernateConnection.getEntityManagerFactory();
        entityManager.getTransaction().begin();
        Long data = Long.parseLong(entityManager.createNativeQuery("CALL USP_GetUltrasoundCount(:dni)")
                .setParameter("dni", dni)
                .getSingleResult().toString());
        entityManager.getTransaction().commit();
        entityManager.close();
        return data;
    }

    @Override
    public List<PatientNotificationDTO> getPatientNotifications(String dni) {
        EntityManager entityManager = HibernateConnection.getEntityManagerFactory();
        List<PatientNotificationDTO> data = new ArrayList<>();
        try {
            entityManager.getTransaction().begin();
            List<?> rawData = entityManager.createNativeQuery("CALL USP_GetPatientNotifications(:dni)")
                    .setParameter("dni", dni)
                    .getResultList();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.S");
            data = rawData.stream()
                    .map(row -> {
                        Object[] columns = (Object[]) row;
                        String icon = switch (columns[0].toString()) {
                            case "MESSAGE" -> "new_message.png";
                            case "ULTRASOUND" -> "new_ultrasound.png";
                            case "AMBASSADOR" -> "new_credit.png";
                            default -> "default_icon.png";
                        };
                        LocalDateTime dateNotification = LocalDateTime.parse(columns[1].toString(), formatter);
                        String formattedDate = dateNotification.format(DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm"));
                        String description = columns[2].toString();
                        return new PatientNotificationDTO(icon, formattedDate, description);
                    })
                    .collect(Collectors.toList());
            entityManager.getTransaction().commit();
        } catch (Exception e) {
            if (entityManager.getTransaction().isActive()) {
                entityManager.getTransaction().rollback();
            }
            LOGGER.severe(e.getMessage());
        } finally {
            if (entityManager.isOpen()) {
                entityManager.close();
            }
        }
        return data;
    }

    @Override
    public Integer getPatientNotificationsCount(String dni) {
        EntityManager entityManager = HibernateConnection.getEntityManagerFactory();
        entityManager.getTransaction().begin();
        Integer data = Integer.parseInt(entityManager.createNativeQuery("CALL USP_CountPatientNotifications(:dni)")
                .setParameter("dni", dni)
                .getSingleResult().toString());
        entityManager.getTransaction().commit();
        entityManager.close();
        return data;
    }

    @Override
    public void registerFavoritesNamesBaby(String dni, String name) {
        EntityManager entityManager = HibernateConnection.getEntityManagerFactory();
        entityManager.getTransaction().begin();
        entityManager.createNativeQuery("CALL USP_RegisterFavoriteName(:dni, :name)")
                .setParameter("dni", dni)
                .setParameter("name", name)
                .executeUpdate();
        entityManager.getTransaction().commit();
        entityManager.close();
    }

    @Override
    public boolean isFavoriteNameBaby(String name, String dni) {
        EntityManager entityManager = HibernateConnection.getEntityManagerFactory();
        entityManager.getTransaction().begin();
        boolean data = Boolean.parseBoolean(entityManager.createNativeQuery("SELECT UF_CheckNameExists(:name, :dni)")
                .setParameter("name", name)
                .setParameter("dni", dni)
                .getSingleResult().toString());
        entityManager.getTransaction().commit();
        entityManager.close();
        return data;
    }

    @Override
    public void deleteFavoriteNameBaby(String name, String dni) {
        EntityManager entityManager = HibernateConnection.getEntityManagerFactory();
        entityManager.getTransaction().begin();
        entityManager.createNativeQuery("CALL USP_DeleteNameByDNI(:name, :dni)")
                .setParameter("name", name)
                .setParameter("dni", dni)
                .executeUpdate();
        entityManager.getTransaction().commit();
        entityManager.close();
    }

    @Override
    public void addAmbassador(String dni_patient, String ambassadorFullName, String ambassadorDNI, String ambassadorNumberPhone, String ambassadorEmail) {
        EntityManager entityManager = HibernateConnection.getEntityManagerFactory();
        entityManager.getTransaction().begin();
        entityManager.createNativeQuery("CALL USP_InsertAmbassador(:dni_patient, :ambassador_full_name, :ambassador_dni, :ambassador_number_phone, :ambassador_email)")
                .setParameter("dni_patient", dni_patient)
                .setParameter("ambassador_full_name", new String(ambassadorFullName.getBytes(), StandardCharsets.UTF_8))
                .setParameter("ambassador_dni", ambassadorDNI)
                .setParameter("ambassador_number_phone", ambassadorNumberPhone)
                .setParameter("ambassador_email", ambassadorEmail)
                .executeUpdate();
        entityManager.getTransaction().commit();
        entityManager.close();
    }

    @Override
    public void responseSurvey(String dni, JsonArray responses) {
        EntityManager entityManager = null;
        try {
            entityManager = HibernateConnection.getEntityManagerFactory();
            entityManager.getTransaction().begin();

            // Convertir JsonArray a JSON String utilizando Gson
            Gson gson = new Gson();
            String responsesJson = gson.toJson(responses); // Convierte el JsonArray a un String JSON

            // Llamada al procedimiento almacenado, pasando el JSON como String
            entityManager.createNativeQuery("CALL USP_SaveSurveyResponses(:dni, :responses)")
                    .setParameter("dni", dni)
                    .setParameter("responses", responsesJson)
                    .executeUpdate();

            // Confirmamos la transacción
            entityManager.getTransaction().commit();
        } catch (RuntimeException e) {
            // En caso de error, revertimos la transacción
            if (entityManager != null && entityManager.getTransaction().isActive()) {
                entityManager.getTransaction().rollback();
            }
            // Lanzamos una excepción o manejamos el error de acuerdo a lo que necesites
            throw e; // O puedes manejarlo de otra forma según el contexto
        } finally {
            if (entityManager != null) {
                entityManager.close(); // Asegúrate de cerrar el EntityManager
            }
        }
    }

    @Override
    public Integer getSurveyCount(String dni) {
        EntityManager entityManager = HibernateConnection.getEntityManagerFactory();
        entityManager.getTransaction().begin();
        Integer data = Integer.parseInt(entityManager.createNativeQuery("CALL USP_GetStatusCountByDNI(:dni)")
                .setParameter("dni", dni)
                .getSingleResult().toString());
        entityManager.getTransaction().commit();
        entityManager.close();
        return data;
    }

    @Override
    public String getNameByDNI(String dni) {
        EntityManager entityManager = HibernateConnection.getEntityManagerFactory();
        entityManager.getTransaction().begin();
        String data = entityManager.createNativeQuery("CALL USP_GetPatientNameByDNI(:dni)")
                .setParameter("dni", dni)
                .getSingleResult().toString();
        entityManager.getTransaction().commit();
        entityManager.close();
        return data;
    }

    @Override
    public List<GenreAndTypePregnancyDTO> getGenreAndTypePregnancy(String dni) {
        EntityManager entityManager = HibernateConnection.getEntityManagerFactory();
        entityManager.getTransaction().begin();
        List<GenreAndTypePregnancyDTO> data = new ArrayList<>();
        try {
            List<?> rawData = entityManager.createNativeQuery("CALL USP_GetBabyInfoByDNI(:dni)")
                    .setParameter("dni", dni)
                    .getResultList();
            data = rawData.stream()
                    .map(row -> {
                        Object[] columns = (Object[]) row;
                        return new GenreAndTypePregnancyDTO(columns[0].toString(), columns[1].toString());
                    })
                    .collect(Collectors.toList());
            entityManager.getTransaction().commit();
        } catch (Exception e) {
            if (entityManager.getTransaction().isActive()) {
                entityManager.getTransaction().rollback();
            }
            LOGGER.severe(e.getMessage());
        } finally {
            if (entityManager.isOpen()) {
                entityManager.close();
            }
        }
        return data;
    }
}
