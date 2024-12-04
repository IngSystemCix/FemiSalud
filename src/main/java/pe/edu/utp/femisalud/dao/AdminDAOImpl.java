package pe.edu.utp.femisalud.dao;

import com.google.common.base.Preconditions;
import com.google.gson.Gson;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.persistence.EntityManager;
import pe.edu.utp.femisalud.DTO.*;
import pe.edu.utp.femisalud.config.HibernateConnection;
import pe.edu.utp.femisalud.util.ValidateInputUtil;

import java.nio.charset.StandardCharsets;
import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;
import java.util.stream.Collectors;

@ApplicationScoped
public class AdminDAOImpl implements AdminDAO {
    private static final Logger LOGGER = Logger.getLogger("pe.edu.utp.femisalud");

    @Override
    public void addCallCenter(String dni, String name, String paternalSurname, String maternalSurname, String email, String phoneNumber, LocalDate birthDate) {
        ValidateInputUtil.checkByAddingCallCenter(dni, name, paternalSurname, maternalSurname, email, phoneNumber, birthDate);
        EntityManager entityManager = HibernateConnection.getEntityManagerFactory();
        entityManager.getTransaction().begin();
        entityManager.createNativeQuery("CALL USP_REGISTERCALLCENTER(:p_dni, :p_name, :p_paternal_surname, :p_maternal_surname, :p_email, :p_phone_number, :p_birth_date)")
                .setParameter("p_dni", dni)
                .setParameter("p_name", new String(name.getBytes(), StandardCharsets.UTF_8))
                .setParameter("p_paternal_surname", new String(paternalSurname.getBytes(), StandardCharsets.UTF_8))
                .setParameter("p_maternal_surname", new String(maternalSurname.getBytes(), StandardCharsets.UTF_8))
                .setParameter("p_email", email)
                .setParameter("p_phone_number", phoneNumber)
                .setParameter("p_birth_date", birthDate)
                .executeUpdate();
        entityManager.getTransaction().commit();
        LOGGER.info("Adding call center with dni: " + dni);
    }

    @Override
    public void addPatient(String dni, String name, String paternalSurname, String maternalSurname, String email, String phoneNumber, LocalDate birthDate, LocalDate dateStartPregnancy, LocalDate dateEndPregnancy, int amountBaby, String typePregnancy, List<Integer> babyGenres) {
        // Validar los parámetros de entrada
        ValidateInputUtil.checkByAddingPatient(dni, name, paternalSurname, maternalSurname, email, phoneNumber, birthDate, dateStartPregnancy, dateEndPregnancy, amountBaby, typePregnancy, babyGenres);

        // Convertir la lista de géneros de bebés a un JSON válido
        Gson gson = new Gson();
        String babyGenresJson = gson.toJson(babyGenres);

        // Obtener el EntityManager y realizar la transacción
        EntityManager entityManager = HibernateConnection.getEntityManagerFactory();
        entityManager.getTransaction().begin();

        entityManager.createNativeQuery("CALL USP_CREATEUSERPATIENT(:p_dni, :p_name, :p_paternal_surname, :p_maternal_surname, :p_email, :p_phone_number, :p_birth_date, :p_date_start_pregnancy, :p_date_end_pregnancy, :p_amount_baby, :p_type_pregnancy, :p_baby_genres)")
                .setParameter("p_dni", dni)
                .setParameter("p_name", new String(name.getBytes(), StandardCharsets.UTF_8))
                .setParameter("p_paternal_surname", new String(paternalSurname.getBytes(), StandardCharsets.UTF_8))
                .setParameter("p_maternal_surname", new String(maternalSurname.getBytes(), StandardCharsets.UTF_8))
                .setParameter("p_email", email)
                .setParameter("p_phone_number", phoneNumber)
                .setParameter("p_birth_date", birthDate)
                .setParameter("p_date_start_pregnancy", dateStartPregnancy)
                .setParameter("p_date_end_pregnancy", dateEndPregnancy)
                .setParameter("p_amount_baby", amountBaby)
                .setParameter("p_type_pregnancy", typePregnancy)
                .setParameter("p_baby_genres", babyGenresJson)  // Pasar el JSON válido
                .executeUpdate();

        entityManager.getTransaction().commit();
        entityManager.close();

        LOGGER.info("Adding patient with dni: " + dni);
    }

