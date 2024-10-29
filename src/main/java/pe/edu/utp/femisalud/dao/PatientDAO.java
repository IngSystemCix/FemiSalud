package pe.edu.utp.femisalud.dao;

import java.util.List;

public interface PatientDAO {
    boolean verifyDni(String dni);
    String getEmail(String dni);
    String getNames(String dni);
    List<Object[]> getAllPatients();
    List<String> getData(String dni);
    void updateData(String dni, String phone, String email);
}
