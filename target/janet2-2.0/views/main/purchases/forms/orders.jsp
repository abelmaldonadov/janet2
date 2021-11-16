<%-- 
    Document   : orders
    Created on : 08/09/2021, 12:26:41 AM
    Author     : abelm
--%>

<!-- MODAL -->
<div class="modal" id="ordersModal">
    <div class="modal-content white">
        <div class="modal-header">
            <h5>Pedidos</h5>
        </div>
        <div class="modal-body">
            
            <div class="row">
                <div class="col lg-6" v-for="item in arrOrdersComp">
                    
                    <div class="control border">
                        <div class="control-header">
                            <h6>{{ item.productName }}</h6>
                        </div>
                        <div class="control-body">
                            <table>
                                <tbody>
                                    <tr>
                                        <td>Proveedor</td>
                                        <td>{{ item.providerName }}</td>
                                    </tr>
                                    <tr>
                                        <td>Importe pagado</td>
                                        <td>{{ item.totalCost }}</td>
                                    </tr>
                                    <tr>
                                        <td>Cantidad de productos</td>
                                        <td>{{ item.quantity }}</td>
                                    </tr>
                                    <tr>
                                        <td>Fecha de llegada</td>
                                        <td>{{ item.arrivalDate }}</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    
                </div>
            </div>

        </div>
        <div class="modal-footer">
            <button class="btn notify modal-close">Cerrar</button>
        </div>
    </div>
</div>
