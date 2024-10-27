package pe.edu.utp.femisalud.dao;

import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import jakarta.persistence.EntityManager;
import pe.edu.utp.femisalud.util.HibernateUtil;

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
}
