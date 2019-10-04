<%-- 
    Document   : FrmUsuario
    Created on : 29/09/2019, 09:35:16 PM
    Author     : AFCHT
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="modeloDAO.UsuarioDAO"%>
<%@page import="modeloVO.UsuarioVO"%>
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
                            <h2 class="pageheader-title">Buscar y Deshabilitar Usuario</h2>
                            <div class="page-breadcrumb">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Menú</a></li>
                                        <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Gestionar Usuarios</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Buscar y Deshabilitar Usuario</li>
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
                                <h5 class="card-header">Buscar y Deshabilitar Usuario</h5>
                                <div class="card-body">
                                <div class="table-responsive card-body">
                                    <table id="datatable" class="table table-primary table-bordered table-striped table-hover">
                                        <thead class="thead-light">
                                            <tr>
                                                <th scope="col">Identificación Usuario</th>
                                                <th scope="col">Nombre</th>
                                                <th scope="col">Clave</th>
                                                <th scope="col">Estado</th>
                                                <th scope="col">Botones</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                UsuarioVO usuVO = new UsuarioVO();
                                                UsuarioDAO usuDAO = new UsuarioDAO();
                                                ArrayList<UsuarioVO> listar = usuDAO.listar();
                                                if (listar.size() == 0) {
                                            %>
                                            <tr>
                                                <td colspan="10">No existen Usuarios en la Base de Datos</td>
                                            </tr>
                                            <%
                                            } else {
                                                for (int i = 0; i < listar.size(); i++) {
                                                    usuVO = listar.get(i);
                                            %>
                                            <tr>
                                                <td><%= usuVO.getIdUsu()%></td>
                                                <td><%= usuVO.getNombreUsu()%></td>
                                                <td><%= usuVO.getClaveUsu()%></td>
                                                <%
                                                if(usuVO.getEstadoUsu().equals("0")){
                                                %>
                                                <td>Inactivo</td>
                                                <%
                                                }else{
                                                %>
                                                <td>Activo</td>
                                                <%
                                                }
                                                %>
                                                <td>
                                                    <form method="post" action="UsuarioControlador2">
                                                        <input type="hidden" name="txtIdUsu" value="<%= usuVO.getIdUsu()%>">
                                                        <input type="hidden" name="opcion" value="4">
                                                        <button name="eliminarUsuario" type="submit" class="btn float-left"><i class="fa fa-user-times"></i></button>
                                                    </form>
                                                    <form method="post" action="UsuarioControlador2">
                                                        <input type="hidden" name="txtIdUsu" value="<%= usuVO.getIdUsu()%>">
                                                        <input type="hidden" name="opcion" value="7">
                                                        <button name="eliminarUsuario" type="submit" class="btn float-left"><i class="fa fa-check"></i></button>
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
                                    <!-----///////////////////////////////
                                    <%//if (request.getParameter("eliminarUsuario")!=null){%>
                                    <%//if(request.getAttribute("MensajeExito")!=null){%>
                                    <div class="alert alert-success alert-dismissable">
                                        <button type="button" class="close" data-dismiss="alert">&times;</button>                                    
                                        <h3 class="text-success">${MensajeExito}<%%></h3>
                                    </div>
                                    <%//}else if(request.getAttribute("MensajeError")!=null){ %>
                                    <div class="alert alert-danger alert-dismissable">
                                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                                        <h3 class="text-danger">${MensajeError}</h3>
                                    </div>
                                    <%//}%>---->
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
