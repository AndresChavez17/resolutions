<%-- 
    Document   : ActualizarEquipo
    Created on : 24/09/2019, 07:42:38 AM
    Author     : APRENDIZ
--%>

<%@page import="modeloVO.EstadoVO"%>
<%@page import="modeloVO.ClienteVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modeloDAO.EquipoDAO"%>
<%@page import="modeloVO.EquipoVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="FrmLogin.jsp" %>
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
                            <h2 class="pageheader-title">Actualizar Equipo</h2>
                            <div class="page-breadcrumb">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Menú</a></li>
                                        <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Gestionar Equipos</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Actualizar Equipo</li>
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
                                <h5 class="card-header">Actualizar Equipo</h5>
                                <div class="card-body">
                                    <form id="validationform" data-parsley-validate="" novalidate="" method="post" action="EquipoControlador">
                                        <div class="form-group row">
                                            <label class="col-12 col-sm-3 col-form-label text-sm-right">Seleccione el equipo que desea actualizar</label>
                                            <div class="col-12 col-sm-8 col-lg-6">
                                                <select name="txtIdEq" class="form-control single-select-search" required="">
                                                    <option  value="">Seleccione...</option>
                                                    <%
                                                        EquipoVO EquipVO = new EquipoVO();
                                                        EquipoDAO EquipDAO = new EquipoDAO();
                                                        ArrayList<EquipoVO> ListarEquips = EquipDAO.listar();
                                                        for (int i = 0; i < ListarEquips.size(); i++) {
                                                            EquipVO = ListarEquips.get(i);
                                                    %>
                                                    <option value="<%= EquipVO.getIdEq()%>"><%= EquipVO.getIdEq()%> - <%= EquipVO.getNombreEq()%></option>
                                                    <%
                                                        }
                                                    %>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group row text-right">
                                            <div class="col col-sm-10 col-lg-9 offset-sm-1 offset-lg-0">
                                                <button class="btn btn-space btn-primary" name="buscarEquipo">Buscar Equipo</button>
                                                <input type="hidden" value="5" name="opcion">
                                            </div>
                                        </div>
                                    </form>
                                    <%if (request.getParameter("buscarEquipo")!=null){%>
                                    <%if(request.getAttribute("MensajeErrorBuscar")!=null){%>
                                    <div class="alert alert-danger alert-dismissable">
                                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                                        <h3 class="text-danger">${MensajeErrorBuscar}</h3>
                                    </div>
                                    <%}else{ %>
                                    <form id="validationform" data-parsley-validate="" novalidate="" method="post" action="EquipoControlador" name="formAct">
                                        <%
                                        EquipoVO equVO = (EquipoVO) request.getAttribute("voLlenoActualizar");
                                        if (equVO != null) {
                                        %>
                                            <h3 class="section-title">Equipo Encontrado</h3>
                                            <div class="form-group">
                                                <small>Los campos con (*) son obligatorios</small> 
                                             </div>
                                            <div class="table-responsive">
                                                <table class="table table-primary table-bordered table-striped table-hover">
                                                    <thead class="thead-light">
                                                        <tr>
                                                            <th scope="col">Identificación *</th>
                                                            <th scope="col">Cliente *</th>
                                                            <th scope="col">Estado *</th>
                                                            <th scope="col">Nombre *</th>
                                                            <th scope="col">Inventario *</th>
                                                            <th scope="col">Marca *</th>
                                                            <th scope="col">Serie *</th>
                                                            <th scope="col">Ubicación *</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td><input type="number" required="" readonly="" class="form-control" name="txtIdEq" value="<%=equVO.getIdEq()%>"></td>
                                                            <td>
                                                                <select class="form-control single-select-search" name="txtIdEqCli">
                                                                    <%
                                                                        ClienteVO clientVO = new ClienteVO();

                                                                        EquipoDAO clientDAO = new EquipoDAO();

                                                                        ArrayList<ClienteVO> ListarClient = clientDAO.listarClientes();

                                                                        for (int i = 0; i < ListarClient.size(); i++) {
                                                                            clientVO = ListarClient.get(i);
                                                                    %>
                                                                        <option name="txtIdEqCli" value="<%= clientVO.getIdCli()%>"><%= clientVO.getIdCli() %> - <%= clientVO.getNombreCli()%></option>
                                                                    <%
                                                                        }
                                                                    %>
                                                                </select>
                                                            </td>
                                                            <td>
                                                            <select class="form-control" name="txtIdEqEst">
                                                                <%
                                                                    EstadoVO estdVO = new EstadoVO();
                                                                    EquipoDAO equipitDAO = new EquipoDAO();

                                                                    ArrayList<EstadoVO> ListarEstds = equipitDAO.listarEstados();

                                                                    for (int i = 0; i < ListarEstds.size(); i++) {
                                                                        estdVO = ListarEstds.get(i);
                                                                %>
                                                                    <option value="<%= estdVO.getIdEst()%>"><%= estdVO.getIdEst()%> - <%= estdVO.getNombreEst()%></option>
                                                                <%
                                                                    }
                                                                %>
                                                            </select>
                                                            </td>
                                                            <td><input type="text" required="" data-parsley-maxlength="50" placeholder="Ej. Nevera Industrial" class="form-control" name="txtNombreEq" value="<%=equVO.getNombreEq()%>"></td>
                                                            <td><input type="text" required="" data-parsley-maxlength="20" placeholder="Ej. Mixto" class="form-control" name="txtInventarioEq" value="<%=equVO.getInventarioEq()%>"></td>
                                                            <td><input type="text" required="" data-parsley-maxlength="20" placeholder="Ej. Mabbe" class="form-control" name="txtMarcaEq" value="<%=equVO.getMarcaEq()%>"></td>
                                                            <td><input type="number" required="" data-parsley-maxlength="11" placeholder="Ej. 0000" class="form-control" name="txtSerieEq" value="<%=equVO.getSerieEq()%>"></td>
                                                            <td><input type="text" required="" data-parsley-maxlength="15" placeholder="Ej. Cocina" class="form-control" name="txtUbicacionEq" value="<%=equVO.getUbicacionEq()%>"></td>                                                            
                                                        </tr>                                                    
                                                    </tbody>
                                                </table>
                                            </div>
                                            <%}
                                            }
                                            }%>
                                            <%if (request.getParameter("buscarEquipo")!=null){%>
                                            <div class="form-group row text-right">
                                                <div class="col col-sm-10 col-lg-9 offset-sm-1 offset-lg-0">
                                                    <button class="btn btn-space btn-primary" name="actualizarEquipo">Actualizar Equipo</button>
                                                    <input type="hidden" value="2" name="opcion">
                                                </div>
                                            </div>
                                            <%}%>
                                    </form>
                                    <%if (request.getParameter("actualizarEquipo")!=null){%>
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
