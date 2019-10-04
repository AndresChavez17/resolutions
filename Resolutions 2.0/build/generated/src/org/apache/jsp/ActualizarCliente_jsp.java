package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.ArrayList;
import modeloDAO.ClienteDAO;
import modeloVO.ClienteVO;

public final class ActualizarCliente_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("                            <h2 class=\"pageheader-title\">Actualizar Cliente</h2>\n");
      out.write("                            <div class=\"page-breadcrumb\">\n");
      out.write("                                <nav aria-label=\"breadcrumb\">\n");
      out.write("                                    <ol class=\"breadcrumb\">\n");
      out.write("                                        <li class=\"breadcrumb-item\"><a href=\"#\" class=\"breadcrumb-link\">Menú</a></li>\n");
      out.write("                                        <li class=\"breadcrumb-item\"><a href=\"#\" class=\"breadcrumb-link\">Gestionar Clientes</a></li>\n");
      out.write("                                        <li class=\"breadcrumb-item active\" aria-current=\"page\">Actualizar Cliente</li>\n");
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
      out.write("                                <h5 class=\"card-header\">Actualizar Cliente</h5>\n");
      out.write("                                <div class=\"card-body\">\n");
      out.write("                                    <h3 class=\"section-title\">Ingrese la Identificación del Cliente que desea Actualizar</h3>\n");
      out.write("                                    <form id=\"validationform\" data-parsley-validate=\"\" novalidate=\"\" method=\"post\" action=\"ClienteControlador\">\n");
      out.write("                                        <div class=\"form-group row\">\n");
      out.write("                                            <label class=\"col-12 col-sm-3 col-form-label text-sm-right\">Identificación del Cliente</label>\n");
      out.write("                                            <div class=\"col-12 col-sm-8 col-lg-6\">\n");
      out.write("                                                <input data-parsley-type=\"number\" type=\"number\" required=\"\" data-parsley-minlength=\"7\" placeholder=\"Ingrese la Identificación\" class=\"form-control\" name=\"txtIdCli\">\n");
      out.write("                                            </div>\n");
      out.write("                                        </div>\n");
      out.write("                                        <div class=\"form-group row text-right\">\n");
      out.write("                                            <div class=\"col col-sm-10 col-lg-9 offset-sm-1 offset-lg-0\">\n");
      out.write("                                                <button class=\"btn btn-space btn-primary\" name=\"buscarCliente\">Buscar Cliente</button>\n");
      out.write("                                                <input type=\"hidden\" value=\"5\" name=\"opcion\">\n");
      out.write("                                            </div>\n");
      out.write("                                        </div>\n");
      out.write("                                    </form>\n");
      out.write("                                    ");
if (request.getParameter("buscarCliente")!=null){
      out.write("\n");
      out.write("                                    ");
if(request.getAttribute("MensajeErrorBuscar")!=null){
      out.write("\n");
      out.write("                                    <div class=\"alert alert-danger alert-dismissable\">\n");
      out.write("                                        <button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>\n");
      out.write("                                        <h3 class=\"text-danger\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${MensajeErrorBuscar}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</h3>\n");
      out.write("                                    </div>\n");
      out.write("                                    ");
}else{ 
      out.write("\n");
      out.write("                                    <form id=\"validationform\" data-parsley-validate=\"\" novalidate=\"\" method=\"post\" action=\"ClienteControlador\" name=\"formAct\">\n");
      out.write("                                        ");

                                        ClienteVO clienVO = (ClienteVO) request.getAttribute("voLlenoActualizar");
                                        if (clienVO != null) {
                                        
      out.write("\n");
      out.write("                                            <h3 class=\"section-title\">Cliente Encontrado</h3>\n");
      out.write("                                            <div class=\"table-responsive\">\n");
      out.write("                                                <table class=\"table table-primary table-bordered table-striped table-hover\">\n");
      out.write("                                                    <thead class=\"thead-light\">\n");
      out.write("                                                        <tr>\n");
      out.write("                                                            <th scope=\"col\">Identificación</th>\n");
      out.write("                                                            <th scope=\"col\">Nombre</th>\n");
      out.write("                                                            <th scope=\"col\">Direccion</th>\n");
      out.write("                                                            <th scope=\"col\">Telefono</th>\n");
      out.write("                                                            <th scope=\"col\">Celular</th>\n");
      out.write("                                                        </tr>\n");
      out.write("                                                    </thead>\n");
      out.write("                                                    <tbody>\n");
      out.write("                                                        <tr>\n");
      out.write("                                                            <td><input type=\"number\" required=\"\" placeholder=\"Ingrese la Identificación\" class=\"form-control\" readonly name=\"txtIdCli\" value=\"");
      out.print(clienVO.getIdCli());
      out.write("\"></td>\n");
      out.write("                                                            <td><input type=\"text\" required=\"\" data-parsley-maxlength=\"50\" placeholder=\"Ingrese el Nombre\" class=\"form-control\" name=\"txtNombreCli\" value=\"");
      out.print(clienVO.getNombreCli());
      out.write("\"></td>\n");
      out.write("                                                            <td><input type=\"text\" required=\"\" data-parsley-maxlength=\"25\" placeholder=\"Ingrese la Dirección\" class=\"form-control\" name=\"txtDireccionCli\" value=\"");
      out.print(clienVO.getDireccionCli());
      out.write("\"></td>\n");
      out.write("                                                            <td><input type=\"number\" class=\"form-control\" data-parsley-minlength=\"7\" id=\"phone-mask\" placeholder=\"\" name=\"txtTelefonoCli\" value=\"");
      out.print(clienVO.getTelefonoCli());
      out.write("\"></td>\n");
      out.write("                                                            <td><input type=\"number\" class=\"form-control\" data-parsley-minlength=\"10\" id=\"international-mask\" placeholder=\"\" name=\"txtCelularCli\" value=\"");
      out.print(clienVO.getCelularCli());
      out.write("\"></td> \n");
      out.write("                                                        </tr>                                                    \n");
      out.write("                                                    </tbody>\n");
      out.write("                                                </table>\n");
      out.write("                                            </div>\n");
      out.write("                                            ");
}
                                            }
                                            }
      out.write("\n");
      out.write("                                            ");
