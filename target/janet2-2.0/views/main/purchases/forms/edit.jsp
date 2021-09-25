<%-- 
    Document   : edit
    Created on : 08/09/2021, 12:25:11 AM
    Author     : abelm
--%>

<!-- MODAL -->
<div class="modal" id="editModal">
    <div class="content white">
        <div class="modal-header">
            <h4>Editar compra: <span class="text-notify">{{ purchase.id }}</span></h4>
        </div>
        <div class="modal-body">

            <div class="row">
                <div class="col">
                    <label class="ml-1">Producto</label>
                    <select disabled v-model="purchase.productId">
                        <option v-for="item in arrProducts" :value="item.id">{{ item.name }} : {{ item.unitary }}</option>
                    </select>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <label class="ml-1">Proveedor</label>
                    <select disabled v-model="purchase.providerId">
                        <option v-for="item in arrProviders" :value="item.id">{{ item.name }}</option>
                    </select>
                </div>
            </div>
            <div class="row">
                <div class="col md-4">
                    <label class="ml-1">Cantidad</label>
                    <input readonly type="number" min="0" v-model="purchase.amount">
                </div>
                <div class="col md-4">
                    <label class="ml-1">Fecha de llegada</label>
                    <input type="date" v-model="purchase.arrivalDate">
                </div>
                <div class="col md-4">
                    <label class="ml-1">Estado</label>
                    <select v-model="purchase.state">
                        <option v-for="item in info.states" :value="item.key">{{ item.value }}</option>
                    </select>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <label class="ml-1">Notas</label>
                    <textarea type="text" v-model="purchase.notes" rows="5"></textarea>
                </div>
            </div>

        </div>
        <div class="modal-footer">
            <button class="btn l-red modal-close">Cancelar</button>
            <button class="btn l-notify modal-close" @click="purchaseUpdate">Guardar</button>
        </div>
    </div>
</div>
