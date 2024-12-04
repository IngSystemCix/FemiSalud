package pe.edu.utp.femisalud.dao;

import pe.edu.utp.femisalud.DTO.MessageDTO;

import java.util.List;

public interface UserDAO {
    String getRole(String dni);
    String getEmail(String dni);
    String getFullName(String dni);
    List<String> getData(String dni);
    void updateData(String dni, String email, String phoneNumber);
}
