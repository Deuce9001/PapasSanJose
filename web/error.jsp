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
            <form method="post" action="${pageContext.request.contextPath}/Logout" size="25" class="logout">
                <input type="submit" value="Salir">
            </form>
        </div>

        <div id="content">

            <body><center>

                <h1>Ha Ocurrido un error</h1>
                <br>
                <br>
                <br>
                <h4>No se ha realizado ningun cambio a la base de datos, favor de tratar de nuevo</h4>
                <form method="post" action="${pageContext.request.contextPath}/Logout">
                    <h6>Da click para volver a entrar</h6>
                    <input type="submit" value="Seleccionar">
                </form>

                </body>
                </html>

        </div>

    </body>
</html>