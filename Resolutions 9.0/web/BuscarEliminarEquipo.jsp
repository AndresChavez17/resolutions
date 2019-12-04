<%-- 
    Document   : BuscarEliminarEquipo
    Created on : 26/09/2019, 09:39:49 AM
    Author     : APRENDIZ
--%>

<%@page import="modeloVO.EstadoVO"%>
<%@page import="modeloVO.ClienteVO"%>
<%@page import="modeloDAO.EquipoDAO"%>
<%@page import="java.util.ArrayList"%>
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
                            <h2 class="pageheader-title">Buscar y Eliminar Equipo</h2>
                            <div class="page-breadcrumb">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Menú</a></li>
                                        <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Gestionar Equipos</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Buscar y Eliminar Equipo</li>
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
                                <h5 class="card-header">Buscar y Eliminar Equipo</h5>
                                <div class="card-body">    
                                    <%if (request.getParameter("eliminarEquipo")!=null){%>
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
                                    <table id="datatable" class="table table-primary table-bordered table-striped table-hover">
                                        <thead class="thead-light">
                                            <tr>
                                                <th scope="col">Número del equipo</th>
                                                <th scope="col">Identificación del cliente</th>
                                                <th scope="col">Identificación del estado</th>
                                                <th scope="col">Nombre</th>
                                                <th scope="col">Inventario</th>
                                                <th scope="col">Marca</th>
                                                <th scope="col">Serie</th>
                                                <th scope="col">Ubicación</th>
                                                <th scope="col">Acciones</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                EquipoVO eqVO = new EquipoVO();
                                                EquipoDAO eqDAO = new EquipoDAO();
                                                ArrayList<EquipoVO> listar = eqDAO.listar();
                                                if (listar.size() == 0) {
                                            %>
                                            <tr>
                                                <td colspan="10">No existen Equipos en la Base de Datos</td>
                                            </tr>
                                            <%
                                            } else {
                                                for (int i = 0; i < listar.size(); i++) {
                                                    eqVO = listar.get(i);
                                            %>
                                            <tr>
                                                <td><%= eqVO.getIdEq()%></td>
                                                <td><%= eqVO.getIdEqCli()%></td>
                                                <td><%= eqVO.getIdEqEst()%></td>
                                                <td><%= eqVO.getNombreEq()%></td>
                                                <td><%= eqVO.getInventarioEq()%></td>                                                
                                                <td><%= eqVO.getMarcaEq()%></td>                                                
                                                <td><%= eqVO.getSerieEq()%></td>                                                
                                                <td><%= eqVO.getUbicacionEq()%></td>
                                                <td>                                                    
                                                    <form method="post" action="EquipoControlador">
                                                        <input type="hidden" name="txtIdEq" value="<%= eqVO.getIdEq()%>">
                                                        <input type="hidden" name="opcion" value="3">
                                                        <button name="eliminarEquipo" type="submit" class="btn"><i class="far fa-trash-alt"></i></button>
                                                    </form>
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
