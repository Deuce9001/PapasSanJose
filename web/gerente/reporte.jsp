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
            >
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
            <a href="modificarEmpleado.jsp">Modificar Empleado</a>
            <br>
            <br>
            <a href="${pageContext.request.contextPath}/MostrarInventario" >Ver Inventario</a>
            <br>
            <br>
            <br>
            <a  href="${pageContext.request.contextPath}/Logout" class="myButton" align="right" >Salir</a>

        </div>

        <div id="content">

            <h1>Generar Reporte</h1>
            <br>
            <br>            
            <br>
            <form method="post" action="${pageContext.request.contextPath}/GenerarReporte">

                <label for="fecha_salida">Fecha de Inicio:</label>
                <select name="diaIni">
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
                <select name="mesIni">
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
                <input type="text" name ="anoIni" value="2014" size="8">
                <br>
                <br>

                <label for="fecha_llegada">Fecha de Corte:</label>
                <select name="diaFin">
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
                <select name="mesFin">
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
                <input type="text" name ="anoFin" value="2014" size="8">
                <br>
                <br>
                <input type="submit" name="fecha" value="Generar Reporte" />
                <br class="clear" />
                <br />
                <input type="submit" name="fecha" value="Dia" width="40"/>
                <input type="submit" name="fecha" value="Mes" />
            </form>
            <br>
            <br>
            <center>
            <table border="2" align="center">
                <tr>
                    <th>Tipo</th>
                    <th>KG Vendidos</th>
                    <th>$ Vendido</th>
                    <th>Merma</th>
                </tr>
                <c:forEach items="${requestScope.inf}" var="al">
                    <tr>
                        <td>
                            <c:out value="${al.tipo}" />
                            <br />
                        </td>
                        <td>
                            <c:out value="${al.kgVendidos}" />
                            <br />
                        </td>
                        <td>
                            <c:out value="${al.totalVentas}" />
                            <br />
                        </td>
                        <td>
                            <c:out value="${al.merma}" />
                            <br />
                        </td>
                    </tr>
                </c:forEach>
            </table>
            Ventas Totales: ${requestScope.tot}
        </div>
    </body>
</html>