/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.login;

import beans.UserBean;
import dao.Driver;
import factory.DaoFactory;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author abelm
 */
public class Login extends HttpServlet {

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        request.setAttribute("title", "Login");
        request.setAttribute("context", request.getContextPath());
        
        ServletContext sc = request.getServletContext();
        RequestDispatcher rd = sc.getRequestDispatcher("/views/login/login.jsp");
        rd.forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        
        try {
            // Validar datos de ususario
            ArrayList arrParams = new ArrayList();
            arrParams.add(request.getParameter("user"));
            arrParams.add(request.getParameter("password"));
            Driver dao = DaoFactory.createDao();
            dao.exec("sp_login", arrParams);
            
            // Iniciar sesión
            request.getSession().setAttribute("token", "true");
            
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            response.sendError(404);
        }
    }
}
