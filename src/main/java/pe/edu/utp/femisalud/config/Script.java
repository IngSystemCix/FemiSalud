package pe.edu.utp.femisalud.config;

import jakarta.enterprise.context.ApplicationScoped;
import jakarta.enterprise.inject.Produces;
import jakarta.inject.Named;

@Named
@ApplicationScoped
public class Script {

    @Produces
    public String getFlowbite() {
        return "node_modules/flowbite/dist/flowbite.js";
    }
}
