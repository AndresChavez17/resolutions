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
import modeloDAO.EquipoDAO;
import modeloVO.EquipoVO;

/**
 *
 * @author AFCHT
 */
@WebServlet(name = "EquipoControlador", urlPatterns = {"/EquipoControlador"})
public class EquipoControlador extends HttpServlet {

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
        String idEq = request.getParameter("txtIdEq");
        String idEqCli = request.getParameter("txtIdEqCli");
        String idEqEst = request.getParameter("txtIdEqEst");
        String nombreEq = request.getParameter("txtNombreEq");
        String inventarioEq = request.getParameter("txtInventarioEq");
        String marcaEq = request.getParameter("txtMarcaEq");
        String serieEq = request.getParameter("txtSerieEq");
        String ubicacionEq = request.getParameter("txtUbicacionEq");
        
        EquipoVO eqVO = new EquipoVO(idEq, idEqCli, idEqEst, nombreEq, inventarioEq, marcaEq, serieEq, ubicacionEq);
        EquipoDAO eqDAO = new EquipoDAO(eqVO);
        
        switch (opcion){
            
            case 1: //Insertar Equipos
                if (eqDAO.insertarRegistro()) {
                    
                    request.setAttribute("MensajeExito", "¡El Equipo Fue Insertado Correctamente!");                    
                }else{
                    request.setAttribute("MensajeError", "¡Ocurrio un error. No se pudo Insertar el Equipo!");
                }
            request.getRequestDispatcher("InsertarEquipo.jsp").forward(request, response);
            break;
                
            case 2: //Actualizar Equipos
                if (eqDAO.actualizarRegistro()) {
                    
                    request.setAttribute("MensajeExito", "¡El Equipo Fue Actualizado Correctamente!");                    
                }else{
                    request.setAttribute("MensajeError", "¡El Equipo No Fue Actualizado Correctamente!");
                }
            request.getRequestDispatcher("ActualizarEquipo.jsp").forward(request, response);
            break;
                
            case 3: //Eliminar Equipos
                if (eqDAO.eliminarRegistro()) {
                    
                    request.setAttribute("MensajeExito", "¡El Equipo Fue Eliminado Correctamente!");
                }else{
                    request.setAttribute("MensajeError", "¡El Equipo No Fue Eliminado!");
                }
            request.getRequestDispatcher("BuscarEliminarEquipo.jsp").forward(request, response);
            break;
            
            case 4: //Buscar Equipos
                
                EquipoVO equipoVO = EquipoDAO.buscarRegistro(idEq);
                    
                    if (equipoVO != null) {
                        
                        request.setAttribute("voLleno", equipoVO);
                        request.getRequestDispatcher("Equipo.jsp").forward(request, response);
                        //request.getparameter("voLleno");
                        
                    }else{
                        request.setAttribute("MensajeError", "¡El Equipo NO existe!");
                        
                    }request.getRequestDispatcher("Equipo.jsp").forward(request, response);
            break;
            
            case 5: //Buscar y Actualizar Equipos
                
                EquipoVO equiVO = EquipoDAO.buscarRegistro2(idEq);
                    
                    if (equiVO != null) {
                        
                        request.setAttribute("voLlenoActualizar", equiVO);
                        request.getRequestDispatcher("ActualizarEquipo.jsp").forward(request, response);
                        //request.getparameter("voLleno");
                        
                    }else{
                        request.setAttribute("MensajeErrorBuscar", "¡El Equipo NO existe!");
                        
                    }request.getRequestDispatcher("ActualizarEquipo.jsp").forward(request, response);
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
