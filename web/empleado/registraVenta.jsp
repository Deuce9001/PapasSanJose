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

            function validateRadio()
            {
                for (i = 1; i <= 5; ++i)
                {
                    if (document.forms["myForm"]["b" + i].checked == true)
                        return true;
                }
                return false;
            }
            function validate()
            {
                if (validateRadio() == false)
                {
                    alert("Seleccione almenos una opcion");
                    return false
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

            <br>
            <br>
            <a href="clienteNuevo.jsp">Agregar Cliente</a>
            <br>
            <br>
            <a href="proveedorNuevo.jsp">Agregar Proveedor</a>
            <br>
            <br> 
            <a href="registraEntrega.jsp">Registrar Entrega</a>
            <br>
            <br>
            <br>
            <a  href="${pageContext.request.contextPath}/Logout" class="myButton" align="right" >Salir</a>

        </div>

        <div id="content">

            <body><center>

                <h1>Registro de Venta</h1>
                <br>
                <br>
                <br>
                <form action="${pageContext.request.contextPath}/Registrar" method="post" name="myForm"  onsubmit="return(validate());">
                    <label for="id_cliente">Nombre Cliente:</label>
                    <select name="id_cliente" size="1" required>
                        <c:forEach items="${result.rows}" var="row">
                            <option value ="<c:out value="${row.id}" />"><c:out value="${row.nombre}" /> <c:out value="${row.apellidos}" /></option>
                        </c:forEach>
                    </select>
                    <input type="button" value="Agregar Cliente" onclick="document.location.href = 'clienteNuevo.jsp'"/>
                    <br>
                    Primeras<input type="checkbox" name="b1" value="1" size="2"/>
                    Bultos:<input name="v1" type="text" value="" size = 10>
                    KG:<input name="v1" type="text" value="" size = 10>
                    Precio Unitario:<input name="v1" type="text" value="" size = 10>
                    <br> 
                    Segundas<input type="checkbox" name="b2" value="2" size="2"/>
                    Bultos:<input name="v2" type="text" value="" size = 10>
                    KG:<input name="v2" type="text" value="" size = 10>
                    Precio Unitario:<input name="v2" type="text" value="" size = 10>
                    <br> 
                    Terceras<input type="checkbox" name="b3" value="3" size="2"/>
                    Bultos:<input name="v3" type="text" value="" size = 10>
                    KG:<input name="v3" type="text" value="" size = 10>
                    Precio Unitario:<input name="v3" type="text" value="" size = 10>
                    <br> 
                    Cuartas<input type="checkbox" name="b4" value="4" size="2"/>
                    Bultos:<input name="v4" type="text" value="" size = 10>
                    KG:<input name="v4" type="text" value="" size = 10>
                    Precio Unitario:<input name="v4" type="text" value="" size = 10>
                    <br> 
                    Desecho<input type="checkbox" name="b5" value="5" size="2"/>
                    Bultos:<input name="v5" type="text" value="" size = 10>
                    KG:<input name="v5" type="text" value="" size = 10>
                    Precio Unitario:<input name="v5" type="text" value="" size = 10>
                    <br> 

                    <input type="submit" value="Guardar Venta" />
                    <input type="button" class="floatright" value="Regresar" onclick="javascript:history.back()"/><br class="clear"/>
                </form>

                </body>
                </html>
        </div>

    </body>
</html>