package pe.edu.utp.femisalud.dao;

import com.google.common.base.Preconditions;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import jakarta.persistence.EntityManager;
import pe.edu.utp.femisalud.util.HibernateUtil;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@ApplicationScoped
public class UltrasoundDAOImpl implements UltrasoundDAO{
    @Inject
    private HibernateUtil hibernateUtil;

    private static final org.slf4j.Logger LOGGER = org.slf4j.LoggerFactory.getLogger(UltrasoundDAOImpl.class);

    @Override
    public List<Long> getUltrasoundByPatient(String dni) {
        Preconditions.checkNotNull(dni, "El DNI no puede ser nulo");

        List<Long> ultrasounds = new ArrayList<>();

        // Uso de try-with-resources para manejar el EntityManager
        try (EntityManager em = hibernateUtil.getEntityManager()) {
            // Ejecuta el procedimiento almacenado y obtiene el resultado
            ultrasounds = em.createNativeQuery("CALL usp_get_ultrasound_patient(:input_dni)", Long.class)
                    .setParameter("input_dni", dni)
                    .getResultList();
        } catch (Exception e) {
            // Manejo de excepciones usando un logger
            LOGGER.error("Error al ejecutar el procedimiento almacenado usp_get_ultrasound_patient", e);
        }

        // Retorna la lista de resultados
        return ultrasounds != null ? ultrasounds : Collections.emptyList();
    }

    @Override
    public List<Object[]> getClinicalNotesByPatient(String dni) {
        EntityManager em = null;
        List<Object[]> clinicalNotes = new ArrayList<>();
        try {
            em = hibernateUtil.getEntityManager();
            clinicalNotes = em.createNativeQuery("CALL usp_get_clinical_notes(:input_dni)")
                    .setParameter("input_dni", dni)
                    .getResultList();
        } catch (Exception e) {
            // Manejo de excepciones
            LOGGER.error("Error al ejecutar el procedimiento almacenado usp_get_clinical_notes", e);
        } finally {
            // Asegúrate de cerrar el EntityManager
            if (em != null && em.isOpen()) {
                em.close();
            }
        }
        return clinicalNotes; // No necesitas verificar si es null
    }

    @Override
    public void addClinicalNotes(String dni, Long idUltrasound, String notes) {
        Preconditions.checkNotNull(dni, "El DNI no puede ser nulo");
        Preconditions.checkNotNull(idUltrasound, "El ID de la ecografía no puede ser nulo");
        Preconditions.checkNotNull(notes, "Las notas clínicas no pueden ser nulas");

        EntityManager em = null;
        try {
            em = hibernateUtil.getEntityManager();
            em.getTransaction().begin();
            em.createNativeQuery("CALL usp_update_clinical_note(:p_dni, :p_id_ultrasound, :p_clinical_notes)")
                    .setParameter("p_dni", dni)
                    .setParameter("p_id_ultrasound", idUltrasound)
                    .setParameter("p_clinical_notes", notes)
                    .executeUpdate();
            em.getTransaction().commit();
        } catch (Exception e) {
            // Manejo de excepciones
            LOGGER.error("Error al ejecutar el procedimiento almacenado usp_add_clinical_notes", e);
            if (em != null && em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
        } finally {
            // Asegúrate de cerrar el EntityManager
            if (em != null && em.isOpen()) {
                em.close();
            }
        }
    }


}
