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
        
    <a href="registraEntrega.jsp"></a>
    </head>

    <body>

        <div id="header">
            <img src="${pageContext.request.contextPath}/images/logo.png" width="100" height="100" alt="logo" align="left"/>
        </div>

        <div id="navigation">
            <br>
            <br>
            <a href="empleado/clienteNuevo.jsp">Agregar Cliente</a>
            <br>
            <br>
            <a href="empleado/proveedorNuevo.jsp">Agregar Proveedor</a>
            <br>
            <br>
            <a href="empleado/registraEntrega.jsp">Registrar Entrega</a>
            <br>
            <br>
            <a href="empleado/registraVenta.jsp">Registrar Venta</a>
            <br>
            <br>
            <br>
            <a  href="${pageContext.request.contextPath}/Logout" class="myButton" align="right" >Salir</a>

        </div>

        <div id="content">

            <center>

                <h1>${requestScope.res}</h1>


                </html>

        </div>

    </body>
</html>