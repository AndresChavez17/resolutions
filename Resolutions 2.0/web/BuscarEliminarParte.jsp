<%-- 
    Document   : BuscarEliminarParte
    Created on : 29/09/2019, 03:14:17 AM
    Author     : AFCHT
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="modeloDAO.PartesDAO"%>
<%@page import="modeloVO.PartesVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
                            <h2 class="pageheader-title">Insertar Partes</h2>
                            <div class="page-breadcrumb">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Menú</a></li>
                                        <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Gestionar Partes</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Buscar y Eliminar Partes</li>
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
                                <h5 class="card-header">Buscar y Eliminar Parte</h5>
                                <div class="card-body">                                
                                <div class="table-responsive card-body">
                                    <table id="datatable" class="table table-primary table-bordered table-striped table-hover">
                                        <thead class="thead-light">
                                            <tr>
                                                <th scope="col">Identificación Parte</th>
                                                <th scope="col">Identificación Equipo</th>
                                                <th scope="col">Identificación Estado</th>
                                                <th scope="col">Nombre</th>
                                                <th scope="col">Tipo</th>
                                                <th scope="col">Comentario</th>
                                                <th scope="col">Botones</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                PartesVO partVO = new PartesVO();
                                                PartesDAO partDAO = new PartesDAO();
                                                ArrayList<PartesVO> listar = partDAO.listar();
                                                if (listar.size() == 0) {
                                            %>
                                            <tr>
                                                <td colspan="10">No existen Partes en la Base de Datos</td>
                                            </tr>
                                            <%
                                            } else {
                                                for (int i = 0; i < listar.size(); i++) {
                                                    partVO = listar.get(i);
                                            %>
                                            <tr>
                                                <td><%= partVO.getIdPart()%></td>
                                                <td><%= partVO.getIdEq()%></td>
                                                <td><%= partVO.getIdEst()%></td>
                                                <td><%= partVO.getNombrePart()%></td>
                                                <td><%= partVO.getTipoPart()%></td>                                                
                                                <td><%= partVO.getComentarioPart()%></td>
                                                <td>                                                    
                                                    <form method="post" action="Partes">
                                                        <input type="hidden" name="txtIdPart" value="<%= partVO.getIdPart()%>">
                                                        <input type="hidden" name="opcion" value="3">
                                                        <button name="eliminarParte" type="submit" class="btn"><i class="far fa-trash-alt"></i></button>
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
                                    <%if (request.getParameter("eliminarParte")!=null){%>
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
