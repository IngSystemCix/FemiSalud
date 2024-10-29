package pe.edu.utp.femisalud.service;

import io.github.cdimascio.dotenv.Dotenv;
import jakarta.enterprise.context.ApplicationScoped;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;

import java.time.Year;

@ApplicationScoped
public class EmailService {
    private static final Dotenv dotenv = Dotenv.configure().load();
    private static final String EMAIL = dotenv.get("EMAIL");
    private static final String APP_CODE = dotenv.get("APP_CODE");
    private static final String HOST_NAME = "smtp.gmail.com";
    private static final int SMTP_PORT = 587;

    public void sendEmail(String recipientEmail, String name, String code) throws EmailException {
        HtmlEmail email = new HtmlEmail();

        email.setHostName(HOST_NAME);
        email.setSmtpPort(SMTP_PORT);
        email.setStartTLSEnabled(true);
        email.setAuthentication(EMAIL, APP_CODE);
        email.setContentType("text/html; charset=UTF-8");
        email.setCharset("UTF-8");
        email.setFrom(EMAIL);
        email.addTo(recipientEmail);
        email.setSubject("Código de verificación");

        String htmlMessage = createHtmlMessage(name, code);
        email.setMsg(htmlMessage);
        email.send();
    }

    private String createHtmlMessage(String name, String code) {
        return "<!DOCTYPE html>"
                + "<html lang=\"es\">"
                + "<head>"
                + "  <meta charset=\"UTF-8\">"
                + "  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">"
                + "  <title>FemiSalud - Código de Verificación</title>"
                + "  <link href=\"https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap\" rel=\"stylesheet\">"
                + "</head>"
                + "<body style=\"margin: 0; padding: 0; font-family: 'Roboto', Arial, sans-serif; background-color: #f3f4f6;\">"
                + "  <table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"background-color: #f3f4f6; padding: 20px;\">"
                + "    <tr>"
                + "      <td align=\"center\">"
                + "        <table width=\"600px\" style=\"background-color: #ffffff; border-radius: 8px; padding: 30px;\">"
                + "          <tr>"
                + "            <td align=\"center\">"
                + "              <img src=\"https://lh3.googleusercontent.com/fife/ALs6j_EqS23V2rn87GufFenJzGClL-WY2nbB75tNjm07ZSCdWSUx3onp23si3V-efDqxiX9RC4a-ZEhPsbrSOEitz8io1WqmfOz8hzvwqjGT7G7LnBViO7zc3fGLBDg9W39gdvwh6VXBRNUxKIC_ZIis_ld5TPzNda1FE1uJU4YtRE0gFolgfI_gjQqwlY1mKnpgH9TEZrl3Kx4orEmOWNXdBGAWEDBiZ08llLJa31ToGx-DKNK_4tWgtCssgxe7ECWQtUBHPrrW8pE9QKoZShZ7Syyms43KG77PFQCX1-sEXnC4ypNZbDD8U8LADybzvpZIonZvDinwpJtXgva51TsWF8nZmKT5sxiJMha04LMCFO6-6l95cA-mbM38gX8L-3STToKAAiz0oTu_xfHMSykA_VPX1EW568Uh0zWbBwocZ38hGfvXSnj8dzz0Lr9CTr9lIM4KrouqCx-UwJ8BRH28YEATWJGprGoz2F9U_LXbR2OFo9E_ib9PvZQVHPtk5SSM6URxq0ESm-5ytP1GE6wpf5iP1z_E0ot7T6BNjOl0ty1d6WTXKfKCN2TbuySjfbeC9f5w1l0CkIpreJSQu8zqo1nYgTzJpZZ8jHvP_0AI2rkWKrW0WfzYHkdz8YpN-IffdzNwW6gj7TkEBF8nbfk_6Fs6kO8hxujPecEUAO4B59vrnXnLnIpAINvvl0OFiWGiqz7yABM__vkkGhLnljTPlec6RJokD4nGAEpJizFOLZBvwDCGT4G734VJ_li5AhbwHpOt5GeH6B8qfFAdAu7p5YwauN17eit0D5iqk-sqXc1QW0NBWLxtVQr6etaLBULM9N6lbk7IgITFtMnGhML5m1b2U9T9ElpOO45FUHUWF-aqs2W4mj48m-qK-azO9bRGrReJg_0BP9nMxJc3rVnMj5mxqLln5mus3AZdDsiNZvLrx4g_u2RnRW5J_R0SAetisnSzMEgH1IGcRmzecpYd_mc_f0xP3CGdq7jpp_6TT9BfLpnN_QRHZJBT2_BgMb8Wi8hVYd6cm1tCycx2n59FTLwk58bt5v3aRpVgWCiegJJB8p27RP80qkCDVENYuJOKeLk-wIFkfQFc2A1IY9RYT7AZxvwc1OUigV-WrCZego0zG9L1C2V8RlNUf_W3RJkVkBzheefJAMkS7FunpLx3yePRw-LhpFMaW2Xk8bZBXNLRoUiI9EsjDqzBw-EskrlyFIu5zl9si8rt5ESD0gTf7cUBVkX9qCHTxDjGP35iVAwlvdsKJyO9M3wtWq52lHiO0mY9pV3KJcl2Icay-xyDHxL0ElVFdXq0_NgvmDdQqCwHfPjoV_c-dW5xebIeAaZ7YS2gWXdl4YHiEtjnDaqx2KrgGBUKjILz_sbaeIfxsoOAHmNkBqMN93WdArbDDyYamIPqrcBD7sJQ7vBmPCGSVSwc5X4_K4cl7Q2EMiwzuhDQYnoYlajeNN4UtVN2Ik-SkET6HoLEabR0OMyI66t_x1owDxsqA1gFKHXSYt_ivPKMFlFhB95L1V7qVfQqLvsYKpJpkVJNDIB7PlqJYJY0rryAPQ4nQJhFtfk9Bz51BDWucOyb5yIe3U81kspyoJtE3M1ctm34zdqAqVf_YUZllWNnn0jgxmygQqVPbLGz122S1_rZwdCe5jI=w1851-h883\" alt=\"femisalud\" style=\"width: 150px; margin-bottom: 20px;\">"
                + "              <h1 style=\"color: #005ea3; font-size: 24px; margin: 0;\">FemiSalud - Código de Verificación</h1>"
                + "            </td>"
                + "          </tr>"
                + "          <tr>"
                + "            <td align=\"center\" style=\"padding: 20px;\">"
                + "              <p style=\"color: #333; font-size: 18px;\">¡Hola, " + name + "!</p>"
                + "              <p style=\"color: #555; font-size: 16px;\">Gracias por solicitar los servicios de FemiSalud. Ingrese el código a continuación para continuar:</p>"
                + "              <div style=\"background-color: #005ea3; color: #ffffff; padding: 15px 20px; font-size: 26px; font-weight: bold; margin: 20px 0; border-radius: 5px;\">" + code + "</div>"
                + "              <p style=\"color: #777; font-size: 14px;\">Por favor, no comparta este código. Si no solicitó este código, ignore este mensaje.</p>"
                + "            </td>"
                + "          </tr>"
                + "          <tr>"
                + "            <td align=\"center\" style=\"padding-top: 30px;\">"
                + "              <p style=\"font-size: 12px; color: #aaa;\">FemiSalud &copy; "+ getYearNow() +". Todos los derechos reservados.</p>"
                + "            </td>"
                + "          </tr>"
                + "        </table>"
                + "      </td>"
                + "    </tr>"
                + "  </table>"
                + "</body>"
                + "</html>";
    }

    private static int getYearNow() {
        return Year.now().getValue();
    }
}