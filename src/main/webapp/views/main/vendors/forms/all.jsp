<%-- 
    Document   : all
    Created on : 08/09/2021, 12:20:43 AM
    Author     : abelm
--%>

<!-- MODAL -->
<div class="modal" id="allModal">
    <div class="modal-content white">
        <div class="modal-header">
            <h5>Todos los Vendedores</h5>
        </div>
        <div class="modal-body">

            <!-- TABLE -->
            <table class="table">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Nombre</th>
                        <th>Tratos</th>
                        <th>Calificación</th>
                        <th>Estado</th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="item in arrVendors10Comp" onclick="show('#editModal')" @click="vendorGet(item)">
                        <th>{{ item.id }}</th>
                        <td>{{ item.name }}</td>
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