    @Override
    public List<CallCenterUserDTO> getCallCenterDniList() {
        EntityManager entityManager = HibernateConnection.getEntityManagerFactory();
        List<?> rawData = null;

        try {
            // Realizar la consulta
            rawData = entityManager.createNativeQuery("CALL USP_GET_CALL_CENTER_USERS()")
                    .getResultList();

            // Mapear los resultados a objetos CallCenterUserDTO
            return rawData.stream()
                    .map(row -> {
                        Object[] columns = (Object[]) row; // Cada fila es un arreglo de objetos
                        String dateString = columns[6].toString();
                        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.S");
                        LocalDate birthDate = LocalDate.parse(dateString, formatter);
                        return new CallCenterUserDTO(
                                columns[0].toString(),                         // dni
                                columns[1].toString(),                         // name
                                columns[2].toString(),                         // paternalSurname
                                columns[3].toString(),                         // maternalSurname
                                columns[4].toString(),                         // email
                                columns[5].toString(),                         // phoneNumber
                                birthDate                                      // birthDate
                        );
                    })
                    .collect(Collectors.toList());
        } catch (Exception e) {
            // Manejo de excepciones
            LOGGER.severe("Error al obtener la lista de call center: " + e.getMessage());
            return new ArrayList<>(); // Retorna una lista vacía en caso de error
        } finally {
            // Cerrar el EntityManager
            if (entityManager.isOpen()) {
                entityManager.close();
            }
        }
    }

    @Override
    public List<PatientUserDTO> getPatientDniList() {
        EntityManager entityManager = HibernateConnection.getEntityManagerFactory();
        List<?> rawData = null;

        try {
            // Realizar la consulta
            rawData = entityManager.createNativeQuery("CALL USP_GET_PATIENT_USERS()")
                    .getResultList();

            // Mapear los resultados a objetos PatientUserDTO
            return rawData.stream()
                    .map(row -> {
                        Object[] columns = (Object[]) row; // Cada fila es un arreglo de objetos
                        String dateString = columns[6].toString();
                        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.S");
                        LocalDate birthDate = LocalDate.parse(dateString, formatter);
                        return new PatientUserDTO(
                                columns[0].toString(),                         // dni
                                columns[1].toString(),                         // name
                                columns[2].toString(),                         // paternalSurname
                                columns[3].toString(),                         // maternalSurname
                                columns[4].toString(),                         // email
                                columns[5].toString(),                         // phoneNumber
                                birthDate                                      // birthDate
                        );
                    })
                    .collect(Collectors.toList());
        } catch (Exception e) {
            // Manejo de excepciones
            LOGGER.severe("Error al obtener la lista de pacientes: " + e.getMessage());
            return new ArrayList<>(); // Retorna una lista vacía en caso de error
        } finally {
            // Cerrar el EntityManager
            if (entityManager.isOpen()) {
                entityManager.close();
            }
        }
    }

    @Override
    public List<MedicalHistoryDTO> getMedicalHistoryList(String dni) {
        Preconditions.checkNotNull(dni, "dni cannot be null");
        EntityManager entityManager = HibernateConnection.getEntityManagerFactory();
        List<?> rawData = null;

        try {
            // Realizar la consulta, esperando una lista de resultados
            rawData = entityManager.createNativeQuery("CALL USP_GET_MEDICAL_HISTORY(:p_dni)")
                    .setParameter("p_dni", dni)
                    .getResultList();

            // Mapear los resultados a objetos MedicalHistoryDTO
            return rawData.stream()
                    .map(row -> {
                        Object[] columns = (Object[]) row; // Cada fila es un arreglo de objetos
                        String dateString = columns[3].toString();
                        LocalDate dateAttention = LocalDate.parse(dateString);
                        return new MedicalHistoryDTO(
                                columns[0].toString(),                         // dni
                                columns[1].toString(),                         // fullName
                                Integer.parseInt(columns[2].toString()),       // amountBaby
                                dateAttention                                  // dateAttention
                        );
                    })
                    .collect(Collectors.toList());
        } catch (Exception e) {
            // Manejo de excepciones
            LOGGER.severe("Error al obtener el historial médico por paciente: " + e.getMessage());
            return new ArrayList<>(); // Retorna una lista vacía en caso de error
        } finally {
            // Cerrar el EntityManager
            if (entityManager.isOpen()) {
                entityManager.close();
            }
        }
    }

