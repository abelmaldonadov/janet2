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
        
        <!--Mandarina Css-->
        <link rel='stylesheet' href='https://cdn.jsdelivr.net/gh/mandarinacss/mandarina@master/mandarina.ini.css'>
        <link rel='stylesheet' href='https://cdn.jsdelivr.net/gh/mandarinacss/mandarina@master/mandarina.min.css'>
    </head>
    <body>
        <main class="row flex-center pt-9">
        <div class="col sm-6 md-5 lg-4 xl-3">
            <form class="form white" action="#" method="POST">
                <h3 class="center mb-3">Login</h3>
                <input type="mail" id="mail" placeholder="Ingresa tu correo electrónico">
                <input type="pass" id="pass" placeholder="Ingresa tu contraseña">
                <a href="#" class="link text-orange ml-1">Recuperar contraseña</a>
                <div class="flex-right">
                    <button class="btn l-orange">Submit</button>
                </div>
            </form>
        </div>
    </main>
        
        
        
        
        <!--Mandarina Scripts-->
        <script src='https://cdn.jsdelivr.net/gh/mandarinacss/mandarina@master/mandarina.min.js'></script>
        
    </body>
</html>
