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
        
        <main class="container pt-10" id="app">
            
            <div class="shadow white p-2 my-3 flex-between">
                <div>
                    <button class="btn btn-lg ml-1 flex-left sky" data-title="Unidades en almacén">&#127978; {{ totalStockComp }} u.</button> <!--Total de inventario-->
                    <button class="btn btn-lg ml-1 flex-left sky" data-title="Unidades en camino">&#128666; {{ totalOrdersComp }} u.</button> <!--Total en camino-->
                </div>
                <div>
                    <button class="btn btn-lg ml-1 modal-open" data-title="Reportes">&#128202;</button> <!--Reportes-->
                    <button class="btn btn-lg ml-1 modal-open" data-title="Buscar" data-target="#searchModal">&#128269;</button> <!--Buscar-->
                    <button class="btn btn-lg ml-1 modal-open" data-title="Inventarios agotados" data-target="#spentsModal">&#128680;</button> <!--A punto de agotarse y agotados-->
                    <button class="btn btn-lg ml-1 modal-open" data-title="Todos los inventarios" data-target="#allModal">&#128194;</button> <!--Todos-->
                </div>
            </div>
            
            <div class="shadow white p-2 mb-3">
                <h5 class="p-2">Últimas actualizaciones</h5>
                <!-- TABLE -->
                <table class="table">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Tienda</th>
                            <th>UPC</th>
                            <th>Producto</th>
                            <th>P. Lista</th>
                            <th>Id Compra</th>
                            <th>Stock Ini.</th>
                            <th>Stock Act.</th>
                            <th>Estado</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="item in arrInventories10Comp" onclick="show('#editModal')" @click="inventoryGet(item)">
                            <th>{{ item.id }}</th>
                            <td>{{ item.storeName }}</td>
                            <td>{{ item.upc }}</td>
                            <td>{{ item.productName }}</td>
                            <td class="text-purple">{{ item.listPrice }}</td>
                            <td>{{ item.purchaseId }}</td>
                            <td>{{ item.initialStock }}</td>
                            <td>{{ item.stock }}</td>
                            <td :class="'text-'+getAux('states', item.state).color">{{ getAux("states", item.state).value }}</td>
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
