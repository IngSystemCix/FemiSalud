package pe.edu.utp.femisalud.api;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import pe.edu.utp.femisalud.dao.PatientDAO;

import java.io.BufferedReader;
import java.io.IOException;

@WebServlet(name = "DeleteFavoriteNameBabyServlet", value = "/api/delete-favorites-names-baby")
public class DeleteFavoriteNameBabyServlet extends HttpServlet {

    @Inject
    private PatientDAO patientDAO;

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json");
        HttpSession session = req.getSession(false);

        String dni = (String) session.getAttribute("USER_DNI");

        // Parsear el cuerpo JSON para obtener el nombre
        try (BufferedReader reader = req.getReader()) {
            Gson gson = new Gson();
            JsonObject jsonBody = gson.fromJson(reader, JsonObject.class);
            String name = jsonBody.get("name").getAsString();

            patientDAO.deleteFavoriteNameBaby(name, dni);
            resp.setStatus(HttpServletResponse.SC_OK);
            resp.getWriter().write("{\"success\": true, \"message\": \"Nombre eliminado de favoritos\"}");
        } catch (Exception e) {
            resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            resp.getWriter().write("{\"success\": false, \"message\": \"Error al eliminar el nombre\"}");
        }
    }
}
