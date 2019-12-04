<%-- 
    Document   : BuscarEliminarCliente
    Created on : 26/09/2019, 09:16:03 AM
    Author     : APRENDIZ
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="modeloDAO.ClienteDAO"%>
<%@page import="modeloVO.ClienteVO"%>
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
                            <h2 class="pageheader-title">Buscar y Deshabilitar Cliente</h2>
                            <div class="page-breadcrumb">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Menú</a></li>
                                        <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Gestionar Clientes</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Buscar y Deshabilitar Cliente</li>
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
                                <h5 class="card-header">Buscar y Deshabilitar Cliente</h5>
                                <div class="card-body">
                                    <br>
                                    <%if (request.getParameter("eliminarClienteD")!=null){%>
                                    <%if(request.getAttribute("MensajeExito")!=null){%>
                                    <div class="alert alert-danger alert-dismissable fade show">
                                        <button type="button" class="close" data-dismiss="alert">&times;</button>                                    
                                        <h3 class="text-danger">${MensajeExito}<%%></h3>
                                    </div>
                                    <%}}%>
                                    <%if (request.getParameter("eliminarClienteH")!=null){%>
                                    <%if(request.getAttribute("MensajeExito")!=null){%>
                                    <div class="alert alert-success alert-dismissable fade show">
                                        <button type="button" class="close" data-dismiss="alert">&times;</button>                                    
                                        <h3 class="text-success">${MensajeExito}<%%></h3>
                                    </div>
                                    <%}}%>
                                    <table id="datatable" class="table table-primary table-bordered table-striped table-hover">
                                        <thead class="thead-light">
                                            <tr>
                                                <th scope="col">Identificación Cliente</th>
                                                <th scope="col">Nombre</th>
                                                <th scope="col">Direccion</th>
                                                <th scope="col">Teléfono</th>
                                                <th scope="col">Celular</th>
                                                <th scope="col">Estado</th>
                                                <th scope="col">Acciones</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                ClienteVO cliVO = new ClienteVO();
                                                ClienteDAO cliDAO = new ClienteDAO();
                                                ArrayList<ClienteVO> listar = cliDAO.listar();
                                                if (listar.size() == 0) {
                                            %>
                                            <tr>
                                                <td colspan="10">No existen Clientes en la Base de Datos</td>
                                            </tr>
                                            <%
                                            } else {
                                                for (int i = 0; i < listar.size(); i++) {
                                                    cliVO = listar.get(i);
                                            %>
                                            <tr>
                                                <td><%= cliVO.getIdCli()%></td>
                                                <td><%= cliVO.getNombreCli()%></td>
                                                <td><%= cliVO.getDireccionCli()%></td>
                                                <%
                                                if(cliVO.getTelefonoCli()==null||cliVO.getTelefonoCli().equals("")){
                                                %>
                                                <td>N/A</td>
                                                <%
                                                }else{
                                                %>
                                                <td><%= cliVO.getTelefonoCli()%></td>
                                                <%
                                                }
                                                %>
                                                <%
                                                if(cliVO.getCelularCli()==null||cliVO.getCelularCli().equals("")){
                                                %>
                                                <td>N/A</td>
                                                <%
                                                }else{
                                                %>
                                                <td><%= cliVO.getCelularCli()%></td>
                                                <%
                                                }
                                                %>
                                                <%
                                                if(cliVO.getEstadoCli().equals("0")){
                                                %>
                                                <td>Inactivo</td>
                                                <%
                                                }else if(cliVO.getEstadoCli().equals("1")){
                                                %>
                                                <td>Activo</td>
                                                <%
                                                }
                                                %>
                                                <td>
                                                    <%
                                                if(cliVO.getEstadoCli().equals("1")){
                                                %>
                                                    <form method="post" action="ClienteControlador">
                                                        <input type="hidden" name="txtIdCli" value="<%= cliVO.getIdCli()%>">
                                                        <input type="hidden" name="opcion" value="3">
                                                        <button name="eliminarClienteD" type="submit" class="btn float-left bg-transparent"><i class="fa fa-toggle-on"></i></button>
                                                    </form>
                                                        <%}else{%>
                                                    <form method="post" action="ClienteControlador">
                                                        <input type="hidden" name="txtIdCli" value="<%= cliVO.getIdCli()%>">
                                                        <input type="hidden" name="opcion" value="7">
                                                        <button name="eliminarClienteH" type="submit" class="btn float-left bg-transparent"><i class="fa fa-toggle-off"></i></button>
                                                    </form>
                                                        <%}%>
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