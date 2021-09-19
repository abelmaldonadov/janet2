<%-- 
    Document   : all
    Created on : 08/09/2021, 12:24:58 AM
    Author     : abelm
--%>

<!-- MODAL -->
<div class="modal" id="allModal">
    <div class="content white">
        <div class="modal-header">
            <h4>Todas las ventas</h4>
        </div>
        <div class="modal-body">

            <!-- TABLE -->
            <table class="table">
                <thead>
                    <tr>
                        <th>Fecha</th>
                        <th>Producto</th>
                        <th>P. Unitario</th>
                        <th>Cantidad</th>
                        <th>Subtotal</th>
                        <th>F. Entrega</th>
                        <th>Pago</th>
                        <th>Estado</th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="item in arrSales">
                        <th>{{ item.dateIns }}</th>
                        <td>{{ item.productName }}</td>
                        <td>{{ item.unitPrice }}</td>
                        <td>{{ item.amount }}</td>
                        <td>{{ item.totalPrice }}</td>
                        <td>{{ item.deliveryDate }}</td>
                        <td>{{ item.payment }}</td>
                        <td>{{ getAux("states", item.state).value }}</td>
                        <td class="w-10px" 
                            onclick="Mandarina.modalShow('#editModal')" 
                            @click="saleGet(item)">&#128221;</td> <!--Editar-->
                    </tr>
                </tbody>
            </table>

        </div>
        <div class="modal-footer">
            <button class="btn l-notify modal-close">Cerrar</button>
        </div>
    </div>
</div>
