<%-- 
    Document   : orders
    Created on : 08/09/2021, 12:26:41 AM
    Author     : abelm
--%>

<!-- MODAL -->
<div class="modal" id="ordersModal">
    <div class="content white">
        <div class="modal-header">
            <h4>Pedidos</h4>
        </div>
        <div class="modal-body">

            <!-- ALERT -->
            <div class="alert l-yellow" v-for="item in arrOrdersComp">
                <b class="text-13">{{ item.productName }}</b>
                <p>Proveedor: {{ item.providerName }}</p>
                <p>Fecha de llegada: {{ item.arrivalDate }}</p>
            </div>

        </div>
        <div class="modal-footer">
            <button class="btn l-notify modal-close">Cerrar</button>
        </div>
    </div>
</div>
