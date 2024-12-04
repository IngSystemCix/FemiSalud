package pe.edu.utp.femisalud.servlet;

import com.google.common.base.Preconditions;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import pe.edu.utp.femisalud.config.RedirectPageByRole;
import pe.edu.utp.femisalud.dao.UserDAO;

import java.io.IOException;

@WebServlet(name = "UpdateDataUserServlet", value = "/update-data-user")
public class UpdateDataUserServlet extends HttpServlet {
    @Inject
    private UserDAO userDAO;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        String dni = (String) session.getAttribute("USER_DNI");
        String email = req.getParameter("email");
        String phoneNumber = req.getParameter("tel");
        Preconditions.checkNotNull(dni, "dni cannot be null");
        Preconditions.checkNotNull(email, "email cannot be null");
        Preconditions.checkNotNull(phoneNumber, "phoneNumber cannot be null");
        userDAO.updateData(dni, email, phoneNumber);
        RedirectPageByRole.redirectByRole((String) session.getAttribute("USER_ROLE"), req, resp);
    }
}
