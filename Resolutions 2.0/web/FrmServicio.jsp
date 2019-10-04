<%-- 
    Document   : FrmServicio
    Created on : 28/09/2019, 09:46:32 PM
    Author     : AFCHT
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="modeloDAO.ServicioDAO"%>
<%@page import="modeloVO.ServicioVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ServicioVO serVO = new ServicioVO();
    ServicioDAO serDAO = new ServicioDAO(serVO);
    ArrayList<ServicioVO> listar;
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
                            <h2 class="pageheader-title">Gestionar Servicio</h2>
                            <div class="page-breadcrumb">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Menú</a></li>
                                        <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Gestionar Servicios</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Gestionar Servicio</li>
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
                                <h5 class="card-header">Gestionar Servicio</h5>
                                <div class="card-body">
                                    <%
                                        if(request.getAttribute("Mensaje")!=null){
                                    %>
                                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                                        <strong>${Mensaje}.</strong>
                                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <%
                                        }
                                    %>
                                <div id="cajon1">
                                    <form method="post" action="Servicio">
                                        <div class="form-group row">
                                            <label class="col-12 col-sm-3 col-form-label text-sm-right">Identificación de la Persona</label>
                                                <div class="col-12 col-sm-8 col-lg-6">                                             
                                                    <input type="number" required="" placeholder="Ingrese la Identificación de la Persona" class="form-control" id="idEstM" name="idPer">
                                                </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-12 col-sm-3 col-form-label text-sm-right">Identificación del Equipo</label>
                                                <div class="col-12 col-sm-8 col-lg-6">                                             
                                                    <input type="number" required="" placeholder="Ingrese la Identificación del Equipo" class="form-control" id="idEstM" name="idEq">
                                                </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-12 col-sm-3 col-form-label text-sm-right">Fecha de Ingreso</label>
                                                <div class="col-12 col-sm-8 col-lg-6">                                             
                                                    <input type="date" required="" name="fechaIngresoSer">
                                                </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-12 col-sm-3 col-form-label text-sm-right">Fecha de Entrega</label>
                                                <div class="col-12 col-sm-8 col-lg-6">                                             
                                                    <input type="date" required="" name="fechaEntregaSer">
                                                </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-12 col-sm-3 col-form-label text-sm-right">Observaciones</label>
                                                <div class="col-12 col-sm-8 col-lg-6">                                             
                                                    <input type="text" required="" data-parsley-maxlength="50" placeholder="Ingrese la Observación" class="form-control" name="observacionesSer">
                                                </div>
                                        </div>
                                        <div class="form-group row text-right">
                                            <div class="col col-sm-10 col-lg-9 offset-sm-1 offset-lg-0">
                                                <input type="hidden" name="seleccion" value="insertar">
                                                <input class="btn btn-primary" type="submit" value="Insertar">
                                            </div>
                                        </div> 
                                    </form>
                                </div>
                                <div id="cajon2">
                                    <form method="post" action="Servicio">
                                        <div class="form-group row">
                                            <label class="col-12 col-sm-3 col-form-label text-sm-right">Identificación del servicio</label>
                                                <div class="col-12 col-sm-8 col-lg-6">                                             
                                                    <input type="number" required="" placeholder="Identificación del Servicio" class="form-control" id="idPerM" name="idSerM" readonly>
                                                </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-12 col-sm-3 col-form-label text-sm-right">Identificación de la Persona</label>
                                                <div class="col-12 col-sm-8 col-lg-6">                                             
                                                    <input type="number" required="" placeholder="Ingrese la Identificación de la Persona" class="form-control" id="idPerM" name="idPer">
                                                </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-12 col-sm-3 col-form-label text-sm-right">Identificación del Equipo</label>
                                                <div class="col-12 col-sm-8 col-lg-6">                                             
                                                    <input type="number" required="" placeholder="Ingrese la Identificación del Equipo" class="form-control" id="idEqM" name="idEq">
                                                </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-12 col-sm-3 col-form-label text-sm-right">Fecha de Ingreso</label>
                                                <div class="col-12 col-sm-8 col-lg-6">                                             
                                                    <input type="date" required="" name="fechaIngresoSerM">
                                                </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-12 col-sm-3 col-form-label text-sm-right">Fecha de Entrega</label>
                                                <div class="col-12 col-sm-8 col-lg-6">                                             
                                                    <input type="date" required="" name="fechaEntregaSerM">
                                                </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-12 col-sm-3 col-form-label text-sm-right">Observaciones</label>
                                                <div class="col-12 col-sm-8 col-lg-6">                                             
                                                    <input type="text" required="" data-parsley-maxlength="50" placeholder="Ingrese la Observación" class="form-control" name="observacionesSerM">
                                                </div>
                                        </div>
                                        <div class="form-group row text-right">
                                            <div class="col col-sm-10 col-lg-9 offset-sm-1 offset-lg-0">
                                                <input type="hidden" name="seleccion" value="modificar">
                                                <input class="btn btn-primary" type="submit" value="Actualizar">
                                                <input class="btn btn-warning" type="button" id="Regresar" value="Cancelar">
                                            </div>
                                        </div>                                        
                                    </form>
                                </div>
                                <div class="table-responsive">
                                        <table class="table table-primary table-bordered table-striped table-hover">
                                            <thead class="thead-light">
                                                <tr>
                                                    <th scope="col">Identificación del Servicio</th>
                                                    <th scope="col">Identificación de la Persona</th>
                                                    <th scope="col">Identificación del Equipo</th>
                                                    <th scope="col">Fecha de Ingreso</th>
                                                    <th scope="col">Fecha de Entrega</th>
                                                    <th scope="col">Observaciones</th>
                                                    <th scope="col">Botones</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%
                                                    listar = serDAO.listar();
                                                    if(listar.size()==0){
                                                %>
                                                <tr>
                                                    <td colspan="8">No existen Servicios en la Base de Datos</td>
                                                </tr>
                                                <%
                                                    }else{
                                                        for (int i = 0; i < listar.size(); i++) {
                                                            serVO = listar.get(i);
                                                %>
                                                <tr>                                                                        
                                                    <td><%= serVO.getIdSer()%></td>
                                                    <td><%= serVO.getIdPer()%></td>
                                                    <td><%= serVO.getIdEq()%></td>
                                                    <td><%= serVO.getFechaIngresoSer()%></td>
                                                    <td><%= serVO.getFechaEntregaSer()%></td>
                                                    <td><%= serVO.getObservacionesSer()%></td>
                                                    <td><button onclick="modificador2('<%= serVO.getIdSer()%>','<%= serVO.getIdPer()%>','<%= serVO.getIdEq()%>','<%= serVO.getFechaIngresoSer()%>','<%= serVO.getFechaEntregaSer()%>','<%= serVO.getObservacionesSer()%>')" class="btn bg-transparent float-left"><i class="far fa-edit"></i></button>
                                                        <form method="post" action="Servicio">
                                                            <input type="hidden" name="idSer" value="<%= serVO.getIdSer()%>">
                                                            <input type="hidden" name="seleccion" value="eliminar">
                                                            <button type="submit" class="btn"><i class="far fa-trash-alt"></i></button>
                                                        </form>
                                                    </td>
                                                </tr>
                                            <%
                                                    }
                                                }
                                            %>
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
