<%-- 
    Document   : FrmUsuario
    Created on : 29/09/2019, 09:35:16 PM
    Author     : AFCHT
--%>

<%@page import="modeloDAO.PersonasDAO"%>
<%@page import="modeloVO.PersonasVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modeloDAO.UsuarioDAO"%>
<%@page import="modeloVO.UsuarioVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="FrmLogin.jsp" %>
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
<%
if(perVO.getTipoPer().equals("1")){%>
<!DOCTYPE html>
<html lang="en">

<jsp:include page = "template/head.jsp"></jsp:include>


<body>
    <!-- ============================================================== -->
    <!-- main wrapper -->
    <!-- ============================================================== -->
    <div class="dashboard-main-wrapper">
        <!-- ============================================================== -->
        <!-- navbar -->
        <!-- ============================================================== -->
            <jsp:include page= "template/top.jsp"></jsp:include>
        <!-- ============================================================== -->
        <!-- end navbar -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- left sidebar -->
        <!-- ============================================================== -->
            <jsp:include page= "template/menu.jsp"></jsp:include>
        <!-- ============================================================== -->
        <!-- end left sidebar -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- wrapper  -->
        <!-- ============================================================== -->
        <div class="dashboard-wrapper">
            <div class="container-fluid dashboard-content">
                <!-- ============================================================== -->
                <!-- pageheader -->
                <!-- ============================================================== -->
                <div class="row">
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                        <div class="page-header">
                            <h2 class="pageheader-title">Gestionar Usuarios</h2>
                            <div class="page-breadcrumb">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Menú</a></li>
                                        <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Gestionar Usuarios</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Gestionar Usuarios</li>
                                    </ol>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- end pageheader -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- INICIO CONTENIDO DE LA PAGINA -->
                <!-- ============================================================== -->
                <div class="row">
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <div class="card">
                                <h5 class="card-header">Gestionar Usuarios</h5>
                                <div class="card-body">
                                <%
                                    if(request.getAttribute("MensajeB")!=null){
                                %>
                                <div class="alert alert-success alert-dismissible fade show" role="alert">
                                    <strong>${MensajeB}.</strong>
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <%
                                    }
                                %>
                                <%
                                    if(request.getAttribute("MensajeM")!=null){
                                %>
                                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                    <strong>${MensajeM}.</strong>
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <%
                                    }
                                %>
                                <div class="form-group">
                                    <small>Los campos con (*) son obligatorios</small> 
                                 </div>
                                    <form method="post" action="Persona" id="validationform" data-parsley-validate="" novalidate="">                                        
                                        <div class="form-group row">
                                            <label class="col-12 col-sm-3 col-form-label text-sm-right">Número de Usuario *</label>
                                        <div class="col-12 col-sm-8 col-lg-6">                                             
                                            <input type="number" required="" data-parsley-minlength="1" placeholder="Ej. 1" class="form-control" name="idUsu" autofocus="">
                                            
                                        </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-12 col-sm-3 col-form-label text-sm-right">Nombre de usuario *</label>
                                        <div class="col-12 col-sm-8 col-lg-6">                                             
                                            <input type="text" required="" data-parsley-maxlength="25" placeholder="Ej. resolutions210" class="form-control" name="nombreUsu">                                            
                                        </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-12 col-sm-3 col-form-label text-sm-right">Tipo de usuario *</label>
                                        <div class="col-12 col-sm-8 col-lg-6">
                                            <select class="form-control" name="tipoPer" required="">
                                                <option value="">Seleccione...</option>
                                                <option value="1">Administrador</option>
                                                <option value="0">Empleado</option>
                                            </select>
                                        </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-12 col-sm-3 col-form-label text-sm-right">Nombres *</label>
                                        <div class="col-12 col-sm-8 col-lg-6">                                             
                                            <input type="text" required="" data-parsley-maxlength="30" placeholder="Ej. Francisco Simón" class="form-control" name="nombrePer">                                            
                                        </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-12 col-sm-3 col-form-label text-sm-right">Apellidos *</label>
                                        <div class="col-12 col-sm-8 col-lg-6">                                             
                                            <input type="text" required="" data-parsley-maxlength="30" placeholder="Ej. Fortnox Nuñez" class="form-control" name="apellidoPer">                                            
                                        </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-12 col-sm-3 col-form-label text-sm-right">Tipo de documento *</label>
                                        <div class="col-12 col-sm-8 col-lg-6">
                                            <select class="form-control" name="tipoDocumenoPer" required="">
                                                <option value="">Seleccione...</option>
                                                <option value="C.C">Cédula de ciudadanía</option>
                                                <option value="T.I">Tarjeta de identidad</option>
                                                <option value="C.E">Cédula de extranjería</option>
                                            </select>
                                        </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-12 col-sm-3 col-form-label text-sm-right">Nº de documento *</label>
                                        <div class="col-12 col-sm-8 col-lg-6">                                             
                                            <input type="number" required="" data-parsley-minlength="7" placeholder="Ej. 0000000" class="form-control" name="identificacionPer">                                            
                                        </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-12 col-sm-3 col-form-label text-sm-right">Correo Eléctronico *</label>
                                        <div class="col-12 col-sm-8 col-lg-6">                                             
                                            <input type="email" required="" placeholder="Ej. resolutions210@gmail.com" class="form-control" name="correoPer">                                            
                                        </div>
                                        </div>
                                        <div class="form-group row text-right">
                                            <div class="col col-sm-10 col-lg-9 offset-sm-1 offset-lg-0">
                                                <input type="hidden" name="seleccion" value="insertar">
                                                <input class="btn btn-space btn-primary" type="submit" value="Insertar Usuario">
                                            </div>
                                        </div>                                        
                                    </form>
                                    <table id="datatable" class="table table-primary table-bordered table-striped table-hover">
                                        <thead class="thead-light">
                                            <tr>
                                                <th scope="col">Identificación del Usuario</th>
                                                <th scope="col">Nombre</th>
                                                <th scope="col">Estado</th>
                                                <th scope="col">Acciones</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                usuVO = new UsuarioVO();
                                                usuDAO = new UsuarioDAO();
                                                ArrayList<UsuarioVO> listar = usuDAO.listar();
                                                if (listar.size() == 0) {
                                            %>
                                            <tr>
                                                <td colspan="10">No existen Usuarios en la Base de Datos</td>
                                            </tr>
                                            <%
                                            } else {
                                                for (int i = 0; i < listar.size(); i++) {
                                                    usuVO = listar.get(i);
                                            %>
                                            <tr>
                                                <td><%= usuVO.getIdUsu()%></td>
                                                <td><%= usuVO.getNombreUsu()%></td>
                                                <%
                                                if(usuVO.getEstadoUsu().equals("0")){
                                                %>
                                                <td>Inactivo</td>
                                                <%
                                                }else{
                                                %>
                                                <td>Activo</td>
                                                <%
                                                }
                                                %>
                                                <td>
                                                    <%
                                                if(usuVO.getEstadoUsu().equals("1")){
                                                %>
                                                    <form method="post" action="UsuarioControlador2">
                                                        <input type="hidden" name="txtIdUsu" value="<%= usuVO.getIdUsu()%>">
                                                        <input type="hidden" name="opcion" value="4">
                                                        <button name="eliminarUsuarioD" type="submit" class="btn float-left"><i class="fa fa-toggle-on"></i></button>
                                                    </form>
                                                    <form method="post" action="Usuario">
                                                        <input type="hidden" name="txtIdUsu" value="<%= usuVO.getIdUsu()%>">
                                                        <input type="hidden" name="seleccion" value="enviarCorreo">
                                                        <button name="" type="submit" class="btn float-left"><i class="fa fa-envelope-square"></i></button>
                                                    </form>
                                                        <%}else{%>
                                                    <form method="post" action="UsuarioControlador2">
                                                        <input type="hidden" name="txtIdUsu" value="<%= usuVO.getIdUsu()%>">
                                                        <input type="hidden" name="opcion" value="7">
                                                        <button name="eliminarUsuarioH" type="submit" class="btn float-left"><i class="fa fa-toggle-off"></i></button>
                                                    </form>
                                                    <form method="post" action="Usuario">
                                                        <input type="hidden" name="txtIdUsu" value="<%= usuVO.getIdUsu()%>">
                                                        <input type="hidden" name="seleccion" value="enviarCorreo">
                                                        <button name="" type="submit" class="btn float-left"><i class="fa fa-envelope-square"></i></button>
                                                    </form>
                                                        <%}%>
                                                </td>
                                            </tr>
                                            <%
                                                    }
                                                }
                                            %>
                                        </tbody>
                                    </table>
                                    <br>                                    
                            </div>
                    </div>
                </div>
            </div>
                <!-- ============================================================== -->
                <!-- FIN CONTENIDO DE LA PAGINA -->
                <!-- ============================================================== -->
                <jsp:include page= "template/footer.jsp"></jsp:include>
                <!-- ============================================================== -->
                <!-- footer -->
                <!-- ============================================================== -->                   
            </div>
            <!-- ============================================================== -->
            <!-- end footer -->
            <!-- ============================================================== -->        
        </div>
        <!-- ============================================================== -->
        <!-- end main wrapper -->
        <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- end main wrapper -->
    <!-- ============================================================== -->
    <!-- Optional JavaScript -->
        <jsp:include page= "template/scripts.jsp"></jsp:include>
</body>
</html>
<%}else{response.sendRedirect("FrmLogin.jsp");}%>
