<%-- 
    Document   : deliveries
    Created on : 08/09/2021, 12:26:41 AM
    Author     : abelm
--%>

<!-- MODAL -->
<div class="modal" id="deliveriesModal">
    <div class="modal-content white">
        <div class="modal-header">
            <h5>Entregas programadas</h5>
        </div>
        <div class="modal-body">
            
            <div class="row">
                <div class="col lg-6" v-for="item in arrDeliveriesComp">
                    
                    <div class="control border">
                        <div class="control-header">
                            <h6>{{ item.productName }}</h6>
                        </div>
                        <div class="control-body">
                            <table>
                                <tbody>
                                    <tr>
                                        <td>Vendedor</td>
                                        <td>{{ item.vendorName }}</td>
                                    </tr>
                                    <tr>
                                        <td>Cliente</td>
                                        <td>{{ item.customer }}</td>
                                    </tr>
                                    <tr>
                                        <td>Lugar de entrega</td>
                                        <td>{{ item.deliveryPlace }}</td>
                                    </tr>
                                    <tr>
                                        <td>Fecha de entrega</td>
                                        <td>{{ item.deliveryDate }}</td>
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
