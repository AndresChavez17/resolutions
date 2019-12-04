<%@page import="net.sf.jasperreports.engine.JasperExportManager"%>
<%@page import="net.sf.jasperreports.engine.JasperCompileManager"%>
<%@page import="net.sf.jasperreports.engine.JasperRunManager"%>
<%@page import="net.sf.jasperreports.engine.JRExporter" %>
<%@page import="net.sf.jasperreports.engine.JRExporterParameter" %>
<%@page import="net.sf.jasperreports.engine.JasperFillManager" %>
<%@page import="net.sf.jasperreports.engine.JasperPrint" %>
<%@page import="net.sf.jasperreports.engine.JasperReport" %>
<%@page import="net.sf.jasperreports.engine.export.JRPdfExporter" %>
<%@page import="net.sf.jasperreports.engine.util.JRLoader" %>
<%@page import="java.util.*" %> 
<%@page import="java.io.*" %> 
<%@page import="java.sql.*" %>

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
            Map parameters = new HashMap();
            byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath (), parameters, conn);
            
            String path = application.getRealPath("/");
            JasperPrint jasperPrint = JasperFillManager.fillReport(path + "/Reportes/" + "RepGeneral.jasper", null, conn);
            
            OutputStream ouputStream = response.getOutputStream();
            JRExporter exporter = null;
            
            response.setContentType("application/pdf");
            response.setHeader("Content-Disposition", "attachment; filename=\"ReporteGeneral.pdf\"");

            exporter = new JRPdfExporter();
            exporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
            exporter.setParameter(JRExporterParameter.OUTPUT_STREAM, ouputStream);
            exporter.exportReport();
        }else{

        }
        %>
    </body>
</html>