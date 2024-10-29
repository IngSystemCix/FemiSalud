package pe.edu.utp.femisalud.service;

import jakarta.inject.Inject;
import org.apache.commons.mail.EmailException;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.Mockito;

import static org.mockito.Mockito.*;

public class EmailServiceTest {

    @Inject
    private EmailService emailService;

    @BeforeEach
    public void setUp() {
        emailService = new EmailService();
    }

    @Test
    public void sendEmailTest() throws EmailException {
        EmailService emailServiceMock = Mockito.mock(EmailService.class);
        doNothing().when(emailServiceMock).sendEmail("juanromerocollazos@gmail.com", "Juan", "234567");
        emailServiceMock.sendEmail("juanromerocollazos@gmail.com", "Juan", "234567");
        verify(emailServiceMock, times(1)).sendEmail("juanromerocollazos@gmail.com", "Juan", "234567");
        emailService.sendEmail("juanromerocollazos@gmail.com", "Juan", "234567");
    }
}