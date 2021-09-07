<%-- 
    Document   : products
    Created on : 06/09/2021, 08:40:40 PM
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
            
            <div class="radius shadow white p-2 mb-3 text-right">
                <button class="btn btn-lg ml-1">&#128202;</button> <!--Reportes-->
                <button class="btn btn-lg ml-1 modal-open" data-target="#searchModal">&#128269;</button> <!--Buscar-->
                <button class="btn btn-lg ml-1 modal-open" data-target="#blacklistModal">&#127988;</button> <!--Más valorados-->
                <button class="btn btn-lg ml-1 modal-open" data-target="#allModal">&#128194;</button> <!--Todos-->
                <button class="btn btn-lg ml-1">&#128681;</button> <!--Marcados-->
                <button class="btn btn-lg ml-1 modal-open" data-target="#newModal" @click="clearForm">&#128195;</button> <!--Nuevo-->
            </div>
            
            <div class="radius shadow white p-2 mb-3">
                <h4 class="center mb-3">Agregados recientemente</h4>
                <!-- TABLE -->
                <table class="table">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Nombre</th>
                            <th>Plataforma</th>
                            <th>Tratos</th>
                            <th>Calificación</th>
                            <th>Estado</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="item in arrProviders10Comp">
                            <th>{{ item.id }}</th>
                            <td>{{ item.name }}</td>
                            <td>{{ item.plataform }}</td>
                            <td>{{ item.deals }}</td>
                            <td>{{ getAux("score", item.score).value }}</td>
                            <td>{{ getAux("states", item.state).value }}</td>
                            <td class="w-10px" 
                                onclick="Mandarina.modalShow('#updateModal')" 
                                @click="providerGet(item)">&#128221;</td> <!--Editar-->
                        </tr>
                    </tbody>
                </table>
            </div>
            
            
            
            
            
            
            
            
            
            
        </main>
        
        <%@include file="../../templates/vue.jsp" %>
        <script src="${context}/views/main/products/products.js"></script>
        <%@include file="../../templates/scripts.jsp" %>
        
    </body>
</html>
