package pe.edu.utp.femisalud.config;

import io.github.cdimascio.dotenv.Dotenv;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

/**
 * Utility class for managing Hibernate connections.
 */
public class HibernateConnection {
    private static final Dotenv ENV = Dotenv
            .configure()
            .load();
    private static final EntityManagerFactory ENTITY_MANAGER_FACTORY = Persistence.createEntityManagerFactory(ENV.get("PERSISTENCE_UNIT"));

    /**
     * Retrieves an instance of EntityManager from the EntityManagerFactory.
     *
     * @return an instance of EntityManager
     */
    public static EntityManager getEntityManagerFactory() {
        return ENTITY_MANAGER_FACTORY.createEntityManager();
    }

    /**
     * Closes the EntityManagerFactory if it is not null.
     */
    public static void close() {
        if (ENTITY_MANAGER_FACTORY != null) {
            ENTITY_MANAGER_FACTORY.close();
        }
    }
}