<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
        <script type="text/javascript">
<!--
            function validate()
            {
                if (document.myForm.nombre.value == "")
                {
                    alert("Intrudizca el nombre");
                    document.myForm.nombre.focus();
                    return false;
                }
                if (document.myForm.apellidos.value == "")
                {
                    alert("Introduzca los apellidos");
                    document.myForm.apellidos.focus();
                    return false;
                }
                if (document.myForm.telefono.value == "")
                {
                    alert("Introduzca un telefono");
                    document.myForm.empresa.focus();
                    return false;
                }
                if (document.myForm.empresa.value == "")
                {
                    alert("Introduzca el nombre de la empresa");
                    document.myForm.empresa.focus();
                    return false;
                }
                if (document.myForm.direccion.value == "")
                {
                    alert("Introduzca la direccion");
                    document.myForm.direccion.focus();
                    return false;
                }

                return true
            }
//-->
        </script>
    </head>

    <body>

        <sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/papas_san_jose" user="leector" password="leer"/>

        <sql:query dataSource="${ds}" var="result">
            SELECT id, nombre, apellidos FROM cliente;
        </sql:query>

        <div id="header">
            <img src="${pageContext.request.contextPath}/images/logo.png" width="100" height="100" alt="logo" align="left"/>
            
        </div>

        <div id="navigation">

            <a href="clienteNuevo.jsp">Agregar Cliente</a>
            <br>
            <br>
            <a href="proveedorNuevo.jsp">Agregar Proveedor</a>
            <br>
            <br>
            <a href="modificarProveedor.jsp">Modificar Proveedor</a>
            <br>
            <br>
            <a href="empleadoNuevo.jsp">Agregar Empleado</a>
            <br>
            <br>
            <a href="modificarEmpleado.jsp">Modificar Empleado</a>
            <br>
            <br>
            <a href="${pageContext.request.contextPath}/MostrarInventario" >Ver Inventario</a>
            <br>
            <br>
            <a href="reporte.jsp">Generar Reporte</a>
            <br>
            <br>
            <br>
            <a  href="${pageContext.request.contextPath}/Logout" class="myButton" align="right" >Salir</a>

        </div>

        <div id="content">

            <body><center>

                <h1>Modificar Cliente</h1>
                <br>
                <br>
                <br>
                <form method="get" action="${pageContext.request.contextPath}/ModificarCliente">
                    Cliente:<select name="id_cliente" size="1" required>
                        <c:forEach items="${result.rows}" var="row">
                            <option value ="<c:out value="${row.id}" />"><c:out value="${row.nombre}" /> <c:out value="${row.apellidos}" /></option>
                        </c:forEach>
                    </select>
                    <input type="submit" value="Seleccionar">
                </form>
                <br>
                <br>
                <form method="post" action="${pageContext.request.contextPath}/ModificarCliente" name="myForm" onsubmit="return(validate());">
                    <input type="hidden" name="id_cliente" value="${requestScope.id}">
                    <label for="firstname">Nombre:</label>    <input type="text" name="nombre" value="${requestScope.nombre}"/><br/>
                    <br>
                    <label for="surname">Apellidos:</label>   <input type="text" name="apellidos" value ="${requestScope.apellidos}" /><br/>
                    <br>
                    <label for="empresa">Nombre Empresa:</label>  <input type="text" name="empresa" value ="${requestScope.empresa}" /><br/>
                    <br>
                    <label for="mobile">Telefono:</label>   <input type="text" name="telefono" value ="${requestScope.telefono}" /><br/>
                    <br>
                    <label for="celphone">Celular:</label>  <input type="text" name="celular" value ="${requestScope.celular}" /><br/>
                    <br>
                    <label for="home">Direcci&oacuten: </label>   <input type="text" name="direccion" value ="${requestScope.direccion}" /><br/>
                    <br>
                    <label for="email">Email: </label>    <input type="text" name="email" value ="${requestScope.email}" /><br/>
                    <br>
                    <label for="rfc">RFC: </label>    <input type="text" name="rfc" value ="${requestScope.rfc}" /><br/>
                    <br>
                    <label for="marca">Marca: </label>    <input type="text" name="marca" value ="${requestScope.marca}" /><br/>
                    <br class="clear" />
                    <br />
                    <input type="submit" name="boton" value="Modificar Cliente" />
                    <input type="submit" name="boton" value="Borrar" />
                    <br>
                    <input type="button" class="floatright" value="Regresar" onclick="javascript:history.back()"/><br class="clear"/>
                </form>
        </div>
    </body>
</html>