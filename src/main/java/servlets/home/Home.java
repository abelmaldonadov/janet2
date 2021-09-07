/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.home;

import beans.AreaBean;
import beans.InfoBean;
import beans.UserBean;
import com.google.gson.Gson;
import dao.Driver;
import factory.DaoFactory;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
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
public class Home extends HttpServlet {
    
    UserBean user;
    InfoBean info;
    AreaBean area;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        request.setAttribute("title", "Purchases");
        request.setAttribute("context", request.getContextPath());
        
        ServletContext sc = request.getServletContext();
        RequestDispatcher rd = sc.getRequestDispatcher("/views/home/home.jsp");
        rd.forward(request, response);
    }

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
        try {
            Driver dao = DaoFactory.createDao();
            
            // Obtener datos de usuario
            ArrayList arrParams = new ArrayList();
            arrParams.add("AMALDONADO");
            ArrayList tableUsers = dao.getData("sp_users_get", arrParams);
            user = new UserBean((LinkedHashMap) tableUsers.get(0));
            request.setAttribute("user", user);
            
            // Obtener áreas disponibles
            ArrayList tableAreas = dao.getData("sp_areas_getall");
            ArrayList arrAreas = new ArrayList();
            for (Object row : tableAreas) {
                area = new AreaBean((LinkedHashMap) row);
                arrAreas.add(area);
            }
            request.setAttribute("arrAreas", arrAreas);
            
            // Resolver
            processRequest(request, response);
            
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            response.sendError(404);
        }
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
        LinkedHashMap resolve = new LinkedHashMap();
        
        try {
            // Cargar datos de ususario
            ArrayList arrParams = new ArrayList();
            arrParams.add("AMALDONADO");
            Driver dao = DaoFactory.createDao();
            ArrayList table = dao.getData("sp_users_get", arrParams);
            user = new UserBean((LinkedHashMap) table.get(0));
            resolve.put("user", user);
            
            // Cargar datos de apoyo
            info = new InfoBean(dao.getData("sp_aux_getall"));
            resolve.put("info", info);
            
            // Procesar respuesta JSON
            try (PrintWriter out = response.getWriter()) {
                response.setStatus(200);
                out.print(new Gson().toJson(resolve));
            }
            
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            response.sendError(404);
        }
    }

}
