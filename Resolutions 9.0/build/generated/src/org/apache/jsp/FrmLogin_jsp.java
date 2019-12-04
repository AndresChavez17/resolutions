package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import controlador.UsuarioControlador;
import modeloDAO.UsuarioDAO;
import modeloVO.UsuarioVO;

public final class FrmLogin_jsp extends org.apache.jasper.runtime.HttpJspBase
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
    Throwable exception = org.apache.jasper.runtime.JspRuntimeLibrary.getThrowable(request);
    if (exception != null) {
      response.setStatus((Integer)request.getAttribute("javax.servlet.error.status_code"));
    }
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			"404Page.jsp", true, 8192, true);
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

    UsuarioVO usuVO = new UsuarioVO();
    UsuarioDAO usuDAO = new UsuarioDAO(usuVO);
    UsuarioControlador usuCon = new UsuarioControlador();
            
    HttpSession currentSession = request.getSession();
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (int i=0; i<cookies.length; i++) {
            if(cookies[i].getName().equals("ReUsu")) {
                usuVO = usuDAO.consulta(usuCon.desencriptarCookie(cookies[i].getValue().toString()));
                if(usuVO != null){
                    currentSession.setAttribute("dta", usuVO);
                    response.sendRedirect("index.jsp");
                }
            }
        }
    }
    /*Object cuenta = currentSession.getAttribute("dta");
    if(cuenta!=null){
        response.sendRedirect("index.jsp");
    }*/

      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write(" \n");
      out.write("<head>\n");
      out.write("    <!-- Required meta tags -->\n");
      out.write("    <meta charset=\"utf-8\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">\n");
      out.write("    <title>Login</title>\n");
      out.write("    <!-- Bootstrap CSS -->\n");
      out.write("    <link rel=\"stylesheet\" href=\"assets/vendor/bootstrap/css/bootstrap.min.css\">\n");
      out.write("    <link href=\"assets/vendor/fonts/circular-std/style.css\" rel=\"stylesheet\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"assets/libs/css/style.css\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"assets/vendor/fonts/fontawesome/css/fontawesome-all.css\">\n");
      out.write("    <link rel=\"shortcut icon\" type=\"image/png\" href=\"assets/images/favicon.ico\">\n");
      out.write("    <style>\n");
      out.write("    html,\n");
      out.write("    body {\n");
      out.write("        height: 100%;\n");
      out.write("    }\n");
      out.write("\n");
      out.write("    body {\n");
      out.write("        background-image: url(\"assets/images/fondo2.jpg\");\n");
      out.write("        background-position: center center;\n");
      out.write("        background-repeat: no-repeat;\n");
      out.write("        background-attachment: fixed;\n");
      out.write("        background-size: cover;\n");
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
      out.write("    <!-- login page  -->\n");
      out.write("    <!-- ============================================================== -->\n");
      out.write("    <div class=\"splash-container\">\n");
      out.write("        <div class=\"card \">\n");
      out.write("            <div class=\"card-header text-center\"><a href=\"FrmLogin.jsp\"><img class=\"logo-img\" src=\"assets/images/logoResolutions.png\" alt=\"logo\"></a><span class=\"splash-description\">Por Favor Ingresa la Información</span></div>\n");
      out.write("            <div class=\"card-body\">                               \n");
      out.write("                <form method=\"post\" action=\"Usuario\">\n");
      out.write("                    <div class=\"form-group\">\n");
      out.write("                        <input class=\"form-control form-control-lg\" id=\"inputName\" type=\"text\" name=\"txtNombreUsu\" placeholder=\"Ingresa tu Usuario\" required=\"\" autocomplete=\"off\" autofocus=\"\">\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"form-group\">\n");
      out.write("                    <div class=\"input-group\">\n");
      out.write("                        <input class=\"form-control form-control-lg\" id=\"txtPassword\" type=\"password\" name=\"txtClaveUsu\" placeholder=\"Ingresa la Contraseña\" required=\"\">\n");
      out.write("                        <button id=\"show_password\" class=\"btn btn-primary\" type=\"button\" onclick=\"mostrarPassword()\"> <span class=\"fa fa-eye-slash icon\"></span> </button>\n");
      out.write("                    </div>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"form-group\">\n");
      out.write("                    <div class=\"input-group-append\">\n");
      out.write("                        <label class=\"custom-control custom-checkbox\">\n");
      out.write("                            <input class=\"custom-control-input\" type=\"checkbox\" name=\"checkno\" value=\"remember-me\"><span class=\"custom-control-label\">Recordar mis datos</span>\n");
      out.write("                        </label>\n");
      out.write("                    </div>\n");
      out.write("                    </div>\n");
      out.write("                    <input type=\"hidden\" name=\"seleccion\" value=\"entrar\">\n");
      out.write("                    <button type=\"submit\" class=\"btn btn-primary btn-lg btn-block\">Iniciar Sesión</button>\n");
      out.write("                </form>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"card-footer bg-white p-0\">\n");
      out.write("                <div class=\"card-footer-item card-footer-item-bordered\">\n");
      out.write("                    <a href=\"IngreseCorreo.jsp\" class=\"footer-link\">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp He olvidado mi Contraseña</a>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"card-footer bg-white p-0\">\n");
      out.write("                <div class=\"card-footer-item card-footer-item-bordered\">\n");
      out.write("                    <a href=\"http://ior.ad/6L1F\" target=\"_blank\" class=\"footer-link\">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp¿Como Inicio Sesión?</a>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            ");

                    if(request.getAttribute("Mensaje")!=null){
            
      out.write("\n");
      out.write("            <hr>\n");
      out.write("            <div class=\"alert alert-danger alert-dismissible fade show\" role=\"alert\">\n");
      out.write("                <strong>¡No se pudo ingresar!</strong> ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${Mensaje}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write(".\n");
      out.write("                <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">\n");
      out.write("                    <span aria-hidden=\"true\">&times;</span>\n");
      out.write("                </button>\n");
      out.write("            </div>\n");
      out.write("            ");

                }
            
      out.write("\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("  \n");
      out.write("    <!-- ============================================================== -->\n");
      out.write("    <!-- end login page  -->\n");
      out.write("    <!-- ============================================================== -->\n");
      out.write("    <!-- Optional JavaScript -->\n");
      out.write("    <script src=\"assets/vendor/jquery/jquery-3.3.1.min.js\"></script>\n");
      out.write("    <script src=\"assets/vendor/bootstrap/js/bootstrap.bundle.js\"></script>\n");
      out.write("    <script type=\"text/javascript\" src=\"assets/libs/js/Popper.js\"></script>\n");
      out.write("    <script type=\"text/javascript\" src=\"assets/libs/js/jQuery.js\"></script>\n");
      out.write("    <script type=\"text/javascript\" src=\"assets/libs/js/bootstrap.js\"></script>\n");
      out.write("    <script type=\"text/javascript\">\n");
      out.write("    function mostrarPassword(){\n");
      out.write("                    var cambio = document.getElementById(\"txtPassword\");\n");
      out.write("                    if(cambio.type == \"password\"){\n");
      out.write("                            cambio.type = \"text\";\n");
      out.write("                            $('.icon').removeClass('fa fa-eye-slash').addClass('fa fa-eye');\n");
      out.write("                    }else{\n");
      out.write("                            cambio.type = \"password\";\n");
      out.write("                            $('.icon').removeClass('fa fa-eye').addClass('fa fa-eye-slash');\n");
      out.write("                    }\n");
      out.write("            }\n");
      out.write("    </script>\n");
      out.write("</body>\n");
      out.write(" \n");
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
