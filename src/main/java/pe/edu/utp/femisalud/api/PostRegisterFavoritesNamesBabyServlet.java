package pe.edu.utp.femisalud.api;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import pe.edu.utp.femisalud.dao.PatientDAO;

import java.io.IOException;
import java.lang.reflect.Type;
import java.util.Map;

@WebServlet(name = "PostRegisterFavoritesNamesBabyServlet", value = "/api/register-favorites-names-baby")
public class PostRegisterFavoritesNamesBabyServlet extends HttpServlet {

    @Inject
    private PatientDAO patientDAO;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Leer el cuerpo de la solicitud como JSON
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = req.getReader().readLine()) != null) {
            sb.append(line);
        }

        // Convertir el cuerpo a JSON
        String json = sb.toString();
        Gson gson = new Gson();

        // Usar TypeToken para definir correctamente el tipo genérico
        Type type = new TypeToken<Map<String, String>>(){}.getType();
        Map<String, String> data = gson.fromJson(json, type);  // Ahora se especifica Map<String, String>

        String name = data.get("name");  // Obtener el nombre del JSON

        HttpSession session = req.getSession();
        String dni = (String) session.getAttribute("USER_DNI");

        if (name != null && !name.isEmpty()) {
            patientDAO.registerFavoritesNamesBaby(dni, name);  // Guardar el nombre en la base de datos
            resp.setStatus(HttpServletResponse.SC_OK);
            resp.getWriter().write("Nombre guardado exitosamente");
        } else {
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            resp.getWriter().write("Nombre no válido");
        }
    }
}
