<%-- 
    Document   : customers
    Created on : 18/09/2021, 04:22:58 PM
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
                <button class="btn btn-lg ml-1 modal-open">&#128202;</button> <!--Reportes-->
                <button class="btn btn-lg ml-1 modal-open" data-target="#searchModal">&#128269;</button> <!--Buscar-->
                <button class="btn btn-lg ml-1 modal-open" data-target="#blacklistModal">&#127988;</button> <!--Lista negra-->
                <button class="btn btn-lg ml-1 modal-open" data-target="#allModal">&#128194;</button> <!--Todos-->
                <button class="btn btn-lg ml-1 modal-open" data-target="#newModal" @click="clearForm">&#128195;</button> <!--Nuevo-->
            </div>
            
            <div class="radius shadow white p-2 mb-3">
                <h4 class="center mb-3">Clientes recientes</h4>
                <!-- TABLE -->
                <table class="table">
                    <thead>
                        <tr>
                            <th>Canal</th>
                            <th>Nombre</th>
                            <th>Teléfono</th>
                            <th>Correo</th>
                            <th>Dirección</th>
                            <th>Calificación</th>
                            <th>Estado</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="item in arrCustomers10Comp">
                            <th>{{ getAux("channel", item.channel).value }}</th>
                            <td>{{ item.name }}</td>
                            <td>{{ item.phone }}</td>
                            <td>{{ item.email }}</td>
                            <td>{{ item.addr }}</td>
                            <td>{{ getAux("score", item.score).value }}</td>
                            <td>{{ getAux("states", item.state).value }}</td>
                            <td class="w-10px" 
                                onclick="Mandarina.modalShow('#editModal')" 
                                @click="customerGet(item)">&#128221;</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            
            
            <%@include file="forms/search.jsp" %>
            <%@include file="forms/blacklist.jsp" %>
            <%@include file="forms/all.jsp" %>
            <%@include file="forms/new.jsp" %>
            <%@include file="forms/edit.jsp" %>
            
            
        </main>
        
        <%@include file="../../templates/vue.jsp" %>
        <script src="${context}/views/main/customers/customers.js"></script>
        <%@include file="../../templates/scripts.jsp" %>
        
    </body>
</html>
