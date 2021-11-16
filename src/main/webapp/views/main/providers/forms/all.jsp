<%-- 
    Document   : all
    Created on : 08/09/2021, 12:20:43 AM
    Author     : abelm
--%>

<!-- MODAL -->
<div class="modal" id="allModal">
    <div class="modal-content white">
        <div class="modal-header">
            <h5>Todos los proveedores</h5>
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
                        <th>Calificación</th>
                        <th>Estado</th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="item in arrProviders" onclick="show('#editModal')" @click="providerGet(item)">
                        <th>{{ item.id }}</th>
                        <td>{{ item.name }}</td>
                        <td>{{ getAux("channel", item.channel).value }}</td>
                        <td>{{ item.web }}</td>
                        <td>{{ item.deals }}</td>
                        <td><span v-for="star in parseInt(item.score)">&#11088;</span></td>
                        <td :class="'text-'+getAux('states', item.state).color">{{ getAux("states", item.state).value }}</td>
                    </tr>
                </tbody>
            </table>

        </div>
        <div class="modal-footer">
            <button class="btn notify modal-close">Cerrar</button>
        </div>
    </div>
</div>
