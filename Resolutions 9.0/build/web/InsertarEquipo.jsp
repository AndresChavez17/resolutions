<%-- 
    Document   : InsertarEquipo
    Created on : 23/09/2019, 07:47:49 PM
    Author     : AFCHT
--%>

<%@page import="modeloDAO.EstadoDAO"%>
<%@page import="modeloDAO.ClienteDAO"%>
<%@page import="modeloVO.EstadoVO"%>
<%@page import="modeloVO.ClienteVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modeloDAO.EquipoDAO"%>
<%@page import="modeloVO.EquipoVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                            <h2 class="pageheader-title">Insertar Equipo</h2>
                            <div class="page-breadcrumb">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Menú</a></li>
                                        <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Gestionar Equipos</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Insertar Equipo</li>
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
                                <h5 class="card-header">Insertar Equipo</h5>
                                <div class="card-body">                                    
                                    <%if (request.getParameter("insertarEquipo")!=null){%>
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
                                    <form method="post" action="EquipoControlador" id="validationform" data-parsley-validate="" novalidate="">
                                        <div class="form-group row">
                                            <label class="col-12 col-sm-3 col-form-label text-sm-right">Número del Equipo *</label>
                                            <div class="col-12 col-sm-8 col-lg-6">
                                                <input type="number" required="" placeholder="Ej. 0" class="form-control" name="txtIdEq" autofocus="">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-12 col-sm-3 col-form-label text-sm-right">Cliente *</label>
                                            <div class="col-12 col-sm-8 col-lg-6">
                                                <select class="form-control single-select-search" name="txtIdEqCli" required="">
                                                    <option value="">Seleccione un cliente</option>
                                                <%
                                                    ClienteVO clienVO = new ClienteVO();

                                                    ClienteDAO clienDAO = new ClienteDAO();

                                                    ArrayList<ClienteVO> ListarClientesActivos = clienDAO.listarClientesActivos();

                                                    for (int i = 0; i < ListarClientesActivos.size(); i++) {
                                                        clienVO = ListarClientesActivos.get(i);
                                                %>
                                                    <option name="txtIdEqCli" value="<%= clienVO.getIdCli() %>"><%= clienVO.getIdCli() %> - <%= clienVO.getNombreCli()%></option>
                                                <%
                                                    }
                                                %>
                                                </select>
                                            </div>
                                                <button type="button" class="btn btn-space btn-primary" data-toggle="modal" data-target="#modalNuevoCliente">Nuevo cliente</button>
                                        </div>
                                            <input type="hidden" required="" value="3" name="txtIdEqEst">                                        
                                        <div class="form-group row">
                                            <label class="col-12 col-sm-3 col-form-label text-sm-right">Nombre del Equipo *</label>
                                            <div class="col-12 col-sm-8 col-lg-6">
                                                <input type="text" required="" data-parsley-maxlength="50" placeholder="Ej. Nevera Industrial" class="form-control" name="txtNombreEq">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-12 col-sm-3 col-form-label text-sm-right">Inventario del Equipo *</label>
                                            <div class="col-12 col-sm-8 col-lg-6">
                                                <input type="text" required="" data-parsley-maxlength="20" placeholder="Ej. Mixto" class="form-control" name="txtInventarioEq">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-12 col-sm-3 col-form-label text-sm-right">Marca del Equipo *</label>
                                            <div class="col-12 col-sm-8 col-lg-6">
                                                <input type="text" required="" data-parsley-maxlength="20" placeholder="Ej. Mabbe" class="form-control" name="txtMarcaEq">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-12 col-sm-3 col-form-label text-sm-right">Serie del Equipo *</label>
                                            <div class="col-12 col-sm-8 col-lg-6">
                                                <input type="number" required="" data-parsley-maxlength="11" placeholder="Ej. 00000" class="form-control" name="txtSerieEq">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-12 col-sm-3 col-form-label text-sm-right">Ubicación del Equipo *</label>
                                            <div class="col-12 col-sm-8 col-lg-6">
                                                <input type="text" required="" data-parsley-maxlength="15" placeholder="Ej. Cocina" class="form-control" name="txtUbicacionEq">
                                            </div>
                                        </div>
                                        <div class="form-group row text-right">
                                            <div class="col col-sm-10 col-lg-9 offset-sm-1 offset-lg-0">
                                                <button class="btn btn-space btn-primary" name="insertarEquipo">Insertar Equipo</button>
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
                <div class="modal fade bd-example-modal-lg fade" id="modalNuevoCliente" tabindex="-1" role="dialog" aria-labelledby="modalNuevoCliente" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Nuevo cliente</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <div class="">
                                <h5 class="">Insertar Cliente</h5>
                                <div class="">
                                    <div class="form-group">
                                        <small>Los campos con (*) son obligatorios</small> 
                                     </div>
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
                                        <div class="form-group row text-right modal-footer">
                                            <div class="col col-sm-10 col-lg-9 offset-sm-1 offset-lg-0">
                                                <button class="btn btn-space btn-primary" name="insertarCliente">Insertar Cliente</button>
                                                <input type="hidden" value="8" name="opcion">
                                            </div>
                                        </div>
                                    </form>                                    
                                </div>                            
                            </div>
                    </div>
      </div>
    </div>
  </div>
</div>
    <!-- ============================================================== -->
    <!-- end main wrapper -->
    <!-- ============================================================== -->
    <!-- Optional JavaScript -->
        <jsp:include page= "template/scripts.jsp"></jsp:include>
</body>
</html>