    @Override
    public void addMedicalHistory(String dni, LocalDate dateStartPregnancy, LocalDate dateEndPregnancy, int amountBaby, String typePregnancy, List<Integer> babyGenres) {
        Preconditions.checkNotNull(dni, "dni cannot be null");
        Preconditions.checkNotNull(dateStartPregnancy, "dateStartPregnancy cannot be null");
        Preconditions.checkNotNull(dateEndPregnancy, "dateEndPregnancy cannot be null");
        Preconditions.checkNotNull(amountBaby, "amountBaby cannot be null");
        Preconditions.checkNotNull(typePregnancy, "typePregnancy cannot be null");
        Preconditions.checkNotNull(babyGenres, "babyGenres cannot be null");

        // Convertir la lista de géneros de bebés a un JSON válido
        Gson gson = new Gson();
        String babyGenresJson = gson.toJson(babyGenres);

        // Obtener el EntityManager
        EntityManager entityManager = HibernateConnection.getEntityManagerFactory();
        entityManager.getTransaction().begin();
        entityManager.createNativeQuery("CALL USP_InsertPregnancyAndBabies(:p_dni, :p_date_start_pregnancy, :p_date_end_pregnancy, :p_amount_baby, :p_type_pregnancy, :p_baby_genres)")
                .setParameter("p_dni", dni)
                .setParameter("p_date_start_pregnancy", dateStartPregnancy)
                .setParameter("p_date_end_pregnancy", dateEndPregnancy)
                .setParameter("p_amount_baby", amountBaby)
                .setParameter("p_type_pregnancy", typePregnancy)
                .setParameter("p_baby_genres", babyGenresJson)  // Pasar el JSON válido
                .executeUpdate();

        entityManager.getTransaction().commit();
        LOGGER.info("Adding medical history with dni: " + dni);
    }

    @Override
    public void addUltrasound(String dni, LocalDate dateAttention, LocalDateTime dateUltrasound, String typeEvaluation, String typeUltrasound, String linkUltrasound, String doctorName) {
        Preconditions.checkNotNull(dni, "dni cannot be null");
        Preconditions.checkNotNull(dateAttention, "dateAttention cannot be null");
        Preconditions.checkNotNull(dateUltrasound, "dateUltrasound cannot be null");
        Preconditions.checkNotNull(typeEvaluation, "typeEvaluation cannot be null");
        Preconditions.checkNotNull(typeUltrasound, "typeUltrasound cannot be null");
        Preconditions.checkNotNull(linkUltrasound, "linkUltrasound cannot be null");
        Preconditions.checkNotNull(doctorName, "doctorName cannot be null");

        EntityManager entityManager = HibernateConnection.getEntityManagerFactory();
        entityManager.getTransaction().begin();
        entityManager.createNativeQuery("CALL USP_AddUltrasound(:p_dni, :p_date_attention, :p_date_ultrasound, :p_type_evaluation, :p_type_ultrasound, :p_link_ultrasound, :p_doctor_name)")
                .setParameter("p_dni", dni)
                .setParameter("p_date_attention", dateAttention)
                .setParameter("p_date_ultrasound", dateUltrasound)
                .setParameter("p_type_evaluation", typeEvaluation)
                .setParameter("p_type_ultrasound", typeUltrasound)
                .setParameter("p_link_ultrasound", linkUltrasound)
                .setParameter("p_doctor_name", new String(doctorName.getBytes(), StandardCharsets.UTF_8))
                .executeUpdate();
        entityManager.getTransaction().commit();
        LOGGER.info("Adding ultrasound with dni: " + dni);
    }

