package com.enrypase.olimpiadi;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Enumeration;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class Login extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        DAO db = new DAO();
        int result = -1;
        String nickname = "";
        
        try {
            nickname = request.getParameter("nick");
            result = db.checkUser(nickname, request.getParameter("pass"));
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        if(result == 0){
            System.out.println("Giusto");
            HttpSession sessione = request.getSession();
            sessione.setAttribute("username", nickname);
            sessione.setAttribute("logged", "true");
            
            // NON FUNZIONA
            //SE HTTP 1.1 - Implementare anche con le altre versioni
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
            //response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
            response.setHeader("Expires", "0"); // Proxies.
                        
            response.sendRedirect("log.jsp");            
        }
        else if(result == 1){
            request.getSession().setAttribute("Error", "Password inserita non valida");
            response.sendRedirect("ErrorPage.jsp");
        }
        else if(result == -1){
            request.getSession().setAttribute("Error", "Username inserito non valido");
            response.sendRedirect("ErrorPage.jsp");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}