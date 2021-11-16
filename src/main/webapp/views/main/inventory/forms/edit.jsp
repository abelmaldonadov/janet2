<%-- 
    Document   : edit
    Created on : 08/09/2021, 12:56:25 AM
    Author     : abelm
--%>

<!-- MODAL -->
<div class="modal" id="editModal">
    <div class="modal-content white">
        <div class="modal-header">
            <h5>Editar inventario: <span class="text-notify">{{ inventory.id }}</span></h5>
        </div>
        <div class="modal-body">

            <div class="row">
                <div class="col md-4">
                    <label class="ml-1">Tienda</label>
                    <input type="text" readonly v-model="inventory.storeName">
                </div>
                <div class="col md-8">
                    <label class="ml-1">Producto</label>
                    <input type="text" readonly v-model="inventory.productName">
                </div>
            </div>
            <div class="row">
                <div class="col md-4">
                    <label class="ml-1">Id de compra</label>
                    <input type="text" readonly v-model="inventory.purchaseId">
                </div>
                <div class="col md-4">
                    <label class="ml-1">Precio de lista</label>
                    <input type="text" v-model="inventory.listPrice">
                </div>
                <div class="col md-4">
                    <label class="ml-1">Estado</label>
                    <select v-model="inventory.state">
                        <option v-for="item in info.states" :value="item.key">{{ item.value }}</option>
                    </select>
                </div>
            </div>
            <div class="row">
                <div class="col md-4">
                    <label class="ml-1">Stock inicial</label>
                    <input type="number" readonly readonly v-model="inventory.initialStock">
                </div>
                <div class="col md-4">
                    <label class="ml-1">Stock mínimo</label>
                    <input type="number" readonly v-model="inventory.minStock">
                </div>
                <div class="col md-4">
                    <label class="ml-1">Stock</label>
                    <input type="number" readonly readonly v-model="inventory.stock">
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <label class="ml-1">UPC</label>
                    <input type="text" v-model="inventory.upc">
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <label class="ml-1">Notas</label>
                    <textarea v-model="inventory.notes" rows="5"></textarea>
                </div>
            </div>

        </div>
        <div class="modal-footer">
            <button class="btn red modal-close">Cancelar</button>
            <button class="btn green modal-close" @click="inventoryUpdate">Guardar</button>
        </div>
    </div>
</div>