    @Override
    public List<LocalDate> getAttentionDateByDni(String dni) {
        Preconditions.checkNotNull(dni, "dni cannot be null");
        EntityManager entityManager = HibernateConnection.getEntityManagerFactory();
        List<?> rawData = null;

        try {
            // Realizar la consulta, esperando un List de tipo java.sql.Date
            rawData = entityManager.createNativeQuery("CALL USP_GetAttentionDatesByDNI(:p_dni)", Date.class)
                    .setParameter("p_dni", dni)
                    .getResultList();

            // Convertir cada java.sql.Date a LocalDate
            return rawData.stream()
                    .map(date -> LocalDate.parse(date.toString())) // Convertir java.sql.Date a LocalDate
                    .collect(Collectors.toList());
        } catch (Exception e) {
            // Manejo de excepciones
            LOGGER.severe("Error al obtener las fechas de atención por paciente: " + e.getMessage());
            return new ArrayList<>(); // Retorna una lista vacía en caso de error
        } finally {
            // Cerrar el EntityManager
            if (entityManager.isOpen()) {
                entityManager.close();
            }
        }
    }

    @Override
    public List<UltrasoundDTO> getUltrasoundList() {
        EntityManager entityManager = HibernateConnection.getEntityManagerFactory();
        List<?> rawData = null;

        try {
            // Ejecutar la consulta nativa
            rawData = entityManager.createNativeQuery("CALL USP_GetUltrasoundRecords()")
                    .getResultList();

            // Definir el formateador para la fecha
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.S");

            // Mapear los resultados a una lista de UltrasoundDTO
            return rawData.stream()
                    .map(row -> {
                        Object[] columns = (Object[]) row;

                        LocalDateTime dateUltrasound = LocalDateTime.parse(columns[0].toString(), formatter);
                        String url = columns[1].toString();
                        String dni = columns[2].toString();

                        return new UltrasoundDTO(dateUltrasound, url, dni);
                    })
                    .collect(Collectors.toList());
        } catch (Exception e) {
            // Manejo de excepciones
            LOGGER.severe("Error al obtener los registros de ultrasonidos: " + e.getMessage());
            return new ArrayList<>(); // Retorna una lista vacía en caso de error
        } finally {
            // Finalizar la transacción y cerrar el EntityManager
            if (entityManager.isOpen()) {
                entityManager.close();
            }
        }
    }


    @Override
    public List<String[]> getPatientWithClinicalNotes() {
        EntityManager entityManager = HibernateConnection.getEntityManagerFactory();
        entityManager.getTransaction().begin();
        List<?> rawData = null;

        try {
            // Ejecutar la consulta nativa
            rawData = entityManager.createNativeQuery("CALL USP_GetPatientsWithClinicalNotes()")
                    .getResultList();

            // Mapear los resultados a una lista de arreglos de Strings
            return rawData.stream()
                    .map(row -> {
                        Object[] columns = (Object[]) row;
                        return new String[]{columns[0].toString(), columns[1].toString()};
                    })
                    .collect(Collectors.toList());
        } catch (Exception e) {
            // Manejo de excepciones
            LOGGER.severe("Error al obtener los pacientes con notas clínicas: " + e.getMessage());
            return new ArrayList<>(); // Retorna una lista vacía en caso de error
        } finally {
            // Finalizar la transacción y cerrar el EntityManager
            if (entityManager.getTransaction().isActive()) {
                entityManager.getTransaction().commit();
            }
            if (entityManager.isOpen()) {
                entityManager.close();
            }
        }
    }

