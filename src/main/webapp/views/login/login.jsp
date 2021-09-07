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
    <body>
        
        <main class="container" id="app">
            
            <div class="row flex-center pt-9">
                <div class="col sm-6 md-5 lg-4 xl-3">
                    <h3 class="center mb-3">Login</h3>
                    <input type="text" placeholder="Ingresa tu usuario" v-model="user">
                    <input type="password" placeholder="Ingresa tu contraseña" v-model="password" @keypress.enter="login">
                    <a href="#" class="link text-orange ml-1">Recuperar contraseña</a>
                    <div class="flex-right">
                        <button class="btn l-orange" @click="login">Ingresar</button>
                    </div>
                </div>
            </div>
            
        </main>
        
        
        <%@include file="../templates/vue.jsp" %>
        <script src="${context}/views/login/login.js"></script>
        <%@include file="../templates/scripts.jsp" %>
        
    </body>
</html>
