/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.main.inventory;

import beans.InventoryBean;
import com.google.gson.Gson;
import dao.Driver;
import factory.DaoFactory;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import utils.Request;

/**
 *
 * @author abelm
 */
public class InventoryApi extends HttpServlet {
    
    InventoryBean inventory;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getQueryString().equals("all")) this.doGetAll(request, response);
        else {
            response.setContentType("application/json");
            
            try {
                // Cargar datos del inventario
                Driver dao = DaoFactory.createDao();
                ArrayList data = new ArrayList();
                data.add(request.getParameter("id"));
                ArrayList table = dao.getData("sp_inventory_get", data);
                inventory = new InventoryBean((LinkedHashMap) table.get(0));

                // Procesar respuesta JSON
                try (PrintWriter out = response.getWriter()) {
                    response.setStatus(200);
                    out.print(new Gson().toJson(inventory));
                }
            } catch (SQLException ex) {
                System.out.println(ex.getMessage());
                response.sendError(404);
            }
        }
    }
    
    protected void doGetAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        ArrayList resolve = new ArrayList();
            
        try {
            // Cargar datos de todos los inventarios
            Driver dao = DaoFactory.createDao();
            ArrayList table = dao.getData("sp_inventory_getall");
            for (Object row : table) {
                inventory = new InventoryBean((LinkedHashMap) row);
                resolve.add(inventory);
            }
            
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
    
    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        inventory = new Gson().fromJson(Request.getParameter(request, "inventory"), InventoryBean.class);
        
        try {
            // Actualizar datos de la venta
            Driver dao = DaoFactory.createDao();
            ArrayList data = new ArrayList();
            data.add(inventory.getId());
            data.add(inventory.getNotes());
            data.add(inventory.getState());
            data.add(request.getSession().getAttribute("user"));
            data.add(request.getSession().getAttribute("host"));
            dao.exec("sp_inventory_update", data);

            // Procesar estado http
            response.setStatus(200);
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            response.sendError(404);
        }
    }
    
}
