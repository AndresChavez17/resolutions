package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import modeloVO.*;
import modeloDAO.*;
import java.util.ArrayList;
import modeloDAO.ServicioDAO;
import modeloVO.ServicioVO;

public final class FrmServicio_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      			"FrmLogin.jsp", true, 8192, true);
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
      out.write("\n");
      out.write("\n");

    ServicioVO serVO = new ServicioVO();
    ServicioDAO serDAO = new ServicioDAO(serVO);
    ArrayList<ServicioVO> listar;
    HttpSession currentSession = request.getSession();
    Object cuenta = currentSession.getAttribute("dta");
    UsuarioVO perfilVO = (UsuarioVO) cuenta;
    PersonasVO perVO = new PersonasVO();
    PersonasDAO perDAO = new PersonasDAO();
    
    Date fecha = new Date();
    String modifiedDate = new SimpleDateFormat("yyyy-MM-dd").format(fecha);
    
    perVO = perDAO.buscarRegistro(perfilVO.getIdUsu());

      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
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
      out.write("                            <h2 class=\"pageheader-title\">Gestionar Servicio</h2>\n");
      out.write("                            <div class=\"page-breadcrumb\">\n");
      out.write("                                <nav aria-label=\"breadcrumb\">\n");
      out.write("                                    <ol class=\"breadcrumb\">\n");
      out.write("                                        <li class=\"breadcrumb-item\"><a href=\"#\" class=\"breadcrumb-link\">Menú</a></li>\n");
      out.write("                                        <li class=\"breadcrumb-item\"><a href=\"#\" class=\"breadcrumb-link\">Gestionar Servicios</a></li>\n");
      out.write("                                        <li class=\"breadcrumb-item active\" aria-current=\"page\">Gestionar Servicio</li>\n");
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
      out.write("                                <h5 class=\"card-header\">Gestionar Servicio</h5>\n");
      out.write("                                <div class=\"card-body\">\n");
      out.write("                                    <div class=\"form-group\">\n");
      out.write("                                        <small>Los campos con (*) son obligatorios</small> \n");
      out.write("                                     </div>\n");
      out.write("                                    ");

                                        if(request.getAttribute("Mensaje")!=null){
                                    
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
      out.write("                                <div id=\"cajon1\">\n");
      out.write("                                    <form id=\"validationform\" data-parsley-validate=\"\" novalidate=\"\" method=\"post\" action=\"Servicio\">\n");
      out.write("                                        <div class=\"form-group row\">\n");
      out.write("                                            <label class=\"col-12 col-sm-3 col-form-label text-sm-right\">Empleado</label>\n");
      out.write("                                                <div class=\"col-12 col-sm-8 col-lg-6\">\n");
      out.write("                                                    <input type=\"hidden\" required=\"\" value=\"0\" class=\"form-control\" name=\"idSer\">\n");
      out.write("                                                    <input type=\"hidden\" required=\"\" value=\"");
      out.print( perVO.getTipoPer());
      out.write("\" class=\"form-control\" name=\"idPer\">\n");
      out.write("                                                    <input type=\"text\" required=\"\" value=\"");
      out.print( perVO.getNombrePer());
      out.write(' ');
      out.print( perVO.getApellidoPer());
      out.write("\" class=\"form-control\" autofocus=\"\" readonly=\"\">\n");
      out.write("                                                </div>\n");
      out.write("                                        </div>\n");
      out.write("                                        <div class=\"form-group row\">\n");
      out.write("                                            <label class=\"col-12 col-sm-3 col-form-label text-sm-right\">Equipo *</label>\n");
      out.write("                                            <div class=\"col-12 col-sm-8 col-lg-6\">\n");
      out.write("                                                <select class=\"form-control single-select-search\" name=\"idEq\" required=\"\">\n");
      out.write("                                                    <option value=\"\">Seleccione un equipo</option>\n");
      out.write("                                                    ");

                                                        EquipoVO equVO = new EquipoVO();
                                                        EquipoDAO equDAO = new EquipoDAO(equVO);

                                                        ArrayList<EquipoVO> ListarEqus = equDAO.listar();

                                                        for (int i = 0; i < ListarEqus.size(); i++) {
                                                            equVO = ListarEqus.get(i);
                                                    
      out.write("\n");
      out.write("                                                    <option value=\"");
      out.print( equVO.getIdEq());
      out.write('"');
      out.write('>');
      out.print( equVO.getIdEq());
      out.write(" - ");
      out.print( equVO.getNombreEq());
      out.write("</option>\n");
      out.write("                                                    ");

                                                        }
                                                    
      out.write("\n");
      out.write("                                                </select>\n");
      out.write("                                            </div>\n");
      out.write("                                        </div>\n");
      out.write("                                        <div class=\"form-group row\">\n");
      out.write("                                            <label class=\"col-12 col-sm-3 col-form-label text-sm-right\">Fecha de Ingreso *</label>\n");
      out.write("                                                <div class=\"col-12 col-sm-8 col-lg-6\">                                             \n");
      out.write("                                                    <input class=\"form-control\" type=\"date\" required=\"\" value=\"");
      out.print( modifiedDate );
      out.write("\" name=\"fechaIngresoSer\" min=\"");
      out.print( modifiedDate );
      out.write("\" max=\"");
      out.print( modifiedDate );
      out.write("\">\n");
      out.write("                                                </div>\n");
      out.write("                                        </div>\n");
      out.write("                                        <div class=\"form-group row\">\n");
      out.write("                                            <label class=\"col-12 col-sm-3 col-form-label text-sm-right\">Fecha de Entrega *</label>\n");
      out.write("                                                <div class=\"col-12 col-sm-8 col-lg-6\">                                             \n");
      out.write("                                                    <input class=\"form-control\" type=\"date\" required=\"\" name=\"fechaEntregaSer\" min=\"");
      out.print( modifiedDate );
      out.write("\">\n");
      out.write("                                                </div>\n");
      out.write("                                        </div>\n");
      out.write("                                        <div class=\"form-group row\">\n");
      out.write("                                            <label class=\"col-12 col-sm-3 col-form-label text-sm-right\">Observaciones *</label>\n");
      out.write("                                                <div class=\"col-12 col-sm-8 col-lg-6\">                                             \n");
      out.write("                                                    <input type=\"text\" required=\"\" data-parsley-maxlength=\"70\" placeholder=\"Ingrese una observación\" class=\"form-control\" name=\"observacionesSer\">\n");
      out.write("                                                </div>\n");
      out.write("                                        </div>\n");
      out.write("                                        <div class=\"form-group row text-right\">\n");
      out.write("                                            <div class=\"col col-sm-10 col-lg-9 offset-sm-1 offset-lg-0\">\n");
      out.write("                                                <input type=\"hidden\" name=\"seleccion\" value=\"insertar\">\n");
      out.write("                                                <input class=\"btn btn-primary\" type=\"submit\" value=\"Insertar Servicio\">\n");
      out.write("                                            </div>\n");
      out.write("                                        </div> \n");
      out.write("                                    </form>\n");
      out.write("                                </div>\n");
      out.write("                                <div id=\"cajon2\">\n");
      out.write("                                    <form id=\"validationform\" data-parsley-validate=\"\" novalidate=\"\" method=\"post\" action=\"Servicio\">\n");
      out.write("                                        <div class=\"form-group row\">\n");
      out.write("                                            <label class=\"col-12 col-sm-3 col-form-label text-sm-right\">Identificación del Servicio</label>\n");
      out.write("                                                <div class=\"col-12 col-sm-8 col-lg-6\">                                             \n");
      out.write("                                                    <input type=\"number\" required=\"\" placeholder=\"Identificación del Servicio\" class=\"form-control\" id=\"idSerM\" name=\"idSer\" readonly>\n");
      out.write("                                                </div>\n");
      out.write("                                        </div>\n");
      out.write("                                        <div class=\"form-group row\">\n");
      out.write("                                            <label class=\"col-12 col-sm-3 col-form-label text-sm-right\">Empleado</label>\n");
      out.write("                                                <div class=\"col-12 col-sm-8 col-lg-6\">\n");
      out.write("                                                    <input type=\"hidden\" required=\"\" value=\"");
      out.print( perVO.getTipoPer());
      out.write("\" class=\"form-control\" id=\"idEstM\" name=\"idPer\">\n");
      out.write("                                                    <input type=\"text\" required=\"\" value=\"");
      out.print( perVO.getNombrePer());
      out.write(' ');
      out.print( perVO.getApellidoPer());
      out.write("\" class=\"form-control\" readonly=\"\">\n");
      out.write("                                                </div>\n");
      out.write("                                        </div>\n");
      out.write("                                        <div class=\"form-group row\">\n");
      out.write("                                            <label class=\"col-12 col-sm-3 col-form-label text-sm-right\">Identificación del Equipo</label>\n");
      out.write("                                                <div class=\"col-12 col-sm-8 col-lg-6\">                                             \n");
      out.write("                                                    <input type=\"number\" required=\"\" placeholder=\"Ingrese la Identificación del Equipo\" class=\"form-control\" id=\"idEqM\" name=\"idEq\" readonly=\"\">\n");
      out.write("                                                </div>\n");
      out.write("                                        </div>\n");
      out.write("                                        <div class=\"form-group row\">\n");
      out.write("                                            <label class=\"col-12 col-sm-3 col-form-label text-sm-right\">Fecha de Ingreso</label>\n");
      out.write("                                                <div class=\"col-12 col-sm-8 col-lg-6\">                                             \n");
      out.write("                                                    <input type=\"date\" class=\"form-control\" required=\"\" name=\"fechaIngresoSer\" id=\"fechaIngresoSerM\" readonly=\"\">\n");
      out.write("                                                </div>\n");
      out.write("                                        </div>\n");
      out.write("                                        <div class=\"form-group row\">\n");
      out.write("                                            <label class=\"col-12 col-sm-3 col-form-label text-sm-right\">Fecha de Entrega *</label>\n");
      out.write("                                                <div class=\"col-12 col-sm-8 col-lg-6\">                                             \n");
      out.write("                                                    <input type=\"date\" class=\"form-control\" required=\"\" name=\"fechaEntregaSer\" id=\"fechaEntregaSerM\">\n");
      out.write("                                                </div>\n");
      out.write("                                        </div>\n");
      out.write("                                        <div class=\"form-group row\">\n");
      out.write("                                            <label class=\"col-12 col-sm-3 col-form-label text-sm-right\">Observaciones *</label>\n");
      out.write("                                                <div class=\"col-12 col-sm-8 col-lg-6\">                                             \n");
      out.write("                                                    <input type=\"text\" required=\"\" data-parsley-maxlength=\"70\" placeholder=\"Ingrese una observación\" class=\"form-control\" name=\"observacionesSer\" id=\"observacionesSerM\">\n");
      out.write("                                                </div>\n");
      out.write("                                        </div>\n");
      out.write("                                        <div class=\"form-group row text-right\">\n");
      out.write("                                            <div class=\"col col-sm-10 col-lg-9 offset-sm-1 offset-lg-0\">\n");
      out.write("                                                <input type=\"hidden\" name=\"seleccion\" value=\"modificar\">\n");
      out.write("                                                <input class=\"btn btn-primary\" type=\"submit\" value=\"Actualizar Servicio\">\n");
      out.write("                                                <input class=\"btn btn-warning\" type=\"button\" id=\"Regresar\" value=\"Cancelar\">\n");
      out.write("                                            </div>\n");
      out.write("                                        </div>                                        \n");
      out.write("                                    </form>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"card-body\">\n");
      out.write("                                    <table id=\"datatable\" class=\"table table-primary table-bordered table-striped table-hover\">\n");
      out.write("                                            <thead class=\"thead-light\">\n");
      out.write("                                                <tr>\n");
      out.write("                                                    <th>Identificación del Servicio</th>\n");
      out.write("                                                    <th>Identificación del Empleado</th>\n");
      out.write("                                                    <th>Identificación del Equipo</th>\n");
      out.write("                                                    <th>Fecha de Ingreso</th>\n");
      out.write("                                                    <th>Fecha de Entrega</th>\n");
      out.write("                                                    <th>Observaciones</th>\n");
      out.write("                                                    <th>Modificar</th>\n");
      out.write("                                                    <th>Eliminar</th>\n");
      out.write("                                                </tr>\n");
      out.write("                                            </thead>\n");
      out.write("                                            <tbody>\n");
      out.write("                                                ");

                                                    listar = serDAO.listar();
                                                    if(listar.size()==0){
                                                
      out.write("\n");
      out.write("                                                <tr>\n");
      out.write("                                                    <td colspan=\"8\">No existen Servicios en la Base de Datos</td>\n");
      out.write("                                                </tr>\n");
      out.write("                                                ");

                                                    }else{
                                                        for (int i = 0; i < listar.size(); i++) {
                                                            serVO = listar.get(i);
                                                
      out.write("\n");
      out.write("                                                <tr>\n");
      out.write("                                                    <td>");
      out.print( serVO.getIdSer());
      out.write("</td>\n");
      out.write("                                                    <td>");
      out.print( serVO.getIdPer());
      out.write("</td>\n");
      out.write("                                                    <td>");
      out.print( serVO.getIdEq());
      out.write("</td>\n");
      out.write("                                                    <td>");
      out.print( serVO.getFechaIngresoSer());
      out.write("</td>\n");
      out.write("                                                    <td>");
      out.print( serVO.getFechaEntregaSer());
      out.write("</td>\n");
      out.write("                                                    <td>");
      out.print( serVO.getObservacionesSer());
      out.write("</td>\n");
      out.write("                                                    <td><button onclick=\"modificador2('");
      out.print( serVO.getIdSer());
      out.write("','");
      out.print( serVO.getIdPer());
      out.write("','");
      out.print( serVO.getIdEq());
      out.write("','");
      out.print( serVO.getFechaIngresoSer());
      out.write("','");
      out.print( serVO.getFechaEntregaSer());
      out.write("','");
      out.print( serVO.getObservacionesSer());
      out.write("')\" class=\"btn bg-transparent float-left\"><i class=\"far fa-edit\"></i></button></td>\n");
      out.write("                                                    <td>\n");
      out.write("                                                        <form method=\"post\" action=\"Servicio\">\n");
      out.write("                                                            <input type=\"hidden\" name=\"idSer\" value=\"");
      out.print( serVO.getIdSer());
      out.write("\">\n");
      out.write("                                                            <input type=\"hidden\" name=\"seleccion\" value=\"eliminar\">\n");
      out.write("                                                            <button type=\"submit\" class=\"btn bg-transparent float-left\"><i class=\"far fa-trash-alt\"></i></button>\n");
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
