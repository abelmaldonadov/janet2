/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.main.customers;

import beans.CustomerBean;
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
public class CustomersApi extends HttpServlet {
    
    CustomerBean customer;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getQueryString().equals("all")) this.doGetAll(request, response);
        else {
            response.setContentType("application/json");
            
            try {
                // Cargar datos del cliente
                Driver dao = DaoFactory.createDao();
                ArrayList data = new ArrayList();
                data.add(request.getParameter("id"));
                ArrayList table = dao.getData("sp_customers_get", data);
                customer = new CustomerBean((LinkedHashMap) table.get(0));

                // Procesar respuesta JSON
                try (PrintWriter out = response.getWriter()) {
                    response.setStatus(200);
                    out.print(new Gson().toJson(customer));
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
            // Cargar datos de todos los clientes
            Driver dao = DaoFactory.createDao();
            ArrayList table = dao.getData("sp_customers_getall");
            for (Object row : table) {
                customer = new CustomerBean((LinkedHashMap) row);
                resolve.add(customer);
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        customer = new Gson().fromJson(request.getParameter("customer"), CustomerBean.class);
        
        try {
            // Actualizar datos del cliente
            Driver dao = DaoFactory.createDao();
            ArrayList data = new ArrayList();
            data.add(customer.getName());
            data.add(customer.getChannel());
            data.add(customer.getPhone());
            data.add(customer.getEmail());
            data.add(customer.getAddr());
            data.add(customer.getDeals());
            data.add(customer.getScore());
            data.add(customer.getBlacklist());
            data.add(customer.getNotes());
            data.add(customer.getState());
            data.add(request.getSession().getAttribute("user"));
            data.add(request.getSession().getAttribute("host"));
            dao.exec("sp_customers_insert", data);

            // Procesar estado http
            response.setStatus(201);
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            response.sendError(404);
        }
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        customer = new Gson().fromJson(Request.getParameter(request, "customer"), CustomerBean.class);
        
        try {
            // Actualizar datos del cliente
            Driver dao = DaoFactory.createDao();
            ArrayList data = new ArrayList();
            data.add(customer.getId());
            data.add(customer.getName());
            data.add(customer.getChannel());
            data.add(customer.getPhone());
            data.add(customer.getEmail());
            data.add(customer.getAddr());
            data.add(customer.getDeals());
            data.add(customer.getScore());
            data.add(customer.getBlacklist());
            data.add(customer.getNotes());
            data.add(customer.getState());
            data.add(request.getSession().getAttribute("user"));
            data.add(request.getSession().getAttribute("host"));
            dao.exec("sp_customers_update", data);

            // Procesar estado http
            response.setStatus(200);
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            response.sendError(404);
        }
    }
}
