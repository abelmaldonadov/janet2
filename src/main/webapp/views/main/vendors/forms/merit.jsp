<%-- 
    Document   : merit
    Created on : 08/09/2021, 12:22:09 AM
    Author     : abelm
--%>

<!-- MODAL -->
<div class="modal" id="meritModal">
    <div class="content white">
        <div class="modal-header">
            <h4>Vendedores sobresalientes</h4>
        </div>
        <div class="modal-body">

            <!-- ALERT -->
            <div class="alert l-yellow" v-for="item in arrMeritComp">
                <b class="text-13">{{ item.name }}</b>
                <p>Id: {{ item.id }}</p>
                <p>Ventas: {{ item.deals }}</p>
            </div>

        </div>
        <div class="modal-footer">
            <button class="btn l-notify modal-close">Cerrar</button>
        </div>
    </div>
</div>