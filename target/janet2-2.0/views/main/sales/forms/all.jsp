<%-- 
    Document   : all
    Created on : 08/09/2021, 12:24:58 AM
    Author     : abelm
--%>

<!-- MODAL -->
<div class="modal" id="allModal">
    <div class="modal-content white">
        <div class="modal-header">
            <h5>Todas las ventas</h5>
        </div>
        <div class="modal-body">

            <!-- TABLE -->
            <table class="table">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Producto</th>
                        <th>Cliente</th>
                        <th>Subtotal</th>
                        <th>F. Entrega</th>
                        <th>Pagado</th>
                        <th>Canal</th>
                        <th>Estado</th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="item in arrSales" onclick="show('#editModal')" @click="saleGet(item)">
                        <th>{{ item.id }}</th>
                        <td>{{ item.productName }}</td>
                        <td>{{ item.customer }}</td>
                        <td>{{ item.totalPrice }}</td>
                        <td>{{ item.deliveryDate }}</td>
                        <td :class="'text-'+getAux('bool', item.payment).color">{{ getAux("bool", item.payment).value }}</td>
                        <td>{{ getAux("paymentChannel", item.channel).value }}</td>
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
