<%-- 
    Document   : top
    Created on : 09-sep-2019, 20:02:27
    Author     : FelipeC
--%>

<%@page import="modeloDAO.UsuarioDAO"%>
<%@page import="modeloVO.UsuarioVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page errorPage="../FrmLogin.jsp" %> 
<%
    UsuarioVO usuVO = new UsuarioVO();
    UsuarioDAO usuDAO = new UsuarioDAO(usuVO);
    HttpSession currentSession = request.getSession();
    Object cuenta = currentSession.getAttribute("dta");
    if(cuenta==null){
        response.sendRedirect("FrmLogin.jsp");
    }
    UsuarioVO perfilVO = (UsuarioVO) cuenta;
 response.setHeader("Cache-Control","no-cache"); //HTTP 1.1 
 response.setHeader("Pragma","no-cache"); //HTTP 1.0 
 response.setDateHeader ("Expires", 0); //prevents caching at the proxy server  
%>
<!DOCTYPE html>
<div class="dashboard-header">
            <nav class="navbar navbar-expand-lg bg-white fixed-top">
                <a class="navbar-brand" href="index.jsp"><img src="assets/images/logoResolutions.png" /></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ml-auto navbar-right-top">
                                               
                        <li class="nav-item dropdown nav-user">
                            <a class="nav-link nav-user-img" href="#" id="navbarDropdownMenuLink2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="assets/images/avatar1.png" alt="" class="user-avatar-md rounded-circle"></a>
                            <div class="dropdown-menu dropdown-menu-right nav-user-dropdown" aria-labelledby="navbarDropdownMenuLink2">
                                <div class="nav-user-info">
                                    <h5 class="mb-0 text-white nav-user-name"><%= perfilVO.getNombreUsu() %></h5>
                                    <span class="status"></span><span class="ml-2">Activo</span>
                                </div>
                                <a class="dropdown-item" href="MiCuenta.jsp"><i class="fas fa-user mr-2"></i>Mi Cuenta</a>
                                <form method="post" action="Usuario">
                                    <input type="hidden" name="seleccion" value="cerrar">
                                    <button class="dropdown-item" type="submit"><i class="fas fa-power-off mr-2"></i>Cerrar Sesión</button>
                                </form>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
