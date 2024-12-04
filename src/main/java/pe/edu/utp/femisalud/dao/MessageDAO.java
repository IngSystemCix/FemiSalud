package pe.edu.utp.femisalud.dao;

import pe.edu.utp.femisalud.DTO.MessageDTO;

import java.util.List;

public interface MessageDAO {
    List<Integer> getIdsChatSession(String dni);
    List<MessageDTO> getMessages(List<Integer> id);
    List<MessageDTO> getMessagesByDNI(String dniPatient, String dniCallCenter);
    void sendMessage(String dni, String message);
}
