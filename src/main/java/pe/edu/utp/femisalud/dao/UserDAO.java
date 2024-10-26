package pe.edu.utp.femisalud.dao;

import com.google.common.collect.ImmutableList;
import pe.edu.utp.femisalud.model.User;

public interface UserDAO {
    ImmutableList<Object[]> generateReport(String name);
    User findByDni(String dni);
}
