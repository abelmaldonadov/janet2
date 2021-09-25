<%-- 
    Document   : all
    Created on : 08/09/2021, 12:20:43 AM
    Author     : abelm
--%>

<!-- MODAL -->
<div class="modal" id="allModal">
    <div class="content white">
        <div class="modal-header">
            <h4>Todos los proveedores</h4>
        </div>
        <div class="modal-body">

            <!-- TABLE -->
            <table class="table">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Nombre</th>
                        <th>Canal</th>
                        <th>Web</th>
                        <th>Tratos</th>
                        <th>Calificaci�n</th>
                        <th>Estado</th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="item in arrProviders">
                        <th>{{ item.id }}</th>
                        <td>{{ item.name }}</td>
                        <td>{{ getAux("channel", item.channel).value }}</td>
                        <td>{{ item.web }}</td>
                        <td>{{ item.deals }}</td>
                        <td>{{ getAux("score", item.score).value }}</td>
                        <td>{{ getAux("states", item.state).value }}</td>
                        <td class="w-10px" 
                            onclick="Mandarina.modalShow('#editModal')" 
                            @click="providerGet(item)">&#128221;</td> <!--Editar-->
                    </tr>
                </tbody>
            </table>

        </div>
        <div class="modal-footer">
            <button class="btn l-notify modal-close">Cerrar</button>
        </div>
    </div>
</div>
