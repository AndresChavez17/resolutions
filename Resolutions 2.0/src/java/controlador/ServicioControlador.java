/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modeloDAO.ServicioDAO;
import modeloVO.ServicioVO;

/**
 *
 * @author Jaxx
 */
@WebServlet(name = "ServicioControlador", urlPatterns = {"/Servicio"})
public class ServicioControlador extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            HttpSession currentSession = request.getSession();
            Object cuenta = currentSession.getAttribute("dta");
            if(cuenta==null){
                response.sendRedirect("FrmLogin.jsp");
            }else{
                String seleccion = request.getParameter("seleccion");
                String idSer = request.getParameter("idSer");
                String idPer = request.getParameter("idPer");
                String idEq = request.getParameter("idEq");
                String fechaIngresoSer = request.getParameter("fechaIngresoSer");
                String fechaEntregaSer = request.getParameter("fechaEntregaSer");
                String observacionesSer = request.getParameter("observacionesSer");
                String mensaje = "";

                ServicioVO serVO;
                ServicioDAO serDAO;

                switch(seleccion){
                    case "entrar":
                        request.getRequestDispatcher("FrmServicio.jsp").forward(request, response);
                        break;
                    case "insertar":
                        serVO = new ServicioVO(idSer, idPer, idEq, fechaIngresoSer, fechaEntregaSer, observacionesSer);
                        serDAO = new ServicioDAO(serVO);
                        mensaje = serDAO.agregarRegistro();
                        request.setAttribute("Mensaje", mensaje);
                        request.getRequestDispatcher("FrmServicio.jsp").forward(request, response);
                        break;
                    case "modificar":
                        serVO = new ServicioVO(idSer, idPer, idEq, fechaIngresoSer, fechaEntregaSer, observacionesSer);
                        serDAO = new ServicioDAO(serVO);
                        mensaje = serDAO.actualizarRegistro();
                        request.setAttribute("Mensaje", mensaje);
                        request.getRequestDispatcher("FrmServicio.jsp").forward(request, response);
                        break;
                    case "eliminar":
                        serVO = new ServicioVO(idSer, idPer, idEq, fechaIngresoSer, fechaEntregaSer, observacionesSer);
                        serDAO = new ServicioDAO(serVO);
                        mensaje = serDAO.eliminarRegistro();
                        request.setAttribute("Mensaje", mensaje);
                        request.getRequestDispatcher("FrmServicio.jsp").forward(request, response);
                        break;
                    case "consultar":
                        request.setAttribute("CargarDatosTabla", idSer);
                        request.getRequestDispatcher("FrmServicio.jsp").forward(request, response);
                        break;
                    default:
                        out.println("<h1>???</h1>");
                        break;
                }
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
