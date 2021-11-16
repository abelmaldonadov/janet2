/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.main.products;

import beans.ProductBean;
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
public class ProductsApi extends HttpServlet {
    
    ProductBean product;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getQueryString().equals("all")) this.doGetAll(request, response);
        else {
            response.setContentType("application/json");
            
            try {
                // Cargar datos del producto
                Driver dao = DaoFactory.createDao();
                ArrayList data = new ArrayList();
                data.add(request.getParameter("id"));
                ArrayList table = dao.getData("sp_products_get", data);
                product = new ProductBean((LinkedHashMap) table.get(0));

                // Procesar respuesta JSON
                try (PrintWriter out = response.getWriter()) {
                    response.setStatus(200);
                    out.print(new Gson().toJson(product));
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
            // Cargar datos de todos los productos
            Driver dao = DaoFactory.createDao();
            ArrayList tableProducts = dao.getData("sp_products_getall");
            ArrayList arrProducts = new ArrayList();
            for (Object row : tableProducts) {
                product = new ProductBean((LinkedHashMap) row);
                arrProducts.add(product);
            }
            
            //
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
        product = new Gson().fromJson(request.getParameter("product"), ProductBean.class);
        
        try {
            // Actualizar datos del producto
            Driver dao = DaoFactory.createDao();
            ArrayList data = new ArrayList();
            data.add(product.getCategory());
            data.add(product.getTag());
            data.add(product.getName());
            data.add(product.getBrand());
            data.add(product.getModel());
            data.add(product.getGeneration());
            data.add(product.getDetail());
            data.add(product.getNotes());
            data.add(product.getState());
            data.add(request.getSession().getAttribute("user"));
            data.add(request.getSession().getAttribute("host"));
            dao.exec("sp_products_insert", data);

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
        product = new Gson().fromJson(Request.getParameter(request, "product"), ProductBean.class);
        
        try {
            // Actualizar datos del producto
            Driver dao = DaoFactory.createDao();
            ArrayList data = new ArrayList();
            data.add(product.getId());
            data.add(product.getCategory());
            data.add(product.getTag());
            data.add(product.getName());
            data.add(product.getBrand());
            data.add(product.getModel());
            data.add(product.getGeneration());
            data.add(product.getDetail());
            data.add(product.getNotes());
            data.add(product.getState());
            data.add(request.getSession().getAttribute("user"));
            data.add(request.getSession().getAttribute("host"));
            dao.exec("sp_products_update", data);

            // Procesar estado http
            response.setStatus(200);
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            response.sendError(404);
        }
    }
}
