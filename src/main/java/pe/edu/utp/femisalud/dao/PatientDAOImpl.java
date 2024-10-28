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
            email = em.createQuery("SELECT p.email FROM Patient p WHERE p.dni = :p_dni", String.class)
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
            fullName = em.createQuery("SELECT p.fullName FROM Patient p WHERE p.dni = :p_dni", String.class)
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
    public List<String> getAllPatients() {
        EntityManager em = hibernateUtil.getEntityManager();
        List<String> patients;
        try {
            // Ejecuta el procedimiento almacenado y obtiene el resultado
            // Asegúrate de que el resultado es del tipo correcto (String)
            List<Object> resultList = em.createNativeQuery("CALL usp_get_all_patient()").getResultList();

            // Convierte el resultado a List<String> si es necesario
            patients = resultList.stream()
                    .map(result -> (String) result) // Asegúrate de que cada resultado es un String
                    .collect(Collectors.toList());
        } catch (Exception e) {
            // Manejo de excepciones
            e.printStackTrace(); // O usar un logger para registrar el error
            patients = new ArrayList<>(); // Devuelve una lista vacía en caso de error
        } finally {
            // Asegúrate de cerrar el EntityManager
            if (em != null && em.isOpen()) {
                em.close();
            }
        }
        return patients;
    }

}
