package pe.edu.utp.femisalud.dao;

import com.google.common.base.Preconditions;
import com.google.common.collect.ImmutableList;
import jakarta.ejb.Stateless;
import jakarta.inject.Inject;
import jakarta.persistence.EntityManager;
import jakarta.persistence.ParameterMode;
import jakarta.persistence.StoredProcedureQuery;
import pe.edu.utp.femisalud.model.User;
import pe.edu.utp.femisalud.util.HibernateUtil;

import java.util.Arrays;

@Stateless
public class UserDaoImpl implements UserDAO {

    @Inject
    private HibernateUtil hibernateUtil;

    @Override
    public ImmutableList<Object[]> generateReportUltrasound(String name) {
        Preconditions.checkNotNull(name, "El nombre no puede ser nulo");
        Preconditions.checkArgument(!name.trim().isEmpty(), "El nombre no puede estar vacío");

        String[] nameParts = name.trim().split(" ");

        if (nameParts.length < 3) {
            throw new IllegalArgumentException("El nombre debe contener al menos un nombre y dos apellidos.");
        }

        String firstName = nameParts[0];
        String paternalSurname = nameParts[nameParts.length - 2];
        String maternalSurname = nameParts[nameParts.length - 1];

        if (nameParts.length > 3) {
            firstName = String.join(" ", Arrays.copyOfRange(nameParts, 0, nameParts.length - 2));
        }

        try (EntityManager em = hibernateUtil.getEntityManager()) {
            StoredProcedureQuery query = em.createNamedStoredProcedureQuery("usp_get_ultrasound_info_by_name");
            query.registerStoredProcedureParameter("p_full_name", String.class, ParameterMode.IN);
            query.registerStoredProcedureParameter("p_paternal_surname", String.class, ParameterMode.IN);
            query.registerStoredProcedureParameter("p_maternal_surname", String.class, ParameterMode.IN);

            query.setParameter("p_full_name", firstName);
            query.setParameter("p_paternal_surname", paternalSurname);
            query.setParameter("p_maternal_surname", maternalSurname);

            query.execute();

            return ImmutableList.copyOf(query.getResultList());
        } catch (Exception e) {
            throw new RuntimeException("Error al generar el reporte de ecografías", e);
        }
    }

    @Override
    public boolean findByDni(String dni) {
        Preconditions.checkNotNull(dni, "El DNI no puede ser nulo");
        Preconditions.checkArgument(!dni.trim().isEmpty(), "El DNI no puede estar vacío");

        try (EntityManager em = hibernateUtil.getEntityManager()) {
            StoredProcedureQuery query = em.createNamedStoredProcedureQuery("sf_valid_dni");
            query.registerStoredProcedureParameter("p_dni", String.class, ParameterMode.IN);

            query.setParameter("p_dni", dni);

            query.execute();

            Boolean isValid = (Boolean) query.getSingleResult();
            return isValid != null && isValid;

        } catch (Exception e) {
            throw new RuntimeException("Error al buscar el usuario por DNI", e);
        }
    }

}
