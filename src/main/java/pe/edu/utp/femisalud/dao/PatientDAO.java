package pe.edu.utp.femisalud.dao;

public interface PatientDAO {
    boolean verifyDni(String dni);
    String getEmail(String dni);
    String getNames(String dni);
}
