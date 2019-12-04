<%-- 
    Document   : ActualizarPartes
    Created on : 28/09/2019, 05:34:16 PM
    Author     : AFCHT
--%>

<%@page import="modeloDAO.EstadoDAO"%>
<%@page import="modeloDAO.EquipoDAO"%>
<%@page import="modeloVO.EstadoVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modeloDAO.PartesDAO"%>
<%@page import="modeloVO.EquipoVO"%>
<%@page import="modeloVO.PartesVO"%>
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
                            <h2 class="pageheader-title">Actualizar Parte</h2>
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
                                    <form id="validationform" data-parsley-validate="" novalidate="" method="post" action="Partes">
                                        <div class="form-group row">
                                            <label class="col-12 col-sm-3 col-form-label text-sm-right">Seleccione la parte que desea actualizar</label>
                                            <div class="col-12 col-sm-8 col-lg-6">
                                                <select name="txtIdPart" class="form-control single-select-search" required="">
                                                    <option value="">Seleccione...</option>
                                                    <%
                                                        PartesVO PPTVO = new PartesVO();
                                                        PartesDAO PPTDAO = new PartesDAO();
                                                        ArrayList<PartesVO> ListarPPTTSS = PPTDAO.listar();
                                                        for (int i = 0; i < ListarPPTTSS.size(); i++) {
                                                            PPTVO = ListarPPTTSS.get(i);
                                                    %>
                                                    <option value="<%= PPTVO.getIdPart()%>"><%= PPTVO.getIdPart()%> - <%= PPTVO.getNombrePart()%></option>
                                                    <%
                                                        }
                                                    %>
                                                </select>
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
                                            <div class="form-group">
                                                <small>Los campos con (*) son obligatorios</small> 
                                             </div>
                                            <div class="table-responsive">
                                                <table class="table table-primary table-bordered table-striped table-hover">
                                                    <thead class="thead-light">
                                                        <tr>
                                                            <th scope="col">Identificación *</th>
                                                            <th scope="col">Equipo *</th>
                                                            <th scope="col">Estado *</th>
                                                            <th scope="col">Nombre *</th>
                                                            <th scope="col">Tipo *</th>
                                                            <th scope="col">Comentarios *</th>                                                            
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td><input type="number" required="" readonly="" class="form-control" name="txtIdPart" value="<%=partVO.getIdPart()%>"></td>
                                                            <td>
                                                                <select class="form-control single-select-search" name="txtIdEq">
                                                                <%
                                                                    EquipoVO equVO = new EquipoVO();
                                                                    EquipoDAO equDAO = new EquipoDAO(equVO);

                                                                    ArrayList<EquipoVO> ListarEqus = equDAO.listar();

                                                                    for (int i = 0; i < ListarEqus.size(); i++) {
                                                                        equVO = ListarEqus.get(i);
                                                                %>
                                                                <option value="<%=equVO.getIdEq()%>"><%=equVO.getIdEq()%> - <%= equVO.getNombreEq()%></option>
                                                                <%
                                                                    }
                                                                %>
                                                                </select>
                                                                </td>
                                                            <td>
                                                                <select class="form-control" name="txtIdEst">
                                                                <%
                                                                    EstadoVO estVO = new EstadoVO();
                                                                    EstadoDAO estDAO = new EstadoDAO(estVO);

                                                                    ArrayList<EstadoVO> ListarEstados = estDAO.listar();

                                                                    for (int i = 0; i < ListarEstados.size(); i++) {
                                                                        estVO = ListarEstados.get(i);
                                                                %>
                                                                <option value="<%= estVO.getIdEst()%>"><%= estVO.getIdEst()%> - <%= estVO.getNombreEst()%></option>
                                                                <%
                                                                    }
                                                                %>
                                                                </select>
                                                                </td>
                                                            <td><input type="text" required="" data-parsley-maxlength="50" placeholder="Ej. Fusible" class="form-control" name="txtNombrePart" value="<%=partVO.getNombrePart()%>"></td>
                                                            <td><input type="text" required="" data-parsley-maxlength="25" placeholder="Ej. Eléctrica" class="form-control" name="txtTipoPart" value="<%=partVO.getTipoPart()%>"></td>
                                                            <td><input type="text" required="" data-parsley-maxlength="50" placeholder="Ingrese un Comentario" class="form-control" name="txtComentarioPart" value="<%=partVO.getComentarioPart()%>"></td> 
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
