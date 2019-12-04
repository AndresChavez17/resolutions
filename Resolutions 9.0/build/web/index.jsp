<%-- 
    Document   : index
    Created on : 28/09/2019, 08:08:38 PM
    Author     : AFCHT
--%>

<%@page import="modeloDAO.UsuarioDAO"%>
<%@page import="modeloVO.UsuarioVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page errorPage="404Page.jsp" %> 
<%UsuarioVO usuVO = new UsuarioVO();
    UsuarioDAO usuDAO = new UsuarioDAO(usuVO);
    HttpSession currentSession = request.getSession();
    Cookie[] cookies=request.getCookies();
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if(cookie.getName().equals("nUsu")) {
                usuVO = usuDAO.consulta(cookie.getValue().toString());
                currentSession.setAttribute("dta", usuVO);
            }
        }
    }
    Object cuenta = currentSession.getAttribute("dta");
    if(cuenta==null){
        response.sendRedirect("FrmLogin.jsp");
    }
    UsuarioVO perfilVO = (UsuarioVO) cuenta;
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
                <div class="row">
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                        <h3 class="text-center">¡Bienvenido <%=perfilVO.getNombreUsu()%>!</h3>
                    </div>
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <div class="card">
                                <h5 class="card-header">Grafico del estado actual de los equipos</h5>
                                <div class="card-body">
                                    <div id="morris_donut"></div>
                                </div>
                            </div>
                    </div>
                </div>
            </div>
            <!-- ============================================================== -->
            <!-- footer -->
            <!-- ============================================================== -->
                   <jsp:include page= "template/footer.jsp"></jsp:include>
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
