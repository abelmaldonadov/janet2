<%-- 
    Document   : new
    Created on : 08/09/2021, 12:20:59 AM
    Author     : abelm
--%>

<!-- MODAL -->
<div class="modal" id="newModal">
    <div class="content white">
        <div class="modal-header">
            <h4>Nuevo Cliente</h4>
        </div>
        <div class="modal-body">

            <div class="row">
                <div class="col">
                    <label class="ml-1">Nombre</label>
                    <input type="text" v-model="customer.name">
                </div>
            </div>
            <div class="row">
                <div class="col md-3">
                    <label class="ml-1">Tratos hechos</label>
                    <input type="text" v-model="customer.deals">
                </div>
                <div class="col md-3">
                    <label class="ml-1">Calificación</label>
                    <select v-model="customer.score">
                        <option v-for="item in info.score" :value="item.key">{{ item.value }}</option>
                    </select>
                </div>
                <div class="col md-3">
                    <label class="ml-1">Lista negra</label>
                    <select v-model="customer.blacklist">
                        <option v-for="item in info.bool" :value="item.key">{{ item.value }}</option>
                    </select>
                </div>
                <div class="col md-3">
                    <label class="ml-1">Estado</label>
                    <select v-model="customer.state">
                        <option v-for="item in info.states" :value="item.key">{{ item.value }}</option>
                    </select>
                </div>
            </div>
            <div class="row">
                <div class="col md-6">
                    <label class="ml-1">Teléfono</label>
                    <input type="text" v-model="customer.phone">
                </div>
                <div class="col md-6">
                    <label class="ml-1">Correo electrónico</label>
                    <input type="text" v-model="customer.email">
                </div>
            </div>
            <div class="row">
                <div class="col md-6">
                    <label class="ml-1">Dirección</label>
                    <input type="text" v-model="customer.addr">
                </div>
                <div class="col md-6">
                    <label class="ml-1">Canal</label>
                    <select v-model="customer.channel">
                        <option v-for="item in info.channel" :value="item.key">{{ item.value }}</option>
                    </select>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <label class="ml-1">Notas</label>
                    <textarea type="text" v-model="customer.notes" rows="5"></textarea>
                </div>
            </div>

        </div>
        <div class="modal-footer">
            <button class="btn l-red modal-close">Cancelar</button>
            <button class="btn l-notify modal-close" @click="customerInsert">Guardar</button>
        </div>
    </div>
</div>
