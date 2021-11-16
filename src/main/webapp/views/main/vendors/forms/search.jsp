<%-- 
    Document   : search
    Created on : 08/09/2021, 12:21:07 AM
    Author     : abelm
--%>

<!-- MODAL -->
<div class="modal" id="searchModal">
    <div class="modal-content white">
        <div class="modal-header">
            <h5>Buscar Vendedor</h5>
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
                        <option>Por Canal</option>
                        <option>Por Telefono</option>
                        <option>Por Correo Electrónico</option>
                        <option>Por Calificación</option>
                    </select>
                </div>
            </div>

        </div>
        <div class="modal-footer">
            <button class="btn red modal-close">Cancelar</button>
            <button class="btn green" @click="vendorSearch">Buscar</button>
        </div>
    </div>
</div>