    @Override
    public List<String> getPatientWithUltrasound() {
        EntityManager entityManager = HibernateConnection.getEntityManagerFactory();
        entityManager.getTransaction().begin();
        List<?> rawData = null;

        try {
            // Ejecutar la consulta nativa
            rawData = entityManager.createNativeQuery("CALL USP_GetPatientsWithUltrasounds()")
                    .getResultList();

            // Mapear los resultados a una lista de Strings
            return rawData.stream()
                    .map(Object::toString)
                    .collect(Collectors.toList());
        } catch (Exception e) {
            // Manejo de excepciones
            LOGGER.severe("Error al obtener los pacientes con ultrasonidos: " + e.getMessage());
            return new ArrayList<>(); // Retorna una lista vacía en caso de error
        } finally {
            // Finalizar la transacción y cerrar el EntityManager
            if (entityManager.getTransaction().isActive()) {
                entityManager.getTransaction().commit();
            }
            if (entityManager.isOpen()) {
                entityManager.close();
            }
        }
    }

    @Override
    public List<Long> getUltrasoundIDsByDni(String dni) {
        EntityManager entityManager = HibernateConnection.getEntityManagerFactory();
        entityManager.getTransaction().begin();
        List<?> rawData = null;

        try {
            // Ejecutar la consulta nativa
            rawData = entityManager.createNativeQuery("CALL USP_GetUltrasoundIDsByPatientDNI(:p_dni)")
                    .setParameter("p_dni", dni)
                    .getResultList();

            // Mapear los resultados a una lista de Longs
            return rawData.stream()
                    .map(id -> Long.parseLong(id.toString()))
                    .collect(Collectors.toList());
        } catch (Exception e) {
            // Manejo de excepciones
            LOGGER.severe("Error al obtener los IDs de ultrasonidos por paciente: " + e.getMessage());
            return new ArrayList<>(); // Retorna una lista vacía en caso de error
        } finally {
            // Finalizar la transacción y cerrar el EntityManager
            if (entityManager.getTransaction().isActive()) {
                entityManager.getTransaction().commit();
            }
            if (entityManager.isOpen()) {
                entityManager.close();
            }
        }
    }

    @Override
    public void addClinicalNotes(String dni, Long idUltrasound, String clinicalNotes) {
        Preconditions.checkNotNull(dni, "dni cannot be null");
        Preconditions.checkNotNull(idUltrasound, "idUltrasound cannot be null");
        Preconditions.checkNotNull(clinicalNotes, "clinicalNotes cannot be null");

        EntityManager entityManager = HibernateConnection.getEntityManagerFactory();
        entityManager.getTransaction().begin();
        entityManager.createNativeQuery("CALL USP_InsertClinicalNote(:p_dni, :p_id_ultrasound, :p_clinical_notes)")
                .setParameter("p_dni", dni)
                .setParameter("p_id_ultrasound", idUltrasound)
                .setParameter("p_clinical_notes", new String(clinicalNotes.getBytes(), StandardCharsets.UTF_8))
                .executeUpdate();
        entityManager.getTransaction().commit();
        LOGGER.info("Adding clinical notes with dni: " + dni + " and idUltrasound: " + idUltrasound);
    }

    @Override
    public List<ClinicalNotesDTO> getClinicalNotesListByDNI(String dni) {
        EntityManager entityManager = HibernateConnection.getEntityManagerFactory();
        entityManager.getTransaction().begin();
        List<?> rawData = null;

        try {
            // Ejecutar la consulta nativa
            rawData = entityManager.createNativeQuery("CALL USP_GetClinicalDataByDNI(:p_dni)")
                    .setParameter("p_dni", dni)
                    .getResultList();

            // Definir el formateador para la fecha
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.S");

            // Mapear los resultados a una lista de ClinicalNotesDTO
            return rawData.stream()
                    .map(row -> {
                        Object[] columns = (Object[]) row;
                        return new ClinicalNotesDTO(
                                columns[0].toString(),                         // dni
                                Long.parseLong(columns[1].toString()),          // idUltrasound
                                LocalDateTime.parse(columns[2].toString(), formatter),     // ultrasoundDate
                                columns[3].toString()                           // clinicalNotes
                        );
                    })
                    .collect(Collectors.toList());
        } catch (Exception e) {
            // Manejo de excepciones
            LOGGER.severe("Error al obtener las notas clínicas por paciente: " + e.getMessage());
            return new ArrayList<>(); // Retorna una lista vacía en caso de error
        } finally {
            // Finalizar la transacción y cerrar el EntityManager
            if (entityManager.getTransaction().isActive()) {
                entityManager.getTransaction().commit();
            }
            if (entityManager.isOpen()) {
                entityManager.close();
            }
        }
    }

