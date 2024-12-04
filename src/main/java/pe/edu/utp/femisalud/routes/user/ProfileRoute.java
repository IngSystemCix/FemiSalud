package pe.edu.utp.femisalud.routes.user;

import com.google.common.base.Preconditions;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import pe.edu.utp.femisalud.dao.UserDAO;
import pe.edu.utp.femisalud.security.AuthUserSecurity;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProfileRoute", value = "/u/profile")
public class ProfileRoute extends HttpServlet {

    @Inject
    private UserDAO userDAO;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (AuthUserSecurity.authUserPatient(req, resp)) return;

        HttpSession session = req.getSession(false);
        String dni = (String) session.getAttribute("USER_DNI");
        Preconditions.checkNotNull(dni, "dni cannot be null");
        List<String> data = userDAO.getData(dni);
        Preconditions.checkNotNull(data, "data cannot be null");
        req.setAttribute("PROFILE_PATIENT", data);
        req.getRequestDispatcher("/private/profile.jsp").forward(req, resp);
    }
}