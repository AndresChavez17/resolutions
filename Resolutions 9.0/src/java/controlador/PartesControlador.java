/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import modeloDAO.PartesDAO;
import modeloVO.PartesVO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author SHAMAN
 */
@WebServlet(name = "PartesControlador", urlPatterns = {"/Partes"})
public class PartesControlador extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        
        int opcion = Integer.parseInt(request.getParameter("opcion"));
        String idPart=request.getParameter("txtIdPart");
        String idEq=request.getParameter("txtIdEq");
        String idEst=request.getParameter("txtIdEst");
        String nombrePart=request.getParameter("txtNombrePart");
        String tipoPart=request.getParameter("txtTipoPart");
        String comentarioPart=request.getParameter("txtComentarioPart");
        
        PartesVO partVO = new PartesVO(idPart, idEq, idEst, nombrePart, tipoPart, comentarioPart);
        PartesDAO partDAO = new PartesDAO(partVO);
        
        switch (opcion){
            
            case 1: //Insertar Partes
                if (partDAO.insertarRegistro()) {
                    
                    request.setAttribute("MensajeExito", "¡La parte fue insertada correctamente!");                    
                }else{
                    request.setAttribute("MensajeError", "¡Ocurrio un error. La parte NO fue insertada!");
                }
            request.getRequestDispatcher("InsertarParte.jsp").forward(request, response);
            break;
                
            case 2: //Actualizar Equipos
                if (partDAO.actualizarRegistro()) {
                    
                    request.setAttribute("MensajeExito", "¡Los datos de la parte fueron actualizadas correctamente!");                    
                }else{
                    request.setAttribute("MensajeError", "¡Ocurrio un error. La parte NO fue actualizada!");
                }
            request.getRequestDispatcher("ActualizarPartes.jsp").forward(request, response);
            break;
                
            case 3: //Eliminar Equipos
                if (partDAO.eliminarRegistro()) {
                    
                    request.setAttribute("MensajeExito", "¡La parte fue eliminada correctamente!");
                }else{
                    request.setAttribute("MensajeError", "¡Ocurrio un error. La parte NO fue eliminada!");
                }
            request.getRequestDispatcher("BuscarEliminarParte.jsp").forward(request, response);
            break;
            
            case 4: //Buscar Equipos
                
                PartesVO partesVO = PartesDAO.consultarporId(idPart);
                    
                    if (partesVO != null) {
                        
                        request.setAttribute("voLleno", partesVO);
                        request.getRequestDispatcher("Equipo.jsp").forward(request, response);
                        //request.getparameter("voLleno");
                        
                    }else{
                        request.setAttribute("MensajeError", "¡La parte NO existe!");
                        
                    }request.getRequestDispatcher("Equipo.jsp").forward(request, response);
            break;
            
            case 5: //Buscar y Actualizar Equipos
                
                PartesVO parteVO = PartesDAO.consultarporId2(idPart);
                    
                    if (parteVO != null) {
                        
                        request.setAttribute("voLlenoActualizar", parteVO);
                        request.getRequestDispatcher("ActualizarPartes.jsp").forward(request, response);
                        //request.getparameter("voLleno");
                        
                    }else{
                        request.setAttribute("MensajeErrorBuscar", "¡La parte NO existe!");
                        
                    }request.getRequestDispatcher("ActualizarPartes.jsp").forward(request, response);
            break;
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
