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
        
        <main class="container py-10" id="app">
            
            <div class="shadow white p-2 my-3 text-right">
                <button class="btn btn-lg ml-1 modal-open">&#128202;</button> <!--Reportes-->
                <button class="btn btn-lg ml-1 modal-open" data-target="#searchModal">&#128269;</button> <!--Buscar-->
                <button class="btn btn-lg ml-1 modal-open" data-target="#blacklistModal">&#127988;</button> <!--Lista negra-->
                <button class="btn btn-lg ml-1 modal-open" data-target="#allModal">&#128194;</button> <!--Todos-->
                <button class="btn btn-lg ml-1 modal-open" data-target="#newModal" @click="clearForm">&#128195;</button> <!--Nuevo-->
            </div>
            
            <div class="shadow white p-2 mb-3">
                
                <div class="row">
                    <div class="col lg-4" v-for="item in arrProviders">

                        <div class="control border pointer" onclick="show('#editModal')" @click="providerGet(item)">
                            <div class="control-header">
                                <h6>{{ item.name }}</h6>
                            </div>
                            <div class="control-body">
                                <table>
                                    <tbody>
                                        <tr>
                                            <td>Id Proveedor</td>
                                            <td>{{ item.id }}</td>
                                        </tr>
                                        <tr>
                                            <td>Canal</td>
                                            <td>{{ getAux("channel", item.channel).value }}</td>
                                        </tr>
                                        <tr>
                                            <td>Web</td>
                                            <td>{{ item.web }}</td>
                                        </tr>
                                        <tr>
                                            <td>Compras realizadas</td>
                                            <td>{{ item.deals }}</td>
                                        </tr>
                                        <tr>
                                            <td>Calificación</td>
                                            <td><span v-for="star in parseInt(item.score)">&#11088;</span></td>
                                        </tr>
                                        <tr :class="'text-'+getAux('states', item.state).color">
                                            <td>Estado</td>
                                            <td>{{ getAux("states", item.state).value }}</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                    </div>
                </div>
            
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

