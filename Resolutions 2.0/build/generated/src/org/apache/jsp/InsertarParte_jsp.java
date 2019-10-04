package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import modeloVO.EstadoVO;
import modeloVO.EquipoVO;
import java.util.ArrayList;
import modeloDAO.PartesDAO;
import modeloDAO.ClienteDAO;
import modeloVO.PartesVO;

public final class InsertarParte_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("                            <h2 class=\"pageheader-title\">Insertar Partes</h2>\n");
      out.write("                            <div class=\"page-breadcrumb\">\n");
      out.write("                                <nav aria-label=\"breadcrumb\">\n");
      out.write("                                    <ol class=\"breadcrumb\">\n");
      out.write("                                        <li class=\"breadcrumb-item\"><a href=\"#\" class=\"breadcrumb-link\">Menú</a></li>\n");
      out.write("                                        <li class=\"breadcrumb-item\"><a href=\"#\" class=\"breadcrumb-link\">Gestionar Partes</a></li>\n");
      out.write("                                        <li class=\"breadcrumb-item active\" aria-current=\"page\">Insertar Parte</li>\n");
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
      out.write("                                <h5 class=\"card-header\">Insertar Parte</h5>\n");
      out.write("                                <div class=\"card-body\">\n");
      out.write("                                    <form method=\"post\" action=\"Partes\" id=\"validationform\" data-parsley-validate=\"\" novalidate=\"\">\n");
      out.write("                                        <div class=\"form-group row\">\n");
      out.write("                                            <label class=\"col-12 col-sm-3 col-form-label text-sm-right\">Identificación de la Parte</label>\n");
      out.write("                                            <div class=\"col-12 col-sm-8 col-lg-6\">\n");
      out.write("                                                <input type=\"number\" required=\"\" placeholder=\"Ingrese la Identificación\" class=\"form-control\" name=\"txtIdPart\">\n");
      out.write("                                            </div>\n");
      out.write("                                        </div>\n");
      out.write("                                        <div class=\"form-group row\">\n");
      out.write("                                            <label class=\"col-12 col-sm-3 col-form-label text-sm-right\">Identificación del Equipo</label>\n");
      out.write("                                            <div class=\"col-12 col-sm-8 col-lg-6\">\n");
      out.write("                                                <input type=\"number\" required=\"\" placeholder=\"Ingrese la Identificación\" class=\"form-control\" name=\"txtIdEq\">\n");
      out.write("                                            </div>\n");
      out.write("                                        </div>\n");
      out.write("                                        <div class=\"form-group row\">\n");
      out.write("                                            <label class=\"col-12 col-sm-3 col-form-label text-sm-right\">Identificación del Estado</label>\n");
      out.write("                                            <div class=\"col-12 col-sm-8 col-lg-6\">\n");
      out.write("                                                <input type=\"number\" required=\"\" placeholder=\"Ingrese la Identificación\" class=\"form-control\" name=\"txtIdEst\">\n");
      out.write("                                            </div>\n");
      out.write("                                        </div>\n");
      out.write("                                        <div class=\"form-group row\">\n");
      out.write("                                            <label class=\"col-12 col-sm-3 col-form-label text-sm-right\">Nombre de la Parte</label>\n");
      out.write("                                            <div class=\"col-12 col-sm-8 col-lg-6\">\n");
      out.write("                                                <input type=\"text\" required=\"\" data-parsley-maxlength=\"50\" placeholder=\"Ingrese el Nombre\" class=\"form-control\" name=\"txtNombrePart\">\n");
      out.write("                                            </div>\n");
      out.write("                                        </div>\n");
      out.write("                                        <div class=\"form-group row\">\n");
      out.write("                                            <label class=\"col-12 col-sm-3 col-form-label text-sm-right\">Tipo de Parte</label>\n");
      out.write("                                            <div class=\"col-12 col-sm-8 col-lg-6\">\n");
      out.write("                                                <input type=\"text\" required=\"\" data-parsley-maxlength=\"25\" placeholder=\"Ingrese el Tipo\" class=\"form-control\" name=\"txtTipoPart\">\n");
      out.write("                                            </div>\n");
      out.write("                                        </div>\n");
      out.write("                                        <div class=\"form-group row\">\n");
      out.write("                                            <label class=\"col-12 col-sm-3 col-form-label text-sm-right\">Comentario de la Parte</label>\n");
      out.write("                                            <div class=\"col-12 col-sm-8 col-lg-6\">\n");
      out.write("                                                <input type=\"text\" required=\"\" data-parsley-maxlength=\"50\" placeholder=\"Ingrese el Nombre\" class=\"form-control\" name=\"txtComentarioPart\">\n");
      out.write("                                            </div>\n");
      out.write("                                        </div>                                          \n");
      out.write("                                        <div class=\"form-group row text-right\">\n");
      out.write("                                            <div class=\"col col-sm-10 col-lg-9 offset-sm-1 offset-lg-0\">\n");
      out.write("                                                <button class=\"btn btn-space btn-primary\" name=\"insertarParte\">Insertar Parte</button>\n");
      out.write("                                                <input type=\"hidden\" value=\"1\" name=\"opcion\">\n");
      out.write("                                            </div>\n");
      out.write("                                        </div>\n");
      out.write("                                    </form>\n");
      out.write("                                    ");
