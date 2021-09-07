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
                <button class="btn btn-lg ml-1">&#128202;</button> <!--Reportes-->
                <button class="btn btn-lg ml-1 modal-open" data-target="#searchModal">&#128269;</button> <!--Buscar-->
                <button class="btn btn-lg ml-1 modal-open" data-target="#ordersModal">&#128230;</button> <!--Pedidos-->
                <button class="btn btn-lg ml-1 modal-open" data-target="#allModal">&#128194;</button> <!--Todos-->
                <button class="btn btn-lg ml-1">&#128681;</button> <!--Marcados-->
                <button class="btn btn-lg ml-1 modal-open" data-target="#newModal" @click="clearForm">&#128195;</button> <!--Nuevo-->
            </div>
            
            <div class="radius shadow white p-2 mb-3">
                <h4 class="center mb-3">Compras recientes</h4>
                <!-- TABLE -->
                <table class="table">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Cantidad</th>
                            <th>C. Total</th>
                            <th>Proveedor</th>
                            <th>F. Llegada</th>
                            <th>Estado</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="item in arrPurchases10Comp">
                            <th>{{ item.id }}</th>
                            <td>{{ item.amount }}</td>
                            <td>{{ item.totalCost }}</td>
                            <td>{{ item.providerName }}</td>
                            <td>{{ item.arrivalDate }}</td>
                            <td>{{ getAux("states", item.state).value }}</td>
                            <td class="w-10px" 
                                onclick="Mandarina.modalShow('#updateModal')" 
                                @click="purchaseGet(item)">&#128221;</td> <!--Editar-->
                        </tr>
                    </tbody>
                </table>
            </div>
            
            
            
            
            
            
            <!-- MODAL -->
            <div class="modal" id="searchModal">
                <div class="content white">
                    <div class="modal-header">
                        <h4>Buscar compra</h4>
                    </div>
                    <div class="modal-body">
                        
                        <div class="row">
                            <div class="col md-8">
                                <label class="ml-1">Texto a buscar</label>
                                <input type="text">
                            </div>
                            <div class="col md-4">
                                <label class="ml-1">Criterio</label>
                                <select id="select">
                                    <option selected>Por Id</option>
                                    <option>Por Fecha de llegada</option>
                                </select>
                            </div>
                        </div>
                        
                    </div>
                    <div class="modal-footer">
                        <button class="btn l-red modal-close">Cancelar</button>
                        <button class="btn l-notify" @click="purchaseSearch">Buscar</button>
                    </div>
                </div>
            </div>
            
            <!-- MODAL -->
            <div class="modal" id="ordersModal">
                <div class="content white">
                    <div class="modal-header">
                        <h4>Pedidos</h4>
                    </div>
                    <div class="modal-body">
                        
                        <!-- ALERT -->
                        <div class="alert l-yellow" v-for="item in arrOrdersComp">
                            <b class="text-13">{{ item.providerName }}</b>
                            <p>Fecha de llegada: {{ item.arrivalDate }}</p>
                        </div>
                        
                    </div>
                    <div class="modal-footer">
                        <button class="btn l-notify modal-close">Cerrar</button>
                    </div>
                </div>
            </div>
            
            <!-- MODAL -->
            <div class="modal" id="allModal">
                <div class="content white">
                    <div class="modal-header">
                        <h4>Todas las compras</h4>
                    </div>
                    <div class="modal-body">
                        
                        <!-- TABLE -->
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Cantidad</th>
                                    <th>C. Total</th>
                                    <th>Proveedor</th>
                                    <th>F. Llegada</th>
                                    <th>Estado</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="item in arrPurchases">
                                    <th>{{ item.id }}</th>
                                    <td>{{ item.amount }}</td>
                                    <td>{{ item.totalCost }}</td>
                                    <td>{{ item.providerName }}</td>
                                    <td>{{ item.arrivalDate }}</td>
                                    <td>{{ getAux("states", item.state).value }}</td>
                                    <td class="w-10px" 
                                        onclick="Mandarina.modalShow('#updateModal')" 
                                        @click="purchaseGet(item)">&#128221;</td> <!--Editar-->
                                </tr>
                            </tbody>
                        </table>
                        
                    </div>
                    <div class="modal-footer">
                        <button class="btn l-notify modal-close">Cerrar</button>
                    </div>
                </div>
            </div>
            
            <!-- MODAL -->
            <div class="modal" id="newModal">
                <div class="content white">
                    <div class="modal-header">
                        <h4>Nueva compra</h4>
                    </div>
                    <div class="modal-body">
                        
                        <div class="row">
                            <div class="col md-6">
                                <label class="ml-1">Id</label>
                                <input type="text" v-model="purchase.id">
                            </div>
                            <div class="col md-3">
                                <label class="ml-1">Cantidad</label>
                                <input type="number" min="0" v-model="purchase.amount">
                            </div>
                            <div class="col md-3">
                                <label class="ml-1">Costo total</label>
                                <input type="text" v-model="purchase.totalCost">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col md-6">
                                <label class="ml-1">Proveedor</label>
                                <select v-model="purchase.providerId">
                                    <option v-for="item in arrProviders" :value="item.id">{{ item.name }}</option>
                                </select>
                            </div>
                            <div class="col md-3">
                                <label class="ml-1">Fecha de llegada</label>
                                <input type="date" v-model="purchase.arrivalDate">
                            </div>
                            <div class="col md-3">
                                <label class="ml-1">Estado</label>
                                <select v-model="purchase.state">
                                    <option v-for="item in info.states" :value="item.key">{{ item.value }}</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <label class="ml-1">Notas</label>
                                <input type="text" v-model="purchase.notes">
                            </div>
                        </div>
                        
                    </div>
                    <div class="modal-footer">
                        <button class="btn l-red modal-close">Cancelar</button>
                        <button class="btn l-notify modal-close" @click="purchaseInsert">Guardar</button>
                    </div>
                </div>
            </div>
            
            <!-- MODAL -->
            <div class="modal" id="updateModal">
                <div class="content white">
                    <div class="modal-header">
                        <h4>Editar compra</h4>
                    </div>
                    <div class="modal-body">
                        
                        <div class="row">
                            <div class="col md-6">
                                <label class="ml-1">Id</label>
                                <input type="text" readonly v-model="purchase.id">
                            </div>
                            <div class="col md-3">
                                <label class="ml-1">Cantidad</label>
                                <input type="number" min="0" v-model="purchase.amount">
                            </div>
                            <div class="col md-3">
                                <label class="ml-1">Costo total</label>
                                <input type="text" v-model="purchase.totalCost">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col md-6">
                                <label class="ml-1">Proveedor</label>
                                <select v-model="purchase.providerId">
                                    <option v-for="item in arrProviders" :value="item.id">{{ item.name }}</option>
                                </select>
                            </div>
                            <div class="col md-3">
                                <label class="ml-1">Fecha de llegada</label>
                                <input type="date" v-model="purchase.arrivalDate">
                            </div>
                            <div class="col md-3">
                                <label class="ml-1">Estado</label>
                                <select v-model="purchase.state">
                                    <option v-for="item in info.states" :value="item.key">{{ item.value }}</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <label class="ml-1">Notas</label>
                                <input type="text" v-model="purchase.notes">
                            </div>
                        </div>
                        
                    </div>
                    <div class="modal-footer">
                        <button class="btn l-red modal-close">Cancelar</button>
                        <button class="btn l-notify modal-close" @click="purchaseUpdate">Guardar</button>
                    </div>
                </div>
            </div>
            
        </main>
        
        <%@include file="../../templates/vue.jsp" %>
        <script src="${context}/views/main/purchases/purchases.js"></script>
        <%@include file="../../templates/scripts.jsp" %>
        
    </body>
</html>
