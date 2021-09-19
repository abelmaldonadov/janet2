<%-- 
    Document   : all
    Created on : 07/09/2021, 10:13:53 PM
    Author     : abelm
--%>

<!-- MODAL -->
<div class="modal" id="allModal">
    <div class="content white">
        <div class="modal-header">
            <h4>Todos los productos</h4>
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
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="item in arrProducts">
                        <th>{{ item.id }}</th>
                        <td>{{ getAux("category", item.category).value }}</td>
                        <td>{{ item.name }}</td>
                        <td>{{ item.brand }}</td>
                        <td>{{ item.model }}</td>
                        <td>{{ item.tag }}</td>
                        <td>{{ getAux("states", item.state).value }}</td>
                        <td class="w-10px" 
                            onclick="Mandarina.modalShow('#costsModal')" 
                            @click="productGet(item)">&#128176;</td> <!--Costos-->
                        <td class="w-10px" 
                            onclick="Mandarina.modalShow('#editModal')" 
                            @click="productGet(item)">&#128221;</td> <!--Editar-->
                    </tr>
                </tbody>
            </table>

        </div>
        <div class="modal-footer">
            <button class="btn l-notify modal-close">Cerrar</button>
        </div>
    </div>
</div>
