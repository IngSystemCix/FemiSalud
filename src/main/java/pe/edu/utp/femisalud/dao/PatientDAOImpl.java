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
        try (EntityManager em = hibernateUtil.getEntityManager()) {
            return em.createQuery("SELECT sf_valid_dni(:p_dni)", Boolean.class)
                    .setParameter("p_dni", dni)
                    .getSingleResult();
        }finally {
            hibernateUtil.cleanUp();
        }
    }

    @Override
    public String getEmail(String dni) {
        try (EntityManager em = hibernateUtil.getEntityManager()) {
            return em.createQuery("SELECT p.email FROM Patient p WHERE p.dni = :p_dni", String.class)
                    .setParameter("p_dni", dni)
                    .getSingleResult();
        }finally {
            hibernateUtil.cleanUp();
        }
    }

    @Override
    public String getNames(String dni) {
        try (EntityManager em = hibernateUtil.getEntityManager()) {
            return em.createQuery("SELECT p.fullName FROM Patient p WHERE p.dni = :p_dni", String.class)
                    .setParameter("p_dni", dni)
                    .getSingleResult();
        }finally {
            hibernateUtil.cleanUp();
        }
    }
}
