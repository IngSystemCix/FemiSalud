package pe.edu.utp.femisalud.util;

import jakarta.persistence.EntityManagerFactory;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;

import static org.junit.jupiter.api.Assertions.assertThrows;

public class HibernateUtilTest {

    @Mock
    private EntityManagerFactory entityManagerFactory;

    private HibernateUtil hibernateUtil;

    @BeforeEach
    public void setUp() {
        // Inicializa los mocks
        MockitoAnnotations.openMocks(this);

        // Crea la instancia de HibernateUtil y configura el mock de EntityManagerFactory
        hibernateUtil = new HibernateUtil();
        hibernateUtil.setEntityManagerFactory(entityManagerFactory); // Inyecta el mock
    }

    @Test
    public void testCleanUp() {
        // Llama explícitamente a cleanUp
        hibernateUtil.cleanUp();

        // Verifica que el método close() se haya llamado en entityManagerFactory
        Mockito.verify(entityManagerFactory).close();
    }

    @Test
    public void testGetEntityManagerWhenNotInitialized() {
        // Simula que no hay un EntityManagerFactory y llama a cleanUp
        hibernateUtil.cleanUp();
        hibernateUtil.setEntityManagerFactory(null);

        // Verifica que getEntityManager() lance IllegalStateException si no está inicializado
        assertThrows(IllegalStateException.class, () -> {
            hibernateUtil.getEntityManager();
        });
    }
}
