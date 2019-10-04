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
import modeloDAO.EstadoDAO;
import modeloVO.EstadoVO;

/**
 *
 * @author Jaxx
 */
@WebServlet(name = "EstadoControlador", urlPatterns = {"/Estado"})
public class EstadoControlador extends HttpServlet {

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
                String idEst = request.getParameter("idEst");
                String nombreEst = request.getParameter("nombreEst");
                String mensaje = "";

                EstadoVO estVO;
                EstadoDAO estDAO;

                switch(seleccion){
                    case "entrar":
                        request.getRequestDispatcher("FrmEstado.jsp").forward(request, response);
                        break;
                    case "insertar":
                        estVO = new EstadoVO(idEst, nombreEst);
                        estDAO = new EstadoDAO(estVO);
                        mensaje = estDAO.agregarRegistro();
                        request.setAttribute("Mensaje", mensaje);
                        request.getRequestDispatcher("FrmEstado.jsp").forward(request, response);
                        break;
                    case "modificar":
                        estVO = new EstadoVO(idEst, nombreEst);
                        estDAO = new EstadoDAO(estVO);
                        mensaje = estDAO.actualizarRegistro();
                        request.setAttribute("Mensaje", mensaje);
                        request.getRequestDispatcher("FrmEstado.jsp").forward(request, response);
                        break;
                    case "eliminar":
                        estVO = new EstadoVO(idEst, nombreEst);
                        estDAO = new EstadoDAO(estVO);
                        mensaje = estDAO.eliminarRegistro();
                        request.setAttribute("Mensaje", mensaje);
                        request.getRequestDispatcher("FrmEstado.jsp").forward(request, response);
                        break;
                    case "consultar":
                        request.setAttribute("CargarDatosTabla", idEst);
                        request.getRequestDispatcher("FrmEstado.jsp").forward(request, response);
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
