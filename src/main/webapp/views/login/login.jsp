<%-- 
    Document   : login
    Created on : Aug 31, 2021, 12:29:30 AM
    Author     : rodri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${title}</title>
        <%@include file="../templates/styles.jsp" %>
        
    </head>
    <body data-texture="plus">
        
        <main class="container" id="app">
            
            <div class="row flex-center pt-10">
                <div class="col sm-8 md-6 xl-3">
                    <h4 class="center mb-3">Janet 2.0</h4>
                    <input type="text" placeholder="Ingresa tu usuario" v-model="user">
                    <input type="password" placeholder="Ingresa tu contraseña" v-model="password" @keypress.enter="login">
                    <a href="#" class="link text-blue ml-1">Recuperar contraseña</a>
                    <div class="flex-right">
                        <button class="btn orange" @click="login">Ingresar</button>
                    </div>
                </div>
            </div>
            
        </main>
        
        
        <%@include file="../templates/vue.jsp" %>
        <script src="${context}/views/login/login.js"></script>
        <%@include file="../templates/scripts.jsp" %>
        
    </body>
</html>
