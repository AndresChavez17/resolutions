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
import modeloDAO.PersonasDAO;
import modeloVO.PersonasVO;

/**
 *
 * @author AFCHT
 */
@WebServlet(name = "PersonasControlador", urlPatterns = {"/PersonasControlador"})
public class PersonasControlador extends HttpServlet {

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
        String idPer = request.getParameter("txtIdPer");
        String idUsu = request.getParameter("txtIdUsu");
        String tipoPer = request.getParameter("txtTipoPer");
        String nombrePer = request.getParameter("txtNombrePer");
        String apellidoPer = request.getParameter("txtApellidoPer");
        String tipoDocumentoPer = request.getParameter("txtTipoDocumentoPer");
        String identificacionPer = request.getParameter("txtIdentificacionPer");
        String correoPer = request.getParameter("txtCorreoPer");
        
        PersonasVO perVO = new PersonasVO(idPer, idUsu, tipoPer, nombrePer, apellidoPer, tipoDocumentoPer, identificacionPer, correoPer);
        PersonasDAO perDAO = new PersonasDAO(perVO);
        
        switch (opcion){
            
            case 1: //Insertar Personas
                if (perDAO.insertarRegistro()) {
                    
                    request.setAttribute("MensajeExito", "¡La Persona Fue Insertada Correctamente!");                    
                }else{
                    request.setAttribute("MensajeError", "¡Ocurrio un error. No se pudo Insertar la Persona!");
                }
            request.getRequestDispatcher("InsertarPersona.jsp").forward(request, response);
            break;
                
            case 2: //Actualizar Personas
                if (perDAO.actualizarRegistro()) {
                    
                    request.setAttribute("MensajeExito", "¡Sus datos se actualizaron correctamente!");                    
                }else{
                    request.setAttribute("MensajeError", "¡Ocurrio un error. No se pudo actualizar sus datos!");
                }
            request.getRequestDispatcher("MiCuenta.jsp").forward(request, response);
            break;
                
            case 3: //Eliminar Persona
                if (perDAO.eliminarRegistro()) {
                    
                    request.setAttribute("MensajeExito", "¡La Persona Fue Eliminado Correctamente!");
                }else{
                    request.setAttribute("MensajeError", "¡Ocurrio un error. No se pudo Eliminar la Persona!");
                }
            request.getRequestDispatcher("#").forward(request, response);
            break;
            
            case 4: //Buscar Personas
                
                PersonasVO personaVO = PersonasDAO.buscarRegistro2(idPer);
                    
                    if (personaVO != null) {
                        
                        request.setAttribute("voLleno", personaVO);
                        request.getRequestDispatcher("Equipo.jsp").forward(request, response);
                        //request.getparameter("voLleno");
                        
                    }else{
                        request.setAttribute("MensajeError", "¡La Persona NO existe!");
                        
                    }request.getRequestDispatcher("Equipo.jsp").forward(request, response);
            break;
            
            case 5: //Buscar y Actualizar Personas
                
                PersonasVO persVO = PersonasDAO.buscarRegistro2(idPer);
                    
                    if (persVO != null) {
                        
                        request.setAttribute("voLlenoActualizar", persVO);
                        request.getRequestDispatcher("ActualizarEquipo.jsp").forward(request, response);
                        //request.getparameter("voLleno");
                        
                    }else{
                        request.setAttribute("MensajeErrorBuscar", "¡La Persona NO existe!");
                        
                    }request.getRequestDispatcher("ActualizarEquipo.jsp").forward(request, response);
            break;
            
            case 6:
                PersonasVO PerVO2 = PersonasDAO.RecuperarCorreo(identificacionPer);

                    if (PerVO2 != null) {
                        request.setAttribute("voRellenarCor", PerVO2);
                        request.getRequestDispatcher("IngreseCorreo.jsp").forward(request, response);
                    } else {
                        request.setAttribute("Mensaje_Error", "La identificación no existe o dato incorrecto.");
                        request.getRequestDispatcher("IngreseIdentificacion.jsp").forward(request, response);
                    }
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
