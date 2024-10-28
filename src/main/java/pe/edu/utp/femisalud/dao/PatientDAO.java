package pe.edu.utp.femisalud.dao;

import java.util.List;

public interface PatientDAO {
    boolean verifyDni(String dni);
    String getEmail(String dni);
    String getNames(String dni);
    List<Object[]> getAllPatients();
}
