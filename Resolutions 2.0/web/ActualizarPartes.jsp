<%-- 
    Document   : ActualizarPartes
    Created on : 28/09/2019, 05:34:16 PM
    Author     : AFCHT
--%>

<%@page import="modeloDAO.EquipoDAO"%>
<%@page import="modeloVO.EstadoVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modeloDAO.PartesDAO"%>
<%@page import="modeloVO.EquipoVO"%>
<%@page import="modeloVO.PartesVO"%>
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
                            <h2 class="pageheader-title">Actualizar Partes</h2>
                            <div class="page-breadcrumb">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Menú</a></li>
                                        <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Gestionar Partes</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Actualizar Parte</li>
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
                                <h5 class="card-header">Actualizar Parte</h5>
                                <div class="card-body">
                                    <h3 class="section-title">Ingrese la Identificación de la Parte que desea Actualizar</h3>
                                    <form id="validationform" data-parsley-validate="" novalidate="" method="post" action="Partes">
                                        <div class="form-group row">
                                            <label class="col-12 col-sm-3 col-form-label text-sm-right">Identificación de la Parte</label>
                                            <div class="col-12 col-sm-8 col-lg-6">
                                                <input data-parsley-type="number" type="number" required="" placeholder="Ingrese la Identificación" class="form-control" name="txtIdPart">
                                            </div>
                                        </div>
                                        <div class="form-group row text-right">
                                            <div class="col col-sm-10 col-lg-9 offset-sm-1 offset-lg-0">
                                                <button class="btn btn-space btn-primary" name="buscarParte">Buscar Parte</button>
                                                <input type="hidden" value="5" name="opcion">
                                            </div>
                                        </div>
                                    </form>
                                    <%if (request.getParameter("buscarParte")!=null){%>
                                    <%if(request.getAttribute("MensajeErrorBuscar")!=null){%>
                                    <div class="alert alert-danger alert-dismissable">
                                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                                        <h3 class="text-danger">${MensajeErrorBuscar}</h3>
                                    </div>
                                    <%}else{ %>
                                    <form id="validationform" data-parsley-validate="" novalidate="" method="post" action="Partes" name="formAct">
                                        <%
                                        PartesVO partVO = (PartesVO) request.getAttribute("voLlenoActualizar");
                                        if (partVO != null) {
                                        %>
                                            <h3 class="section-title">Parte Encontrada</h3>
                                            <div class="table-responsive">
                                                <table class="table table-primary table-bordered table-striped table-hover">
                                                    <thead class="thead-light">
                                                        <tr>
                                                            <th scope="col">Identificación de la Parte</th>
                                                            <th scope="col">Identificación del Equipo</th>
                                                            <th scope="col">Identificación del Estado</th>
                                                            <th scope="col">Nombre</th>
                                                            <th scope="col">Tipo</th>
                                                            <th scope="col">Comentario</th>                                                            
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td><input type="number" required="" placeholder="Ingrese la Identificación" class="form-control" name="txtIdPart" value="<%=partVO.getIdPart()%>"></td>
                                                            <td><input type="number" required="" placeholder="Ingrese la Identificación" class="form-control" name="txtIdEq" value="<%=partVO.getIdEq()%>"></td>
                                                            <td><input type="number" required="" min="4" max="6" placeholder="Ingrese la Identificación" class="form-control" name="txtIdEst" value="<%=partVO.getIdEst()%>"></td>
                                                            <td><input type="text" required="" data-parsley-maxlength="50" placeholder="Ingrese el Nombre" class="form-control" name="txtNombrePart" value="<%=partVO.getNombrePart()%>"></td>
                                                            <td><input type="text" required="" data-parsley-maxlength="25" placeholder="Ingrese el Tipo" class="form-control" name="txtTipoPart" value="<%=partVO.getTipoPart()%>"></td>
                                                            <td><input type="text" required="" data-parsley-maxlength="50" placeholder="Ingrese el Comentario" class="form-control" name="txtComentarioPart" value="<%=partVO.getComentarioPart()%>"></td> 
                                                        </tr>                                                    
                                                    </tbody>
                                                </table>
                                            </div>
                                            <%}
                                            }
                                            }%>
                                            <%if (request.getParameter("buscarParte")!=null){%>
                                            <div class="form-group row text-right">
                                                <div class="col col-sm-10 col-lg-9 offset-sm-1 offset-lg-0">
                                                    <button class="btn btn-space btn-primary" name="actualizarParte">Actualizar Parte</button>
                                                    <input type="hidden" value="2" name="opcion">
                                                </div>
                                            </div>
                                            <%}%>
                                    </form>
                                    <%if (request.getParameter("actualizarParte")!=null){%>
                                    <%if(request.getAttribute("MensajeError")!=null){%>
                                    <div class="alert alert-danger alert-dismissable">
                                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                                        <h3 class="text-danger">${MensajeError}</h3>
                                    </div>
                                    <%}else{ %>
                                    <div class="alert alert-success alert-dismissable">
                                        <button type="button" class="close" data-dismiss="alert">&times;</button>                                    
                                        <h3 class="text-success">${MensajeExito}<%}%></h3>
                                    </div>
                                    <%}%>
                                </div>                            
                            </div>
                    </div>
                </div>
                <div class="row">
                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6">
                            <div class="card">
                                <h5 class="card-header">Información de los Equipos</h5>
                                <div class="card-body">
                                    <div class="table-responsive ">
                                        <table class="table table-primary table-bordered table-striped table-hover">
                                            <thead class="thead-light">
                                                <tr>
                                                    <th scope="col">Identificación del Equipo</th>
                                                    <th scope="col">Identificación del Cliente</th>
                                                    <th scope="col">Nombre del Equipo</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <%
                                            EquipoVO equiVO = new EquipoVO();
                                            PartesDAO partDAO = new PartesDAO();

                                            ArrayList<EquipoVO> ListarEquipos = partDAO.listarEquipos();

                                            for (int i = 0; i < ListarEquipos.size(); i++) {
                                                equiVO = ListarEquipos.get(i);
                                            %>

                                                <tr>
                                                    <td><%=equiVO.getIdEq()%></td>
                                                    <td><%=equiVO.getIdEqCli()%></td>
                                                    <td><%=equiVO.getNombreEq()%></td>
                                                </tr>
                                            <%}%>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>                            
                            </div>
                    </div>
                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6">
                            <div class="card">
                                <h5 class="card-header">Información de los Estados</h5>
                                <div class="card-body">
                                    <div class="table-responsive ">
                                        <table class="table table-primary table-bordered table-striped table-hover">
                                            <thead class="thead-light">
                                                <tr>
                                                    <th scope="col">Identificación del Estado</th>
                                                    <th scope="col">Nombre del Estado</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <%                                            
                                            EstadoVO estadoVO = new EstadoVO();
                                            PartesDAO parteDAO = new PartesDAO();

                                            ArrayList<EstadoVO> ListarEstados = parteDAO.listarEstados();
                                            
                                            for (int i = 0; i < ListarEstados.size(); i++) {
                                                estadoVO = ListarEstados.get(i);
                                            %>

                                                <tr>
                                                    <td><%=estadoVO.getIdEst()%></td>
                                                    <td><%=estadoVO.getNombreEst()%></td>
                                                </tr>
                                            <%}%>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>                            
                            </div>
                    </div>
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <div class="card">
                                <h5 class="card-header">Tabla con todas las Partes</h5>
                                <div class="card-body">
                                    <div class="table-responsive ">
                                        <table class="table table-primary table-bordered table-striped table-hover">
                                            <thead class="thead-light">
                                                <tr>
                                                    <th scope="col">Identificación de la Parte</th>
                                                    <th scope="col">Identificación del Equipo</th>
                                                    <th scope="col">Identificación del Estado</th>
                                                    <th scope="col">Nombre</th>
                                                    <th scope="col">Tipo</th>
                                                    <th scope="col">Comentario</th>                                                    
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <%                                            
                                            PartesVO partesVO = new PartesVO();
                                            PartesDAO partesDAO = new PartesDAO();

                                            ArrayList<PartesVO> ListarPartes = partesDAO.listar();
                                                
                                            for (int i = 0; i < ListarPartes.size(); i++) {
                                                partesVO = ListarPartes.get(i);
                                            %>

                                                <tr>
                                                    <td><%=partesVO.getIdPart()%></td>
                                                    <td><%=partesVO.getIdEq()%></td>
                                                    <td><%=partesVO.getIdEst()%></td>
                                                    <td><%=partesVO.getNombrePart()%></td>
                                                    <td><%=partesVO.getTipoPart()%></td> 
                                                    <td><%=partesVO.getComentarioPart()%></td> 
                                                </tr>
                                            <%}%>
                                            </tbody>
                                        </table>
                                    </div>
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
