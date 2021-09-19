/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.main.purchases;

import beans.ProviderBean;
import beans.PurchaseBean;
import beans.UserBean;
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
public class PurchasesApi extends HttpServlet {
    
    PurchaseBean purchase;
    ProviderBean provider;
    ProviderBean product;
    UserBean user;

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
                ArrayList table = dao.getData("sp_purchases_get", data);
                purchase = new PurchaseBean((LinkedHashMap) table.get(0));

                // Procesar respuesta JSON
                try (PrintWriter out = response.getWriter()) {
                    response.setStatus(200);
                    out.print(new Gson().toJson(purchase));
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
            // Cargar datos de todas las compras
            Driver dao = DaoFactory.createDao();
            ArrayList tablePurchases = dao.getData("sp_purchases_getall");
            ArrayList arrPurchases = new ArrayList();
            for (Object row : tablePurchases) {
                purchase = new PurchaseBean((LinkedHashMap) row);
                arrPurchases.add(purchase);
            }
            
            // Cargar datos de todos los proveedores
            ArrayList tableProviders = dao.getData("sp_providers_getall");
            ArrayList arrProviders = new ArrayList();
            for (Object row : tableProviders) {
                provider = new ProviderBean((LinkedHashMap) row);
                arrProviders.add(provider);
            }
            
            // Cargar datos de todos los productos
            ArrayList tableProducts = dao.getData("sp_products_getall");
            ArrayList arrProducts = new ArrayList();
            for (Object row : tableProducts) {
                product = new ProviderBean((LinkedHashMap) row);
                arrProducts.add(product);
            }
            
            //
            resolve.put("arrProviders", arrProviders);
            resolve.put("arrPurchases", arrPurchases);
            resolve.put("arrProducts", arrProducts);
            
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
        purchase = new Gson().fromJson(request.getParameter("purchase"), PurchaseBean.class);
        
        try {
            // Insertar datos de la compra
            Driver dao = DaoFactory.createDao();
            ArrayList data = new ArrayList();
            data.add(purchase.getAmount());
            data.add(purchase.getProductId());
            data.add(purchase.getProviderId());
            data.add(purchase.getArrivalDate());
            data.add(purchase.getNotes());
            data.add(purchase.getState());
            data.add(request.getSession().getAttribute("user"));
            data.add(request.getSession().getAttribute("host"));
            dao.exec("sp_purchases_insert", data);

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
        purchase = new Gson().fromJson(Request.getParameter(request, "purchase"), PurchaseBean.class);
        
        try {
            // Actualizar datos de la compra
            Driver dao = DaoFactory.createDao();
            ArrayList data = new ArrayList();
            data.add(purchase.getId());
            data.add(purchase.getAmount());
            data.add(purchase.getProductId());
            data.add(purchase.getProviderId());
            data.add(purchase.getArrivalDate());
            data.add(purchase.getNotes());
            data.add(purchase.getState());
            data.add(request.getSession().getAttribute("user"));
            data.add(request.getSession().getAttribute("host"));
            dao.exec("sp_purchases_update", data);

            // Procesar estado http
            response.setStatus(200);
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            response.sendError(404);
        }
    }
    
}
