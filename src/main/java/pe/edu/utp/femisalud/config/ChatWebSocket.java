package pe.edu.utp.femisalud.config;

import jakarta.inject.Inject;
import jakarta.servlet.http.HttpSession;
import jakarta.websocket.*;
import jakarta.websocket.server.ServerEndpoint;
import pe.edu.utp.femisalud.dao.MessageDAO;

import java.util.Collections;
import java.util.HashSet;
import java.util.Set;
import java.util.logging.Logger;

@ServerEndpoint(value = "/chat", configurator = HttpSessionConfigurator.class)
public class ChatWebSocket {
    private static final Logger LOGGER = Logger.getLogger("pe.edu.utp.femisalud");

    @Inject
    private MessageDAO messageDAO;

    private static final Set<Session> usersSession = Collections.synchronizedSet(new HashSet<>());

    @OnOpen
    public void onOpen(Session session, EndpointConfig config) {
        HttpSession httpSession = (HttpSession) config.getUserProperties().get("httpSession");
        if (httpSession != null) {
            session.getUserProperties().put("httpSession", httpSession);
            usersSession.add(session);
            LOGGER.info("Session opened: " + session.getId());
        } else {
            LOGGER.warning("No HTTP session available for WebSocket session: " + session.getId());
        }
    }

    @OnMessage
    public void onMessage(String message, Session session) {
        HttpSession httpSession = (HttpSession) session.getUserProperties().get("httpSession");
        if (httpSession != null) {
            String dni = (String) httpSession.getAttribute("USER_DNI");
            if (dni != null) {
                messageDAO.sendMessage(dni, message);
                broadcast(dni, message);
            } else {
                LOGGER.warning("USER_DNI is null for session: " + session.getId());
            }
        } else {
            LOGGER.warning("No HTTP session associated with WebSocket session: " + session.getId());
        }
    }

    @OnClose
    public void onClose(Session session) {
        usersSession.remove(session);
        LOGGER.info("Session closed: " + session.getId());
    }

    @OnError
    public void onError(Session session, Throwable throwable) {
        LOGGER.severe("Error in session " + session.getId() + ": " + throwable.getMessage());
    }

    private void broadcast(String dni, String message) {
        synchronized (usersSession) {
            for (Session session : usersSession) {
                try {
                    if (session.isOpen()) {
                        session.getBasicRemote().sendText(dni + ": " + message);
                    }
                } catch (Exception e) {
                    LOGGER.severe("Error broadcasting message: " + e.getMessage());
                }
            }
        }
    }
}
