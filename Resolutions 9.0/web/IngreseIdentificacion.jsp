<%-- 
    Document   : IngreseIdentificacion
    Created on : 1/10/2019, 08:31:08 AM
    Author     : APRENDIZ
--%>

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
                        <div class="card-header text-center"><a href="FrmLogin.jsp"><img class="logo-img" src="assets/images/logoResolutions.png" alt="logo"></a><span class="splash-description">Por favor ingresa la información.</span></div>
                                <div class="card-body">
                                    <form method="post" action="PersonasControlador">  
                                        <div class="form-group">
                                        Número de identificación:
                                        <input class="form-control form-control-lg" type="number" required="" name="txtIdentificacionPer" placeholder="Ingrese su Identificación">
                                        </div>
                                        <div class="form-group pt-1"><button name="opcion" value="6" name="siguiente" class="btn btn-block btn-primary btn-xl">Siguiente</button></div>
                                    </form>

                                    <%if (request.getAttribute("Mensaje_Error") != null) {%>
                                    <div class="alert alert-danger alert-dismissible fade show" style="color: red;">
                                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                                        ${Mensaje_Error}
                                        <%}%>
                                    </div>
                                </div>                            
                            </div>
                    </div>
                <!-- ============================================================== -->
    <!-- end forgot password  -->
    <!-- ============================================================== -->
    <!-- Optional JavaScript -->
    <script src="assets/vendor/jquery/jquery-3.3.1.min.js"></script>
    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
</body>

 
</html>
