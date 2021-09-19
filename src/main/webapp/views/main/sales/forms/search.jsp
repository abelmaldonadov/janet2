<%-- 
    Document   : search
    Created on : 08/09/2021, 12:25:19 AM
    Author     : abelm
--%>

<!-- MODAL -->
<div class="modal" id="searchModal">
    <div class="content white">
        <div class="modal-header">
            <h4>Buscar venta</h4>
        </div>
        <div class="modal-body">

            <div class="row">
                <div class="col md-8">
                    <label class="ml-1">Texto a buscar</label>
                    <input type="text">
                </div>
                <div class="col md-4">
                    <label class="ml-1">Criterio</label>
                    <select id="select">
                        <option selected>Por Id</option>
                        <option>Por Fecha de entrega</option>
                        <option>Por Fecha de inserción</option>
                    </select>
                </div>
            </div>

        </div>
        <div class="modal-footer">
            <button class="btn l-red modal-close">Cancelar</button>
            <button class="btn l-notify" @click="saleSearch">Buscar</button>
        </div>
    </div>
</div>
