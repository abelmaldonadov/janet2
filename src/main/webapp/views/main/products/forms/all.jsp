<%-- 
    Document   : all
    Created on : 07/09/2021, 10:13:53 PM
    Author     : abelm
--%>

<!-- MODAL -->
<div class="modal" id="allModal">
    <div class="modal-content white">
        <div class="modal-header">
            <h5>Todos los productos</h5>
        </div>
        <div class="modal-body">

            <!-- TABLE -->
            <table class="table">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Categoría</th>
                        <th>Nombre</th>
                        <th>Marca</th>
                        <th>Modelo</th>
                        <th>Etiqueta</th>
                        <th>Estado</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="item in arrProducts">
                        <th>{{ item.id }}</th>
                        <td>{{ getAux("category", item.category).value }}</td>
                        <td>{{ item.name }}</td>
                        <td>{{ item.brand }}</td>
                        <td>{{ item.model }}</td>
                        <td class="text-purple">{{ getAux("tags", item.tag).value }}</td>
                        <td :class="'text-'+getAux('states', item.state).color">{{ getAux("states", item.state).value }}</td>
                        <td class="w-10px" 
                            onclick="Mandarina.modalShow('#editModal')" 
                            @click="productGet(item)">&#128221;</td> <!--Editar-->
                    </tr>
                </tbody>
            </table>

        </div>
        <div class="modal-footer">
            <button class="btn notify modal-close">Cerrar</button>
        </div>
    </div>
</div>
