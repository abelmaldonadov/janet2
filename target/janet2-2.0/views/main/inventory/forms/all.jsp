<%-- 
    Document   : all
    Created on : 08/09/2021, 12:45:44 AM
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
                        <th>Tienda</th>
                        <th>UPC</th>
                        <th>Producto</th>
                        <th>P. Lista</th>
                        <th>Id Compra</th>
                        <th>Stock Ini.</th>
                        <th>Stock Act.</th>
                        <th>Estado</th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="item in arrInventories" onclick="show('#editModal')" @click="inventoryGet(item)">
                        <th>{{ item.id }}</th>
                        <td>{{ item.storeName }}</td>
                        <th>{{ item.upc }}</th>
                        <td>{{ item.productName }}</td>
                        <td class="text-purple">{{ item.listPrice }}</td>
                        <td>{{ item.purchaseId }}</td>
                        <td>{{ item.initialStock }}</td>
                        <td>{{ item.stock }}</td>
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

