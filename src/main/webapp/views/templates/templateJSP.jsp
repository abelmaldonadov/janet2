<%-- 
    Document   : templateJSP
    Created on : 04/09/2021, 08:05:09 PM
    Author     : abelm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${title}</title>
        <%@include file="../../templates/styles.jsp" %>
    </head>
    <body>
        
        <%@include file="../../templates/navbar.jsp" %>
        
        <main class="container" id="app">
            
            
            
        </main>
        
        <%@include file="../../templates/vue.jsp" %>
        <script src="${context}/views/main/    .js"></script>
        <%@include file="../../templates/scripts.jsp" %>
        
    </body>
</html>
