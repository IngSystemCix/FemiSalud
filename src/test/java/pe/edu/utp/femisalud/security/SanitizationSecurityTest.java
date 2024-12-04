package pe.edu.utp.femisalud.security;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

public class SanitizationSecurityTest {

    @Test
    void sanitizeForHTMLWithNullInput() {
        assertEquals("", SanitizationSecurity.sanitizeForHTML(null));
    }

    @Test
    void sanitizeForHTMLWithValidInput() {
        assertEquals("&lt;div&gt;Test&lt;/div&gt;", SanitizationSecurity.sanitizeForHTML("<div>Test</div>"));
    }

    @Test
    void sanitizeForSQLWithNullInput() {
        assertEquals("", SanitizationSecurity.sanitizeForSQL(null));
    }

    @Test
    void sanitizeForSQLWithValidInput() {
        assertEquals("O''Reilly", SanitizationSecurity.sanitizeForSQL("O'Reilly"));
    }

    @Test
    void sanitizeForURLWithNullInput() {
        assertEquals("", SanitizationSecurity.sanitizeForURL(null));
    }

    @Test
    void sanitizeForURLWithValidInput() {
        assertEquals("alert(\\'XSS\\')", SanitizationSecurity.sanitizeForURL("alert('XSS')"));
    }

    @Test
    void sanitizeForXMLWithNullInput() {
        assertEquals("", SanitizationSecurity.sanitizeForXML(null));
    }

    @Test
    void sanitizeForXMLWithValidInput() {
        assertEquals("&lt;tag&gt;value&lt;/tag&gt;", SanitizationSecurity.sanitizeForXML("<tag>value</tag>"));
    }

    @Test
    void sanitizeForXMLAttributeWithNullInput() {
        assertEquals("", SanitizationSecurity.sanitizeForXMLAttribute(null));
    }

    @Test
    void sanitizeForXMLAttributeWithValidInput() {
        assertEquals("&lt;tag attr=&quot;value&quot;&gt;", SanitizationSecurity.sanitizeForXMLAttribute("<tag attr=\"value\">"));
    }

    @Test
    void sanitizeForCSVWithNullInput() {
        assertEquals("", SanitizationSecurity.sanitizeForCSV(null));
    }

    @Test
    void sanitizeForCSVWithValidInput() {
        assertEquals("\"value,with,commas\"", SanitizationSecurity.sanitizeForCSV("value,with,commas"));
    }

    @Test
    void sanitizeForJavaWithNullInput() {
        assertEquals("", SanitizationSecurity.sanitizeForJava(null));
    }

    @Test
    void sanitizeForJavaWithValidInput() {
        assertEquals("\\\"String\\\"", SanitizationSecurity.sanitizeForJava("\"String\""));
    }
}