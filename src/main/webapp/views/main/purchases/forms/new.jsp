<%-- 
    Document   : new
    Created on : 08/09/2021, 12:25:05 AM
    Author     : abelm
--%>

<!-- MODAL -->
<div class="modal" id="newModal">
    <div class="content white">
        <div class="modal-header">
            <h4>Nueva compra</h4>
        </div>
        <div class="modal-body">

            <div class="row">
                <div class="col md-6">
                    <label class="ml-1">Producto</label>
                    <select v-model="purchase.productId">
                        <option v-for="item in arrProducts" :value="item.id" v-if="item.state=='A'">{{ item.name }}</option>
                    </select>
                </div>
                <div class="col md-6">
                    <label class="ml-1">Proveedor</label>
                    <select v-model="purchase.providerId">
                        <option v-for="item in arrProviders" :value="item.id" v-if="item.state=='A' && item.blacklist==0">{{ item.name }}</option>
                    </select>
                </div>
            </div>
            <div class="row">
                <div class="col md-4">
                    <label class="ml-1">Cantidad</label>
                    <input type="number" min="0" v-model="purchase.amount">
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
            <button class="btn l-notify modal-close" @click="purchaseInsert">Guardar</button>
        </div>
    </div>
</div>
