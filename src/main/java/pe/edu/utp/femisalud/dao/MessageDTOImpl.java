package pe.edu.utp.femisalud.dao;

import jakarta.enterprise.context.ApplicationScoped;
import jakarta.persistence.EntityManager;
import pe.edu.utp.femisalud.DTO.MessageDTO;
import pe.edu.utp.femisalud.config.HibernateConnection;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;
import java.util.stream.Collectors;

@ApplicationScoped
public class MessageDTOImpl implements MessageDAO {

    private static final Logger LOGGER = Logger.getLogger("pe.edu.utp.femisalud");

    @Override
    public List<Integer> getIdsChatSession(String dni) {
        EntityManager entityManager = HibernateConnection.getEntityManagerFactory();
        entityManager.getTransaction().begin();
        List<Integer> data = new ArrayList<>();
        try {
            List<?> ids = entityManager.createNativeQuery("CALL USP_GetMessagesByChatId(:dni)")
                    .setParameter("dni", dni)
                    .getResultList();
            data = ids.stream()
                    .map(row -> (Integer) row)
                    .collect(Collectors.toList());
            entityManager.getTransaction().commit();
        }catch (Exception e){
            LOGGER.severe(e.getMessage());
        }finally {
            entityManager.close();
        }
        return data;
    }

    @Override
    public List<MessageDTO> getMessages(List<Integer> id) {
        EntityManager entityManager = HibernateConnection.getEntityManagerFactory();
        entityManager.getTransaction().begin();
        List<MessageDTO> data = new ArrayList<>();
        try {
            List<?> messages = entityManager.createNativeQuery("CALL USP_GetMessagesByChatId(:id)")
                    .setParameter("id", id)
                    .getResultList();
            data = messages.stream()
                    .map(row -> {
                        Object[] rowArray = (Object[]) row;
                        return new MessageDTO(
                                (String) rowArray[0],
                                LocalDateTime.parse(rowArray[1].toString())
                        );
                    })
                    .collect(Collectors.toList());
            entityManager.getTransaction().commit();
        }catch (Exception e){
            LOGGER.severe(e.getMessage());
        }finally {
            entityManager.close();
        }
        return data;
    }

    @Override
    public List<MessageDTO> getMessagesByDNI(String dniPatient, String dniCallCenter) {
        EntityManager entityManager = HibernateConnection.getEntityManagerFactory();
        entityManager.getTransaction().begin();
        List<MessageDTO> data = new ArrayList<>();
        try {
            List<?> messages = entityManager.createNativeQuery("CALL USP_GetMessagesByDNI(:dniPatient, :dniCallCenter)")
                    .setParameter("dniPatient", dniPatient)
                    .setParameter("dniCallCenter", dniCallCenter)
                    .getResultList();
            data = messages.stream()
                    .map(row -> {
                        Object[] rowArray = (Object[]) row;
                        return new MessageDTO(
                                (String) rowArray[0],
                                LocalDateTime.parse(rowArray[1].toString())
                        );
                    })
                    .collect(Collectors.toList());
            entityManager.getTransaction().commit();
        }catch (Exception e){
            LOGGER.severe(e.getMessage());
        }finally {
            entityManager.close();
        }
        return data;
    }

    @Override
    public void sendMessage(String dni, String message) {
        EntityManager entityManager = HibernateConnection.getEntityManagerFactory();
        entityManager.getTransaction().begin();
        entityManager.createNativeQuery("CALL USP_CreateMessageAndSession(:dni, :message)")
                .setParameter("dni", dni)
                .setParameter("message", message)
                .executeUpdate();
        entityManager.getTransaction().commit();
        entityManager.close();
    }
}
