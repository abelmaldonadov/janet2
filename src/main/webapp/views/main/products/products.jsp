<%-- 
    Document   : products
    Created on : 06/09/2021, 08:40:40 PM
    Author     : abelm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${title}</title>
        <%@include file="../../templates/styles.jsp" %>
    </head>
    <body>
        
        <%@include file="../../templates/navbar.jsp" %>
        
        <main class="container py-10" id="app">
            
            <div class="shadow white p-2 my-3 text-right">
                <button class="btn btn-lg ml-1 modal-open">&#128202;</button> <!--Reportes-->
                <button class="btn btn-lg ml-1 modal-open" data-target="#searchModal">&#128269;</button> <!--Buscar-->
                <button class="btn btn-lg ml-1 modal-open" data-target="#allModal">&#128194;</button> <!--Todos-->
                <button class="btn btn-lg ml-1 modal-open" data-target="#newModal" @click="clearForm">&#128195;</button> <!--Nuevo-->
            </div>
            
            <div class="row">
                <div class="col lg-3" v-for="item in arrProducts10Comp">

                    <div class="card white radius shadow pointer" style="height:300px;"onclick="show('#editModal')" @click="productGet(item)">
                        <div class="card-header">
                            <img src="https://source.unsplash.com/random?shipping">
                        </div>
                        <div class="card-body">
                            <h6>{{ item.name }}</h6>
                            <p>{{ item.id }}</p>
                            <p>{{ getAux("category", item.category).value }}</p>
                            <p class="text-purple">{{ getAux("tags", item.tag).value }}</p>
                            <p :class="'text-'+getAux('states', item.state).color">{{ getAux("states", item.state).value }}</p>
                        </div>
                    </div>

                </div>
            </div>
            
            
            <!--Products-->
            <%@include file="forms/search.jsp" %>
            <%@include file="forms/all.jsp" %>
            <%@include file="forms/new.jsp" %>
            <%@include file="forms/edit.jsp" %>
            
            
        </main>
        
        <%@include file="../../templates/vue.jsp" %>
        <script src="${context}/views/main/products/products.js"></script>
        <%@include file="../../templates/scripts.jsp" %>
        
    </body>
</html>