    @Override
    public UltrasoundStatisticsDTO getUltrasoundStatistics() {
        EntityManager entityManager = HibernateConnection.getEntityManagerFactory();
        entityManager.getTransaction().begin();
        List<?> rawData = null;

        try {
            // Ejecutar la consulta nativa
            rawData = entityManager.createNativeQuery("CALL USP_GetUltrasoundStatistics()")
                    .getResultList();

            // Obtener los resultados y construir el DTO
            Object[] columns = (Object[]) rawData.get(0);
            return new UltrasoundStatisticsDTO(
                    Long.parseLong(columns[0].toString()), // totalViews
                    Long.parseLong(columns[1].toString()), // totalNoViews
                    Long.parseLong(columns[2].toString())  // totalDownloads
            );
        } catch (Exception e) {
            // Manejo de excepciones
            LOGGER.severe("Error al obtener las estadísticas de ultrasonidos: " + e.getMessage());
            return null; // Puedes retornar un valor por defecto o manejar el error de otra forma
        } finally {
            // Finalizar la transacción y cerrar el EntityManager
            if (entityManager.getTransaction().isActive()) {
                entityManager.getTransaction().commit();
            }
            if (entityManager.isOpen()) {
                entityManager.close();
            }
        }
    }

    @Override
    public UltrasoundStatisticsPercentagesDTO getUltrasoundStatisticsPercentages() {
        EntityManager entityManager = HibernateConnection.getEntityManagerFactory();
        entityManager.getTransaction().begin();
        List<?> rawData = null;

        try {
            // Ejecutar la consulta nativa
            rawData = entityManager.createNativeQuery("CALL USP_CalculatePercentages()")
                    .getResultList();

            // Obtener los resultados y construir el DTO
            Object[] columns = (Object[]) rawData.get(0);
            return new UltrasoundStatisticsPercentagesDTO(
                    Double.parseDouble(columns[0].toString()), // percentageViews
                    Double.parseDouble(columns[1].toString()), // percentageNoViews
                    Double.parseDouble(columns[2].toString())  // percentageDownloads
            );
        } catch (Exception e) {
            // Manejo de excepciones
            LOGGER.severe("Error al obtener las estadísticas de porcentajes: " + e.getMessage());
            return null; // Puedes retornar un valor por defecto o manejar el error de otra forma
        } finally {
            // Finalizar la transacción y cerrar el EntityManager
            if (entityManager.getTransaction().isActive()) {
                entityManager.getTransaction().commit();
            }
            if (entityManager.isOpen()) {
                entityManager.close();
            }
        }
    }

    @Override
    public List<ConsultDTO[]> getConsultsByPatient() {
        EntityManager entityManager = HibernateConnection.getEntityManagerFactory();
        entityManager.getTransaction().begin();
        List<?> rawData = null;

        try {
            // Ejecutar la consulta nativa
            rawData = entityManager.createNativeQuery("CALL USP_GetMessageStatusByPatient()")
                    .getResultList();

            // Convertir los resultados en una lista de ConsultDTO[]
            return rawData.stream()
                    .map(row -> {
                        Object[] columns = (Object[]) row;
                        return new ConsultDTO[]{
                                new ConsultDTO(
                                        columns[0].toString(), // dni
                                        columns[1].toString(), // status [Atendio, No Atendio]
                                        Long.parseLong(columns[2].toString()) // totalMessagesAttended
                                )
                        };
                    })
                    .collect(Collectors.toList());
        } catch (Exception e) {
            // Manejo de excepciones (si ocurre algún error)
            LOGGER.severe("Error al obtener los mensajes atendidos por paciente: " + e.getMessage());
            return new ArrayList<>(); // Retorna una lista vacía en caso de error
        } finally {
            // Finalizar la transacción y cerrar el EntityManager
            if (entityManager.getTransaction().isActive()) {
                entityManager.getTransaction().commit();
            }
            if (entityManager.isOpen()) {
                entityManager.close();
            }
        }
    }

