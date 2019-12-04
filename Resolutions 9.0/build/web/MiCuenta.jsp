<%-- 
    Document   : MiCuenta
    Created on : 3/10/2019, 02:40:03 PM
    Author     : APRENDIZ
--%>

<%@page import="modeloVO.*"%>
<%@page import="modeloDAO.*"%>
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
                            <h2 class="pageheader-title">Mi Cuenta</h2>
                            <div class="page-breadcrumb">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item active" aria-current="page">Mi Cuenta</li>
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
                                <h5 class="card-header">Mi Cuenta</h5>                                
                                <div class="card-body">
                                    <%if (request.getParameter("actualizarPersona")!=null){%>
                                    <%if(request.getAttribute("MensajeError")!=null){%>
                                    <div class="alert alert-danger alert-dismissable fade show">
                                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                                        <h3 class="text-danger">${MensajeError}</h3>
                                    </div>
                                    <%}else{ %>
                                    <div class="alert alert-success alert-dismissable fade show">
                                        <button type="button" class="close" data-dismiss="alert">&times;</button>                                    
                                        <h3 class="text-success">${MensajeExito}<%}%></h3>
                                    </div>
                                    <%}%>
                                    <%if(request.getAttribute("MensajeErrorC")!=null){%>
                                    <div class="alert alert-danger alert-dismissable fade show">
                                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                                        <h3 class="text-danger">${MensajeErrorC}</h3>
                                    </div>
                                    <%}else if(request.getAttribute("MensajeExitoC")!=null){ %>
                                    <div class="alert alert-success alert-dismissable fade show">
                                        <button type="button" class="close" data-dismiss="alert">&times;</button>                                    
                                        <h3 class="text-success">${MensajeExitoC}</h3>
                                    </div>
                                    <%}%>
                                    <%--<div class="form-group row">
                                        <label class="col-12 col-sm-3 col-form-label text-sm-right">Número de Usuario</label>
                                        <div class="col-12 col-sm-8 col-lg-6">
                                            <input type="number" class="form-control" value="<%= perVO.getIdUsu()%>" name="txtIdUsu" readonly="">
                                        </div>
                                    </div>--%>
                                    <div class="form-group row">
                                        <label class="col-12 col-sm-3 col-form-label text-sm-right">Tipo de Usuario</label>
                                        <div class="col-12 col-sm-8 col-lg-6">
                                        <%if(perVO.getTipoPer().equals("1")){%>
                                        <input type="text" class="form-control" value="Administrador" name="txtTipoPer" readonly="">
                                        <%}else{%>
                                        <input type="text" class="form-control" value="Empleado" name="txtTipoPer" readonly="">
                                        <%}%>
                                        </div>
                                    </div> 
                                    <form id="validationform" data-parsley-validate="" novalidate="" method="post" action="PersonasControlador" name="formAct">
                                    <div class="form-group row">
                                        <label class="col-12 col-sm-3 col-form-label text-sm-right">Número de Persona</label>
                                        <div class="col-12 col-sm-8 col-lg-6">
                                            <input type="number" class="form-control" value="<%= perVO.getIdPer()%>" name="txtIdPer" readonly="">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-12 col-sm-3 col-form-label text-sm-right">Nombres</label>
                                        <div class="col-12 col-sm-8 col-lg-6">
                                            <input type="text" class="form-control" name="txtNombrePer" data-parsley-maxlength="30" required="" placeholder="Ej. Tobias Antonio" value="<%= perVO.getNombrePer()%>">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-12 col-sm-3 col-form-label text-sm-right">Apellidos</label>
                                        <div class="col-12 col-sm-8 col-lg-6">
                                            <input type="text" class="form-control" name="txtApellidoPer" data-parsley-maxlength="30" required="" placeholder="Ej. Soderberg Ortiz" value="<%= perVO.getApellidoPer()%>">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-12 col-sm-3 col-form-label text-sm-right">Tipo Documento</label>
                                        <div class="col-12 col-sm-8 col-lg-6">
                                            <select class="form-control" name="txtTipoDocumentoPer">
                                                <option><%= perVO.getTipoDocumentoPer()%></option>
                                                <option value="C.C">Cédula de ciudadanía</option>
                                                <option value="T.I">Tarjeta de identidad</option>
                                                <option value="C.E">Cédula de extranjería</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-12 col-sm-3 col-form-label text-sm-right">Número de Identificación</label>
                                        <div class="col-12 col-sm-8 col-lg-6">
                                            <input type="number" data-parsley-minlength="7" required="" class="form-control" name="txtIdentificacionPer" placeholder="Ej. 0000000" value="<%= perVO.getIdentificacionPer()%>">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-12 col-sm-3 col-form-label text-sm-right">Correo Eléctronico</label>
                                        <div class="col-12 col-sm-8 col-lg-6">
                                            <input type="email" class="form-control" required="" placeholder="Ej. resolutions210@gmail.com" name="txtCorreoPer" value="<%= perVO.getCorreoPer()%>">
                                        </div>
                                    </div>
                                    <div class="form-group row text-right">
                                        <div class="col col-sm-10 col-lg-9 offset-sm-1 offset-lg-0">
                                            <button type="button" class="btn btn-space btn-primary" data-toggle="modal" data-target="#passwordModal"><i class="fas fa-key mr-2"></i>Cambiar contraseña</button>
                                            <button class="btn btn-space btn-primary" name="actualizarPersona">Actualizar</button>
                                            <input type="hidden" value="2" name="opcion">
                                        </div>
                                    </div>
                                </form>
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
        
            <div class="modal fade" id="passwordModal" tabindex="-1" role="dialog" aria-labelledby="passwordModal" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Cambiar contraseña</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                    <div class="">
                                        <div class="form-group">
                                            <small>Los campos con (*) son obligatorios</small> 
                                        </div>
                                        <form method="post" action="Usuario" data-parsley-validate="" novalidate="">
                                            <div class="form-group">
                                                <label class="">Contraseña actual *</label>
                                                <div class="col-12 col-sm-8 col-lg-6">
                                                    <input type="text" required data-parsley-maxlength="35" placeholder="*******" class="form-control" name="cambiarClave">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="">Nueva contraseña *</label>
                                                <div class="col-12 col-sm-8 col-lg-6">
                                                    <input type="text" required data-parsley-maxlength="35" placeholder="*******" class="form-control" name="nuevaClave1">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="">Confirmar nueva contraseña *</label>
                                                <div class="col-12 col-sm-8 col-lg-6">
                                                    <input type="text" required data-parsley-maxlength="35" placeholder="*******" class="form-control" name="nuevaClave2">
                                                </div>
                                            </div>
                                            <input type="hidden" value="cambiar" name="seleccion">
                                            <input type="hidden" value="<%= perfilVO.getIdUsu() %>" name="txtIdUsu">
                                            <div class="modal-footer">
                                                <input type="submit" class="btn btn-space btn-primary" name="" value="Cambiar">
                                                <button type="button" class="btn btn-space btn-danger" data-dismiss="modal">Cerrar</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                        </div>
                    </div>
                </div>
            </div>
</body>
</html>
