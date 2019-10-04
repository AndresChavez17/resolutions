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
                                    <form method="post" action="EquipoControlador" id="validationform" data-parsley-validate="" novalidate="">
                                        <div class="form-group row">
                                            <label class="col-12 col-sm-3 col-form-label text-sm-right">Identificación del Equipo</label>
                                            <div class="col-12 col-sm-8 col-lg-6">
                                                <input type="number" required="" placeholder="Ingrese la Identificación" class="form-control" name="txtIdEq">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-12 col-sm-3 col-form-label text-sm-right">Identificación del Cliente</label>
                                            <div class="col-12 col-sm-8 col-lg-6">
                                                 <select class="form-control" name="txtIdEqCli">
                                                     <option>Seleccione un Cliente</option>
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
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-12 col-sm-3 col-form-label text-sm-right">Identificación del Estado</label>
                                            <div class="col-12 col-sm-8 col-lg-6">
                                            <select class="form-control" name="txtIdEqEst">
                                                <option>Seleccione un Estado</option>
                                                <%
                                                    EstadoVO estVO = new EstadoVO();
                                                    EstadoDAO estDAO = new EstadoDAO(estVO);

                                                    ArrayList<EstadoVO> ListarEstados123 = estDAO.listar();

                                                    for (int i = 0; i < 3; i++) {
                                                        estVO = ListarEstados123.get(i);
                                                %>
                                                <option value="<%= estVO.getIdEst()%>"><%= estVO.getIdEst() %> - <%= estVO.getNombreEst()%></option>
                                                <%
                                                    }
                                                %>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-12 col-sm-3 col-form-label text-sm-right">Nombre del Equipo</label>
                                            <div class="col-12 col-sm-8 col-lg-6">
                                                <input type="text" required="" data-parsley-maxlength="50" placeholder="Ingrese el Nombre" class="form-control" name="txtNombreEq">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-12 col-sm-3 col-form-label text-sm-right">Inventario del Equipo</label>
                                            <div class="col-12 col-sm-8 col-lg-6">
                                                <input type="text" required="" data-parsley-maxlength="20" placeholder="Ingrese el Inventario" class="form-control" name="txtInventarioEq">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-12 col-sm-3 col-form-label text-sm-right">Marca del Equipo</label>
                                            <div class="col-12 col-sm-8 col-lg-6">
                                                <input type="text" required="" data-parsley-maxlength="20" placeholder="Ingrese la Marca" class="form-control" name="txtMarcaEq">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-12 col-sm-3 col-form-label text-sm-right">Serie del Equipo</label>
                                            <div class="col-12 col-sm-8 col-lg-6">
                                                <input type="number" required="" data-parsley-maxlength="20" placeholder="Ingrese el Numero de Serie" class="form-control" name="txtSerieEq">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-12 col-sm-3 col-form-label text-sm-right">Ubicación del Equipo</label>
                                            <div class="col-12 col-sm-8 col-lg-6">
                                                <input type="text" required="" data-parsley-maxlength="15" placeholder="Ingrese la Ubicación" class="form-control" name="txtUbicacionEq">
                                            </div>
                                        </div>
                                        <div class="form-group row text-right">
                                            <div class="col col-sm-10 col-lg-9 offset-sm-1 offset-lg-0">
                                                <button class="btn btn-space btn-primary" name="insertarEquipo">Insertar Equipo</button>
                                                <input type="hidden" value="1" name="opcion">
                                            </div>
                                        </div>
                                    </form>
                                    <%if (request.getParameter("insertarEquipo")!=null){%>
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
                                <h5 class="card-header">Información de Clientes</h5>
                                <div class="card-body">
                                    <div class="table-responsive ">
                                        <table class="table table-primary table-bordered table-striped table-hover">
                                            <thead class="thead-light">
                                                <tr>
                                                    <th scope="col">Identificación del Cliente</th>
                                                    <th scope="col">Nombre del Cliente</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <%
                                            ClienteVO clienteVO = new ClienteVO();
                                            EquipoDAO equDAO = new EquipoDAO();

                                            ArrayList<ClienteVO> ListarClientes = equDAO.listarClientes();

                                            for (int i = 0; i < ListarClientes.size(); i++) {
                                                clienteVO = ListarClientes.get(i);
                                            %>

                                                <tr>
                                                    <td><%=clienteVO.getIdCli()%></td>
                                                    <td><%=clienteVO.getNombreCli()%></td>
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
                                            EquipoDAO equiDAO = new EquipoDAO();

                                            ArrayList<EstadoVO> ListarEstados = equiDAO.listarEstados();
                                            
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
                                <h5 class="card-header">Tabla con todos los Equipos</h5>
                                <div class="card-body">
                                    <div class="table-responsive ">
                                        <table class="table table-primary table-bordered table-striped table-hover">
                                            <thead class="thead-light">
                                                <tr>
                                                    <th scope="col">Identificación del Equipo</th>
                                                    <th scope="col">Identificación del Cliente</th>
                                                    <th scope="col">Identificación del Estado</th>
                                                    <th scope="col">Nombre</th>
                                                    <th scope="col">Inventario</th>
                                                    <th scope="col">Marca</th>
                                                    <th scope="col">Serie</th>
                                                    <th scope="col">Ubicación</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <%                                            
                                            EquipoVO equipoVO = new EquipoVO();
                                            EquipoDAO eqDAO = new EquipoDAO();

                                            ArrayList<EquipoVO> ListarEquipos = eqDAO.listar();
                                                
                                            for (int i = 0; i < ListarEquipos.size(); i++) {
                                                equipoVO = ListarEquipos.get(i);
                                            %>

                                                <tr>
                                                    <td><%=equipoVO.getIdEq()%></td>
                                                    <td><%=equipoVO.getIdEqCli()%></td>
                                                    <td><%=equipoVO.getIdEqEst()%></td>
                                                    <td><%=equipoVO.getNombreEq()%></td>
                                                    <td><%=equipoVO.getInventarioEq()%></td> 
                                                    <td><%=equipoVO.getMarcaEq()%></td> 
                                                    <td><%=equipoVO.getSerieEq()%></td> 
                                                    <td><%=equipoVO.getUbicacionEq()%></td> 
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
