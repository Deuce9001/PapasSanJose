<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
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

            <br>
            <br>
            <a href="clienteNuevo.jsp">Agregar Cliente</a>
            <br>
            <br>
            <a href="proveedorNuevo.jsp">Agregar Proveedor</a>
            <br>
            <br>
            <a href="registraVenta.jsp">Registrar Venta</a>
            <br>
            <br>
            <br>
            <a  href="${pageContext.request.contextPath}/Logout" class="myButton" align="right" >Salir</a>

        </div>

        <div id="content">

            Cliente: ${requestScope.cliente}
            <br>
            Total: $ ${requestScope.total}
            <br>
            Kg Vendidos: ${requestScope.totalKg}
            <br>
        </div>
    </body>
</html>
