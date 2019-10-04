<%-- 
    Document   : menu
    Created on : 09-sep-2019, 20:02:58
    Author     : FelipeC
--%>

<%@page import="modeloDAO.PersonasDAO"%>
<%@page import="modeloVO.PersonasVO"%>
<%@page import="modeloDAO.UsuarioDAO"%>
<%@page import="modeloVO.UsuarioVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    UsuarioVO usuVO = new UsuarioVO();
    UsuarioDAO usuDAO = new UsuarioDAO(usuVO);
    HttpSession currentSession = request.getSession();
    Object cuenta = currentSession.getAttribute("dta");
    if(cuenta==null){
        response.sendRedirect("FrmLogin.jsp");
    }
    UsuarioVO perfilVO = (UsuarioVO) cuenta;
    PersonasVO perVO = new PersonasVO();
    PersonasDAO perDAO = new PersonasDAO();
    
    perVO = perDAO.buscarRegistro(perfilVO.getIdUsu());
 response.setHeader("Cache-Control","no-cache"); //HTTP 1.1 
 response.setHeader("Pragma","no-cache"); //HTTP 1.0 
 response.setDateHeader ("Expires", 0); //prevents caching at the proxy server  
%>
<!DOCTYPE html>
<%
if(perVO.getTipoPer().equals("1")){%>
<div class="nav-left-sidebar sidebar-dark">
            <div class="menu-list">
                <nav class="navbar navbar-expand-lg navbar-light">
                    <a class="d-xl-none d-lg-none" href="#">Tablero</a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav flex-column">
                            <li class="nav-divider">
                                Menú
                            </li>
                            <li class="nav-item ">
                                <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-1" aria-controls="submenu-1"><i class="fa fa-fw fa-user-circle"></i>Gestión Clientes <span class="badge badge-success">6</span></a>
                                <div id="submenu-1" class="collapse submenu" style="">
                                    <ul class="nav flex-column">                                        
                                        <li class="nav-item">
                                            <a class="nav-link" href="InsertarCliente.jsp">Insertar Cliente</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="ActualizarCliente.jsp">Actualizar Cliente</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="BuscarEliminarCliente.jsp">Buscar y Deshabilitar Cliente</a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-2" aria-controls="submenu-2"><i class="fa fa-fw fa-plug"></i>Gestión Equipos</a>
                                <div id="submenu-2" class="collapse submenu" style="">
                                    <ul class="nav flex-column">
                                        <li class="nav-item">
                                            <a class="nav-link" href="InsertarEquipo.jsp">Insertar Equipo</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="ActualizarEquipo.jsp">Actualizar Equipo</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="BuscarEliminarEquipo.jsp">Buscar y Eliminar Equipo</a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-3" aria-controls="submenu-3"><i class="fas fa-fw fa-cogs"></i>Gestión Partes</a>
                                <div id="submenu-3" class="collapse submenu" style="">
                                    <ul class="nav flex-column">
                                        <li class="nav-item">
                                            <a class="nav-link" href="InsertarParte.jsp">Insertar Parte</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="ActualizarPartes.jsp">Actualizar Parte</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="BuscarEliminarParte.jsp">Buscar y Eliminar Parte</a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li class="nav-item ">
                                <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-4" aria-controls="submenu-4"><i class="fab fa-fw fa-wpforms"></i>Gestión Servicios</a>
                                <div id="submenu-4" class="collapse submenu" style="">
                                    <ul class="nav flex-column">
                                        <li class="nav-item">
                                            <a class="nav-link" href="FrmServicio.jsp">Gestionar Servicio</a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-5" aria-controls="submenu-5"><i class="fas fa-fw fa-table"></i>Gestión Estados</a>
                                <div id="submenu-5" class="collapse submenu" style="">
                                    <ul class="nav flex-column">
                                        <li class="nav-item">
                                            <a class="nav-link" href="FrmEstado.jsp">Gestionar Estado</a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-6" aria-controls="submenu-6"><i class="fas fa-fw fa-user"></i>Gestión Usuarios</a>
                                <div id="submenu-6" class="collapse submenu" style="">
                                    <ul class="nav flex-column">
                                        <li class="nav-item">
                                            <a class="nav-link" href="FrmUsuario.jsp">Gestionar Usuario</a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-7" aria-controls="submenu-7"><i class="fas fa-fw fa-file"></i>Reporte General</a>
                                <div id="submenu-7" class="collapse submenu" style="">
                                    <ul class="nav flex-column">
                                        <li class="nav-item">
                                            <a class="nav-link" href="Reporte_General.jsp">Reporte General</a>
                                        </li>                                        
                                    </ul>
                                </div>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-8" aria-controls="submenu-8"><i class="fas fa-fw fa-file"></i>Reporte Individual</a>
                                <div id="submenu-8" class="collapse submenu" style="">
                                    <ul class="nav flex-column">
                                        <li class="nav-item">
                                            <form method="post" action="Reporte_Ficha_Equipo.jsp">
                                                <input type="number" name="PIQUED">
                                                <button class="btn btn-space btn-primary" type="submit">Generar</button>
                                            </form>
                                        </li>                                        
                                    </ul>
                                </div>
                            </li>                              
                        </ul>
                    </div>
                </nav>
            </div>
        </div>

<%
}else{
%>
<div class="nav-left-sidebar sidebar-dark">
            <div class="menu-list">
                <nav class="navbar navbar-expand-lg navbar-light">
                    <a class="d-xl-none d-lg-none" href="#">Tablero</a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav flex-column">
                            <li class="nav-divider">
                                Menú
                            </li>
                            <li class="nav-item ">
                                <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-1" aria-controls="submenu-1"><i class="fa fa-fw fa-user-circle"></i>Gestión Clientes <span class="badge badge-success">6</span></a>
                                <div id="submenu-1" class="collapse submenu" style="">
                                    <ul class="nav flex-column">                                        
                                        <li class="nav-item">
                                            <a class="nav-link" href="InsertarCliente.jsp">Insertar Cliente</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="ActualizarCliente.jsp">Actualizar Cliente</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="BuscarEliminarCliente.jsp">Buscar y Deshabilitar Cliente</a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-2" aria-controls="submenu-2"><i class="fa fa-fw fa-plug"></i>Gestión Equipos</a>
                                <div id="submenu-2" class="collapse submenu" style="">
                                    <ul class="nav flex-column">
                                        <li class="nav-item">
                                            <a class="nav-link" href="InsertarEquipo.jsp">Insertar Equipo</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="ActualizarEquipo.jsp">Actualizar Equipo</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="BuscarEliminarEquipo.jsp">Buscar y Eliminar Equipo</a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-3" aria-controls="submenu-3"><i class="fas fa-fw fa-cogs"></i>Gestión Partes</a>
                                <div id="submenu-3" class="collapse submenu" style="">
                                    <ul class="nav flex-column">
                                        <li class="nav-item">
                                            <a class="nav-link" href="InsertarParte.jsp">Insertar Parte</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="ActualizarPartes.jsp">Actualizar Parte</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="BuscarEliminarParte.jsp">Buscar y Eliminar Parte</a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li class="nav-item ">
                                <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-4" aria-controls="submenu-4"><i class="fab fa-fw fa-wpforms"></i>Gestión Servicios</a>
                                <div id="submenu-4" class="collapse submenu" style="">
                                    <ul class="nav flex-column">
                                        <li class="nav-item">
                                            <a class="nav-link" href="FrmServicio.jsp">Gestionar Servicio</a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-5" aria-controls="submenu-5"><i class="fas fa-fw fa-table"></i>Gestión Estados</a>
                                <div id="submenu-5" class="collapse submenu" style="">
                                    <ul class="nav flex-column">
                                        <li class="nav-item">
                                            <a class="nav-link" href="FrmEstado.jsp">Gestionar Estado</a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-7" aria-controls="submenu-7"><i class="fas fa-fw fa-file"></i>Reporte General</a>
                                <div id="submenu-7" class="collapse submenu" style="">
                                    <ul class="nav flex-column">
                                        <li class="nav-item">
                                            <a class="nav-link" href="Reporte_General.jsp">Reporte General</a>
                                        </li>                                        
                                    </ul>
                                </div>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-8" aria-controls="submenu-8"><i class="fas fa-fw fa-file"></i>Reporte Individual</a>
                                <div id="submenu-8" class="collapse submenu" style="">
                                    <ul class="nav flex-column">
                                        <li class="nav-item">
                                            <form method="post" action="Reporte_Ficha_Equipo.jsp">
                                                <input type="number" name="PIQUED">
                                                <button class="btn btn-space btn-primary" type="submit">Generar</button>
                                            </form>
                                        </li>                                        
                                    </ul>
                                </div>
                            </li>                              
                        </ul>
                    </div>
                </nav>
            </div>
        </div>

<%
}
%>