if (request.getParameter("insertarParte")!=null){
      out.write("\n");
      out.write("                                    ");
if(request.getAttribute("MensajeError")!=null){
      out.write("\n");
      out.write("                                    <div class=\"alert alert-danger alert-dismissable\">\n");
      out.write("                                        <button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>\n");
      out.write("                                        <h3 class=\"text-danger\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${MensajeError}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</h3>\n");
      out.write("                                    </div>\n");
      out.write("                                    ");
}else{ 
      out.write("\n");
      out.write("                                    <div class=\"alert alert-success alert-dismissable\">\n");
      out.write("                                        <button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>                                    \n");
      out.write("                                        <h3 class=\"text-success\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${MensajeExito}", java.lang.String.class, (PageContext)_jspx_page_context, null));
}
      out.write("</h3>\n");
      out.write("                                    </div>\n");
      out.write("                                    ");
}
      out.write("\n");
      out.write("                                </div>                            \n");
      out.write("                            </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"row\">\n");
      out.write("                    <div class=\"col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6\">\n");
      out.write("                            <div class=\"card\">\n");
      out.write("                                <h5 class=\"card-header\">Información de los Equipos</h5>\n");
      out.write("                                <div class=\"card-body\">\n");
      out.write("                                    <div class=\"table-responsive \">\n");
      out.write("                                        <table class=\"table table-primary table-bordered table-striped table-hover\">\n");
      out.write("                                            <thead class=\"thead-light\">\n");
      out.write("                                                <tr>\n");
      out.write("                                                    <th scope=\"col\">Identificación del Equipo</th>\n");
      out.write("                                                    <th scope=\"col\">Identificación del Cliente</th>\n");
      out.write("                                                    <th scope=\"col\">Nombre del Equipo</th>\n");
      out.write("                                                </tr>\n");
      out.write("                                            </thead>\n");
      out.write("                                            <tbody>\n");
      out.write("                                            ");

                                            EquipoVO equiVO = new EquipoVO();
                                            PartesDAO partDAO = new PartesDAO();

                                            ArrayList<EquipoVO> ListarEquipos = partDAO.listarEquipos();

                                            for (int i = 0; i < ListarEquipos.size(); i++) {
                                                equiVO = ListarEquipos.get(i);
                                            
      out.write("\n");
      out.write("\n");
      out.write("                                                <tr>\n");
      out.write("                                                    <td>");
      out.print(equiVO.getIdEq());
      out.write("</td>\n");
      out.write("                                                    <td>");
      out.print(equiVO.getIdEqCli());
      out.write("</td>\n");
      out.write("                                                    <td>");
      out.print(equiVO.getNombreEq());
      out.write("</td>\n");
      out.write("                                                </tr>\n");
      out.write("                                            ");
}
      out.write("\n");
      out.write("                                            </tbody>\n");
      out.write("                                        </table>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>                            \n");
      out.write("                            </div>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6\">\n");
      out.write("                            <div class=\"card\">\n");
      out.write("                                <h5 class=\"card-header\">Información de los Estados</h5>\n");
      out.write("                                <div class=\"card-body\">\n");
      out.write("                                    <div class=\"table-responsive \">\n");
      out.write("                                        <table class=\"table table-primary table-bordered table-striped table-hover\">\n");
      out.write("                                            <thead class=\"thead-light\">\n");
      out.write("                                                <tr>\n");
      out.write("                                                    <th scope=\"col\">Identificación del Estado</th>\n");
      out.write("                                                    <th scope=\"col\">Nombre del Estado</th>\n");
      out.write("                                                </tr>\n");
      out.write("                                            </thead>\n");
      out.write("                                            <tbody>\n");
      out.write("                                            ");
                                            
                                            EstadoVO estadoVO = new EstadoVO();
                                            PartesDAO parteDAO = new PartesDAO();

                                            ArrayList<EstadoVO> ListarEstados = parteDAO.listarEstados();
                                            
                                            for (int i = 0; i < ListarEstados.size(); i++) {
                                                estadoVO = ListarEstados.get(i);
                                            
      out.write("\n");
      out.write("\n");
      out.write("                                                <tr>\n");
      out.write("                                                    <td>");
      out.print(estadoVO.getIdEst());
      out.write("</td>\n");
      out.write("                                                    <td>");
      out.print(estadoVO.getNombreEst());
      out.write("</td>\n");
      out.write("                                                </tr>\n");
      out.write("                                            ");
}
      out.write("\n");
      out.write("                                            </tbody>\n");
      out.write("                                        </table>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>                            \n");
      out.write("                            </div>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12\">\n");
      out.write("                            <div class=\"card\">\n");
      out.write("                                <h5 class=\"card-header\">Tabla con todas las Partes</h5>\n");
      out.write("                                <div class=\"card-body\">\n");
      out.write("                                    <div class=\"table-responsive \">\n");
      out.write("                                        <table class=\"table table-primary table-bordered table-striped table-hover\">\n");
      out.write("                                            <thead class=\"thead-light\">\n");
      out.write("                                                <tr>\n");
      out.write("                                                    <th scope=\"col\">Identificación de la Parte</th>\n");
      out.write("                                                    <th scope=\"col\">Identificación del Equipo</th>\n");
      out.write("                                                    <th scope=\"col\">Identificación del Estado</th>\n");
      out.write("                                                    <th scope=\"col\">Nombre</th>\n");
      out.write("                                                    <th scope=\"col\">Tipo</th>\n");
      out.write("                                                    <th scope=\"col\">Comentario</th>                                                    \n");
      out.write("                                                </tr>\n");
      out.write("                                            </thead>\n");
      out.write("                                            <tbody>\n");
      out.write("                                            ");

                                            PartesVO parteVO = new PartesVO();
                                            PartesDAO parDAO = new PartesDAO();

                                            ArrayList<PartesVO> ListarPartes = parDAO.listar();

                                            for (int i = 0; i < ListarPartes.size(); i++) {
                                                parteVO = ListarPartes.get(i);
                                            
      out.write("\n");
      out.write("\n");
      out.write("                                                <tr>\n");
      out.write("                                                    <td>");
      out.print(parteVO.getIdPart());
      out.write("</td>\n");
      out.write("                                                    <td>");
      out.print(parteVO.getIdEq());
      out.write("</td>\n");
      out.write("                                                    <td>");
      out.print(parteVO.getIdEst());
      out.write("</td>\n");
      out.write("                                                    <td>");
      out.print(parteVO.getNombrePart());
      out.write("</td>\n");
      out.write("                                                    <td>");
      out.print(parteVO.getTipoPart());
      out.write("</td>\n");
      out.write("                                                    <td>");
      out.print(parteVO.getComentarioPart());
      out.write("</td>                                                     \n");
      out.write("                                                </tr>\n");
      out.write("                                            ");
}
      out.write("\n");
      out.write("                                            </tbody>\n");
      out.write("                                        </table>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>                            \n");
      out.write("                            </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
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
