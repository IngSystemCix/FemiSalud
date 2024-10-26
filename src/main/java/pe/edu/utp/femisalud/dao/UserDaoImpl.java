package pe.edu.utp.femisalud.dao;

import com.google.common.base.Preconditions;
import com.google.common.collect.ImmutableList;
import jakarta.ejb.Stateless;
import jakarta.inject.Inject;
import jakarta.persistence.EntityManager;
import jakarta.persistence.ParameterMode;
import jakarta.persistence.StoredProcedureQuery;
import pe.edu.utp.femisalud.model.User;

@Stateless
public class UserDaoImpl implements UserDAO {

    @Inject
    private EntityManager em;

    @Override
    public ImmutableList<Object[]> generateReport(String name) {
        Preconditions.checkNotNull(name, "El nombre no puede ser nulo");
        Preconditions.checkArgument(!name.trim().isEmpty(), "El nombre no puede estar vacío");

        StoredProcedureQuery query = em.createNamedStoredProcedureQuery("usp_get_clinical_notes");
        query.registerStoredProcedureParameter("p_name", String.class, ParameterMode.IN);
        query.setParameter("p_name", name);
        query.execute();

        return ImmutableList.copyOf(query.getResultList());
    }

    @Override
    public User findByDni(String dni) {
        return null;
    }
}
