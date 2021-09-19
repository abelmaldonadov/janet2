<%-- 
    Document   : inventory
    Created on : 08/09/2021, 12:33:15 AM
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
                <button class="btn btn-lg ml-1 modal-open" data-target="#spentsModal">&#128680;</button> <!--A punto de agotarse y agotados-->
                <button class="btn btn-lg ml-1 modal-open" data-target="#allModal">&#128194;</button> <!--Todos-->
            </div>
            
            <div class="radius shadow white p-2 mb-3">
                <h4 class="center mb-3">Últimas actualizaciones</h4>
                <!-- TABLE -->
                <table class="table">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Tienda</th>
                            <th>Producto</th>
                            <th>P. Lista</th>
                            <th>Id Compra</th>
                            <th>Stock Ini.</th>
                            <th>Stock Act.</th>
                            <th>Estado</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="item in arrInventories10Comp">
                            <th>{{ item.id }}</th>
                            <td>{{ item.storeName }}</td>
                            <td>{{ item.productName }}</td>
                            <td>{{ item.listPrice }}</td>
                            <td>{{ item.purchaseId }}</td>
                            <td>{{ item.initialStock }}</td>
                            <td>{{ item.stock }}</td>
                            <td>{{ getAux("states", item.state).value }}</td>
                            <td class="w-10px" 
                                onclick="Mandarina.modalShow('#editModal')" 
                                @click="inventoryGet(item)">&#128230;</td> <!--Editar-->
                        </tr>
                    </tbody>
                </table>
            </div>
            
            
            <%@include file="forms/search.jsp" %>
            <%@include file="forms/all.jsp" %>
            <%@include file="forms/spents.jsp" %>
            <%@include file="forms/edit.jsp" %>
            
            
        </main>
        
        <%@include file="../../templates/vue.jsp" %>
        <script src="${context}/views/main/inventory/inventory.js"></script>
        <%@include file="../../templates/scripts.jsp" %>
        
    </body>
</html>
