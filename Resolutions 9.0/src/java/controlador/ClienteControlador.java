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
import modeloDAO.ClienteDAO;
import modeloVO.ClienteVO;

/**
 *
 * @author Andrés Chávez
 */
@WebServlet(name = "ClienteControlador", urlPatterns = {"/ClienteControlador"})
public class ClienteControlador extends HttpServlet {

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
        String idCli = request.getParameter("txtIdCli");
        String nombreCli = request.getParameter("txtNombreCli");
        String direccionCli = request.getParameter("txtDireccionCli");
        String telefonoCli = request.getParameter("txtTelefonoCli");
        String celularCli = request.getParameter("txtCelularCli");
        String estadoCli = request.getParameter("txtEstadoCli");
        
        ClienteVO cliVO = new ClienteVO(idCli, nombreCli, direccionCli, telefonoCli, celularCli, estadoCli);
        ClienteDAO cliDAO = new ClienteDAO(cliVO);
        
        switch (opcion){
            case 1: //Insertar Clientes
                if (cliDAO.insertarRegistro()) {
                    
                    request.setAttribute("MensajeExito", "¡El cliente fue insertado correctamente!");                    
                }else{
                    request.setAttribute("MensajeError", "¡El cliente NO fue insertado correctamente!");
                }
            request.getRequestDispatcher("InsertarCliente.jsp").forward(request, response);
            break;
                
            case 2: //Actualizar Clientes
                if (cliDAO.actualizarRegistro()) {
                    
                    request.setAttribute("MensajeExito", "¡El cliente fue actualizado correctamente!");                    
                }else{
                    request.setAttribute("MensajeError", "¡El cliente NO fue actualizado correctamente!");
                }
            request.getRequestDispatcher("ActualizarCliente.jsp").forward(request, response);
            break;
                
            case 3: //Eliminar Clientes
                if (cliDAO.eliminarRegistro()) {
                    
                    request.setAttribute("MensajeExito", "¡El cliente fue deshabilitado!");
                }
            request.getRequestDispatcher("BuscarEliminarCliente.jsp").forward(request, response);
            break;
            
            case 4: //Buscar Clientes
                
                ClienteVO clienteVO = ClienteDAO.buscarRegistro(idCli);
                    
                    if (clienteVO != null) {
                        
                        request.setAttribute("voLleno", clienteVO);
                        request.getRequestDispatcher("Cliente.jsp").forward(request, response);                        
                        
                    }else{
                        request.setAttribute("MensajeError", "¡El cliente NO existe!");
                        
                    }request.getRequestDispatcher("Cliente.jsp").forward(request, response);
            break;
            
            case 5: //Buscar y Actualizar Clientes
                
                ClienteVO clienVO = ClienteDAO.buscarRegistro2(idCli);
                    
                    if (clienVO != null) {
                        
                        request.setAttribute("voLlenoActualizar", clienVO);
                        request.getRequestDispatcher("ActualizarCliente.jsp").forward(request, response);                        
                        
                    }else{
                        request.setAttribute("MensajeErrorBuscar", "¡El cliente NO existe!");
                        
                    }request.getRequestDispatcher("ActualizarCliente.jsp").forward(request, response);
            break;
            
            case 7: //Eliminar Clientes
                if (cliDAO.habilitarRegistro()) {
                    
                    request.setAttribute("MensajeExito", "¡El cliente fue habilitado!");
                }
            request.getRequestDispatcher("BuscarEliminarCliente.jsp").forward(request, response);
            break;
            
            case 8: //Insertar Clientes modal
                if (cliDAO.insertarRegistro()) {
                    
                    request.setAttribute("MensajeExito", "¡El cliente fue insertado correctamente!");                    
                }else{
                    request.setAttribute("MensajeError", "¡El cliente NO fue insertado correctamente!");
                }
            request.getRequestDispatcher("InsertarEquipo.jsp").forward(request, response);
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
