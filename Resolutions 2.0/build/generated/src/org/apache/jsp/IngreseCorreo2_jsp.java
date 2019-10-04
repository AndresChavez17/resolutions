package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import modeloDAO.PersonasDAO;
import java.util.ArrayList;
import modeloVO.PersonasVO;

public final class IngreseCorreo2_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!doctype html>\n");
      out.write("<html lang=\"en\">\n");
      out.write(" \n");
      out.write("<head>\n");
      out.write("    <!-- Required meta tags -->\n");
      out.write("    <meta charset=\"utf-8\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">\n");
      out.write("    <title>Olvide mi Contraseña</title>\n");
      out.write("    <!-- Bootstrap CSS -->\n");
      out.write("    <link rel=\"stylesheet\" href=\"assets/vendor/bootstrap/css/bootstrap.min.css\">\n");
      out.write("    <link href=\"assets/vendor/fonts/circular-std/style.css\" rel=\"stylesheet\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"assets/libs/css/style.css\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"assets/vendor/fonts/fontawesome/css/fontawesome-all.css\">\n");
      out.write("    <style>\n");
      out.write("    html,\n");
      out.write("    body {\n");
      out.write("        height: 100%;\n");
      out.write("    }\n");
      out.write("\n");
      out.write("    body {\n");
      out.write("        display: -ms-flexbox;\n");
      out.write("        display: flex;\n");
      out.write("        -ms-flex-align: center;\n");
      out.write("        align-items: center;\n");
      out.write("        padding-top: 40px;\n");
      out.write("        padding-bottom: 40px;\n");
      out.write("    }\n");
      out.write("    </style>\n");
      out.write("</head>\n");
      out.write("\n");
      out.write("<body>\n");
      out.write("    <!-- ============================================================== -->\n");
      out.write("    <!-- forgot password  -->\n");
      out.write("    <!-- ============================================================== -->\n");
      out.write("    <div class=\"splash-container\">\n");
      out.write("        <div class=\"card\">\n");
      out.write("            <div class=\"card-header text-center\"><img class=\"logo-img\" src=\"assets/images/logoResolutions.png\" alt=\"logo\"><span class=\"splash-description\">Por favor ingresa tu información.</span></div>\n");
      out.write("            <div class=\"card-body\">\n");
      out.write("                ");

                    PersonasVO PerVO = new PersonasVO();
                    PersonasDAO PerDAO = new PersonasDAO();
                    ArrayList<PersonasVO> listarUsuarios = PerDAO.listar();
                    PersonasVO PerVO1 = (PersonasVO) request.getAttribute("voRellenarCor");

                    if (PerVO1 != null) {
                
      out.write("\n");
      out.write("                <form method=\"post\" action=\"UsuarioControlador2\">\n");
      out.write("                    <p>No te preocupes. Enviaremos un email con tu contraseña</p>                    \n");
      out.write("                    <div class=\"form-group\">\n");
      out.write("                        <input class=\"form-control form-control-lg\" type=\"text\" value=\"");
      out.print(PerVO1.getCorreoPer());
      out.write("\" name=\"txtNombreUsu\" required=\"\" placeholder=\"Ingresa tu nombre de Usuario\" autocomplete=\"off\">\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"form-group pt-1\"><button class=\"btn btn-block btn-primary btn-xl\">Siguiente</button></div>\n");
      out.write("                </form>\n");
      out.write("                ");

                } else {
                
      out.write("\n");
      out.write("                <form method=\"post\" action=\"UsuarioControlador2\">\n");
      out.write("                    <p>No te preocupes. Enviaremos un email con tu contraseña</p>                    \n");
      out.write("                    <div class=\"form-group\">\n");
      out.write("                        <input class=\"form-control form-control-lg\" type=\"text\" name=\"txtNombreUsu\" required=\"\" placeholder=\"Ingresa tu nombre de Usuario\" autocomplete=\"off\">\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"form-group pt-1\"><button class=\"btn btn-block btn-primary btn-xl\">Siguiente</button></div>\n");
      out.write("                </form>\n");
      out.write("                ");
}
      out.write("\n");
      out.write("                <br>\n");
      out.write("                <a href=\"IngreseIdentificacion.jsp\"><button class=\"btn btn-space btn-primary\">Recuperar datos de ingreso</button></a>\n");
      out.write("\n");
      out.write("                <form action=\"EnvioCorreo\" method=\"POST\">\n");
      out.write("                ");
if (request.getParameter("enviar") != null) {
      out.write("\n");
      out.write("                    <div class=\"alert alert-warning alert-dismissible fade show\" style=\"color: orangered;\">\n");
      out.write("                        <button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>\n");
      out.write("                        <center>\n");
      out.write("                            ");
      out.print(request.getAttribute("respuesta"));
      out.write("\n");
      out.write("                        </center>\n");
      out.write("                    </div>\n");
      out.write("                ");
}
      out.write("\n");
      out.write("                </form>\n");
      out.write("                ");
if (request.getAttribute("Mensaje_Error") != null) {
      out.write("\n");
      out.write("                <div class=\"alert alert-danger alert-dismissible fade show\" style=\"color: red;\">\n");
      out.write("                    <button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>\n");
      out.write("                    ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${Mensaje_Error}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\n");
      out.write("                    ");
}
      out.write("\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"card-footer text-center\">\n");
      out.write("                <span>Don't have an account? <a href=\"pages-sign-up.html\">Sign Up</a></span>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("    <!-- ============================================================== -->\n");
      out.write("    <!-- end forgot password  -->\n");
      out.write("    <!-- ============================================================== -->\n");
      out.write("    <!-- Optional JavaScript -->\n");
      out.write("    <script src=\"../assets/vendor/jquery/jquery-3.3.1.min.js\"></script>\n");
      out.write("    <script src=\"../assets/vendor/bootstrap/js/bootstrap.bundle.js\"></script>\n");
      out.write("</body>\n");
      out.write("\n");
      out.write(" \n");
      out.write("</html>");
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
