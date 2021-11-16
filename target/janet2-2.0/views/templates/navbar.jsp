<%-- 
    Document   : navbar
    Created on : 31/08/2021, 12:39:09 AM
    Author     : abelm
--%>

<!-- NAVBAR -->
<nav class="navbar white fixed" data-height="70px">
    <div class="container">
        <div class="brand">
            <a class="text-15" href="${context}/home">Janet 2.0</a>
        </div>
        <button class="menu-open" data-target="#menu1"></button>
        <div class="menu" id="menu1">
            <a class="item" href="${context}/home">Inicio</a>
            <div class="item dropdown">
                <span class="dropdown-open">Áreas</span>
                <div class="dropdown-content">
                    <a class="item" href="#">Inventario</a>
                    <a class="item" href="#">Productos</a>
                    <a class="item" href="#">Compras</a>
                    <a class="item" href="#">Ventas</a>
                    <a class="item" href="#">Clientes</a>
                    <a class="item" href="#">Tiendas</a>
                    <a class="item" href="#">Usuarios</a>
                </div>
            </div>
            <a class="item" href="#">Ajustes</a>
            <a class="item text-red" href="${context}/logout">Salir</a>
        </div>
    </div>
</nav>
