<%-- 
    Document   : FrmServicio
    Created on : 28/09/2019, 09:46:32 PM
    Author     : AFCHT
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="modeloVO.*"%>
<%@page import="modeloDAO.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modeloDAO.ServicioDAO"%>
<%@page import="modeloVO.ServicioVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="FrmLogin.jsp" %>
<%
    ServicioVO serVO = new ServicioVO();
    ServicioDAO serDAO = new ServicioDAO(serVO);
    ArrayList<ServicioVO> listar;
    HttpSession currentSession = request.getSession();
    Object cuenta = currentSession.getAttribute("dta");
    UsuarioVO perfilVO = (UsuarioVO) cuenta;
    PersonasVO perVO = new PersonasVO();
    PersonasDAO perDAO = new PersonasDAO();
    
    Date fecha = new Date();
    String modifiedDate = new SimpleDateFormat("yyyy-MM-dd").format(fecha);
    
    perVO = perDAO.buscarRegistro(perfilVO.getIdUsu());
%>
<!DOCTYPE html>
<html>
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
                                    <div class="form-group">
                                        <small>Los campos con (*) son obligatorios</small> 
                                     </div>
                                    <%
                                        if(request.getAttribute("Mensaje")!=null){
                                    %>
                                    <div class="alert alert-info alert-dismissible fade show" role="alert">
                                        <strong>${Mensaje}.</strong>
                                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <%
                                        }
                                    %>
                                <div id="cajon1">
                                    <form id="validationform" data-parsley-validate="" novalidate="" method="post" action="Servicio">
                                        <div class="form-group row">
                                            <label class="col-12 col-sm-3 col-form-label text-sm-right">Empleado</label>
                                                <div class="col-12 col-sm-8 col-lg-6">
                                                    <input type="hidden" required="" value="0" class="form-control" name="idSer">
                                                    <input type="hidden" required="" value="<%= perVO.getTipoPer()%>" class="form-control" name="idPer">
                                                    <input type="text" required="" value="<%= perVO.getNombrePer()%> <%= perVO.getApellidoPer()%>" class="form-control" autofocus="" readonly="">
                                                </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-12 col-sm-3 col-form-label text-sm-right">Equipo *</label>
                                            <div class="col-12 col-sm-8 col-lg-6">
                                                <select class="form-control single-select-search" name="idEq" required="">
                                                    <option value="">Seleccione un equipo</option>
                                                    <%
                                                        EquipoVO equVO = new EquipoVO();
                                                        EquipoDAO equDAO = new EquipoDAO(equVO);

                                                        ArrayList<EquipoVO> ListarEqus = equDAO.listar();

                                                        for (int i = 0; i < ListarEqus.size(); i++) {
                                                            equVO = ListarEqus.get(i);
                                                    %>
                                                    <option value="<%= equVO.getIdEq()%>"><%= equVO.getIdEq()%> - <%= equVO.getNombreEq()%></option>
                                                    <%
                                                        }
                                                    %>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-12 col-sm-3 col-form-label text-sm-right">Fecha de Ingreso *</label>
                                                <div class="col-12 col-sm-8 col-lg-6">                                             
                                                    <input class="form-control" type="date" required="" value="<%= modifiedDate %>" name="fechaIngresoSer" min="<%= modifiedDate %>" max="<%= modifiedDate %>">
                                                </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-12 col-sm-3 col-form-label text-sm-right">Fecha de Entrega *</label>
                                                <div class="col-12 col-sm-8 col-lg-6">                                             
                                                    <input class="form-control" type="date" required="" name="fechaEntregaSer" min="<%= modifiedDate %>">
                                                </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-12 col-sm-3 col-form-label text-sm-right">Estado del equipo *</label>
                                            <div class="col-12 col-sm-8 col-lg-6">
                                                <select class="form-control single-select-search" name="estEq" required="">
                                                    <option value="" disabled>Seleccione un estado</option>
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
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-12 col-sm-3 col-form-label text-sm-right">Observaciones *</label>
                                                <div class="col-12 col-sm-8 col-lg-6">
                                                    <textarea required data-parsley-maxlength="70" placeholder="Ingrese una observación" class="form-control" name="observacionesSer"></textarea>
                                                </div>
                                        </div>
                                        <div class="form-group row text-right">
                                            <div class="col col-sm-10 col-lg-9 offset-sm-1 offset-lg-0">
                                                <input type="hidden" name="seleccion" value="insertar">
                                                <input class="btn btn-primary" type="submit" value="Insertar Servicio">
                                            </div>
                                        </div> 
                                    </form>
                                </div>
                                <div id="cajon2">
                                    <form id="validationform" data-parsley-validate="" novalidate="" method="post" action="Servicio">
                                        <div class="form-group row">
                                            <label class="col-12 col-sm-3 col-form-label text-sm-right">Identificación del Servicio</label>
                                                <div class="col-12 col-sm-8 col-lg-6">                                             
                                                    <input type="number" required="" placeholder="Identificación del Servicio" class="form-control" id="idSerM" name="idSer" readonly>
                                                </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-12 col-sm-3 col-form-label text-sm-right">Empleado</label>
                                                <div class="col-12 col-sm-8 col-lg-6">
                                                    <input type="hidden" required="" value="<%= perVO.getTipoPer()%>" class="form-control" id="idEstM" name="idPer">
                                                    <input type="text" required="" value="<%= perVO.getNombrePer()%> <%= perVO.getApellidoPer()%>" class="form-control" readonly="">
                                                </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-12 col-sm-3 col-form-label text-sm-right">Identificación del Equipo</label>
                                                <div class="col-12 col-sm-8 col-lg-6">                                             
                                                    <input type="number" required="" placeholder="Ingrese la Identificación del Equipo" class="form-control" id="idEqM" name="idEq" readonly="">
                                                </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-12 col-sm-3 col-form-label text-sm-right">Fecha de Ingreso</label>
                                                <div class="col-12 col-sm-8 col-lg-6">                                             
                                                    <input type="date" class="form-control" required="" name="fechaIngresoSer" id="fechaIngresoSerM" readonly="">
                                                </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-12 col-sm-3 col-form-label text-sm-right">Fecha de Entrega *</label>
                                                <div class="col-12 col-sm-8 col-lg-6">                                             
                                                    <input type="date" class="form-control" required="" name="fechaEntregaSer" id="fechaEntregaSerM">
                                                </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-12 col-sm-3 col-form-label text-sm-right">Estado del equipo *</label>
                                            <div class="col">
                                                <select class="form-control single-select-search" name="estEq" required="">
                                                    <option value="" disabled>Seleccione un estado</option>
                                                        <%
                                                            estVO = new EstadoVO();
                                                            estDAO = new EstadoDAO(estVO);

                                                            ListarEstados = estDAO.listar();

                                                            for (int i = 0; i < ListarEstados.size(); i++) {
                                                                estVO = ListarEstados.get(i);
                                                        %>
                                                    <option value="<%= estVO.getIdEst()%>"><%= estVO.getIdEst()%> - <%= estVO.getNombreEst()%></option>
                                                        <%
                                                            }
                                                        %>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-12 col-sm-3 col-form-label text-sm-right">Observaciones *</label>
                                                <div class="col-12 col-sm-8 col-lg-6">
                                                    <textarea required data-parsley-maxlength="70" placeholder="Ingrese una observación" class="form-control" name="observacionesSer" id="observacionesSerM"></textarea>
                                                </div>
                                        </div>
                                        <div class="form-group row text-right">
                                            <div class="col col-sm-10 col-lg-9 offset-sm-1 offset-lg-0">
                                                <input type="hidden" name="seleccion" value="modificar">
                                                <input class="btn btn-primary" type="submit" value="Actualizar Servicio">
                                                <input class="btn btn-warning" type="button" id="Regresar" value="Cancelar">
                                            </div>
                                        </div>                                        
                                    </form>
                                </div>
                                <div class="card-body">
                                    <table id="datatable" class="table table-primary table-bordered table-striped table-hover">
                                            <thead class="thead-light">
                                                <tr>
                                                    <th>N° del Servicio</th>
                                                    <th>Identificación del Empleado</th>
                                                    <th>N° del Equipo</th>
                                                    <th>Fecha de Ingreso</th>
                                                    <th>Fecha de Entrega</th>
                                                    <th>Estado</th>
                                                    <th>Observaciones</th>
                                                    <th>Modificar</th>
                                                    <th>Eliminar</th>
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
                                                    <% equVO = equDAO.buscarRegistroEquipos(serVO.getIdEq()); %>
                                                    <td><%= equVO.getIdEqEst() %></td>
                                                    <td><%= serVO.getObservacionesSer()%></td>
                                                    <td><button onclick="modificador2('<%= serVO.getIdSer()%>','<%= serVO.getIdPer()%>','<%= serVO.getIdEq()%>','<%= serVO.getFechaIngresoSer()%>','<%= serVO.getFechaEntregaSer()%>','<%= serVO.getObservacionesSer()%>')" class="btn bg-transparent"><i class="far fa-edit"></i></button></td>
                                                    <td>
                                                        <form method="post" action="Servicio">
                                                            <input type="hidden" name="idSer" value="<%= serVO.getIdSer()%>">
                                                            <input type="hidden" name="seleccion" value="eliminar">
                                                            <button type="submit" class="btn bg-transparent"><i class="far fa-trash-alt"></i></button>
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