    @Override
    public Long getTotalConsults() {
        EntityManager entityManager = HibernateConnection.getEntityManagerFactory();
        entityManager.getTransaction().begin();
        Long totalConsults = (Long) entityManager.createNativeQuery("CALL USP_GetTotalMessagesAttended()")
                .getSingleResult();
        entityManager.getTransaction().commit();
        return totalConsults;
    }

    @Override
    public List<RevelationDTO[]> getRevelationsByPatient() {
        EntityManager entityManager = HibernateConnection.getEntityManagerFactory();
        entityManager.getTransaction().begin();
        List<RevelationDTO[]> resultList = new ArrayList<>();

        try {
            List<?> rawData = entityManager.createNativeQuery("CALL USP_GetMonthlyRevelationCount()")
                    .getResultList();

            resultList = rawData.stream()
                    .map(row -> {
                        Object[] columns = (Object[]) row;
                        return new RevelationDTO[]{
                                new RevelationDTO(
                                        columns[0].toString(), // revelationMonth
                                        Long.parseLong(columns[1].toString()) // totalRevelations
                                )
                        };
                    })
                    .collect(Collectors.toList());

            entityManager.getTransaction().commit(); // Confirma la transacción si todo fue exitoso
        } catch (Exception e) {
            entityManager.getTransaction().rollback(); // Revierte la transacción si hubo un error
            LOGGER.severe("Error al obtener las revelaciones mensuales: " + e.getMessage());
            throw e; // Opcional: volver a lanzar la excepción para que se maneje externamente
        } finally {
            entityManager.close();
        }

        return resultList;
    }

    @Override
    public List<PatientReportUltrasoundInfoDTO[]> getPatientReportUltrasoundInfo() {
        EntityManager entityManager = HibernateConnection.getEntityManagerFactory();
        entityManager.getTransaction().begin();
        List<PatientReportUltrasoundInfoDTO[]> resultList = new ArrayList<>();

        try {
            // Ejecutar el procedimiento almacenado
            List<?> rawData = entityManager.createNativeQuery("CALL USP_GetPatienReportUltrasoundInfo()")
                    .getResultList();

            // Definir el formato de fecha esperado
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.S");

            // Mapear los resultados a un array de DTOs
            resultList = rawData.stream()
                    .map(row -> {
                        Object[] columns = (Object[]) row;

                        // Convertir los datos a un DTO y devolver como array
                        return new PatientReportUltrasoundInfoDTO[]{
                                new PatientReportUltrasoundInfoDTO(
                                        columns[0].toString(), // name
                                        columns[1].toString(), // paternalSurname
                                        columns[2].toString(),  // maternalSurname
                                        Integer.parseInt(columns[3].toString()), // age
                                        LocalDateTime.parse(columns[4].toString(), formatter), // dateUltrasound
                                        columns[5].toString(), // downloaded
                                        columns[6].toString()  // viewed
                                )
                        };
                    })
                    .collect(Collectors.toList());  // Convertir a lista de arrays

            entityManager.getTransaction().commit();  // Confirma la transacción si todo fue exitoso
        } catch (Exception e) {
            // Si ocurre un error, se hace rollback de la transacción
            if (entityManager.getTransaction().isActive()) {
                entityManager.getTransaction().rollback();
            }
            LOGGER.severe("Error al obtener la información de reporte de ecografías: " + e.getMessage());
        } finally {
            entityManager.close();  // Cerrar el EntityManager
        }

        return resultList;  // Devolver la lista de arreglos
    }

