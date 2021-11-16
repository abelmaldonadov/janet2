<%-- 
    Document   : all
    Created on : 08/09/2021, 12:24:58 AM
    Author     : abelm
--%>

<!-- MODAL -->
<div class="modal" id="allModal">
    <div class="modal-content white">
        <div class="modal-header">
            <h5>Todas las compras</h5>
        </div>
        <div class="modal-body">

            <!-- TABLE -->
            <table class="table">
                <thead>
                    <tr>
                        <th>Fecha</th>
                        <th>Producto</th>
                        <th>Proveedor</th>
                        <th>F. Llegada</th>
                        <th>Unitario</th>
                        <th>Cantidad</th>
                        <th>Subtotal</th>
                        <th>Estado</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="item in arrPurchases10Comp">
                        <th>{{ item.dateIns }}</th>
                        <td>{{ item.productName }}</td>
                        <td>{{ item.providerName }}</td>
                        <td>{{ item.arrivalDate }}</td>
                        <td>{{ item.unitary }}</td>
                        <td>{{ item.quantity }}</td>
                        <td>{{ item.totalCost }}</td>
                        <td :class="'text-'+getAux('states', item.state).color">{{ getAux("states", item.state).value }}</td>
                        <td class="w-10px" 
                            onclick="show('#editModal')" 
                            @click="purchaseGet(item)">&#128221;</td> <!--Editar-->
                    </tr>
                </tbody>
            </table>

        </div>
        <div class="modal-footer">
            <button class="btn notify modal-close">Cerrar</button>
        </div>
    </div>
</div>
