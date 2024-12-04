package pe.edu.utp.femisalud.config;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

/**
 * Unit tests for the HibernateConnection class.
 */
public class HibernateConnectionTest {

    private static EntityManager entityManager;
    private static EntityManagerFactory entityManagerFactory;

    /**
     * Sets up the EntityManagerFactory and EntityManager before all tests.
     */
    @BeforeAll
    public static void setUp() {
        entityManagerFactory = HibernateConnection.getEntityManagerFactory().getEntityManagerFactory();
        entityManager = entityManagerFactory.createEntityManager();
    }

    /**
     * Closes the EntityManager and EntityManagerFactory after all tests.
     */
    @AfterAll
    public static void tearDown() {
        // Close the EntityManager if it is open
        if (entityManager != null && entityManager.isOpen()) {
            entityManager.close();
        }
        HibernateConnection.close();
    }

    /**
     * Tests that the EntityManagerFactory is not null.
     */
    @Test
    void entityManagerFactoryIsNotNull() {
        assertNotNull(entityManagerFactory);
    }

    /**
     * Tests that the EntityManager is open.
     */
    @Test
    void entityManagerFactoryIsOpen() {
        assertTrue(entityManager.isOpen());
    }

    /**
     * Tests that the EntityManagerFactory is closed after calling HibernateConnection.close().
     */
    @Test
    void closeEntityManagerFactory() {
        // Close the EntityManagerFactory
        HibernateConnection.close();
        assertFalse(entityManagerFactory.isOpen());
    }
}