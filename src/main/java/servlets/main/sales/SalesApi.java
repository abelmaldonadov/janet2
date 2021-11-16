/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.main.sales;

import beans.VendorBean;
import beans.InventoryBean;
import beans.SaleBean;
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
public class SalesApi extends HttpServlet {
    
    SaleBean sale;
    InventoryBean inventory;
    VendorBean vendor;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getQueryString().equals("all")) this.doGetAll(request, response);
        else {
            response.setContentType("application/json");
            
            try {
                // Cargar datos de la venta
                Driver dao = DaoFactory.createDao();
                ArrayList data = new ArrayList();
                data.add(request.getParameter("id"));
                ArrayList table = dao.getData("sp_sales_get", data);
                sale = new SaleBean((LinkedHashMap) table.get(0));

                // Procesar respuesta JSON
                try (PrintWriter out = response.getWriter()) {
                    response.setStatus(200);
                    out.print(new Gson().toJson(sale));
                }
            } catch (SQLException ex) {
                System.out.println(ex.getMessage());
                response.sendError(404);
            }
        }
    }
    
    protected void doGetAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        LinkedHashMap resolve = new LinkedHashMap();
            
        try {
            // Cargar datos de todas las ventas
            Driver dao = DaoFactory.createDao();
            ArrayList tableSales = dao.getData("sp_sales_getall");
            ArrayList arrSales = new ArrayList();
            for (Object row : tableSales) {
                sale = new SaleBean((LinkedHashMap) row);
                arrSales.add(sale);
            }
            
            // Cargar datos de todos los inventarios
            ArrayList tableInventories = dao.getData("sp_inventory_getall");
            ArrayList arrInventories = new ArrayList();
            for (Object row : tableInventories) {
                inventory = new InventoryBean((LinkedHashMap) row);
                arrInventories.add(inventory);
            }
            
            // Cargar datos de todos los vendedores
            ArrayList tableVendors = dao.getData("sp_vendors_getall");
            ArrayList arrVendors = new ArrayList();
            for (Object row : tableVendors) {
                vendor = new VendorBean((LinkedHashMap) row);
                arrVendors.add(vendor);
            }
            
            //
            resolve.put("arrSales", arrSales);
            resolve.put("arrInventories", arrInventories);
            resolve.put("arrVendors", arrVendors);
            
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
        sale = new Gson().fromJson(request.getParameter("sale"), SaleBean.class);
        
        try {
            // Insertar datos de la venta
            Driver dao = DaoFactory.createDao();
            ArrayList data = new ArrayList();
            data.add(sale.getInventoryId());
            data.add(sale.getUnitPrice());
            data.add(sale.getQuantity());
            data.add(sale.getTotalPrice());
            data.add(sale.getDeliveryDate());
            data.add(sale.getDeliveryTime());
            data.add(sale.getDeliveryPlace());
            data.add(sale.getDeliveryMethod());
            data.add(sale.getCustomer());
            data.add(sale.getPayment());
            data.add(sale.getChannel());
            data.add(sale.getVendorId());
            data.add(sale.getNotes());
            data.add(sale.getState());
            data.add(request.getSession().getAttribute("user"));
            data.add(request.getSession().getAttribute("host"));
            dao.exec("sp_sales_insert", data);

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
        sale = new Gson().fromJson(Request.getParameter(request, "sale"), SaleBean.class);
        
        try {
            // Actualizar datos de la venta
            Driver dao = DaoFactory.createDao();
            ArrayList data = new ArrayList();
            data.add(sale.getId());
            data.add(sale.getInventoryId());
            data.add(sale.getUnitPrice());
            data.add(sale.getQuantity());
            data.add(sale.getTotalPrice());
            data.add(sale.getDeliveryDate());
            data.add(sale.getDeliveryTime());
            data.add(sale.getDeliveryPlace());
            data.add(sale.getDeliveryMethod());
            data.add(sale.getCustomer());
            data.add(sale.getPayment());
            data.add(sale.getChannel());
            data.add(sale.getVendorId());
            data.add(sale.getNotes());
            data.add(sale.getState());
            data.add(request.getSession().getAttribute("user"));
            data.add(request.getSession().getAttribute("host"));
            dao.exec("sp_sales_update", data);

            // Procesar estado http
            response.setStatus(200);
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            response.sendError(404);
        }
    }
}
