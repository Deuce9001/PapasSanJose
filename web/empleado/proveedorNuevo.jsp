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

        <div id="header">
            <img src="${pageContext.request.contextPath}/images/logo.png" width="100" height="100" alt="logo" align="left"/>
            
        </div>

        <div id="navigation">
            <br>
            <br>
            <a href="clienteNuevo.jsp">Agregar Cliente</a>
            <br>
            <br>
            <a href="registraEntrega.jsp">Registrar Entrega</a>
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

                <h1>Agregar Proveedor </h1>
                <br>
                <br>
                <br>
                <form method="post" action="${pageContext.request.contextPath}/AgregarProveedor" name="myForm" onsubmit="return(validate());">
                    <label for="firstname">Nombre:</label>    <input type="text" name="nombre" /><br/>
                    <br>
                    <label for="surname">Apellidos:</label>   <input type="text" name="apellidos" /><br/>
                    <br>
                    <label for="empresa">Nombre Empresa:</label>  <input type="text" name="empresa" /><br/>
                    <br>
                    <label for="mobile">Telefono:</label>   <input type="text" name="telefono" /><br/>
                    <br>
                    <label for="celphone">Celular:</label>  <input type="text" name="celular" /><br/>
                    <br>
                    <label for="home">Direcci&oacuten: </label>   <input type="text" name="direccion" /><br/>
                    <br>
                    <label for="email">Email: </label>    <input type="text" name="email" /><br/>
                    <br class="clear" />
                    <br />
                    <input type="submit" value="Agregar Proveedor" />
                    <input type="button" class="floatright" value="Regresar" onclick="javascript:history.back()"/><br class="clear"/>
                </form>
            </center>
        </div>

    </body>
</html>