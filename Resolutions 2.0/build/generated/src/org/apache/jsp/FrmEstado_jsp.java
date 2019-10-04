package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.ArrayList;
import modeloDAO.EstadoDAO;
import modeloVO.EstadoVO;

public final class FrmEstado_jsp extends org.apache.jasper.runtime.HttpJspBase
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
  EstadoVO estVO = new EstadoVO();
    EstadoDAO estDAO = new EstadoDAO(estVO);
    ArrayList<EstadoVO> listar;

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
      out.write("                            <h2 class=\"pageheader-title\">Gestionar Estado</h2>\n");
      out.write("                            <div class=\"page-breadcrumb\">\n");
      out.write("                                <nav aria-label=\"breadcrumb\">\n");
      out.write("                                    <ol class=\"breadcrumb\">\n");
      out.write("                                        <li class=\"breadcrumb-item\"><a href=\"#\" class=\"breadcrumb-link\">Menú</a></li>\n");
      out.write("                                        <li class=\"breadcrumb-item\"><a href=\"#\" class=\"breadcrumb-link\">Gestionar Estados</a></li>\n");
      out.write("                                        <li class=\"breadcrumb-item active\" aria-current=\"page\">Gestionar Estado</li>\n");
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
      out.write("                                <h5 class=\"card-header\">Gestionar Estado</h5>\n");
      out.write("                                <div class=\"card-body\">\n");
      out.write("                                    ");

                                        if (request.getAttribute("Mensaje") != null) {
                                    
      out.write("\n");
      out.write("                                    <div class=\"alert alert-info alert-dismissible fade show\" role=\"alert\">\n");
      out.write("                                        <strong>");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${Mensaje}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write(".</strong>\n");
      out.write("                                        <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">\n");
      out.write("                                            <span aria-hidden=\"true\">&times;</span>\n");
      out.write("                                        </button>\n");
      out.write("                                    </div>\n");
      out.write("                                    ");

                                        }
                                    
      out.write("\n");
      out.write("                                    <div id=\"cajon1\">\n");
      out.write("                                    <form method=\"post\" action=\"Estado\">                                        \n");
      out.write("                                        <div class=\"form-group row\">\n");
      out.write("                                            <label class=\"col-12 col-sm-3 col-form-label text-sm-right\">Nombre del Estado</label>\n");
      out.write("                                        <div class=\"col-12 col-sm-8 col-lg-6\">                                             \n");
      out.write("                                            <input type=\"text\" required=\"\" data-parsley-maxlength=\"50\" placeholder=\"Ingrese el Nombre\" class=\"form-control\" name=\"nombreEst\">                                            \n");
      out.write("                                        </div>\n");
      out.write("                                        </div>\n");
      out.write("                                        <div class=\"form-group row text-right\">\n");
      out.write("                                            <div class=\"col col-sm-10 col-lg-9 offset-sm-1 offset-lg-0\">\n");
      out.write("                                                <input type=\"hidden\" name=\"seleccion\" value=\"insertar\">\n");
      out.write("                                                <input class=\"btn btn-space btn-primary\" type=\"submit\" value=\"Insertar\">\n");
      out.write("                                            </div>\n");
      out.write("                                        </div>                                        \n");
      out.write("                                    </form>\n");
      out.write("                                    </div>\n");
      out.write("                                    <div id=\"cajon2\">\n");
      out.write("                                        <form method=\"post\" action=\"Estado\">\n");
      out.write("                                            <div class=\"form-group row\">\n");
      out.write("                                                <label class=\"col-12 col-sm-3 col-form-label text-sm-right\">Identificación del Estado</label>\n");
      out.write("                                            <div class=\"col-12 col-sm-8 col-lg-6\">                                             \n");
      out.write("                                                <input type=\"number\" placeholder=\"Ingrese la Identificación\" class=\"form-control\" id=\"idEstM\" name=\"idEst\" readonly>\n");
      out.write("                                            </div>\n");
      out.write("                                            </div>\n");
      out.write("                                            <div class=\"form-group row\">\n");
      out.write("                                                <label class=\"col-12 col-sm-3 col-form-label text-sm-right\">Nombre del Estado</label>\n");
      out.write("                                            <div class=\"col-12 col-sm-8 col-lg-6\">                                             \n");
      out.write("                                                <input type=\"text\" required=\"\" data-parsley-maxlength=\"50\" placeholder=\"Ingrese el Nombre\" class=\"form-control\" id=\"nombreEstM\" name=\"nombreEst\">\n");
      out.write("                                            </div>\n");
      out.write("                                            </div>\n");
      out.write("                                            <div class=\"form-group row text-right\">\n");
      out.write("                                            <div class=\"col col-sm-10 col-lg-9 offset-sm-1 offset-lg-0\">\n");
      out.write("                                                <input type=\"hidden\" name=\"seleccion\" value=\"modificar\">\n");
      out.write("                                                <input class=\"btn btn-space btn-primary\" type=\"submit\" value=\"Actualizar\">\n");
      out.write("                                                <input class=\"btn btn-space btn-warning\" type=\"button\" id=\"Regresar\" value=\"Cancelar\">\n");
      out.write("                                            </div>\n");
      out.write("                                            </div>  \n");
      out.write("                                        </form>\n");
      out.write("                                    </div>\n");
      out.write("                                    <div class=\"table-responsive \">\n");
      out.write("                                        <table class=\"table table-primary table-bordered table-striped table-hover\">\n");
      out.write("                                            <thead class=\"thead-light\">\n");
      out.write("                                                <tr>\n");
      out.write("                                                    <th scope=\"col\">Identificación del Estado</th>\n");
      out.write("                                                    <th scope=\"col\">Nombre del Estado</th>\n");
      out.write("                                                    <th scope=\"col\">Botones</th>\n");
      out.write("                                                </tr>\n");
      out.write("                                            </thead>\n");
      out.write("                                            <tbody>\n");
      out.write("                                            ");

                                                listar = estDAO.listar();
                                                if (listar.size() == 0) {
                                            
      out.write("\n");
      out.write("                                                <tr>\n");
      out.write("                                                    <th scope=\"row\">#</th>\n");
      out.write("                                                    <td colspan=\"4\">No existen estados en la Base de Datos</td>\n");
      out.write("                                                </tr>\n");
      out.write("                                            ");

                                            } else {
                                                for (int i = 0; i < listar.size(); i++) {
                                                    estVO = listar.get(i);
                                            
      out.write("\n");
      out.write("                                                <tr>                    \n");
      out.write("                                                    <td>");
      out.print( estVO.getIdEst());
      out.write("</td>\n");
      out.write("                                                    <td>");
      out.print( estVO.getNombreEst());
      out.write("</td>\n");
      out.write("                                                    <td><button onclick=\"modificador('");
      out.print( estVO.getIdEst());
      out.write("', '");
      out.print( estVO.getNombreEst());
      out.write("')\" class=\"btn bg-transparent float-left\"><i class=\"far fa-edit\"></i></button>\n");
      out.write("                                                        <form method=\"post\" action=\"Estado\">\n");
      out.write("                                                            <input type=\"hidden\" name=\"idEst\" value=\"");
      out.print( estVO.getIdEst());
      out.write("\">\n");
      out.write("                                                            <input type=\"hidden\" name=\"seleccion\" value=\"eliminar\">\n");
      out.write("                                                            <button type=\"submit\" class=\"btn\"><i class=\"far fa-trash-alt\"></i></button>\n");
      out.write("                                                        </form>\n");
      out.write("                                                    </td>\n");
      out.write("                                                </tr>\n");
      out.write("                                            ");

                                                    }
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
