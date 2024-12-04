package pe.edu.utp.femisalud.dao;

import com.google.common.base.Preconditions;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.persistence.EntityManager;
import pe.edu.utp.femisalud.config.HibernateConnection;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@ApplicationScoped
public class UserDAOImpl implements UserDAO {

    @Override
    public String getRole(String dni) {
        Preconditions.checkNotNull(dni, "dni cannot be null");
        EntityManager entityManager = HibernateConnection.getEntityManagerFactory();
        String role = null;
        role = (String) entityManager.createNativeQuery("SELECT UF_GET_ROLE_BY_DNI(:userDNI)").setParameter("userDNI", dni).getSingleResult();
        Preconditions.checkNotNull(role, "role cannot be null");
        return role;
    }

    @Override
    public String getEmail(String dni) {
        Preconditions.checkNotNull(dni, "dni cannot be null");
        EntityManager entityManager = HibernateConnection.getEntityManagerFactory();
        String email = null;
        email = (String) entityManager.createNativeQuery("SELECT UF_GETEMAIL(:DNI_patient)").setParameter("DNI_patient", dni).getSingleResult();
        return email;
    }

    @Override
    public String getFullName(String dni) {
        Preconditions.checkNotNull(dni, "dni cannot be null");
        EntityManager entityManager = HibernateConnection.getEntityManagerFactory();
        String fullName = null;
        fullName = (String) entityManager.createNativeQuery("SELECT UF_GETFULLNAME(:DNI_input)").setParameter("DNI_input", dni).getSingleResult();
        Preconditions.checkNotNull(fullName, "fullName cannot be null");
        return fullName;
    }

    @Override
    public List<String> getData(String dni) {
        Preconditions.checkNotNull(dni, "dni cannot be null");
        EntityManager entityManager = HibernateConnection.getEntityManagerFactory();
        List<?> rawData = entityManager
                .createNativeQuery("CALL USP_GetUserInfoByDNI(:input_dni)")
                .setParameter("input_dni", dni)
                .getResultList();
        List<String> data = rawData.stream()
                .map(row -> {
                    Object[] rowArray = (Object[]) row;
                    return Arrays.stream(rowArray)
                            .map(Object::toString)
                            .collect(Collectors.joining(", "));
                })
                .collect(Collectors.toList());
        Preconditions.checkNotNull(data, "data cannot be null");
        return data;
    }

    @Override
    public void updateData(String dni, String email, String phoneNumber) {
        Preconditions.checkNotNull(dni, "dni cannot be null");
        Preconditions.checkNotNull(email, "email cannot be null");
        Preconditions.checkNotNull(phoneNumber, "phoneNumber cannot be null");
        EntityManager entityManager = HibernateConnection.getEntityManagerFactory();
        entityManager.getTransaction().begin();
        entityManager.createNativeQuery("CALL USP_UPDATEDATAUSER(:p_dni, :p_email, :p_phone_number)")
                .setParameter("p_dni", dni)
                .setParameter("p_email", email)
                .setParameter("p_phone_number", phoneNumber)
                .executeUpdate();
        entityManager.getTransaction().commit();
    }

}
