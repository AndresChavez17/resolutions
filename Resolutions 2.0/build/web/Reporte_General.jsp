<%@ page import="net.sf.jasperreports.engine.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="java.sql.*" %>

<html>
    <head>
        <title>Reporte Equipos</title>
    </head>
    <body>
        <%
        /*Establecemos la ruta del reporte*/
        Connection conn = null;
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://"+"localhost"+"/"+"ReSolutions"+"?useUnicode=true&useJDBCCompliantTimeZoneShift=true&useLegacyDatetimecode=false&serverTimezone=UTC", "root", "");
        if(conn!=null){
            File reportFile = new File(application.getRealPath("Reportes/RepGeneral.jasper")); 
            /* No enviamos parámetros porque nuestro reporte no los necesita asi que escriba 
            cualquier cadena de texto ya que solo seguiremos el formato del método runReportToPdf*/ 
            Map parameters = new HashMap();
            /*Enviamos la ruta del reporte, los parámetros y la conexión(objeto Connection)*/ 
            byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath (), parameters, conn); 
            /*Indicamos que la respuesta va a ser en formato PDF*/
            response.setContentType("application/pdf");
            response.setContentLength(bytes.length);
            ServletOutputStream ouputStream = response.getOutputStream(); 
            ouputStream.write(bytes, 0, bytes.length); /*Limpiamos y cerramos flujos de salida*/
            ouputStream.flush();
            ouputStream.close();
        }else{

        }
        %>
    </body>
</html>