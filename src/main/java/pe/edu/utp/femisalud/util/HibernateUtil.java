package pe.edu.utp.femisalud.util;

import io.github.cdimascio.dotenv.Dotenv;
import jakarta.annotation.PostConstruct;
import jakarta.annotation.PreDestroy;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Properties;

@ApplicationScoped
public class HibernateUtil {
    private EntityManagerFactory entityManagerFactory;
    private static final Dotenv dotenv = Dotenv.configure().ignoreIfMissing().load();
    private static final Logger LOGGER = LoggerFactory.getLogger(HibernateUtil.class);

    @PostConstruct
    public void init() {
        try {
            entityManagerFactory = Persistence.createEntityManagerFactory("femisalud_db", getProperties());
        } catch (Exception e) {
            // Log the exception instead of printing the stack trace
            LOGGER.error("Error initializing EntityManagerFactory", e);
        }
    }

    public EntityManager getEntityManager() {
        if (entityManagerFactory == null) {
            throw new IllegalStateException("EntityManagerFactory has not been initialized.");
        }
        return entityManagerFactory.createEntityManager();
    }

    private Properties getProperties() {
        Properties properties = new Properties();
        properties.put("jakarta.persistence.jdbc.url",
                "jdbc:mariadb://" + dotenv.get("HOST_DB") + ":" + dotenv.get("PORT_DB") + "/" + dotenv.get("DB_NAME"));
        properties.put("jakarta.persistence.jdbc.user", dotenv.get("USER_DB"));
        properties.put("jakarta.persistence.jdbc.password", dotenv.get("PASS_DB"));
        properties.put("jakarta.persistence.jdbc.driver", "org.mariadb.jdbc.Driver");
        properties.put("jakarta.persistence.schema-generation.database.action", "update");
        properties.put("hibernate.dialect", "org.hibernate.dialect.MariaDBDialect"); // Corrección del nombre de la propiedad
        return properties;
    }

    @PreDestroy
    public void cleanUp() {
        if (entityManagerFactory != null) {
            entityManagerFactory.close();
            LOGGER.info("EntityManagerFactory closed successfully.");
        }
    }

    // Método para establecer un EntityManagerFactory simulado en las pruebas
    public void setEntityManagerFactory(EntityManagerFactory entityManagerFactory) {
        this.entityManagerFactory = entityManagerFactory;
    }
}
