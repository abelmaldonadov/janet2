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
                <button class="btn btn-lg ml-1">&#128202;</button> <!--Reportes-->
                <button class="btn btn-lg ml-1 modal-open" data-target="#searchModal">&#128269;</button> <!--Buscar-->
                <button class="btn btn-lg ml-1 modal-open" data-target="#blacklistModal">&#127988;</button> <!--Lista negra-->
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
            
            
            
            
            
            
            
            <!-- MODAL -->
            <div class="modal" id="searchModal">
                <div class="content white">
                    <div class="modal-header">
                        <h4>Buscar Proveedor</h4>
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
                                    <option>Por Nombre</option>
                                    <option>Por Plataforma</option>
                                    <option>Por Canal</option>
                                    <option>Por Web</option>
                                    <option>Por Telefono</option>
                                    <option>Por Correo Electrónico</option>
                                    <option>Por Calificación</option>
                                </select>
                            </div>
                        </div>
                        
                    </div>
                    <div class="modal-footer">
                        <button class="btn l-red modal-close">Cancelar</button>
                        <button class="btn l-notify" @click="providerSearch">Buscar</button>
                    </div>
                </div>
            </div>
            
            <!-- MODAL -->
            <div class="modal" id="blacklistModal">
                <div class="content white">
                    <div class="modal-header">
                        <h4>Lista negra</h4>
                    </div>
                    <div class="modal-body">
                        
                        <!-- ALERT -->
                        <div class="alert dark" v-for="item in arrBlacklistComp">
                            <b class="text-13">{{ item.name }}</b>
                            <p>Motivo: {{ item.notes }}</p>
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
                        <h4>Todos los proveedores</h4>
                    </div>
                    <div class="modal-body">
                        
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
                    <div class="modal-footer">
                        <button class="btn l-notify modal-close">Cerrar</button>
                    </div>
                </div>
            </div>
            
            <!-- MODAL -->
            <div class="modal" id="newModal">
                <div class="content white">
                    <div class="modal-header">
                        <h4>Nuevo proveedor</h4>
                    </div>
                    <div class="modal-body">
                        
                        <div class="row">
                            <div class="col md-3">
                                <label class="ml-1">Id</label>
                                <input type="text" v-model="provider.id">
                            </div>
                            <div class="col md-9">
                                <label class="ml-1">Nombre</label>
                                <input type="text" v-model="provider.name">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col md-3">
                                <label class="ml-1">Tratos hechos</label>
                                <input type="text" v-model="provider.deals">
                            </div>
                            <div class="col md-3">
                                <label class="ml-1">Calificación</label>
                                <select v-model="provider.score">
                                    <option v-for="item in info.score" :value="item.key">{{ item.value }}</option>
                                </select>
                            </div>
                            <div class="col md-3">
                                <label class="ml-1">Lista negra</label>
                                <select v-model="provider.blacklist">
                                    <option v-for="item in info.bool" :value="item.key">{{ item.value }}</option>
                                </select>
                            </div>
                            <div class="col md-3">
                                <label class="ml-1">Estado</label>
                                <select v-model="provider.state">
                                    <option v-for="item in info.states" :value="item.key">{{ item.value }}</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col md-6">
                                <label class="ml-1">Plataforma</label>
                                <input type="text" v-model="provider.plataform">
                            </div>
                            <div class="col md-6">
                                <label class="ml-1">Web</label>
                                <input type="text" v-model="provider.web">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col md-6">
                                <label class="ml-1">Teléfono</label>
                                <input type="text" v-model="provider.phone">
                            </div>
                            <div class="col md-6">
                                <label class="ml-1">Correo electrónico</label>
                                <input type="text" v-model="provider.email">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <label class="ml-1">Notas</label>
                                <input type="text" v-model="provider.notes">
                            </div>
                        </div>
                        
                    </div>
                    <div class="modal-footer">
                        <button class="btn l-red modal-close">Cancelar</button>
                        <button class="btn l-notify modal-close" @click="providerInsert">Guardar</button>
                    </div>
                </div>
            </div>
            
            <!-- MODAL -->
            <div class="modal" id="updateModal">
                <div class="content white">
                    <div class="modal-header">
                        <h4>Editar proveedor</h4>
                    </div>
                    <div class="modal-body">
                        
                        <div class="row">
                            <div class="col md-3">
                                <label class="ml-1">Id</label>
                                <input type="text" readonly v-model="provider.id">
                            </div>
                            <div class="col md-9">
                                <label class="ml-1">Nombre</label>
                                <input type="text" v-model="provider.name">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col md-3">
                                <label class="ml-1">Tratos hechos</label>
                                <input type="text" v-model="provider.deals">
                            </div>
                            <div class="col md-3">
                                <label class="ml-1">Calificación</label>
                                <select v-model="provider.score">
                                    <option v-for="item in info.score" :value="item.key">{{ item.value }}</option>
                                </select>
                            </div>
                            <div class="col md-3">
                                <label class="ml-1">Lista negra</label>
                                <select v-model="provider.blacklist">
                                    <option v-for="item in info.bool" :value="item.key">{{ item.value }}</option>
                                </select>
                            </div>
                            <div class="col md-3">
                                <label class="ml-1">Estado</label>
                                <select v-model="provider.state">
                                    <option v-for="item in info.states" :value="item.key">{{ item.value }}</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col md-6">
                                <label class="ml-1">Plataforma</label>
                                <input type="text" v-model="provider.plataform">
                            </div>
                            <div class="col md-6">
                                <label class="ml-1">Web</label>
                                <input type="text" v-model="provider.web">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col md-6">
                                <label class="ml-1">Teléfono</label>
                                <input type="text" v-model="provider.phone">
                            </div>
                            <div class="col md-6">
                                <label class="ml-1">Correo electrónico</label>
                                <input type="text" v-model="provider.email">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <label class="ml-1">Notas</label>
                                <input type="text" v-model="provider.notes">
                            </div>
                        </div>
                        
                    </div>
                    <div class="modal-footer">
                        <button class="btn l-red modal-close">Cancelar</button>
                        <button class="btn l-notify modal-close" @click="providerUpdate">Guardar</button>
                    </div>
                </div>
            </div>
            
        </main>
        
        <%@include file="../../templates/vue.jsp" %>
        <script src="${context}/views/main/providers/providers.js"></script>
        <%@include file="../../templates/scripts.jsp" %>
        
    </body>
</html>

