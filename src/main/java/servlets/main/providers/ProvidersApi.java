/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.main.providers;

import beans.ProviderBean;
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
public class ProvidersApi extends HttpServlet {
    
    ProviderBean provider;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getQueryString().equals("all")) this.doGetAll(request, response);
        else {
            response.setContentType("application/json");
            
            try {
                // Cargar datos de la compra
                Driver dao = DaoFactory.createDao();
                ArrayList data = new ArrayList();
                data.add(request.getParameter("id"));
                ArrayList table = dao.getData("sp_providers_get", data);
                provider = new ProviderBean((LinkedHashMap) table.get(0));

                // Procesar respuesta JSON
                try (PrintWriter out = response.getWriter()) {
                    response.setStatus(200);
                    out.print(new Gson().toJson(provider));
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
            // Cargar datos de todas las compras
            Driver dao = DaoFactory.createDao();
            ArrayList table = dao.getData("sp_providers_getall");
            for (Object row : table) {
                provider = new ProviderBean((LinkedHashMap) row);
                resolve.add(provider);
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
        provider = new Gson().fromJson(request.getParameter("provider"), ProviderBean.class);
        
        try {
            // Insertar datos del proveedor
            Driver dao = DaoFactory.createDao();
            ArrayList data = new ArrayList();
            data.add(provider.getName());
            data.add(provider.getChannel());
            data.add(provider.getWeb());
            data.add(provider.getPhone());
            data.add(provider.getEmail());
            data.add(provider.getDeals());
            data.add(provider.getScore());
            data.add(provider.getBlacklist());
            data.add(provider.getNotes());
            data.add(provider.getState());
            data.add(request.getSession().getAttribute("user"));
            data.add(request.getSession().getAttribute("host"));
            dao.exec("sp_providers_insert", data);

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
        provider = new Gson().fromJson(Request.getParameter(request, "provider"), ProviderBean.class);
        
        try {
            // Actualizar datos del proveedor
            Driver dao = DaoFactory.createDao();
            ArrayList data = new ArrayList();
            data.add(provider.getId());
            data.add(provider.getName());
            data.add(provider.getChannel());
            data.add(provider.getWeb());
            data.add(provider.getPhone());
            data.add(provider.getEmail());
            data.add(provider.getDeals());
            data.add(provider.getScore());
            data.add(provider.getBlacklist());
            data.add(provider.getNotes());
            data.add(provider.getState());
            data.add(request.getSession().getAttribute("user"));
            data.add(request.getSession().getAttribute("host"));
            dao.exec("sp_providers_update", data);

            // Procesar estado http
            response.setStatus(200);
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            response.sendError(404);
        }
    }

}
