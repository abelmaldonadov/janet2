<%-- 
    Document   : purchases
    Created on : 31/08/2021, 02:38:42 PM
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
                <button class="btn btn-lg ml-1 modal-open" data-target="#ordersModal">&#128674;</button> <!--Pedidos-->
                <button class="btn btn-lg ml-1 modal-open" data-target="#allModal">&#128194;</button> <!--Todos-->
                <button class="btn btn-lg ml-1 modal-open" data-target="#newModal" @click="clearForm">&#128195;</button> <!--Nuevo-->
            </div>
            
            <div class="radius shadow white p-2 mb-3">
                <h4 class="center mb-3">Compras recientes</h4>
                <!-- TABLE -->
                <table class="table">
                    <thead>
                        <tr>
                            <th>Fecha</th>
                            <th>Cantidad</th>
                            <th>Producto</th>
                            <th>Proveedor</th>
                            <th>F. Llegada</th>
                            <th>Estado</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="item in arrPurchases10Comp">
                            <th>{{ item.dateIns }}</th>
                            <td>{{ item.amount }}</td>
                            <td>{{ item.productName }}</td>
                            <td>{{ item.providerName }}</td>
                            <td>{{ item.arrivalDate }}</td>
                            <td>{{ getAux("states", item.state).value }}</td>
                            <td class="w-10px" 
                                onclick="Mandarina.modalShow('#editModal')" 
                                @click="purchaseGet(item)">&#128221;</td> <!--Editar-->
                        </tr>
                    </tbody>
                </table>
            </div>
            
            
            <%@include file="forms/search.jsp" %>
            <%@include file="forms/orders.jsp" %>
            <%@include file="forms/all.jsp" %>
            <%@include file="forms/new.jsp" %>
            <%@include file="forms/edit.jsp" %>
            
            
        </main>
        
        <%@include file="../../templates/vue.jsp" %>
        <script src="${context}/views/main/purchases/purchases.js"></script>
        <%@include file="../../templates/scripts.jsp" %>
        
    </body>
</html>
