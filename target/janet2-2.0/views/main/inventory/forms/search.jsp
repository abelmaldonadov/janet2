<%-- 
    Document   : search
    Created on : 08/09/2021, 12:45:39 AM
    Author     : abelm
--%>

<!-- MODAL -->
<div class="modal" id="searchModal">
    <div class="modal-content white">
        <div class="modal-header">
            <h5>Buscar inventario</h5>
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
                        <option>Por Id de tienda</option>
                        <option>Por Id de producto</option>
                        <option>Por Stock</option>
                        <option>Por Estado</option>
                    </select>
                </div>
            </div>

        </div>
        <div class="modal-footer">
            <button class="btn red modal-close">Cancelar</button>
            <button class="btn green" @click="inventorySearch">Buscar</button>
        </div>
    </div>
</div>
