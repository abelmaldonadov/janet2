<%-- 
    Document   : blacklist
    Created on : 08/09/2021, 12:22:09 AM
    Author     : abelm
--%>

<!-- MODAL -->
<div class="modal" id="blacklistModal">
    <div class="modal-content white">
        <div class="modal-header">
            <h5>Lista negra</h5>
        </div>
        <div class="modal-body">
            
            <div class="row">
                <div class="col lg-6" v-for="item in arrBlacklistComp">
                    
                    <div class="control border">
                        <div class="control-header">
                            <h6>{{ item.name }}</h6>
                        </div>
                        <div class="control-body">
                            <table>
                                <tbody>
                                    <tr>
                                        <td>Id prov.</td>
                                        <td>{{ item.id }}</td>
                                    </tr>
                                    <tr>
                                        <td>Canal</td>
                                        <td>{{ getAux("channel", item.channel).value }}</td>
                                    </tr>
                                    <tr>
                                        <td>Tratos hechos</td>
                                        <td>{{ item.deals }}</td>
                                    </tr>
                                    <tr>
                                        <td>Notas</td>
                                        <td>{{ item.notes }}</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    
                </div>
            </div>

        </div>
        <div class="modal-footer white">
            <button class="btn notify modal-close">Cerrar</button>
        </div>
    </div>
</div>