package pe.edu.utp.femisalud.config;

import io.github.cdimascio.dotenv.Dotenv;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Named;

import java.io.Serializable;

@Named
@ApplicationScoped
public class Config implements Serializable {
    private final Dotenv dotenv;

    public Config() {
        dotenv = Dotenv.configure().ignoreIfMissing().load();
    }

    public String get(String key) {
        return dotenv.get(key);
    }

}