    @Override
    public List<ReportConsultAttentionDTO[]> getReportConsultAttention() {
        EntityManager entityManager = HibernateConnection.getEntityManagerFactory();
        entityManager.getTransaction().begin();
        List<ReportConsultAttentionDTO[]> resultList = new ArrayList<>();
        try {
            // Ejecutar el procedimiento almacenado
            List<?> rawData = entityManager.createNativeQuery("CALL USP_GetAttendedMessages()")
                    .getResultList();

            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.S");
            // Mapear los resultados a un array de DTOs
            resultList = rawData.stream()
                    .map(row -> {
                        Object[] columns = (Object[]) row;

                        // Convertir los datos a un DTO y devolver como array
                        return new ReportConsultAttentionDTO[]{
                                new ReportConsultAttentionDTO(
                                        columns[0].toString(), // patientName
                                        columns[1].toString(), // DNIPatient
                                        columns[2].toString(),  // callCenterName
                                        columns[3].toString(), // DNICallCenter
                                        columns[4].toString(), // status
                                        LocalDateTime.parse(columns[5].toString(), formatter) // dateAttention
                                )
                        };
                    })
                    .collect(Collectors.toList());  // Convertir a lista de arrays

            entityManager.getTransaction().commit();  // Confirma la transacción si todo fue exitoso
        }catch (Exception e){
            // Si ocurre un error, se hace rollback de la transacción
            if (entityManager.getTransaction().isActive()) {
                entityManager.getTransaction().rollback();
            }
            LOGGER.severe("Error al obtener la información de reporte de consultas: " + e.getMessage());
        }finally {
            entityManager.close();  // Cerrar el EntityManager
        }
        return resultList;  // Devolver la lista de arreglos
    }

    @Override
    public List<ReportRevelationDTO[]> getReportRevelation() {
        EntityManager entityManager = HibernateConnection.getEntityManagerFactory();
        entityManager.getTransaction().begin();
        List<ReportRevelationDTO[]> resultList = new ArrayList<>();
        try {
            // Ejecutar el procedimiento almacenado
            List<?> rawData = entityManager.createNativeQuery("CALL USP_GetRevelationReportByMonth()")
                    .getResultList();

            // Mapear los resultados a un array de DTOs
            resultList = rawData.stream()
                    .map(row -> {
                        Object[] columns = (Object[]) row;

                        // Convertir los datos a un DTO y devolver como array
                        return new ReportRevelationDTO[]{
                                new ReportRevelationDTO(
                                        columns[0].toString(), // dni
                                        columns[1].toString(), // name
                                        columns[2].toString(),  // paternalSurname
                                        columns[3].toString(), // maternalSurname
                                        columns[4].toString() // revelationMonth
                                )
                        };
                    })
                    .collect(Collectors.toList());  // Convertir a lista de arrays

            entityManager.getTransaction().commit();  // Confirma la transacción si todo fue exitoso
        }catch (Exception e){
            // Si ocurre un error, se hace rollback de la transacción
            if (entityManager.getTransaction().isActive()) {
                entityManager.getTransaction().rollback();
            }
            LOGGER.severe("Error al obtener la información de reporte de revelaciones: " + e.getMessage());
        }finally {
            entityManager.close();  // Cerrar el EntityManager
        }
        return resultList;  // Devolver la lista de arreglos
    }

    @Override
    public Boolean checkExistenceEmail(String email) {
        EntityManager entityManager = HibernateConnection.getEntityManagerFactory();

        try {
            // Ejecutar la consulta nativa y obtener el resultado
            Object result = entityManager.createNativeQuery("SELECT UF_email_exists(:p_email)")
                    .setParameter("p_email", email)
                    .getSingleResult();

            // Verificar si el resultado no es nulo y convertir a Boolean
            return result != null && (Boolean) result;
        } finally {
            // Cerrar el EntityManager si se ha abierto manualmente
            if (entityManager != null && entityManager.isOpen()) {
                entityManager.close();
            }
        }
    }

}
