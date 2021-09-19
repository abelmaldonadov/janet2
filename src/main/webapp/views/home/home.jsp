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
        
        <main class="container" id="app">
            <div class="row mb-4">
                <h4 class="center">Bienvenido <span class="text-notify">${user}</span> &#127774;</h4>
            </div>
            <div class="row">
                
                <%
                    ArrayList arrAreas = (ArrayList) request.getAttribute("arrAreas");
                    for (int i = 0; i < arrAreas.size(); i++) {
                        AreaBean area = (AreaBean) arrAreas.get(i);
                %>
                    <div class="col md-4">
                        <!-- CAPTION -->
                        <a class="image" href="${context}<%= area.getRoute() %>" data-bg="${context}<%= area.getImage() %>" data-height="200px">
                            <div class="caption">
                                <h4><%= area.getName()%></h4>
                            </div>
                        </a>
                    </div>
                <% } %>
                
            </div>
        </main>
        
        <%@include file="../templates/scripts.jsp" %>
        
    </body>
</html>
