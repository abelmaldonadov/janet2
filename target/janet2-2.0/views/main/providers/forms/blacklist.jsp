<%-- 
    Document   : blacklist
    Created on : 08/09/2021, 12:22:09 AM
    Author     : abelm
--%>

<!-- MODAL -->
<div class="modal" id="blacklistModal">
    <div class="content white">
        <div class="modal-header">
            <h4>Lista negra</h4>
        </div>
        <div class="modal-body">

            <!-- ALERT -->
            <div class="alert dark" v-for="item in arrBlacklistComp">
                <b class="text-13">{{ item.name }}</b>
                <p>Id: {{ item.id }}</p>
                <p>Motivo: {{ item.notes }}</p>
            </div>

        </div>
        <div class="modal-footer">
            <button class="btn l-notify modal-close">Cerrar</button>
        </div>
    </div>
</div>