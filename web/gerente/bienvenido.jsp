<!DOCTYPE html>
<html>
    <head>
        <title>Papas San Jos&eacute;</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/structure.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/boton.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style1.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bienvenidoCss.css" />
    </head>

    <body>

        <div id="header">
            <img src="${pageContext.request.contextPath}/images/logo.png" width="100" height="100" alt="logo" align="left"/>
            
        </div>

        <div id="navigation">

            <a href="gerente/clienteNuevo.jsp">Agregar Cliente</a>
            <br>
            <br>
            <a href="gerente/modificarCliente.jsp">Modificar Cliente</a>
            <br>
            <br>
            <a href="gerente/proveedorNuevo.jsp">Agregar Proveedor</a>
            <br>
            <br>
            <a href="gerente/modificarProveedor.jsp">Modificar Proveedor</a>
            <br>
            <br>
            <a href="gerente/empleadoNuevo.jsp">Agregar Empleado</a>
            <br>
            <br>
            <a href="gerente/modificarEmpleado.jsp">Modificar Empleado</a>
            <br>
            <br>
            <a href="${pageContext.request.contextPath}/MostrarInventario" >Ver Inventario</a>
            <br>
            <br>
            <a href="gerente/reporte.jsp">Generar Reporte</a>
            <br>
            <br>
            <br>
            <a  href="${pageContext.request.contextPath}/Logout" class="myButton" align="right" >Salir</a>

        </div>

        <div id="content">

            <body><center>

                <h1>${requestScope.res}</h1>

                </body>
                </html>

        </div>

    </body>
</html>