<%-- 
    Document   : Cliente
    Created on : 11/09/2019, 07:49:44 AM
    Author     : APRENDIZ
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="modeloDAO.ClienteDAO"%>
<%@page import="modeloVO.ClienteVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page errorPage="404Page.jsp" %> 
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
                            <h2 class="pageheader-title">Insertar Cliente</h2>
                            <div class="page-breadcrumb">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Menú</a></li>
                                        <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Gestionar Clientes</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Insertar Cliente</li>
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
                                <h5 class="card-header">Insertar Cliente</h5>
                                <div class="card-body">                                    
                                    <%if (request.getParameter("insertarCliente")!=null){%>
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
                                    <div class="form-group">
                                        <small>Los campos con (*) son obligatorios</small> 
                                     </div> 
                                    <form method="post" action="ClienteControlador" id="validationform" data-parsley-validate="" novalidate="">
                                        <div class="form-group row">
                                            <label class="col-12 col-sm-3 col-form-label text-sm-right">Identificación del Cliente *</label>
                                            <div class="col-12 col-sm-8 col-lg-6">
                                                <input type="number" required="" data-parsley-minlength="7" placeholder="Ej. 0000000" class="form-control" name="txtIdCli" autofocus="">                                                
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-12 col-sm-3 col-form-label text-sm-right">Nombre del Cliente *</label>
                                            <div class="col-12 col-sm-8 col-lg-6">
                                                <input type="text" required="" data-parsley-maxlength="50" placeholder="Ej. Entidad S.A.S" class="form-control" name="txtNombreCli">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-12 col-sm-3 col-form-label text-sm-right">Dirección del Cliente *</label>
                                            <div class="col-12 col-sm-8 col-lg-6">
                                                <input type="text" required="" data-parsley-maxlength="25" placeholder="Ej. Cra 00c #00-00" class="form-control" name="txtDireccionCli">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-12 col-sm-3 col-form-label text-sm-right">Teléfono del Cliente</label>
                                        <div class="col-12 col-sm-8 col-lg-6">                                            
                                            <input type="number" data-parsley-minlength="7" class="form-control" id="phone-mask" placeholder="Ej. 0000000" name="txtTelefonoCli">
                                        </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-12 col-sm-3 col-form-label text-sm-right">Celular del Cliente</label>
                                        <div class="col-12 col-sm-8 col-lg-6">                                             
                                            <input type="number" data-parsley-minlength="10" class="form-control" id="international-mask" placeholder="Ej. 0000000000" name="txtCelularCli">                                            
                                        </div>
                                        </div>  
                                        <div class="form-group row text-right">
                                            <div class="col col-sm-10 col-lg-9 offset-sm-1 offset-lg-0">
                                                <button class="btn btn-space btn-primary" name="insertarCliente">Insertar Cliente</button>
                                                <input type="hidden" value="1" name="opcion">
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
</body>
</html>
