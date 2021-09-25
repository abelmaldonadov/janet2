<%-- 
    Document   : edit
    Created on : 08/09/2021, 12:20:52 AM
    Author     : abelm
--%>

<!-- MODAL -->
<div class="modal" id="editModal">
    <div class="content white">
        <div class="modal-header">
            <h4>Editar vendedor: <span class="text-notify">{{ vendor.name }}</span> / Id: <span class="text-notify">{{ vendor.id }}</span></h4>
        </div>
        <div class="modal-body">

            <div class="row">
                <div class="col">
                    <label class="ml-1">Nombre</label>
                    <input type="text" v-model="vendor.name">
                </div>
            </div>
            <div class="row">
                <div class="col md-3">
                    <label class="ml-1">Tratos hechos</label>
                    <input type="text" readonly v-model="vendor.deals">
                </div>
                <div class="col md-3">
                    <label class="ml-1">Calificación</label>
                    <select v-model="vendor.score">
                        <option v-for="item in info.score" :value="item.key">{{ item.value }}</option>
                    </select>
                </div>
                <div class="col md-3">
                    <label class="ml-1">Mérito</label>
                    <select v-model="vendor.merit">
                        <option v-for="item in info.bool" :value="item.key">{{ item.value }}</option>
                    </select>
                </div>
                <div class="col md-3">
                    <label class="ml-1">Estado</label>
                    <select v-model="vendor.state">
                        <option v-for="item in info.states" :value="item.key">{{ item.value }}</option>
                    </select>
                </div>
            </div>
            <div class="row">
                <div class="col md-6">
                    <label class="ml-1">Teléfono</label>
                    <input type="text" v-model="vendor.phone">
                </div>
                <div class="col md-6">
                    <label class="ml-1">Correo electrónico</label>
                    <input type="text" v-model="vendor.email">
                </div>
            </div>
            <div class="row">
                <div class="col md-6">
                    <label class="ml-1">Dirección</label>
                    <input type="text" v-model="vendor.addr">
                </div>
                <div class="col md-6">
                    <label class="ml-1">Canal</label>
                    <select v-model="vendor.channel">
                        <option v-for="item in info.channel" :value="item.key">{{ item.value }}</option>
                    </select>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <label class="ml-1">Notas</label>
                    <textarea type="text" v-model="vendor.notes" rows="5"></textarea>
                </div>
            </div>

        </div>
        <div class="modal-footer">
            <button class="btn l-red modal-close">Cancelar</button>
            <button class="btn l-notify modal-close" @click="vendorUpdate">Guardar</button>
        </div>
    </div>
</div>
