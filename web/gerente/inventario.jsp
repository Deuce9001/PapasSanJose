<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

            <a href="${pageContext.request.contextPath}/gerente/clienteNuevo.jsp">Agregar Cliente</a>
            <br>
            <br>
            <a href="${pageContext.request.contextPath}/gerente/modificarCliente.jsp">Modificar Cliente</a>
            <br>
            <br>
            <a href="${pageContext.request.contextPath}/gerente/proveedorNuevo.jsp">Agregar Proveedor</a>
            <br>
            <br>
            <a href="${pageContext.request.contextPath}/gerente/modificarProveedor.jsp">Modificar Proveedor</a>
            <br>
            <br>
            <a href="${pageContext.request.contextPath}/gerente/empleadoNuevo.jsp">Agregar Empleado</a>
            <br>
            <br>
            <a href="${pageContext.request.contextPath}/gerente/modificarEmpleado.jsp">Modificar Empleado</a>
            <br>
            <br>
            <a href="${pageContext.request.contextPath}/gerente/reporte.jsp">Generar Reporte</a>
            <br>
            <br>
            <br>
            <a  href="${pageContext.request.contextPath}/Logout" class="myButton" align="right" >Salir</a>

        </div>

        <div id="content">

            <table border="1" align="center"> 
                <tr>
                    <th>Tipo</th>
                    <th>Bultos</th>
                    <th>KG</th>
                </tr>
                <c:forEach items="${requestScope.inventario}" var="inv">
                    <tr>
                        <td>
                            <c:out value="${inv.tipo}" />
                            <br />
                        </td>
                        <td>
                            <c:out value="${inv.bultos}" />
                            <br />
                        </td>
                        <td>
                            <c:out value="${inv.kg}" />
                            <br />
                        </td>
                    </tr>
                </c:forEach>
                <tr>
                    <td>
                        <b>Total</b>
                    </td>
                    <td>
                        ${requestScope.tBultos}
                    </td>
                    <td>
                        ${requestScope.tKg}
                    </td>
                </tr>
            </table>

        </div>
    </body>
</html>

