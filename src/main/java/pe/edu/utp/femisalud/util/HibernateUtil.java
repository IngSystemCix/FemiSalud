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
            // Asegúrate de que el contexto de persistencia esté configurado correctamente
            entityManagerFactory = Persistence.createEntityManagerFactory("femisalud_db", getProperties());
            LOGGER.info("EntityManagerFactory initialized successfully."); // Log para confirmar la inicialización
        } catch (Exception e) {
            LOGGER.error("Error initializing EntityManagerFactory", e); // Mensaje de error mejorado
            throw new IllegalStateException("EntityManagerFactory initialization failed.", e); // Lanzar una excepción específica
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

        String host = dotenv.get("HOST_DB");
        String port = dotenv.get("PORT_DB");
        String dbName = dotenv.get("DB_NAME");
        String user = dotenv.get("USER_DB");
        String password = dotenv.get("PASS_DB");

        if (host == null || port == null || dbName == null || user == null || password == null) {
            throw new IllegalStateException("One or more required environment variables are missing.");
        }

        properties.put("jakarta.persistence.jdbc.url",
                "jdbc:mariadb://" + host + ":" + port + "/" + dbName);
        properties.put("jakarta.persistence.jdbc.user", user);
        properties.put("jakarta.persistence.jdbc.password", password);
        properties.put("jakarta.persistence.jdbc.driver", "org.mariadb.jdbc.Driver");
        properties.put("hibernate.dialect", "org.hibernate.dialect.MariaDBDialect");

        properties.put("hibernate.hbm2ddl.auto", "update");

        return properties;
    }

    @PreDestroy
    public void cleanUp() {
        if (entityManagerFactory != null && entityManagerFactory.isOpen()) {
            entityManagerFactory.close();
            LOGGER.info("EntityManagerFactory closed successfully.");
        } else {
            LOGGER.warn("EntityManagerFactory was null or already closed on cleanup.");
        }
    }

    public void setEntityManagerFactory(EntityManagerFactory entityManagerFactory) {
        this.entityManagerFactory = entityManagerFactory;
    }
}