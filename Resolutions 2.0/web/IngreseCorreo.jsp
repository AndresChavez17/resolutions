<%-- 
    Document   : IngreseCorreo
    Created on : 1/10/2019, 08:21:44 AM
    Author     : APRENDIZ
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="modeloDAO.PersonasDAO"%>
<%@page import="modeloVO.PersonasVO"%>
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
                        <div class="card-header text-center"><a href="FrmLogin.jsp"><img class="logo-img" src="assets/images/logoResolutions.png" alt="logo"></a><span class="splash-description">Por Favor Ingresa la Información.</span></div>
                                <div class="card-body">
                                    <%
                                        PersonasVO PerVO = new PersonasVO();
                                        PersonasDAO PerDAO = new PersonasDAO();
                                        ArrayList<PersonasVO> listarUsuarios = PerDAO.listar();
                                        PersonasVO PerVO1 = (PersonasVO) request.getAttribute("voRellenarCor");

                                        if (PerVO1 != null) {
                                    %>
                                    <form method="post" action="UsuarioControlador2">  
                                        <p>No te Preocupes. Te enviaremos un Correo con tu Contraseña.</p>
                                        <div class="form-group">
                                        Correo Eléctronico:                                        
                                        <input class="form-control form-control-lg" type="text" required="" name="txtNombreUsu" autocomplete="off" value="<%=PerVO1.getCorreoPer()%>">
                                        </div>
                                        <div class="form-group pt-1"><button name="opcion" value="5" name="siguiente" class="btn btn-block btn-primary btn-xl">Siguiente</button></div>                                        
                                    </form>

                                    <%
                                    } else {
                                    %>
                                    <form method="post" action="UsuarioControlador2">  
                                        <p>No te Preocupes. Te enviaremos un Correo con tu Contraseña.</p>
                                        <div class="form-group">
                                        Nombre de Usuario:                                        
                                        <input class="form-control form-control-lg" type="text" required="" name="txtNombreUsu" placeholder="Ingresa tu nombre de Usuario para validarlo" autocomplete="off">
                                        </div>
                                        <div class="form-group pt-1"><button name="opcion" value="5" name="siguiente" class="btn btn-block btn-primary btn-xl">Siguiente</button></div>                                        
                                    </form>
                                    <%}%>
                                    <br>
                                    <a href="IngreseIdentificacion.jsp"><button class="btn btn-block btn-primary btn-xl">Recuperar datos de ingreso</button></a>

                                    <form action="EnvioCorreo" method="POST">
                                    <%if (request.getParameter("enviar") != null) {%>
                                        <div class="alert alert-warning alert-dismissible fade show" style="color: orangered;">
                                            <button type="button" class="close" data-dismiss="alert">&times;</button>
                                            <center>
                                                <%=request.getAttribute("respuesta")%>
                                            </center>
                                        </div>
                                    <%}%>
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
