package pe.edu.utp.femisalud.util;

import io.github.cdimascio.dotenv.Dotenv;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;

public class EmailService {
    private static final Dotenv dotenv = Dotenv.configure().load();

    public void sendEmail(String recipientEmail) throws EmailException {
        HtmlEmail email = new HtmlEmail();
        email.setHostName("smtp.googlemail.com");
        email.setSmtpPort(465);
        email.setAuthentication(dotenv.get("EMAIL"), dotenv.get("APP_CODE"));
        email.setSSLOnConnect(true);

        email.setFrom(dotenv.get("EMAIL"));
        email.addTo(recipientEmail);
        email.setSubject("Código de verificación");

        String htmlMessage = "<!DOCTYPE html>"
                + "<html lang=\"en\">"
                + "<head>"
                + "  <meta charset=\"UTF-8\">"
                + "  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">"
                + "  <title>femisalud</title>"
                + "  <style>"
                + "    .card { background-color: #cee8f9; border-radius: 1rem; padding: 1rem; display: flex; flex-direction: column; justify-content: center; align-items: center; gap: 1rem; }"
                + "    .femisalud_logo { width: 30%; }"
                + "    .container_code { width: 100%; display: flex; justify-content: center; align-items: center; }"
                + "    .welcome, .title_message { font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif; color: #006eb6; }"
                + "    .code { width: fit-content; background-color: #006eb6; padding: 1rem; border-radius: 1rem; font-weight: 900; color: #fff; font-size: 2em; font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif; letter-spacing: .3em; }"
                + "    .container_message { width: 100%; }"
                + "    p { font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif; }"
                + "  </style>"
                + "</head>"
                + "<body>"
                + "  <div class=\"card\">"
                + "    <img src=\"https://lh3.googleusercontent.com/fife/ALs6j_EqS23V2rn87GufFenJzGClL-WY2nbB75tNjm07ZSCdWSUx3onp23si3V-efDqxiX9RC4a-ZEhPsbrSOEitz8io1WqmfOz8hzvwqjGT7G7LnBViO7zc3fGLBDg9W39gdvwh6VXBRNUxKIC_ZIis_ld5TPzNda1FE1uJU4YtRE0gFolgfI_gjQqwlY1mKnpgH9TEZrl3Kx4orEmOWNXdBGAWEDBiZ08llLJa31ToGx-DKNK_4tWgtCssgxe7ECWQtUBHPrrW8pE9QKoZShZ7Syyms43KG77PFQCX1-sEXnC4ypNZbDD8U8LADybzvpZIonZvDinwpJtXgva51TsWF8nZmKT5sxiJMha04LMCFO6-6l95cA-mbM38gX8L-3STToKAAiz0oTu_xfHMSykA_VPX1EW568Uh0zWbBwocZ38hGfvXSnj8dzz0Lr9CTr9lIM4KrouqCx-UwJ8BRH28YEATWJGprGoz2F9U_LXbR2OFo9E_ib9PvZQVHPtk5SSM6URxq0ESm-5ytP1GE6wpf5iP1z_E0ot7T6BNjOl0ty1d6WTXKfKCN2TbuySjfbeC9f5w1l0CkIpreJSQu8zqo1nYgTzJpZZ8jHvP_0AI2rkWKrW0WfzYHkdz8YpN-IffdzNwW6gj7TkEBF8nbfk_6Fs6kO8hxujPecEUAO4B59vrnXnLnIpAINvvl0OFiWGiqz7yABM__vkkGhLnljTPlec6RJokD4nGAEpJizFOLZBvwDCGT4G734VJ_li5AhbwHpOt5GeH6B8qfFAdAu7p5YwauN17eit0D5iqk-sqXc1QW0NBWLxtVQr6etaLBULM9N6lbk7IgITFtMnGhML5m1b2U9T9ElpOO45FUHUWF-aqs2W4mj48m-qK-azO9bRGrReJg_0BP9nMxJc3rVnMj5mxqLln5mus3AZdDsiNZvLrx4g_u2RnRW5J_R0SAetisnSzMEgH1IGcRmzecpYd_mc_f0xP3CGdq7jpp_6TT9BfLpnN_QRHZJBT2_BgMb8Wi8hVYd6cm1tCycx2n59FTLwk58bt5v3aRpVgWCiegJJB8p27RP80qkCDVENYuJOKeLk-wIFkfQFc2A1IY9RYT7AZxvwc1OUigV-WrCZego0zG9L1C2V8RlNUf_W3RJkVkBzheefJAMkS7FunpLx3yePRw-LhpFMaW2Xk8bZBXNLRoUiI9EsjDqzBw-EskrlyFIu5zl9si8rt5ESD0gTf7cUBVkX9qCHTxDjGP35iVAwlvdsKJyO9M3wtWq52lHiO0mY9pV3KJcl2Icay-xyDHxL0ElVFdXq0_NgvmDdQqCwHfPjoV_c-dW5xebIeAaZ7YS2gWXdl4YHiEtjnDaqx2KrgGBUKjILz_sbaeIfxsoOAHmNkBqMN93WdArbDDyYamIPqrcBD7sJQ7vBmPCGSVSwc5X4_K4cl7Q2EMiwzuhDQYnoYlajeNN4UtVN2Ik-SkET6HoLEabR0OMyI66t_x1owDxsqA1gFKHXSYt_ivPKMFlFhB95L1V7qVfQqLvsYKpJpkVJNDIB7PlqJYJY0rryAPQ4nQJhFtfk9Bz51BDWucOyb5yIe3U81kspyoJtE3M1ctm34zdqAqVf_YUZllWNnn0jgxmygQqVPbLGz122S1_rZwdCe5jI=w1851-h883\" alt=\"femisalud\" class=\"femisalud_logo\">"
                + "    <h1 class=\"title_message\">Femi Salud: Código de verificación único</h1>"
                + "    <div class=\"container_message\">"
                + "      <h2 class=\"welcome\">¡Hola!, Briggitte</h2>"
                + "      <p>Recibió este correo electronico porque se realizó una solicitud de un código de un solo uso que puede usarse para la autentificación</p>"
                + "      <p>Por favor ingrese el siguiente código de verificación:</p>"
                + "    </div>"
                + "    <div class=\"container_code\">"
                + "      <div class=\"code\">" + verificationCode() + "</div>"
                + "    </div>"
                + "    <div class=\"container_message\">"
                + "      <p>Por favor, no compartas este código con nadie.</p>"
                + "      <p>Si cree que recibió este correo por error, comuníquese con el administrador del sistema</p>"
                + "    </div>"
                + "    <img src=\"https://lh3.googleusercontent.com/fife/ALs6j_E4F2VoqlpAVhRb37fuctlXJCUwclh0-GmekdXVlQ_Ol1rTOZGsjEa9ts1IksH4i3jyrCAEkJd_C8LRbJrG9AS4E_UXgWX6BIbhxHHiNJCDgOPbYYm3b-4p0BGKjVN1GvMrCAMEr_86uq86eTWg7VocwFwMpjnPuWvMdsS9A5JQbMc5CdfFQqEUwbpZl7LvFBcHWUMqXA8uTks8AXTwt4jrlIXOoRoPoBuSBHQEbEZVjzj0uNB8cUGaIpScVYcw_hnDOe42rT3ck4W8c2kgveyIoZxgeSu1BGrhTQ0Na87mXKtSGzfzZIAAiPXEqul8JmuTe4caprqdJ5AWOWliom5xNRTbIUw7isosQrDhZvPIxOC9TDyCjVKpKY5Edc6cKz-rSGNV1Uiutm_xAz4NnF4j_hpC6oyi51WgFbgRjU_71m14P51_cioANfFdFNbugOiNKbRBcodSYq3irjipu_JNbHz97Q8Yu2FKozIDQJnmaQMUe-tuv-v8HrUUAWBXGmGY18sh6xg6dPB4jsczbHXD-8ELA78NVavVUCAJFOyCznQoAPV58EK-WafeMcTIFq2IVejlGDG5PppVwOOLoB6RQgOxm9Odv7PYy5wQ_fwXQ0bhGSZ42ZswKvd_WsmDNA_DoC8awflLv1mR8erlSSz7airM7DDjgvIDuDUDX0NlLTI67y0WLLWu6LlVIYs-c4vcT-qUeVT0kkzzbtiJh3sWxWRjGZWNlJWR5Ec_FaGdEQsOo7_M3C0HWJ73n9gpX1qfrGjyEdT61Lp31mWT30r2c750QZpNT0tIwK2aHTPdTiCZ5becN1Ek0wMnPunzVqrOJIOa_j5V2YY1AP0k45bM2KXJ8OKhgsDZEcU-Nyi0rLtEv4uK4sehb4IKS0j1S95sTExrJMLAdBtEMVK5BNW9CqMMhP3nQxU_5F9h7dKtuAzxLLBfBfQePCfRgyHvDc9n8YtgFNPBs076M2qaUlT4iUaVhJC84CAlmUASAwyMvs9IiJS3UGQfsGKB76HeLDLqkfieydJcZnlyMypYkA6El5aFweVW0DoVU0qAe3kp7B6k9-XMTNvwpDIDfPML1-aiqvPOrYoTkztysOFUadXL4xgPInxOsAArlzln1ilp_uHhZsOZHnO52eRsgHQEfxEaiW4LMc0Wd38GZy1r6YsSsxhnYYrkvpcpfMtpDxQOTP48s8qQ79pPYIS4-7FMW-tLWfNxAk09HrJ_InWhNoqfcM2-UEHXJxuFijjD5GEEaBV765q_T8vdxalHKdcC-7LZTbvCxXkiV1s5HwLrY1F0BiBdOhj7rOuELzgoyaeEkTJxfi6ZsI7yWihXYLGXBj2ItKGNJkZbmD7E2lMJ2Aw8qI3nqH___xh7HvNJ74upsegxHd34dubvoqoCN1eN3hMLGA8bDw_1Fcd42rQ4vvYoyR0ENE3wnxUYJiFf74EvW2dVVUFBDhONy6K5gFAQOESr5-OCpzFJLXvAHffNr7lav5wDBYIX6HYi0FUQeFT3Zxh3JzdwdEV23WgisGIkk5gsvZzt33xBBwt2c6tJ1gWbwpHA1o61L4MtoiR9SAnNDRwJzbsts6IkK1hg6AF9vBQH2F9lZLOemPXtAqCrgFOYjQIbFhUep_ilJ3m5HrjH5FBKCKAaaw=w1851-h883\" alt=\"footer\">"
                + "  </div>"
                + "</body>"
                + "</html>";

        email.setHtmlMsg(htmlMessage);
        email.send();
    }

    private String verificationCode() {
        return String.valueOf((int) (Math.random() * 900000) + 100000);
    }
}
