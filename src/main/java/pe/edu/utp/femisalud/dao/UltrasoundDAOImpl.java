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

}
