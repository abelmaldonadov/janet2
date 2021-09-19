<%-- 
    Document   : costs
    Created on : 07/09/2021, 10:32:12 PM
    Author     : abelm
--%>

<!-- MODAL -->
<div class="modal" id="costsModal">
    <div class="content white">
        <div class="modal-header">
            <h4>Costos del producto: <span class="text-notify">{{ product.name }}</span> / Fecha Act. <span class="text-notify">{{ cost.dateIns }}</span></h4>
        </div>
        <div class="modal-body">

            <div class="row">
                <div class="col md-3">
                    <label class="ml-1">C. Producto</label>
                    <input type="number" v-model="cost.product">
                </div>
                <div class="col md-3">
                    <label class="ml-1">C. Envío</label>
                    <input type="number" v-model="cost.shipping">
                </div>
                <div class="col md-3">
                    <label class="ml-1">C. Impuestos</label>
                    <input type="number" v-model="cost.taxes">
                </div>
                <div class="col md-3">
                    <label class="ml-1">Otros costos</label>
                    <input type="number" v-model="cost.others">
                </div>
            </div>
            <div class="row">
                <div class="col md-3">
                    <label class="ml-1">C. Unitario</label>
                    <input type="number" v-model="cost.unitary">
                </div>
                <div class="col md-3">
                    <label class="ml-1">Precio de lista</label>
                    <input type="number" v-model="cost.listPrice">
                </div>
                <div class="col md-6">
                    <label class="ml-1">Ganancia</label>
                    <input type="number" v-model="cost.profit">
                </div>
            </div>

        </div>
        <div class="modal-footer">
            <button class="btn l-red modal-close">Cerrar</button>
            <button class="btn l-notify modal-close" @click="costInsert">Guardar</button>
        </div>
    </div>
</div>