if (request.getParameter("buscarCliente")!=null){
      out.write("\n");
      out.write("                                            <div class=\"form-group row text-right\">\n");
      out.write("                                                <div class=\"col col-sm-10 col-lg-9 offset-sm-1 offset-lg-0\">\n");
      out.write("                                                    <button class=\"btn btn-space btn-primary\" name=\"actualizarCliente\">Actualizar Cliente</button>\n");
      out.write("                                                    <input type=\"hidden\" value=\"2\" name=\"opcion\">\n");
      out.write("                                                </div>\n");
      out.write("                                            </div>\n");
      out.write("                                            ");
}
      out.write("\n");
      out.write("                                    </form>\n");
      out.write("                                    ");
if (request.getParameter("actualizarCliente")!=null){
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
      out.write("                    <div class=\"col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12\">\n");
      out.write("                            <div class=\"card\">\n");
      out.write("                                <h5 class=\"card-header\">Tabla con todos los Clientes</h5>\n");
      out.write("                                <div class=\"card-body\">\n");
      out.write("                                    <div class=\"table-responsive \">\n");
      out.write("                                        <table class=\"table table-primary table-bordered table-striped table-hover\">\n");
      out.write("                                            <thead class=\"thead-light\">\n");
      out.write("                                                <tr>\n");
      out.write("                                                    <th scope=\"col\">Identificación</th>\n");
      out.write("                                                    <th scope=\"col\">Nombre</th>\n");
      out.write("                                                    <th scope=\"col\">Direccion</th>\n");
      out.write("                                                    <th scope=\"col\">Telefono</th>\n");
      out.write("                                                    <th scope=\"col\">Celular</th>\n");
      out.write("                                                </tr>\n");
      out.write("                                            </thead>\n");
      out.write("                                            <tbody>\n");
      out.write("                                            ");

                                            ClienteVO clienteVO = new ClienteVO();
                                            ClienteDAO cliDAO = new ClienteDAO();

                                            ArrayList<ClienteVO> ListarClientes = cliDAO.listar();

                                            for (int i = 0; i < ListarClientes.size(); i++) {
                                                clienteVO = ListarClientes.get(i);
                                            
      out.write("\n");
      out.write("\n");
      out.write("                                                <tr>\n");
      out.write("                                                    <td>");
      out.print(clienteVO.getIdCli());
      out.write("</td>\n");
      out.write("                                                    <td>");
      out.print(clienteVO.getNombreCli());
      out.write("</td>\n");
      out.write("                                                    <td>");
      out.print(clienteVO.getDireccionCli());
      out.write("</td>\n");
      out.write("                                                    <td>");
      out.print(clienteVO.getTelefonoCli());
      out.write("</td>\n");
      out.write("                                                    <td>");
      out.print(clienteVO.getCelularCli());
      out.write("</td> \n");
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
