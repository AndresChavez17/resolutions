package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.ArrayList;
import modeloDAO.UsuarioDAO;
import modeloVO.UsuarioVO;

public final class FrmUsuario_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("\n");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "template/head.jsp", out, false);
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<body>\n");
      out.write("    <!-- ============================================================== -->\n");
      out.write("    <!-- main wrapper -->\n");
      out.write("    <!-- ============================================================== -->\n");
      out.write("    <div class=\"dashboard-main-wrapper\">\n");
      out.write("        <!-- ============================================================== -->\n");
      out.write("        <!-- navbar -->\n");
      out.write("        <!-- ============================================================== -->\n");
      out.write("            ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "template/top.jsp", out, false);
      out.write("\n");
      out.write("        <!-- ============================================================== -->\n");
      out.write("        <!-- end navbar -->\n");
      out.write("        <!-- ============================================================== -->\n");
      out.write("        <!-- ============================================================== -->\n");
      out.write("        <!-- left sidebar -->\n");
      out.write("        <!-- ============================================================== -->\n");
      out.write("            ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "template/menu.jsp", out, false);
      out.write("\n");
      out.write("        <!-- ============================================================== -->\n");
      out.write("        <!-- end left sidebar -->\n");
      out.write("        <!-- ============================================================== -->\n");
      out.write("        <!-- ============================================================== -->\n");
      out.write("        <!-- wrapper  -->\n");
      out.write("        <!-- ============================================================== -->\n");
      out.write("        <div class=\"dashboard-wrapper\">\n");
      out.write("            <div class=\"container-fluid dashboard-content\">\n");
      out.write("                <!-- ============================================================== -->\n");
      out.write("                <!-- pageheader -->\n");
      out.write("                <!-- ============================================================== -->\n");
      out.write("                <div class=\"row\">\n");
      out.write("                    <div class=\"col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12\">\n");
      out.write("                        <div class=\"page-header\">\n");
      out.write("                            <h2 class=\"pageheader-title\">Buscar y Deshabilitar Usuario</h2>\n");
      out.write("                            <div class=\"page-breadcrumb\">\n");
      out.write("                                <nav aria-label=\"breadcrumb\">\n");
      out.write("                                    <ol class=\"breadcrumb\">\n");
      out.write("                                        <li class=\"breadcrumb-item\"><a href=\"#\" class=\"breadcrumb-link\">Menú</a></li>\n");
      out.write("                                        <li class=\"breadcrumb-item\"><a href=\"#\" class=\"breadcrumb-link\">Gestionar Usuarios</a></li>\n");
      out.write("                                        <li class=\"breadcrumb-item active\" aria-current=\"page\">Buscar y Deshabilitar Usuario</li>\n");
      out.write("                                    </ol>\n");
      out.write("                                </nav>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <!-- ============================================================== -->\n");
      out.write("                <!-- end pageheader -->\n");
      out.write("                <!-- ============================================================== -->\n");
      out.write("                <!-- ============================================================== -->\n");
      out.write("                <!-- INICIO CONTENIDO DE LA PAGINA -->\n");
      out.write("                <!-- ============================================================== -->\n");
      out.write("                <div class=\"row\">\n");
      out.write("                    <div class=\"col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12\">\n");
      out.write("                            <div class=\"card\">\n");
      out.write("                                <h5 class=\"card-header\">Buscar y Deshabilitar Usuario</h5>\n");
      out.write("                                <div class=\"card-body\">\n");
      out.write("                                <div class=\"table-responsive card-body\">\n");
      out.write("                                    <table id=\"datatable\" class=\"table table-primary table-bordered table-striped table-hover\">\n");
      out.write("                                        <thead class=\"thead-light\">\n");
      out.write("                                            <tr>\n");
      out.write("                                                <th scope=\"col\">Identificación Usuario</th>\n");
      out.write("                                                <th scope=\"col\">Nombre</th>\n");
      out.write("                                                <th scope=\"col\">Clave</th>\n");
      out.write("                                                <th scope=\"col\">Estado</th>\n");
      out.write("                                                <th scope=\"col\">Botones</th>\n");
      out.write("                                            </tr>\n");
      out.write("                                        </thead>\n");
      out.write("                                        <tbody>\n");
      out.write("                                            ");

                                                UsuarioVO usuVO = new UsuarioVO();
                                                UsuarioDAO usuDAO = new UsuarioDAO();
                                                ArrayList<UsuarioVO> listar = usuDAO.listar();
                                                if (listar.size() == 0) {
                                            
      out.write("\n");
      out.write("                                            <tr>\n");
      out.write("                                                <td colspan=\"10\">No existen Usuarios en la Base de Datos</td>\n");
      out.write("                                            </tr>\n");
      out.write("                                            ");

                                            } else {
                                                for (int i = 0; i < listar.size(); i++) {
                                                    usuVO = listar.get(i);
                                            
      out.write("\n");
      out.write("                                            <tr>\n");
      out.write("                                                <td>");
      out.print( usuVO.getIdUsu());
      out.write("</td>\n");
      out.write("                                                <td>");
      out.print( usuVO.getNombreUsu());
      out.write("</td>\n");
      out.write("                                                <td>");
      out.print( usuVO.getClaveUsu());
      out.write("</td>\n");
      out.write("                                                ");

                                                if(usuVO.getEstadoUsu().equals("0")){
                                                
      out.write("\n");
      out.write("                                                <td>Inactivo</td>\n");
      out.write("                                                ");

                                                }else{
                                                
      out.write("\n");
      out.write("                                                <td>Activo</td>\n");
      out.write("                                                ");

                                                }
                                                
      out.write("\n");
      out.write("                                                <td>\n");
      out.write("                                                    <form method=\"post\" action=\"UsuarioControlador2\">\n");
      out.write("                                                        <input type=\"hidden\" name=\"txtIdUsu\" value=\"");
      out.print( usuVO.getIdUsu());
      out.write("\">\n");
      out.write("                                                        <input type=\"hidden\" name=\"opcion\" value=\"4\">\n");
      out.write("                                                        <button name=\"eliminarUsuario\" type=\"submit\" class=\"btn float-left\"><i class=\"fa fa-user-times\"></i></button>\n");
      out.write("                                                    </form>\n");
      out.write("                                                    <form method=\"post\" action=\"UsuarioControlador2\">\n");
      out.write("                                                        <input type=\"hidden\" name=\"txtIdUsu\" value=\"");
      out.print( usuVO.getIdUsu());
      out.write("\">\n");
      out.write("                                                        <input type=\"hidden\" name=\"opcion\" value=\"7\">\n");
      out.write("                                                        <button name=\"eliminarUsuario\" type=\"submit\" class=\"btn float-left\"><i class=\"fa fa-check\"></i></button>\n");
      out.write("                                                    </form>\n");
      out.write("                                                </td>\n");
      out.write("                                            </tr>\n");
      out.write("                                            ");

                                                    }
                                                }
                                            
      out.write("\n");
      out.write("                                        </tbody>\n");
      out.write("                                    </table>\n");
      out.write("                                    <br>\n");
      out.write("                                    <!-----///////////////////////////////\n");
      out.write("                                    ");
//if (request.getParameter("eliminarUsuario")!=null){
      out.write("\n");
      out.write("                                    ");
//if(request.getAttribute("MensajeExito")!=null){
      out.write("\n");
      out.write("                                    <div class=\"alert alert-success alert-dismissable\">\n");
      out.write("                                        <button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>                                    \n");
      out.write("                                        <h3 class=\"text-success\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${MensajeExito}", java.lang.String.class, (PageContext)_jspx_page_context, null));

      out.write("</h3>\n");
      out.write("                                    </div>\n");
      out.write("                                    ");
//}else if(request.getAttribute("MensajeError")!=null){ 
      out.write("\n");
      out.write("                                    <div class=\"alert alert-danger alert-dismissable\">\n");
      out.write("                                        <button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>\n");
      out.write("                                        <h3 class=\"text-danger\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${MensajeError}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</h3>\n");
      out.write("                                    </div>\n");
      out.write("                                    ");
//}
      out.write("---->\n");
      out.write("                                </div>                            \n");
      out.write("                            </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("                <!-- ============================================================== -->\n");
      out.write("                <!-- FIN CONTENIDO DE LA PAGINA -->\n");
      out.write("                <!-- ============================================================== -->\n");
      out.write("                ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "template/footer.jsp", out, false);
      out.write("\n");
      out.write("                <!-- ============================================================== -->\n");
      out.write("                <!-- footer -->\n");
      out.write("                <!-- ============================================================== -->                   \n");
      out.write("            </div>\n");
      out.write("            <!-- ============================================================== -->\n");
      out.write("            <!-- end footer -->\n");
      out.write("            <!-- ============================================================== -->        \n");
      out.write("        </div>\n");
      out.write("        <!-- ============================================================== -->\n");
      out.write("        <!-- end main wrapper -->\n");
      out.write("        <!-- ============================================================== -->\n");
      out.write("    </div>\n");
      out.write("    <!-- ============================================================== -->\n");
      out.write("    <!-- end main wrapper -->\n");
      out.write("    <!-- ============================================================== -->\n");
      out.write("    <!-- Optional JavaScript -->\n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "template/scripts.jsp", out, false);
      out.write("\n");
      out.write("</body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
