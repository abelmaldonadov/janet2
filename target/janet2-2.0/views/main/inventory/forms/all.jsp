<%-- 
    Document   : all
    Created on : 08/09/2021, 12:45:44 AM
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
                        <th>Tienda</th>
                        <th>Producto</th>
                        <th>P. Lista</th>
                        <th>Id Compra</th>
                        <th>Stock Ini.</th>
                        <th>Stock Act.</th>
                        <th>Estado</th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="item in arrInventories10Comp">
                        <th>{{ item.id }}</th>
                        <td>{{ item.storeName }}</td>
                        <td>{{ item.productName }}</td>
                        <td>{{ item.listPrice }}</td>
                        <td>{{ item.purchaseId }}</td>
                        <td>{{ item.initialStock }}</td>
                        <td>{{ item.stock }}</td>
                        <td>{{ getAux("states", item.state).value }}</td>
                        <td class="w-10px" 
                            onclick="Mandarina.modalShow('#editModal')" 
                            @click="inventoryGet(item)">&#128230;</td> <!--Editar-->
                    </tr>
                </tbody>
            </table>

        </div>
        <div class="modal-footer">
            <button class="btn l-notify modal-close">Cerrar</button>
        </div>
    </div>
</div>

