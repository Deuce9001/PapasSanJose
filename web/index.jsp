
<!DOCTYPE HTML>
<html>
    <head>
        <title>Inicio de Sesi&oacuten</title>
        <link rel="stylesheet" type="text/css" href="css/reset.css">
        <link rel="stylesheet" type="text/css" href="css/structure.css">
    <center><img src="images/logo3.png" />
    </head>



    <body>
        <form class="box login" method="POST" action="./Login">
            <fieldset class="boxBody">
                <label>Usuario</label>
                <input type="text" name="username" tabindex="1" placeholder="usuario" required>
                <label>Contrase&ntilde;a</label>
                <input type="password" name="password" tabindex="2" placeholder="contrase&ntilde;a" required>
            </fieldset>
            <footer>
                <input type="submit" class="btnLogin" value="Entrar" tabindex="4">
            </footer>
            ${requestScope.res}
        </form>

    </body>
</html>
