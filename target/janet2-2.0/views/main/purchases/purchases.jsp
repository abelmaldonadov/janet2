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
    <body class="light">
        
        <%@include file="../../templates/navbar.jsp" %>
        
        <main class="container py-10" id="app">
            
            <div class="shadow white p-2 my-3 flex-between">
                <div>
                    <button class="btn btn-lg ml-1 flex-left" data-title="Importe total de compras">&#128179; S/ {{ totalPurchasesComp }}</button> <!--Total de compras-->
                </div>
                <div>
                    <button class="btn btn-lg ml-1 modal-open" data-title="Reportes">&#128202;</button> <!--Reportes-->
                    <button class="btn btn-lg ml-1 modal-open" data-title="Buscar" data-target="#searchModal">&#128269;</button> <!--Buscar-->
                    <button class="btn btn-lg ml-1 modal-open" data-title="Pedidos" data-target="#ordersModal">&#128674;</button> <!--Pedidos-->
                    <button class="btn btn-lg ml-1 modal-open" data-title="Todas las compras" data-target="#allModal">&#128194;</button> <!--Todos-->
                    <button class="btn btn-lg ml-1 modal-open" data-title="Nueva compra" data-target="#newModal" @click="clearForm">&#128195;</button> <!--Nuevo-->
                </div>
            </div>
            
            <div class="shadow white p-2 mb-3 overflow-h">
                <h5 class="p-2">Compras recientes</h5>
                <!-- TABLE -->
                <table class="table">
                    <thead>
                        <tr>
                            <th>Fecha</th>
                            <th>Producto</th>
                            <th>Proveedor</th>
                            <th>F. Llegada</th>
                            <th>Unitario</th>
                            <th>Cantidad</th>
                            <th>Subtotal</th>
                            <th>Estado</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="item in arrPurchases10Comp">
                            <th>{{ item.dateIns }}</th>
                            <td>{{ item.productName }}</td>
                            <td>{{ item.providerName }}</td>
                            <td>{{ item.arrivalDate }}</td>
                            <td>{{ item.unitary }}</td>
                            <td>{{ item.quantity }}</td>
                            <td>{{ item.totalCost }}</td>
                            <td :class="'text-'+getAux('states', item.state).color">{{ getAux("states", item.state).value }}</td>
                            <td class="w-10px" 
                                onclick="show('#editModal')" 
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
