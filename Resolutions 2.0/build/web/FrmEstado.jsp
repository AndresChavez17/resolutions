<%-- 
    Document   : FrmEstado
    Created on : 28/09/2019, 08:14:28 PM
    Author     : AFCHT
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="modeloDAO.EstadoDAO"%>
<%@page import="modeloVO.EstadoVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%  EstadoVO estVO = new EstadoVO();
    EstadoDAO estDAO = new EstadoDAO(estVO);
    ArrayList<EstadoVO> listar;
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
                            <h2 class="pageheader-title">Gestionar Estado</h2>
                            <div class="page-breadcrumb">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Menú</a></li>
                                        <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Gestionar Estados</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Gestionar Estado</li>
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
                                <h5 class="card-header">Gestionar Estado</h5>
                                <div class="card-body">
                                    <%
                                        if (request.getAttribute("Mensaje") != null) {
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
                                    <form method="post" action="Estado">                                        
                                        <div class="form-group row">
                                            <label class="col-12 col-sm-3 col-form-label text-sm-right">Nombre del Estado</label>
                                        <div class="col-12 col-sm-8 col-lg-6">                                             
                                            <input type="text" required="" data-parsley-maxlength="50" placeholder="Ingrese el Nombre" class="form-control" name="nombreEst">                                            
                                        </div>
                                        </div>
                                        <div class="form-group row text-right">
                                            <div class="col col-sm-10 col-lg-9 offset-sm-1 offset-lg-0">
                                                <input type="hidden" name="seleccion" value="insertar">
                                                <input class="btn btn-space btn-primary" type="submit" value="Insertar">
                                            </div>
                                        </div>                                        
                                    </form>
                                    </div>
                                    <div id="cajon2">
                                        <form method="post" action="Estado">
                                            <div class="form-group row">
                                                <label class="col-12 col-sm-3 col-form-label text-sm-right">Identificación del Estado</label>
                                            <div class="col-12 col-sm-8 col-lg-6">                                             
                                                <input type="number" placeholder="Ingrese la Identificación" class="form-control" id="idEstM" name="idEst" readonly>
                                            </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-12 col-sm-3 col-form-label text-sm-right">Nombre del Estado</label>
                                            <div class="col-12 col-sm-8 col-lg-6">                                             
                                                <input type="text" required="" data-parsley-maxlength="50" placeholder="Ingrese el Nombre" class="form-control" id="nombreEstM" name="nombreEst">
                                            </div>
                                            </div>
                                            <div class="form-group row text-right">
                                            <div class="col col-sm-10 col-lg-9 offset-sm-1 offset-lg-0">
                                                <input type="hidden" name="seleccion" value="modificar">
                                                <input class="btn btn-space btn-primary" type="submit" value="Actualizar">
                                                <input class="btn btn-space btn-warning" type="button" id="Regresar" value="Cancelar">
                                            </div>
                                            </div>  
                                        </form>
                                    </div>
                                    <div class="table-responsive">
                                        <table class="table table-primary table-bordered table-striped table-hover">
                                            <thead class="thead-light">
                                                <tr>
                                                    <th scope="col">Identificación del Estado</th>
                                                    <th scope="col">Nombre del Estado</th>
                                                    <th scope="col">Botones</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <%
                                                listar = estDAO.listar();
                                                if (listar.size() == 0) {
                                            %>
                                                <tr>
                                                    <th scope="row">#</th>
                                                    <td colspan="4">No existen Estados en la Base de Datos</td>
                                                </tr>
                                            <%
                                            } else {
                                                for (int i = 0; i < listar.size(); i++) {
                                                    estVO = listar.get(i);
                                            %>
                                                <tr>                    
                                                    <td><%= estVO.getIdEst()%></td>
                                                    <td><%= estVO.getNombreEst()%></td>
                                                    <td><button onclick="modificador('<%= estVO.getIdEst()%>', '<%= estVO.getNombreEst()%>')" class="btn bg-transparent float-left"><i class="far fa-edit"></i></button>
                                                        <form method="post" action="Estado">
                                                            <input type="hidden" name="idEst" value="<%= estVO.getIdEst()%>">
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
