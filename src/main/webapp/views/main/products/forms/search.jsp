<%-- 
    Document   : search
    Created on : 07/09/2021, 10:13:14 PM
    Author     : abelm
--%>

<!-- MODAL -->
<div class="modal" id="searchModal">
    <div class="modal-content white">
        <div class="modal-header">
            <h5>Buscar producto</h5>
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
                        <option>Por Nombre</option>
                        <option>Por Categoría</option>
                        <option>Por Tag</option>
                        <option>Por Marca</option>
                        <option>Por Modelo</option>
                    </select>
                </div>
            </div>

        </div>
        <div class="modal-footer">
            <button class="btn red modal-close">Cancelar</button>
            <button class="btn green" @click="productSearch">Buscar</button>
        </div>
    </div>
</div>
