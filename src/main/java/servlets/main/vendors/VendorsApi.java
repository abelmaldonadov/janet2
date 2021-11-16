/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.main.vendors;

import beans.VendorBean;
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
public class VendorsApi extends HttpServlet {
    
    VendorBean vendor;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getQueryString().equals("all")) this.doGetAll(request, response);
        else {
            response.setContentType("application/json");
            
            try {
                // Cargar datos del vendedor
                Driver dao = DaoFactory.createDao();
                ArrayList data = new ArrayList();
                data.add(request.getParameter("id"));
                ArrayList table = dao.getData("sp_vendors_get", data);
                vendor = new VendorBean((LinkedHashMap) table.get(0));

                // Procesar respuesta JSON
                try (PrintWriter out = response.getWriter()) {
                    response.setStatus(200);
                    out.print(new Gson().toJson(vendor));
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
            // Cargar datos de todos los vendedores
            Driver dao = DaoFactory.createDao();
            ArrayList table = dao.getData("sp_vendors_getall");
            for (Object row : table) {
                vendor = new VendorBean((LinkedHashMap) row);
                resolve.add(vendor);
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
        vendor = new Gson().fromJson(request.getParameter("vendor"), VendorBean.class);
        
        try {
            // Actualizar datos del vendedor
            Driver dao = DaoFactory.createDao();
            ArrayList data = new ArrayList();
            data.add(vendor.getName());
            data.add(vendor.getPhone());
            data.add(vendor.getEmail());
            data.add(vendor.getAddr());
            data.add(vendor.getDeals());
            data.add(vendor.getScore());
            data.add(vendor.getMerit());
            data.add(vendor.getNotes());
            data.add(vendor.getState());
            data.add(request.getSession().getAttribute("user"));
            data.add(request.getSession().getAttribute("host"));
            dao.exec("sp_vendors_insert", data);

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
        vendor = new Gson().fromJson(Request.getParameter(request, "vendor"), VendorBean.class);
        
        try {
            // Actualizar datos del vendedor
            Driver dao = DaoFactory.createDao();
            ArrayList data = new ArrayList();
            data.add(vendor.getId());
            data.add(vendor.getName());
            data.add(vendor.getPhone());
            data.add(vendor.getEmail());
            data.add(vendor.getAddr());
            data.add(vendor.getDeals());
            data.add(vendor.getScore());
            data.add(vendor.getMerit());
            data.add(vendor.getNotes());
            data.add(vendor.getState());
            data.add(request.getSession().getAttribute("user"));
            data.add(request.getSession().getAttribute("host"));
            dao.exec("sp_vendors_update", data);

            // Procesar estado http
            response.setStatus(200);
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            response.sendError(404);
        }
    }
}
