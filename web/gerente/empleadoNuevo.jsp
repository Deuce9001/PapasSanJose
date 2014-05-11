<!DOCTYPE html>
<html>
    <link rel="stylesheet" type="text/css" href="style.css" />
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

            function validateUser(form)
            {
                if (myForm.usuario.value == "") {
                    alert("El usuario no puede estar vacio");
                    myForm.usuario.focus();
                    return false;
                }
                if (myForm.pwd1.value != "" && myForm.pwd1.value == myForm.pwd2.value) {
                    if (myForm.pwd1.value.length < 6) {
                        alert("Error: Password must contain at least six characters!");
                        myForm.pwd1.focus();
                        return false;
                    }
                    if (myForm.pwd1.value == myForm.username.value) {
                        alert("Error: La contrasena debe ser diferente al usuario");
                        myForm.pwd1.focus();
                        return false;
                    }

                } else {
                    alert("Error: Las contrasenas no coinciden");
                    myForm.pwd1.focus();
                    return false;
                }
                
                return true;
            }
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
                if (validateUser() == false)
                {
                    return false
                }

                return true
            }
//-->
        </script>
    </head>

    <body>

        <div id="header">
            <img src="../images/logo.png" width="100" height="100" alt="logo" align="left"/>
            
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

                <h1>Agregar Empleado</h1>
                <br>
                <br>
                <br>
                <form method="post" action="${pageContext.request.contextPath}/AgregarEmpleado" name="myForm" onsubmit="return(validate());">
                    <label for="firstname">Nombre:</label>    <input type="text" name="nombre" /><br/>
                    <br>
                    <label for="surname">Apellidos:</label>   <input type="text" name="apellidos" /><br/>
                    <br>
                    <label for="mobile">Telefono:</label>   <input type="text" name="telefono" /><br/>
                    <br>
                    <label for="cellphone">Celular:</label>  <input type="text" name="celular" /><br/>
                    <br>
                    <label for="home">Direcci&oacute;n: </label> <input type="text" name="direccion" /><br/>
                    <br>
                    <label for="email">Email: </label> <input type="text" name="email" /><br/>
                    <br>
                    <label for="curp">CURP: </label> <input type="text" name="curp" /><br/>
                    <br>
                    <label for="user">Usuario: </label> <input type="text" name="usuario" /><br/>
                    <br>
                    <label for="pass">Contrase&ntilde;a: </label> <input type="password" name="pwd1" /><br/>
                    <br>
                    <label for="pass">Repetir contrase&ntilde;a: </label> <input type="password" name="pwd2" /><br/>
                    <br>
                    <br class="clear" />
                    <br />
                    <input type="submit" value="Agregar Empleado" />
                    <input type="button" class="floatright" value="Regresar" onclick="javascript:history.back()" /><br class="clear"/>
                </form>

                </body>
                </html>

        </div>

    </body>
</html>