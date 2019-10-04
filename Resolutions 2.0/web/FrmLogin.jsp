<%-- 
    Document   : FrmLogin
    Created on : 28/09/2019, 11:51:56 PM
    Author     : AFCHT
--%>

<%@page import="modeloDAO.UsuarioDAO"%>
<%@page import="modeloVO.UsuarioVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<%
    UsuarioVO usuVO = new UsuarioVO();
    UsuarioDAO usuDAO = new UsuarioDAO(usuVO);
    
    HttpSession currentSession = request.getSession();
    Cookie[] cookies=request.getCookies();
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if(cookie.getName().equals("nUsu")) {
                usuVO = usuDAO.consulta(cookie.getValue().toString());
                currentSession.setAttribute("dta", usuVO);
            }
        }
    }
    Object cuenta = currentSession.getAttribute("dta");
    if(cuenta!=null){
        response.sendRedirect("index.jsp");
    }
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
    <!-- login page  -->
    <!-- ============================================================== -->
    <div class="splash-container">
        <div class="card ">
            <div class="card-header text-center"><a href="FrmLogin.jsp"><img class="logo-img" src="assets/images/logoResolutions.png" alt="logo"></a><span class="splash-description">Por Favor Ingresa la Información</span></div>
            <div class="card-body">
                <form method="post" action="Usuario">
                    <div class="form-group">
                        <input class="form-control form-control-lg" id="inputName" type="text" name="txtNombreUsu" placeholder="Ingresa tu Usuario" required="" autocomplete="off">
                    </div>
                    <div class="form-group">
                        <input class="form-control form-control-lg" id="inputPassword" type="password" name="txtClaveUsu" placeholder="Ingresa la Contraseña" required="">
                    </div>
                    <div class="form-group">
                        <label class="custom-control custom-checkbox">
                            <input class="custom-control-input" type="checkbox" name="checkno" value="remember-me"><span class="custom-control-label">Recordar mis datos</span>
                        </label>
                    </div>
                    <input type="hidden" name="seleccion" value="entrar">
                    <button type="submit" class="btn btn-primary btn-lg btn-block">Iniciar Sesión</button>
                </form>
            </div>
            <div class="card-footer bg-white p-0  ">
                <div class="card-footer-item card-footer-item-bordered">
                    <a href="#" class="footer-link">Crear Cuenta</a></div>
                <div class="card-footer-item card-footer-item-bordered">
                    <a href="IngreseCorreo.jsp" class="footer-link">Olvide mi Contraseña</a>
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
</body>
 
</html>
