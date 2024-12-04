package pe.edu.utp.femisalud.routes.admin;

import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import pe.edu.utp.femisalud.DTO.UltrasoundStatisticsDTO;
import pe.edu.utp.femisalud.dao.AdminDAO;
import pe.edu.utp.femisalud.security.AuthUserSecurity;

import java.io.IOException;
import java.util.List;
import java.util.logging.Logger;

@WebServlet(name = "HomeRouteAdmin", value = "/admin/home")
public class HomeRoute extends HttpServlet {

    private static final Logger LOGGER = Logger.getLogger("pe.edu.utp.femisalud");

    @Inject
    private AdminDAO adminDAO;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (AuthUserSecurity.authUserAdmin(req, resp)) return;

        HttpSession session = req.getSession(false);
        session.removeAttribute("errorMessages");
        session.removeAttribute("errorMessagesCallCenter");

        UltrasoundStatisticsDTO ultrasoundStatistics = adminDAO.getUltrasoundStatistics();
        Long totalConsults = adminDAO.getTotalConsults();

        req.setAttribute("totalViews", ultrasoundStatistics.getTotalViews());
        req.setAttribute("totalNoViews", ultrasoundStatistics.getTotalNoViews());
        req.setAttribute("totalDownloads", ultrasoundStatistics.getTotalDownloads());

        req.setAttribute("totalConsults", totalConsults);

        req.getRequestDispatcher("/private/admin/home.jsp").forward(req, resp);
    }
}
