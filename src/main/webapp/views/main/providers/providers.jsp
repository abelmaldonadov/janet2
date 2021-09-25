<%-- 
    Document   : providers
    Created on : 04/09/2021, 08:03:25 PM
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
                <h4 class="center mb-3">Agregados recientemente</h4>
                <!-- TABLE -->
                <table class="table">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Nombre</th>
                            <th>Canal</th>
                            <th>Web</th>
                            <th>Tratos</th>
                            <th>Calificación</th>
                            <th>Estado</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="item in arrProviders">
                            <th>{{ item.id }}</th>
                            <td>{{ item.name }}</td>
                            <td>{{ getAux("channel", item.channel).value }}</td>
                            <td>{{ item.web }}</td>
                            <td>{{ item.deals }}</td>
                            <td>{{ getAux("score", item.score).value }}</td>
                            <td>{{ getAux("states", item.state).value }}</td>
                            <td class="w-10px" 
                                onclick="Mandarina.modalShow('#editModal')" 
                                @click="providerGet(item)">&#128221;</td> <!--Editar-->
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
        <script src="${context}/views/main/providers/providers.js"></script>
        <%@include file="../../templates/scripts.jsp" %>
        
    </body>
</html>

