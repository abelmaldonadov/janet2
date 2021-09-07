/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 *
 * @author abelm
 */
@WebServlet(name = "templateApi", urlPatterns = {"/templateApi"})
public class templateApi extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getQueryString().equals("all")) this.doGetAll(request, response);
        else {
            System.out.println("get");
        }
    }
    
    protected void doGetAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("getAll");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    }
    
    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    }

}
