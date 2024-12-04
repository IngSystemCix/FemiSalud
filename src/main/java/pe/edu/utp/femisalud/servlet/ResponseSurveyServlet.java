package pe.edu.utp.femisalud.servlet;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import pe.edu.utp.femisalud.dao.PatientDAO;

import java.io.IOException;
import java.util.logging.Logger;

@WebServlet(name = "ResponseSurveyServlet", value = "/response-survey")
public class ResponseSurveyServlet extends HttpServlet {

    private static final Logger LOGGER = Logger.getLogger("pe.edu.utp.femisalud");

    @Inject
    private PatientDAO patientDAO;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String dni = (String) session.getAttribute("USER_DNI");

        JsonArray responses = new JsonArray();

        // Respuesta para la primera pregunta (rating_question1)
        String responseFirstQuestion = req.getParameter("rating_question1");
        if (responseFirstQuestion != null) {
            JsonObject response1 = new JsonObject();
            response1.addProperty("question_id", 1);
            response1.addProperty("response", responseFirstQuestion);
            responses.add(response1);
        }

        // Respuesta para la segunda pregunta (rating_question2)
        String responseSecondQuestion = req.getParameter("rating_question2");
        if (responseSecondQuestion != null) {
            JsonObject response2 = new JsonObject();
            response2.addProperty("question_id", 2);
            response2.addProperty("response", responseSecondQuestion);
            responses.add(response2);
        }

        // Respuesta para la tercera pregunta (rating_question3)
        String responseThirdQuestion = req.getParameter("rating_question3");
        if (responseThirdQuestion != null) {
            JsonObject response3 = new JsonObject();
            response3.addProperty("question_id", 3);
            response3.addProperty("response", responseThirdQuestion);
            responses.add(response3);
        }

        // Respuesta para la cuarta pregunta (checkbox)
        String[] responseFourthQuestion = req.getParameterValues("question4");
        if (responseFourthQuestion != null) {
            JsonObject response4 = new JsonObject();
            response4.addProperty("question_id", 4);

            JsonArray checkboxResponses = new JsonArray();
            for (String response : responseFourthQuestion) {
                checkboxResponses.add(response);
            }

            // Respuesta adicional (campo "otros" para la pregunta 4)
            String otherResponse = req.getParameter("response-question4");
            if (otherResponse != null && !otherResponse.isEmpty()) {
                checkboxResponses.add(otherResponse);
            }

            // Añadir el array de respuestas al objeto de la pregunta
            response4.add("response", checkboxResponses);

            // Agregar la respuesta de la pregunta 4 al array de respuestas
            responses.add(response4);
        }

        LOGGER.info("Respuestas: " + responses);

        // Llamada al DAO para guardar las respuestas
        patientDAO.responseSurvey(dni, responses);

        // Redirigir al home después de guardar las respuestas
        resp.sendRedirect(req.getContextPath() + "/u/home");
    }
}
