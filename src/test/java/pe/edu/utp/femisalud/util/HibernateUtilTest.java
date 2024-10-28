package pe.edu.utp.femisalud.util;

import jakarta.persistence.EntityManagerFactory;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

public class HibernateUtilTest {

    @Mock
    private EntityManagerFactory entityManagerFactory;

    private HibernateUtil hibernateUtil;

    @BeforeEach
    public void setUp() {
        MockitoAnnotations.openMocks(this);
        hibernateUtil = new HibernateUtil();
        hibernateUtil.setEntityManagerFactory(entityManagerFactory);
    }

    @Test
    public void testCleanUp() {
        when(entityManagerFactory.isOpen()).thenReturn(true);

        hibernateUtil.cleanUp();

        verify(entityManagerFactory).close();
    }

    @Test
    public void testGetEntityManagerWhenNotInitialized() {
        hibernateUtil.setEntityManagerFactory(null);
        assertThrows(IllegalStateException.class, () -> {
            hibernateUtil.getEntityManager();
        });
    }
}
