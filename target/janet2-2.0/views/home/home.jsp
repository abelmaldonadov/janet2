<%-- 
    Document   : home
    Created on : 30/08/2021, 10:36:54 PM
    Author     : abelm
--%>

<%@page import="beans.AreaBean"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${title}</title>
        <%@include file="../templates/styles.jsp" %>
    </head>
    <body>
        
        <%@include file="../templates/navbar.jsp" %>
        
        <main class="container pt-10" id="app">
            
            <header class="row my-4">
                <h5 class="center">Bienvenido <span class="text-notify">${user}</span> &#127774;</h5>
            </header>
            
            <div class="row">
                
                <%
                    ArrayList arrAreas = (ArrayList) request.getAttribute("arrAreas");
                    for (int i = 0; i < arrAreas.size(); i++) {
                        AreaBean area = (AreaBean) arrAreas.get(i);
                %>
                    <div class="col md-4 relative">
                        <!-- CAPTION -->
                        <a class="img" href="${context}<%= area.getRoute() %>" data-bg="https://source.unsplash.com/random?<%= area.getImage() %>" data-height="250px">
                            <div class="caption">
                                <p class="text-20 center"><%= area.getName()%></p>
                            </div>
                        </a>
                            
                        <!--<div class="absolute top-0 right-0 mt-3">-->
                        <div class="absolute top-0 left-0 mt-3 w-100">
                            <div class="flex-center">
                                <a class="pointer px-2 py-1 mr-1 radius green"><b><%= area.getNotiAct()%></b></a> <!-- Activos -->
                                <a class="pointer px-2 py-1 mr-1 radius yellow"><b><%= area.getNotiPen()%></b></a> <!-- Pendientes -->
                                <a class="pointer px-2 py-1 mr-1 radius orange"><b><%= area.getNotiIna()%></b></a> <!-- Inactivos -->
                                <a class="pointer px-2 py-1 radius red"><b><%= area.getNotiEli()%></b></a> <!-- Eliminados -->
                            </div>
                        </div>
                    </div>
                <% } %>
                
            </div>
        </main>
        
        <%@include file="../templates/scripts.jsp" %>
        
        <%@include file="../templates/footer.jsp" %>
        
    </body>
</html>
