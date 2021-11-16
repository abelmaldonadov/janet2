<%-- 
    Document   : sales
    Created on : 17/09/2021, 09:18:07 PM
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
            
            <div class="shadow white p-2 my-3 flex-between">
                <div>
                    <button class="btn btn-lg ml-1 flex-left" data-title="Total de ingresos">&#128200; S/ {{ totalSalesComp }}</button> <!--Total de ventas-->
                    <button class="btn btn-lg ml-1 flex-left" data-title="Total de ingresos en efectivo">&#128181; S/ {{ totalSalesCashComp }}</button> <!--Total de ventas efectivo-->
                    <button class="btn btn-lg ml-1 flex-left" data-title="Total de ingresos por bancos">&#127970; S/ {{ totalSalesBanksComp }}</button> <!--Total de ventas bancos-->
                </div>
                <div>
                    <button class="btn btn-lg ml-1 modal-open" data-title="Reportes">&#128202;</button> <!--Reportes-->
                    <button class="btn btn-lg ml-1 modal-open" data-title="Buscar" data-target="#searchModal">&#128269;</button> <!--Buscar-->
                    <button class="btn btn-lg ml-1 modal-open" data-title="Entregas pendientes" data-target="#deliveriesModal">&#128198;</button> <!--Entregas-->
                    <button class="btn btn-lg ml-1 modal-open" data-title="Todas las ventas" data-target="#allModal">&#128194;</button> <!--Todos-->
                    <button class="btn btn-lg ml-1 modal-open" data-title="Nueva venta" data-target="#newModal" @click="clearForm">&#128195;</button> <!--Nuevo-->
                </div>
            </div>
            
            <div class="shadow white p-2 mb-3">
                <h5 class="p-2">Ventas recientes</h5>
                <!-- TABLE -->
                <table class="table">
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Producto</th>
                            <th>Cliente</th>
                            <th>Subtotal</th>
                            <th>F. Entrega</th>
                            <th>Pagado</th>
                            <th>Canal</th>
                            <th>Estado</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="item in arrSales10Comp" onclick="show('#editModal')" @click="saleGet(item)">
                            <th>{{ item.id }}</th>
                            <td>{{ item.productName }}</td>
                            <td>{{ item.customer }}</td>
                            <td>{{ item.totalPrice }}</td>
                            <td>{{ item.deliveryDate }}</td>
                            <td :class="'text-'+getAux('bool', item.payment).color">{{ getAux("bool", item.payment).value }}</td>
                            <td>{{ getAux("paymentChannel", item.channel).value }}</td>
                            <td :class="'text-'+getAux('states', item.state).color">{{ getAux("states", item.state).value }}</td>
                        </tr>
                    </tbody>
                </table>
            </div>


            <%@include file="forms/search.jsp" %>
            <%@include file="forms/deliveries.jsp" %>
            <%@include file="forms/all.jsp" %>
            <%@include file="forms/new.jsp" %>
            <%@include file="forms/edit.jsp" %>
            
            
        </main>
        
        <%@include file="../../templates/vue.jsp" %>
        <script src="${context}/views/main/sales/sales.js"></script>
        <%@include file="../../templates/scripts.jsp" %>
        
    </body>
</html>
