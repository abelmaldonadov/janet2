<%-- 
    Document   : spents
    Created on : 08/09/2021, 12:26:41 AM
    Author     : abelm
--%>

<!-- MODAL -->
<div class="modal" id="spentsModal">
    <div class="modal-content white">
        <div class="modal-header">
            <h5>Inventarios agotados</h5>
        </div>
        <div class="modal-body">
            
            <div class="row">
                <div class="col lg-6" v-for="item in arrSpentsComp">
                    
                    <div class="control border">
                        <div class="control-header">
                            <h6>{{ item.productName }}</h6>
                        </div>
                        <div class="control-body">
                            <table>
                                <tbody>
                                    <tr>
                                        <td>Id Inv.</td>
                                        <td>{{ item.id }}</td>
                                    </tr>
                                    <tr>
                                        <td>Vendidos</td>
                                        <td>{{ item.initialStock - item.stock }}</td>
                                    </tr>
                                    <tr>
                                        <td>Precio de lista</td>
                                        <td>{{ item.listPrice }}</td>
                                    </tr>
                                    <tr>
                                        <td>Total recaudado</td>
                                        <td>{{ item.listPrice * (item.initialStock - item.stock) }}</td>
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
