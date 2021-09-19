<%-- 
    Document   : new
    Created on : 08/09/2021, 12:25:05 AM
    Author     : abelm
--%>

<!-- MODAL -->
<div class="modal" id="newModal">
    <div class="content white">
        <div class="modal-header">
            <h4>Nueva venta</h4>
        </div>
        <div class="modal-body">

            <div class="row">
                <div class="col">
                    <label class="ml-1">Producto</label>
                    <select v-model="sale.inventoryId">
                        <option v-for="item in arrInventories" :value="item.id" v-if="item.state=='A'">{{ item.productName }}</option>
                    </select>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <label class="ml-1">Cliente</label>
                    <select v-model="sale.customerId">
                        <option v-for="item in arrCustomers" :value="item.id" v-if="item.state=='A' && item.blacklist==0">{{ item.name }}</option>
                    </select>
                </div>
            </div>
            <div class="row">
                <div class="col md-4">
                    <label class="ml-1">Precio unitario</label>
                    <input type="text" v-model="sale.unitPrice">
                </div>
                <div class="col md-4">
                    <label class="ml-1">Cantidad</label>
                    <input type="text" v-model="sale.amount">
                </div>
                <div class="col md-4">
                    <label class="ml-1">Subtotal</label>
                    <input type="text" v-model="sale.totalPrice">
                </div>
            </div>
            <div class="row">
                <div class="col md-4">
                    <label class="ml-1">F. Entrega</label>
                    <input type="date" v-model="sale.deliveryDate">
                </div>
                <div class="col md-4">
                    <label class="ml-1">Pagado</label>
                    <select v-model="sale.payment">
                        <option v-for="item in info.bool" :value="item.key">{{ item.value }}</option>
                    </select>
                </div>
                <div class="col md-4">
                    <label class="ml-1">Estado</label>
                    <select v-model="sale.state">
                        <option v-for="item in info.states" :value="item.key">{{ item.value }}</option>
                    </select>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <label class="ml-1">Notas</label>
                    <textarea type="text" v-model="sale.notes" rows="5"></textarea>
                </div>
            </div>

        </div>
        <div class="modal-footer">
            <button class="btn l-red modal-close">Cancelar</button>
            <button class="btn l-notify modal-close" @click="saleInsert">Guardar</button>
        </div>
    </div>
</div>
