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
                    document.myForm.telefono.focus();
                    return false;
                }
                if (document.myForm.direccion.value == "")
                {
                    alert("Introduzca la direccion");
                    document.myForm.direccion.focus();
                    return false;
                }
                if (document.myForm.curp.value == "")
                {
                    alert("Introduzca el CURP");
                    document.myForm.curp.focus();
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
            SELECT id, nombre, apellidos FROM empleado;
        </sql:query>

        <div id="header">

            <img src="${pageContext.request.contextPath}/images/logo.png" width="100" height="100" alt="logo" align="left" />
            
        </div>

        <div id="navigation">

            <a href="clienteNuevo.jsp">Agregar Cliente</a>
            <br>
            <br>
            <a href="modificarCliente.jsp">Modificar Cliente</a>
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

            <h1>Modificar Empleado</h1>
            <br>
            <br>
            <br>
            <form method="get" action="${pageContext.request.contextPath}/ModificarEmpleado">
                Empleado:<select name="id_empleado" size="1" required>
                    <c:forEach items="${result.rows}" var="row">
                        <option value ="<c:out value="${row.id}" />"><c:out value="${row.nombre}" /> <c:out value="${row.apellidos}" /></option>
                    </c:forEach>
                </select>
                <input type="submit" value="Seleccionar">
            </form >
            <br>
            <br>
            <br>
            <form method="post" action="${pageContext.request.contextPath}/ModificarEmpleado" name="myForm" onsubmit="return(validate());">
                <input type="hidden" name="id_cliente" value="${requestScope.id}">
                <label for="firstname">Nombre:</label>    <input type="text" name="nombre" value="${requestScope.nombre}" /><br/>
                <br>
                <label for="surname">Apellidos:</label>   <input type="text" name="apellidos" value="${requestScope.apellidos}" /><br/>
                <br>
                <label for="mobile">Telefono:</label>   <input type="text" name="telefono" value="${requestScope.telefono}" /><br/>
                <br>
                <label for="celphone">Celular:</label>  <input type="text" name="celular" value="${requestScope.celular}" /><br/>
                <br>
                <label for="home">Direcci&oacuten: </label> <input type="text" name="direccion" value="${requestScope.direccion}" /><br/>
                <br>
                <label for="email">Email: </label> <input type="text" name="email" value="${requestScope.email}" /><br/>
                <br>
                <label for="curp">CURP: </label> <input type="text" name="curp" value="${requestScope.curp}" /><br/>
                <br>
                <br class="clear" />
                <br />
                <input type="submit" value="Modificar Empleado" />
                <input type="submit" name="boton" value="Borrar" />
                <br>
                <br>
                <input type="button" class="floatright" value="Regresar" onclick="javascript:history.back()"/><br class="clear"/>
            </form>
        </div>
    </body>
</html>


