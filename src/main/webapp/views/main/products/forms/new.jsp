<%-- 
    Document   : new
    Created on : 07/09/2021, 10:13:22 PM
    Author     : abelm
--%>

<!-- MODAL -->
<div class="modal" id="newModal">
    <div class="modal-content white">
        <div class="modal-header">
            <h5>Nuevo producto</h5>
        </div>
        <div class="modal-body">

            <div class="row">
                <div class="col md-4">
                    <label class="ml-1">Categoría</label>
                    <select v-model="product.category">
                        <option v-for="item in info.category" :value="item.key">{{ item.value }}</option>
                    </select>
                </div>
                <div class="col md-4">
                    <label class="ml-1">Tag</label>
                    <select v-model="product.tag">
                        <option v-for="item in info.tags" :value="item.key">{{ item.value }}</option>
                    </select>
                </div>
                <div class="col md-4">
                    <label class="ml-1">Estado</label>
                    <select v-model="product.state">
                        <option v-for="item in info.states" :value="item.key">{{ item.value }}</option>
                    </select>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <label class="ml-1">Nombre</label>
                    <input type="text" v-model="product.name">
                </div>
            </div>
            <div class="row">
                <div class="col md-4">
                    <label class="ml-1">Marca</label>
                    <input type="text" v-model="product.brand">
                </div>
                <div class="col md-4">
                    <label class="ml-1">Modelo</label>
                    <input type="text" v-model="product.model">
                </div>
                <div class="col md-4">
                    <label class="ml-1">Generación</label>
                    <input type="text" v-model="product.generation">
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <label class="ml-1">Detalle</label>
                    <textarea type="text" v-model="product.detail" rows="3"></textarea>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <label class="ml-1">Notas</label>
                    <textarea type="text" v-model="product.notes" rows="5"></textarea>
                </div>
            </div>

        </div>
        <div class="modal-footer">
            <button class="btn red modal-close">Cancelar</button>
            <button class="btn green modal-close" @click="productInsert">Guardar</button>
        </div>
    </div>
</div>