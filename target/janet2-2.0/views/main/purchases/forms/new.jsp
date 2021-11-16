<%-- 
    Document   : new
    Created on : 08/09/2021, 12:25:05 AM
    Author     : abelm
--%>

<!-- MODAL -->
<div class="modal" id="newModal">
    <div class="modal-content white">
        <div class="modal-header">
            <h5>Nueva compra</h5>
        </div>
        <div class="modal-body">

            <div class="row">
                <div class="col">
                    <label class="ml-1">Producto</label>
                    <select v-model="purchase.productId">
                        <option v-for="item in arrProducts" :value="item.id" v-if="item.state=='A'">{{ item.name }}</option>
                    </select>
                </div>
            </div>
            <div class="row">
                <div class="col md-9">
                    <label class="ml-1">Proveedor</label>
                    <select v-model="purchase.providerId">
                        <option v-for="item in arrProviders" :value="item.id" v-if="item.state=='A' && item.blacklist==0">{{ item.name }}</option>
                    </select>
                </div>
                <div class="col md-3">
                    <label class="ml-1">Fecha de llegada</label>
                    <input type="date" v-model="purchase.arrivalDate">
                </div>
            </div>
            <div class="row">
                <div class="col md-3">
                    <label class="ml-1">Costo del producto</label>
                    <input type="number" min="0" v-model="purchase.product">
                </div>
                <div class="col md-3">
                    <label class="ml-1">Costo del envío</label>
                    <input type="number" v-model="purchase.shipping">
                </div>
                <div class="col md-3">
                    <label class="ml-1">Costo impuestos</label>
                    <input type="number" v-model="purchase.taxes">
                </div>
                <div class="col md-3">
                    <label class="ml-1">Otros costos</label>
                    <input type="number" v-model="purchase.others">
                </div>
            </div>
            <div class="row">
                <div class="col md-3">
                    <label class="ml-1">Costo unitario</label>
                    <input type="number" min="0" v-model="purchase.unitary">
                </div>
                <div class="col md-3">
                    <label class="ml-1">Cantidad</label>
                    <input type="number" min="0" v-model="purchase.quantity">
                </div>
                <div class="col md-3">
                    <label class="ml-1">Subtotal</label>
                    <input type="number" min="0" v-model="purchase.totalCost">
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
                    <textarea type="text" v-model="purchase.notes" rows="5"></textarea>
                </div>
            </div>

        </div>
        <div class="modal-footer">
            <button class="btn red modal-close">Cancelar</button>
            <button class="btn green modal-close" @click="purchaseInsert">Guardar</button>
        </div>
    </div>
</div>
