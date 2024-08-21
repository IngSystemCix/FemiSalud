package pe.edu.utp.femisalud.config;

import io.github.cdimascio.dotenv.Dotenv;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Named;

@Named
@ApplicationScoped
public class Config {
    private final Dotenv dotenv;

    public Config() {
        dotenv = Dotenv.configure().ignoreIfMissing().load();
    }

    public String get(String key) {
        return dotenv.get(key);
    }

}
