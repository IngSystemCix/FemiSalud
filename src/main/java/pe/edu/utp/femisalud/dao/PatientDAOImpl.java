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

    @Override
    public List<String> getData(String dni) {
        EntityManager em = hibernateUtil.getEntityManager();
        List<String> data = new ArrayList<>();
        try {
            // Ejecuta el procedimiento almacenado y obtiene el resultado
            List<Object[]> resultList = em.createNativeQuery("CALL usp_get_data_patient(:p_dni)")
                    .setParameter("p_dni", dni)
                    .getResultList();

            // Verificar si se encontraron resultados
            if (resultList.isEmpty()) {
                data.add("No se encontraron datos para el DNI proporcionado.");
                return data; // Devolver la lista con el mensaje
            }

            // Procesa el resultado del procedimiento almacenado
            for (Object[] objects : resultList) {
                // Asegúrate de que el resultado tiene al menos 4 columnas
                if (objects.length >= 4) {
                    // Agregar los datos a la lista
                    data.add(objects[0] != null ? objects[0].toString() : "N/A"); // Nombre
                    data.add(objects[2] != null ? objects[2].toString() : "N/A"); // Email
                    data.add(objects[3] != null ? objects[3].toString() : "N/A"); // Otro dato
                    data.add(objects[1] != null ? objects[1].toString() : "N/A"); // Teléfono
                } else {
                    // Manejo en caso de datos incompletos
                    data.add("Datos incompletos");
                }
            }
        } catch (Exception e) {
            // Manejo de excepciones
            e.printStackTrace(); // Considera usar un logger para registrar el error
        } finally {
            // Asegúrate de cerrar el EntityManager
            if (em != null && em.isOpen()) {
                em.close();
            }
        }
        return data; // Devolvemos la lista de datos como cadenas individuales
    }

    @Override
    public void updateData(String dni, String phone, String email) {
        EntityManager em = hibernateUtil.getEntityManager();
        try {
            // Inicia una transacción
            em.getTransaction().begin();
            // Ejecuta el procedimiento almacenado
            em.createNativeQuery("CALL usp_update_patient_data(:p_dni, :p_phone, :p_email)")
                    .setParameter("p_dni", dni)
                    .setParameter("p_phone", phone)
                    .setParameter("p_email", email)
                    .executeUpdate();
            // Confirma la transacción
            em.getTransaction().commit();
        } catch (Exception e) {
            // Manejo de excepciones
            e.printStackTrace(); // Considera usar un logger para registrar el error
            // Si ocurre un error, se hace un rollback de la transacción
            if (em.getTransaction().isActive()) {
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
