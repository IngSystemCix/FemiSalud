package pe.edu.utp.femisalud.service;

import io.github.cdimascio.dotenv.Dotenv;
import jakarta.ejb.Stateless;
import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;

@Stateless
public class EmailService {
    private static final Dotenv dotenv = Dotenv.configure().load();

    public void sendEmail(String recipientEmail, String name) throws EmailException {
        HtmlEmail email = new HtmlEmail();
        email.setHostName("smtp.gmail.com");
        email.setSmtpPort(587);
        email.setStartTLSEnabled(true);
        email.setAuthenticator(new DefaultAuthenticator(dotenv.get("EMAIL"), dotenv.get("APP_CODE")));
        email.setContentType("text/html; charset=UTF-8");
        email.setCharset("UTF-8");
        email.setFrom(dotenv.get("EMAIL"));
        email.addTo(recipientEmail);
        email.setSubject("Código de verificación");

        String htmlMessage = createHtmlMessage(name, verificationCode());

        email.setMsg(htmlMessage);
        email.send();
    }

    private String createHtmlMessage(String name, String code) {
        return "<!DOCTYPE html>"
                + "<html lang=\"es\">"
                + "<head>"
                + "  <meta charset=\"UTF-8\">"
                + "  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">"
                + "  <title>femisalud</title>"
                + "</head>"
                + "<body style=\"margin: 0; padding: 0;\">"
                + "  <table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"background-color: #cee8f9; border-radius: 10px;\">"
                + "    <tr>"
                + "      <td align=\"center\">"
                + "        <img src=\"https://lh3.googleusercontent.com/fife/ALs6j_EqS23V2rn87GufFenJzGClL-WY2nbB75tNjm07ZSCdWSUx3onp23si3V-efDqxiX9RC4a-ZEhPsbrSOEitz8io1WqmfOz8hzvwqjGT7G7LnBViO7zc3fGLBDg9W39gdvwh6VXBRNUxKIC_ZIis_ld5TPzNda1FE1uJU4YtRE0gFolgfI_gjQqwlY1mKnpgH9TEZrl3Kx4orEmOWNXdBGAWEDBiZ08llLJa31ToGx-DKNK_4tWgtCssgxe7ECWQtUBHPrrW8pE9QKoZShZ7Syyms43KG77PFQCX1-sEXnC4ypNZbDD8U8LADybzvpZIonZvDinwpJtXgva51TsWF8nZmKT5sxiJMha04LMCFO6-6l95cA-mbM38gX8L-3STToKAAiz0oTu_xfHMSykA_VPX1EW568Uh0zWbBwocZ38hGfvXSnj8dzz0Lr9CTr9lIM4KrouqCx-UwJ8BRH28YEATWJGprGoz2F9U_LXbR2OFo9E_ib9PvZQVHPtk5SSM6URxq0ESm-5ytP1GE6wpf5iP1z_E0ot7T6BNjOl0ty1d6WTXKfKCN2TbuySjfbeC9f5w1l0CkIpreJSQu8zqo1nYgTzJpZZ8jHvP_0AI2rkWKrW0WfzYHkdz8YpN-IffdzNwW6gj7TkEBF8nbfk_6Fs6kO8hxujPecEUAO4B59vrnXnLnIpAINvvl0OFiWGiqz7yABM__vkkGhLnljTPlec6RJokD4nGAEpJizFOLZBvwDCGT4G734VJ_li5AhbwHpOt5GeH6B8qfFAdAu7p5YwauN17eit0D5iqk-sqXc1QW0NBWLxtVQr6etaLBULM9N6lbk7IgITFtMnGhML5m1b2U9T9ElpOO45FUHUWF-aqs2W4mj48m-qK-azO9bRGrReJg_0BP9nMxJc3rVnMj5mxqLln5mus3AZdDsiNZvLrx4g_u2RnRW5J_R0SAetisnSzMEgH1IGcRmzecpYd_mc_f0xP3CGdq7jpp_6TT9BfLpnN_QRHZJBT2_BgMb8Wi8hVYd6cm1tCycx2n59FTLwk58bt5v3aRpVgWCiegJJB8p27RP80qkCDVENYuJOKeLk-wIFkfQFc2A1IY9RYT7AZxvwc1OUigV-WrCZego0zG9L1C2V8RlNUf_W3RJkVkBzheefJAMkS7FunpLx3yePRw-LhpFMaW2Xk8bZBXNLRoUiI9EsjDqzBw-EskrlyFIu5zl9si8rt5ESD0gTf7cUBVkX9qCHTxDjGP35iVAwlvdsKJyO9M3wtWq52lHiO0mY9pV3KJcl2Icay-xyDHxL0ElVFdXq0_NgvmDdQqCwHfPjoV_c-dW5xebIeAaZ7YS2gWXdl4YHiEtjnDaqx2KrgGBUKjILz_sbaeIfxsoOAHmNkBqMN93WdArbDDyYamIPqrcBD7sJQ7vBmPCGSVSwc5X4_K4cl7Q2EMiwzuhDQYnoYlajeNN4UtVN2Ik-SkET6HoLEabR0OMyI66t_x1owDxsqA1gFKHXSYt_ivPKMFlFhB95L1V7qVfQqLvsYKpJpkVJNDIB7PlqJYJY0rryAPQ4nQJhFtfk9Bz51BDWucOyb5yIe3U81kspyoJtE3M1ctm34zdqAqVf_YUZllWNnn0jgxmygQqVPbLGz122S1_rZwdCe5jI=w1851-h883\" alt=\"femisalud\" style=\"width: 30%; border-radius: 10px;\">"
                + "        <h1 style=\"color: #006eb6; font-family: Arial, sans-serif;\">Femi Salud: Código de verificación único</h1>"
                + "        <h2 style=\"color: #006eb6; font-family: Arial, sans-serif;\">¡Hola!, " + name + "</h2>"
                + "        <p style=\"font-family: Arial, sans-serif;\">Recibió este correo porque se realizó una solicitud de un código de un solo uso.</p>"
                + "        <p style=\"font-family: Arial, sans-serif;\">Por favor ingrese el siguiente código de verificación:</p>"
                + "        <div style=\"background-color: #006eb6; padding: 10px; border-radius: 5px; font-weight: bold; color: #fff; font-size: 24px;\">" + code + "</div>"
                + "        <p style=\"font-family: Arial, sans-serif;\">Por favor, no compartas este código con nadie.</p>"
                + "        <p style=\"font-family: Arial, sans-serif;\">Si cree que recibió este correo por error, comuníquese con el administrador del sistema.</p>"
                + "        <img src=\"https://n9.cl/xmckd\" alt=\"footer\" style=\"width: 100%; border-radius: 10px;\">"
                + "      </td>"
                + "    </tr>"
                + "  </table>"
                + "</body>"
                + "</html>";
    }

    private String verificationCode() {
        return String.valueOf((int) (Math.random() * 900000) + 100000);
    }
}
