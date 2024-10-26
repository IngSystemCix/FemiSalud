package pe.edu.utp.femisalud.util;

import io.github.cdimascio.dotenv.Dotenv;
import jakarta.annotation.PostConstruct;
import jakarta.annotation.PreDestroy;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

import java.util.Properties;

@ApplicationScoped
public class HibernateUtil {
    private EntityManagerFactory entityManagerFactory;
    private static final Dotenv dotenv = Dotenv.configure().ignoreIfMissing().load();

    @PostConstruct
    public void init() {
        entityManagerFactory = Persistence.createEntityManagerFactory("femisalud_db");
    }

    public EntityManager getEntityManager() {
        return entityManagerFactory.createEntityManager();
    }

    private Properties getProperties() {
        Properties properties = new Properties();
        properties.put("jakarta.persistence.jdbc.url", "jdbc:mysql://" + dotenv.get("HOST_DB") + ":"+ dotenv.get("PORT_DB") +"/" + dotenv.get("DB_NAME"));
        properties.put("jakarta.persistence.jdbc.user", dotenv.get("USER_DB"));
        properties.put("jakarta.persistence.jdbc.password", dotenv.get("PASS_DB"));
        properties.put("jakarta.persistence.jdbc.driver", "org.mariadb.jdbc.Driver");
        properties.put("jakarta.persistence.schema-generation.database.action", "create");
        properties.put("jakarta.persistence.schema-generation.create-source", "metadata");
        properties.put("jakarta.persistence.schema-generation.drop-source", "metadata");
        properties.put("jakarta.persistence.schema-generation.scripts.action", "create");
        properties.put("jakarta.persistence.schema-generation.scripts.create-target", "create.sql");
        properties.put("jakarta.persistence.schema-generation.scripts.drop-target", "drop.sql");
        properties.put("jakarta.persistence.sql-load-script-source", "data.sql");
        return properties;
    }

    @PreDestroy
    public void cleanUp() {
        if (entityManagerFactory != null) {
            entityManagerFactory.close();
        }
    }
}
