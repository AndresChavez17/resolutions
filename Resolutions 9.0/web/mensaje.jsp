<%-- 
    Document   : mensaje
    Created on : 1/10/2019, 08:36:04 AM
    Author     : APRENDIZ
--%>

<%@page import="modeloVO.UsuarioVO"%>
<%@page import="modeloDAO.UsuarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Olvide mi Contraseña</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.min.css">
    <link href="assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/libs/css/style.css">
    <link rel="stylesheet" href="assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
    <style>
    html,
    body {
        height: 100%;
    }

    body {
        background-image: url("assets/images/fondo2.jpg");
        background-position: center center;
        background-repeat: no-repeat;
        background-attachment: fixed;
        background-size: cover;
        display: -ms-flexbox;
        display: flex;
        -ms-flex-align: center;
        align-items: center;
        padding-top: 40px;
        padding-bottom: 40px;
    }
    </style>
</head>

<body>
                <!-- ============================================================== -->
                <!-- INICIO CONTENIDO DE LA PAGINA -->
                <!-- ============================================================== -->
                <div class="splash-container">
                    <div class="card">
                        <div class="card-header text-center"><img class="logo-img" src="assets/images/logoResolutions.png" alt="logo"><span class="splash-description">Por Favor ingresa la información.</span></div>
                                <div class="card-body">
                                    <form method="post" action="EnvioCorreo">
                                        <table>
                                        <%
                                            UsuarioVO UsuVO = new UsuarioVO();
                                            UsuarioDAO usuDAO = new UsuarioDAO();
                                            UsuarioVO UsuVO2 = (UsuarioVO) request.getAttribute("voRellenar");
                                            if (UsuVO2 != null) {
                                        %>
                                            <tr>
                                                <td>Correo Eléctronico: </td>
                                                <td><input type="email" placeholder="Ingresa tu Correo Eléctronico" name="receptor"></td>
                                            </tr>
                                            <tr>
                                                <td>Asunto</td>
                                                <td><input type="text" name="asunto" value="Recuperar Contraseña"></td>
                                            </tr>
                                            <textarea hidden="true" name="contenido" >
                                                Apreciado usuario.

                                                Su clave es: <%=UsuVO2.getClaveUsu()%>.

                                                <b>El uso correcto de la clave es su responsabilidad.</b>
                                            </textarea>
                                            <%}%>
                                            <tr>
                                                <td><div class="form-group pt-1"><input type="submit" name="enviar" value="Enviar" class="btn btn-block btn-primary btn-xl"></div></td>
                                            </tr>
                                        </table>
                                    </form>
                                    <form action="EnvioCorreo" method="Post">
                                        <%if (request.getParameter("siguiente") != null) {
                                                if (request.getAttribute("Mensaje_Null") != null) {%>
                                        <div class="alert alert-success alert-dismissible fade show" style="color: red;">
                                            <button type="button" class="close" data-dismiss="alert">&times;</button>
                                            ${Mensaje_Null}
                                        </div>
                                        <%} else {%>
                                        <div class="alert alert-success alert-dismissible fade show" style="color: green;">
                                            <button type="button" class="close" data-dismiss="alert">&times;</button>
                                            ${Mensaje_Exito}
                                        </div>
                                        <%}
                                            }%>
                                    </form>
                                </div>                            
                            </div>
                    </div><!-- ============================================================== -->
    <!-- end forgot password  -->
    <!-- ============================================================== -->
    <!-- Optional JavaScript -->
    <script src="assets/vendor/jquery/jquery-3.3.1.min.js"></script>
    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
</body>

 
</html>
