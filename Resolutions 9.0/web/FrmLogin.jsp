<%-- 
    Document   : FrmLogin
    Created on : 28/09/2019, 11:51:56 PM
    Author     : AFCHT
--%>

<%@page import="controlador.UsuarioControlador"%>
<%@page import="modeloDAO.UsuarioDAO"%>
<%@page import="modeloVO.UsuarioVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="404Page.jsp"%>
<%@page isErrorPage="true" %>
<%
    UsuarioVO usuVO = new UsuarioVO();
    UsuarioDAO usuDAO = new UsuarioDAO(usuVO);
    UsuarioControlador usuCon = new UsuarioControlador();
            
    HttpSession currentSession = request.getSession();
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (int i=0; i<cookies.length; i++) {
            if(cookies[i].getName().equals("ReUsu")) {
                usuVO = usuDAO.consulta(usuCon.desencriptarCookie(cookies[i].getValue().toString()));
                if(usuVO != null){
                    currentSession.setAttribute("dta", usuVO);
                    response.sendRedirect("index.jsp");
                }
            }
        }
    }
    /*Object cuenta = currentSession.getAttribute("dta");
    if(cuenta!=null){
        response.sendRedirect("index.jsp");
    }*/
%>
<!DOCTYPE html>
<html lang="en">
 
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Login</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.min.css">
    <link href="assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/libs/css/style.css">
    <link rel="stylesheet" href="assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
    <link rel="shortcut icon" type="image/png" href="assets/images/favicon.ico">
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
    <!-- login page  -->
    <!-- ============================================================== -->
    <div class="splash-container">
        <div class="card ">
            <div class="card-header text-center"><a href="FrmLogin.jsp"><img class="logo-img" src="assets/images/logoResolutions.png" alt="logo"></a><span class="splash-description">Por Favor Ingresa la Información</span></div>
            <div class="card-body">                               
                <form method="post" action="Usuario">
                    <div class="form-group">
                        <input class="form-control form-control-lg" id="inputName" type="text" name="txtNombreUsu" placeholder="Ingresa tu Usuario" required="" autocomplete="off" autofocus="">
                    </div>
                    <div class="form-group">
                    <div class="input-group">
                        <input class="form-control form-control-lg" id="txtPassword" type="password" name="txtClaveUsu" placeholder="Ingresa la Contraseña" required="">
                        <button id="show_password" class="btn btn-primary" type="button" onclick="mostrarPassword()"> <span class="fa fa-eye-slash icon"></span> </button>
                    </div>
                    </div>
                    <div class="form-group">
                    <div class="input-group-append">
                        <label class="custom-control custom-checkbox">
                            <input class="custom-control-input" type="checkbox" name="checkno" value="remember-me"><span class="custom-control-label">Recordar mis datos</span>
                        </label>
                    </div>
                    </div>
                    <input type="hidden" name="seleccion" value="entrar">
                    <button type="submit" class="btn btn-primary btn-lg btn-block">Iniciar Sesión</button>
                </form>
            </div>
            <div class="card-footer bg-white p-0">
                <div class="card-footer-item card-footer-item-bordered">
                    <a href="IngreseCorreo.jsp" class="footer-link">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp He olvidado mi Contraseña</a>
                </div>
            </div>
            <div class="card-footer bg-white p-0">
                <div class="card-footer-item card-footer-item-bordered">
                    <a href="http://ior.ad/6L1F" target="_blank" class="footer-link">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp¿Como Inicio Sesión?</a>
                </div>
            </div>
            <%
                    if(request.getAttribute("Mensaje")!=null){
            %>
            <hr>
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                <strong>¡No se pudo ingresar!</strong> ${Mensaje}.
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <%
                }
            %>
        </div>
    </div>
  
    <!-- ============================================================== -->
    <!-- end login page  -->
    <!-- ============================================================== -->
    <!-- Optional JavaScript -->
    <script src="assets/vendor/jquery/jquery-3.3.1.min.js"></script>
    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
    <script type="text/javascript" src="assets/libs/js/Popper.js"></script>
    <script type="text/javascript" src="assets/libs/js/jQuery.js"></script>
    <script type="text/javascript" src="assets/libs/js/bootstrap.js"></script>
    <script type="text/javascript">
    function mostrarPassword(){
                    var cambio = document.getElementById("txtPassword");
                    if(cambio.type == "password"){
                            cambio.type = "text";
                            $('.icon').removeClass('fa fa-eye-slash').addClass('fa fa-eye');
                    }else{
                            cambio.type = "password";
                            $('.icon').removeClass('fa fa-eye').addClass('fa fa-eye-slash');
                    }
            }
    </script>
</body>
 
</html>
