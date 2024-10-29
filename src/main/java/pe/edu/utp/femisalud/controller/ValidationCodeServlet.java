package pe.edu.utp.femisalud.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/validate_code")
public class ValidationCodeServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String dni = req.getParameter("dni");
        String code = req.getParameter("code-1") + req.getParameter("code-2") + req.getParameter("code-3") + req.getParameter("code-4") + req.getParameter("code-5") + req.getParameter("code-6");
        String storedCode = (String) req.getSession().getAttribute("verificationCode");
        if (code.equals(storedCode)) {
            HttpSession session = req.getSession();
            session.setAttribute("dni", dni);
            req.getSession().removeAttribute("verificationCode");
            resp.sendRedirect("/femisalud/home");
        } else {
            resp.sendRedirect("/femisalud/login");
        }
    }
}
