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
                if (document.myForm.id_camion.value == "")
                {
                    alert("Introduzca las placas del camion");
                    document.myForm.id_camion.focus();
                    return false;
                }
                if (document.myForm.nChofer.value == "")
                {
                    alert("Introduzca el nombre del chofer");
                    document.myForm.nChofer.focus();
                    return false;
                }
                if (document.myForm.merma.value == "")
                {
                    alert("Introduzca la cantidad de merma que llego en el camion");
                    document.myForm.merma.focus();
                    return false;
                }
                if (document.myForm.costo.value == "")
                {
                    alert("Introduzca el costo del la mercancia");
                    document.myForm.merma.focus();
                    return false;
                }
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
            SELECT id, nombre, apellidos FROM Proveedor;
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
            <a href="registraVenta.jsp">Registrar Venta</a>
            <br>
            <br>
            <br>
            <a  href="${pageContext.request.contextPath}/Logout" class="myButton" align="right" >Salir</a>

        </div>

        <div id="content">

            <center>

                <h1>Registro de Entrega</h1>
                <br>
                <br>
                <br>
                <form action="${pageContext.request.contextPath}/RegistrarEntrega" method="post" name="myForm"  onsubmit="return(validate());">

                    <label for="nombre_proveedor">Nombre Proveedor:</label>     
                    <select name="id_proveedor" size="1" required>
                        <c:forEach items="${result.rows}" var="row">
                            <option value ="<c:out value="${row.id}" />"><c:out value="${row.nombre}" /> <c:out value="${row.apellidos}" /></option>
                        </c:forEach>
                    </select>
                    <input type="button" value="Agregar Proveedor" onclick="document.location.href = 'proveedorNuevo.jsp'"/>
                    <br>
                    <br>

                    <label for="id_camion">Placas Cami&oacute;n:</label>  
                    <input type="text" name="id_camion" /><br/>
                    <br>

                    <label for="chofer">Chofer:</label>  
                    <input type="text" name="nChofer" /><br/>
                    <br>

                    <label for="fecha_salida">Fecha de Salida:</label>
                    <select name="diaSalida">
                        <option value="01">1</option>
                        <option value="02">2</option>
                        <option value="03">3</option>
                        <option value="04">4</option>
                        <option value="05">5</option>
                        <option value="06">6</option>
                        <option value="07">7</option>
                        <option value="08">8</option>
                        <option value="09">9</option>
                        <option value="10">10</option>
                        <option value="11">11</option>
                        <option value="12">12</option>
                        <option value="13">13</option>
                        <option value="14">14</option>
                        <option value="15">15</option>
                        <option value="16">16</option>
                        <option value="17">17</option>
                        <option value="18">18</option>
                        <option value="19">19</option>
                        <option value="20">20</option>
                        <option value="21">21</option>
                        <option value="22">22</option>
                        <option value="23">23</option>
                        <option value="24">24</option>
                        <option value="25">25</option>
                        <option value="26">26</option>
                        <option value="27">27</option>
                        <option value="28">28</option>
                        <option value="29">29</option>
                        <option value="30">30</option>
                        <option value="31">31</option>
                    </select>
                    <select name="mesSalida">
                        <option value="-01-">Enero</option>
                        <option value="-02-">Febrero</option>
                        <option value="-03-">Marzo</option>
                        <option value="-04-">Abril</option>
                        <option value="-05-">Mayo</option>
                        <option value="-06-">Junio</option>
                        <option value="-07-">Julio</option>
                        <option value="-08-">Agosto</option>
                        <option value="-09-">Septiempre</option>
                        <option value="-10-">Octubre</option>
                        <option value="-11-">Noviembre</option>
                        <option value="-12-">Diciembre</option>
                    </select>
                    <input type="text" name ="anoSalida" value="2014" size="8">
                    <br>
                    <br>

                    <label for="fecha_llegada">Fecha de Llegada:</label>
                    <select name="diaLlegada">
                        <option value="01">1</option>
                        <option value="02">2</option>
                        <option value="03">3</option>
                        <option value="04">4</option>
                        <option value="05">5</option>
                        <option value="06">6</option>
                        <option value="07">7</option>
                        <option value="08">8</option>
                        <option value="09">9</option>
                        <option value="10">10</option>
                        <option value="11">11</option>
                        <option value="12">12</option>
                        <option value="13">13</option>
                        <option value="14">14</option>
                        <option value="15">15</option>
                        <option value="16">16</option>
                        <option value="17">17</option>
                        <option value="18">18</option>
                        <option value="19">19</option>
                        <option value="20">20</option>
                        <option value="21">21</option>
                        <option value="22">22</option>
                        <option value="23">23</option>
                        <option value="24">24</option>
                        <option value="25">25</option>
                        <option value="26">26</option>
                        <option value="27">27</option>
                        <option value="28">28</option>
                        <option value="29">29</option>
                        <option value="30">30</option>
                        <option value="31">31</option>
                    </select>
                    <select name="mesLlegada">
                        <option value="-01-">Enero</option>
                        <option value="-02-">Febrero</option>
                        <option value="-03-">Marzo</option>
                        <option value="-04-">Abril</option>
                        <option value="-05-">Mayo</option>
                        <option value="-06-">Junio</option>
                        <option value="-07-">Julio</option>
                        <option value="-08-">Agosto</option>
                        <option value="-09-">Septiempre</option>
                        <option value="-10-">Octubre</option>
                        <option value="-11-">Noviembre</option>
                        <option value="-12-">Diciembre</option>
                    </select>
                    <input type="text" name ="anoLlegada" value="2014" size="8">
                    <br>
                    <br>

                    <label for="merma">Merma: </label>
                    <input type="text" name="merma" /><br/>
                    <br>

                    <label for="costo">Costo: </label>
                    <input type="text" name="costo" /><br/>
                    <br>


                    Tipo de papas
                    <br>
                    <br>
                    Primeras<input type="checkbox" name="b1" value="1" size="2"/>
                    Bultos:<input name="v1" type="text" value="" size = 10>
                    KG:<input name="v1" type="text" value="" size = 10>
                    <br> 
                    Segundas<input type="checkbox" name="b2" value="2" size="2"/>
                    Bultos:<input name="v2" type="text" value="" size = 10>
                    KG:<input name="v2" type="text" value="" size = 10>
                    <br> 
                    Terceras<input type="checkbox" name="b3" value="3" size="2"/>
                    Bultos:<input name="v3" type="text" value="" size = 10>
                    KG:<input name="v3" type="text" value="" size = 10>
                    <br> 
                    Cuartas<input type="checkbox" name="b4" value="4" size="2"/>
                    Bultos:<input name="v4" type="text" value="" size = 10>
                    KG:<input name="v4" type="text" value="" size = 10>
                    <br> 
                    Desecho<input type="checkbox" name="b5" value="5" size="2"/>
                    Bultos:<input name="v5" type="text" value="" size = 10>
                    KG:<input name="v5" type="text" value="" size = 10>
                    <br class="clear" />
                    <br />
                    <input type="submit" value="Guardar Entrega" />
                    <input type="button" class="floatright" value="Regresar" onclick="javascript:history.back()"/><br class="clear"/>
                </form>
        </div>
    </body>
</html>