package pe.edu.utp.femisalud.security;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.text.StringEscapeUtils;

import java.nio.charset.StandardCharsets;

/**
 * Utility class for sanitizing input strings for various contexts.
 */
public class SanitizationSecurity {

    /**
     * Sanitizes a string for HTML content.
     *
     * @param input the input string to sanitize
     * @return the sanitized string safe for HTML
     */
    public static String sanitizeForHTML(String input) {
        if (input == null) return "";
        String sanitized = StringUtils.trim(input);
        sanitized = StringEscapeUtils.escapeHtml4(sanitized);
        return sanitized;
    }

    /**
     * Sanitizes a string for SQL queries.
     *
     * @param input the input string to sanitize
     * @return the sanitized string safe for SQL
     */
    public static String sanitizeForSQL(String input) {
        if (input == null) return "";
        String sanitized = StringUtils.trim(input);
        sanitized = sanitized.replace("'", "''");
        return sanitized;
    }

    /**
     * Sanitizes a string for URL encoding.
     *
     * @param input the input string to sanitize
     * @return the sanitized string safe for URLs
     */
    public static String sanitizeForURL(String input) {
        if (input == null) return "";
        String sanitized = StringUtils.trim(input);
        sanitized = StringEscapeUtils.escapeEcmaScript(sanitized);
        return sanitized;
    }

    /**
     * Sanitizes a string for XML content.
     *
     * @param input the input string to sanitize
     * @return the sanitized string safe for XML
     */
    public static String sanitizeForXML(String input) {
        if (input == null) return "";
        String sanitized = StringUtils.trim(input);
        sanitized = StringEscapeUtils.escapeXml11(sanitized);
        return sanitized;
    }

    /**
     * Sanitizes a string for XML attributes.
     *
     * @param input the input string to sanitize
     * @return the sanitized string safe for XML attributes
     */
    public static String sanitizeForXMLAttribute(String input) {
        if (input == null) return "";
        String sanitized = StringUtils.trim(input);
        sanitized = StringEscapeUtils.escapeXml10(sanitized);
        return sanitized;
    }

    /**
     * Sanitizes a string for CSV content.
     *
     * @param input the input string to sanitize
     * @return the sanitized string safe for CSV
     */
    public static String sanitizeForCSV(String input) {
        if (input == null) return "";
        String sanitized = StringUtils.trim(input);
        sanitized = StringEscapeUtils.escapeCsv(sanitized);
        return sanitized;
    }

    /**
     * Sanitizes a string for Java code.
     *
     * @param input the input string to sanitize
     * @return the sanitized string safe for Java
     */
    public static String sanitizeForJava(String input) {
        if (input == null) return "";
        String sanitized = StringUtils.trim(input);
        sanitized = StringEscapeUtils.escapeJava(sanitized);
        return sanitized;
    }

}