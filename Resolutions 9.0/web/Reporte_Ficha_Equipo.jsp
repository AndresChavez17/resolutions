<%-- 
    Document   : FrmRepInv
    Created on : 23-sep-2019, 20:40:26
    Author     : Jaxx
--%>

<%@page import="net.sf.jasperreports.engine.export.JRPdfExporter"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="net.sf.jasperreports.engine.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.io.*" %>
<%@ page errorPage="FrmLogin.jsp" %> 

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
            File reportFile = new File(application.getRealPath("Reportes/RepInv.jasper"));
            Map parameters = new HashMap();
            String PIQUED = request.getParameter("PIQUED");
            parameters.put("PIDEQ", PIQUED);
            byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath (), parameters, conn);
            
            String path = application.getRealPath("/");
            JasperPrint jasperPrint = JasperFillManager.fillReport(path + "/Reportes/" + "RepInv.jasper", parameters, conn);
            
            OutputStream ouputStream = response.getOutputStream();
            JRExporter exporter = null;
            
            response.setContentType("application/pdf");
            response.setHeader("Content-Disposition", "attachment; filename=\"ReporteEquipo#"+ PIQUED +".pdf\"");

            exporter = new JRPdfExporter();
            exporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
            exporter.setParameter(JRExporterParameter.OUTPUT_STREAM, ouputStream);
            exporter.exportReport();
            ouputStream.flush();
            ouputStream.close();
        }else{

        }
        %>
    </body>
</html>