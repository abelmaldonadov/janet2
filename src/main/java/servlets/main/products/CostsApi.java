/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.main.products;

import beans.CostBean;
import com.google.gson.Gson;
import dao.Driver;
import factory.DaoFactory;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author abelm
 */
public class CostsApi extends HttpServlet {

    CostBean cost;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        cost = new Gson().fromJson(request.getParameter("cost"), CostBean.class);
        
        try {
            // Insertar nuevo costo (Da la impresión al usuario de que se actualiza)
            Driver dao = DaoFactory.createDao();
            ArrayList data = new ArrayList();
            data.add(cost.getProductId());
            data.add(cost.getProduct());
            data.add(cost.getShipping());
            data.add(cost.getTaxes());
            data.add(cost.getOthers());
            data.add(cost.getUnitary());
            data.add(cost.getListPrice());
            data.add(cost.getProfit());
            data.add("A");
            data.add(request.getSession().getAttribute("user"));
            data.add(request.getSession().getAttribute("host"));
            dao.exec("sp_costs_insert", data);
            
            // Lanzar estatus http
            response.setStatus(201);
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            response.sendError(404);
        }
    }
    
}
