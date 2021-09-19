<%-- 
    Document   : spents
    Created on : 08/09/2021, 12:26:41 AM
    Author     : abelm
--%>

<!-- MODAL -->
<div class="modal" id="spentsModal">
    <div class="content white">
        <div class="modal-header">
            <h4>Inventarios agotados</h4>
        </div>
        <div class="modal-body">

            <!-- ALERT -->
            <div class="alert l-red" v-for="item in arrSpentsComp">
                <b class="text-13">{{ item.productName }}</b>
                <p>Id Inv.:  {{ item.id }}</p>
                <p>Vendidos: {{ item.initialStock - item.stock }}</p>
                <p>Stock:  {{ item.stock }}</p>
            </div>

        </div>
        <div class="modal-footer">
            <button class="btn l-notify modal-close">Cerrar</button>
        </div>
    </div>
</div>
