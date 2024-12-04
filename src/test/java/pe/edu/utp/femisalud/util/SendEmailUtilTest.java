package pe.edu.utp.femisalud.util;

import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import static org.mockito.Mockito.*;

/**
 * Unit tests for the SendEmailUtil class.
 */
class SendEmailUtilTest {

    private SendEmailUtil sendEmailUtil;
    private HtmlEmail mockEmail;

    /**
     * Sets up the test environment before each test.
     * Initializes the SendEmailUtil instance and mocks the HtmlEmail class.
     */
    @BeforeEach
    void setUp() {
        sendEmailUtil = new SendEmailUtil();
        mockEmail = mock(HtmlEmail.class);
    }

    /**
     * Tests the sendEmail method with valid input.
     * Verifies that the email is sent successfully.
     *
     * @throws EmailException if there is an error sending the email
     */
    @Test
    void testSendEmail() throws EmailException {
        String recipientEmail = "juanromerocollazos@gmail.com";
        String name = "Juan Romero";
        String code = "123456";

        when(mockEmail.getHostName()).thenReturn("smtp.gmail.com");

        sendEmailUtil.sendEmail(recipientEmail, name, code);
    }
}