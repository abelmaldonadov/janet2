<%-- 
    Document   : all
    Created on : 08/09/2021, 12:20:43 AM
    Author     : abelm
--%>

<!-- MODAL -->
<div class="modal" id="allModal">
    <div class="content white">
        <div class="modal-header">
            <h4>Todos los Clientes</h4>
        </div>
        <div class="modal-body">

            <!-- TABLE -->
            <table class="table">
                <thead>
                    <tr>
                        <th>Canal</th>
                        <th>Nombre</th>
                        <th>Teléfono</th>
                        <th>Correo</th>
                        <th>Dirección</th>
                        <th>Calificación</th>
                        <th>Estado</th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="item in arrCustomers10Comp">
                        <th>{{ getAux("channel", item.channel).value }}</th>
                        <td>{{ item.name }}</td>
                        <td>{{ item.phone }}</td>
                        <td>{{ item.email }}</td>
                        <td>{{ item.addr }}</td>
                        <td>{{ getAux("score", item.score).value }}</td>
                        <td>{{ getAux("states", item.state).value }}</td>
                        <td class="w-10px" 
                            onclick="Mandarina.modalShow('#editModal')" 
                            @click="customerGet(item)">&#128221;</td>
                    </tr>
                </tbody>
            </table>

        </div>
        <div class="modal-footer">
            <button class="btn l-notify modal-close">Cerrar</button>
        </div>
    </div>
</div>
