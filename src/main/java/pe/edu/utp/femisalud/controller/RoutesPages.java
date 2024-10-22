package pe.edu.utp.femisalud.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class RoutesPages extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Obtener el path de la solicitud
        String path = req.getServletPath();

        switch (path) {
            case "/":
            case "/login":
                req.getRequestDispatcher("/index.jsp").forward(req, resp);
                break;
            case "/home":
                req.getRequestDispatcher("/home.jsp").forward(req, resp);
                break;
            case "/profile":
                req.getRequestDispatcher("/editProfile.jsp").forward(req, resp);
                break;
            case "/ambassador":
                req.getRequestDispatcher("/ambassadorsForm.jsp").forward(req, resp);
                break;
            case "/message":
                req.getRequestDispatcher("/message.jsp").forward(req, resp);
                break;
            case "/ultrasound":
                req.getRequestDispatcher("/ultrasound.jsp").forward(req, resp);
                break;
            case "/baby":
                req.getRequestDispatcher("/baby.jsp").forward(req, resp);
                break;
            case "/attention_form":
                req.getRequestDispatcher("/attentionForm.jsp").forward(req, resp);
                break;
            default:
                req.getRequestDispatcher("/404.jsp").forward(req, resp);
                break;
        }
    }
}
