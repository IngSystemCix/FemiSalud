package pe.edu.utp.femisalud.dao;

import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import jakarta.persistence.EntityManager;
import pe.edu.utp.femisalud.util.HibernateUtil;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@ApplicationScoped
public class PatientDAOImpl implements PatientDAO {

    @Inject
    private HibernateUtil hibernateUtil;

    @Override
    public boolean verifyDni(String dni) {
        EntityManager em = hibernateUtil.getEntityManager();
        boolean result = false; // Variable para almacenar el resultado

        try {
            result = em.createQuery("SELECT sf_valid_dni(:p_dni)", Boolean.class)
                    .setParameter("p_dni", dni)
                    .getSingleResult();
        } finally {
            if (em != null && em.isOpen()) {
                em.close(); // Cerrar el EntityManager
            }
        }
        return result; // Retornar el resultado
    }

    @Override
    public String getEmail(String dni) {
        EntityManager em = hibernateUtil.getEntityManager();
        String email = null; // Variable para almacenar el email

        try {
            email = em.createQuery("SELECT sf_get_patient_email(:p_dni)", String.class)
                    .setParameter("p_dni", dni)
                    .getSingleResult();
        } finally {
            if (em != null && em.isOpen()) {
                em.close(); // Cerrar el EntityManager
            }
        }
        return email; // Retornar el email
    }

    @Override
    public String getNames(String dni) {
        EntityManager em = hibernateUtil.getEntityManager();
        String fullName = null;

        try {
            fullName = em.createQuery("SELECT sf_get_patient_full_name(:p_dni)", String.class)
                    .setParameter("p_dni", dni)
                    .getSingleResult();
        } finally {
            if (em != null && em.isOpen()) {
                em.close(); // Cerrar el EntityManager
            }
        }
        return fullName; // Retornar el nombre completo
    }

    @Override
    public List<Object[]> getAllPatients() {
        EntityManager em = hibernateUtil.getEntityManager();
        List<Object[]> patients = new ArrayList<>();
        try {
            // Ejecuta el procedimiento almacenado y obtiene el resultado
            List<Object[]> resultList = em.createNativeQuery("CALL usp_get_all_patient()").getResultList();
            patients = resultList;
        } catch (Exception e) {
            // Manejo de excepciones
            e.printStackTrace(); // Considera usar un logger para registrar el error
        } finally {
            // Asegúrate de cerrar el EntityManager
            if (em != null && em.isOpen()) {
                em.close();
            }
        }
        return patients;
    }

}
