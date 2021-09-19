<%-- 
    Document   : deliveries
    Created on : 08/09/2021, 12:26:41 AM
    Author     : abelm
--%>

<!-- MODAL -->
<div class="modal" id="deliveriesModal">
    <div class="content white">
        <div class="modal-header">
            <h4>Entregas programadas</h4>
        </div>
        <div class="modal-body">

            <!-- ALERT -->
            <div class="alert l-yellow" v-for="item in arrDeliveriesComp">
                <b class="text-13">{{ item.productName }}</b>
                <p>Cliente:  {{ item.customerName }}</p>
                <p>Fecha de entrega: {{ item.deliveryDate }}</p>
            </div>

        </div>
        <div class="modal-footer">
            <button class="btn l-notify modal-close">Cerrar</button>
        </div>
    </div>
</div>
