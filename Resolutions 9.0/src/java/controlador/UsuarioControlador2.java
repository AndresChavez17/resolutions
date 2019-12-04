/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.mail.MessagingException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modeloDAO.PersonasDAO;
import modeloDAO.UsuarioDAO;
import modeloVO.PersonasVO;
import modeloVO.UsuarioVO;
import util.PropiedadesCorreo;

/**
 *
 * @author APRENDIZ
 */
@WebServlet(name = "UsuarioControlador2", urlPatterns = {"/UsuarioControlador2"})
public class UsuarioControlador2 extends HttpServlet {

    private String host, puerto, usuario, clave;
    
    public void init(){
        ServletContext context = getServletContext();
        
        host = context.getInitParameter("host");
        puerto = context.getInitParameter("puerto");
        usuario = context.getInitParameter("usuario");
        clave = context.getInitParameter("clave");
    }
    
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
        
        String opcion = request.getParameter("opcion");
        String idUsu = request.getParameter("txtIdUsu");
        String nombreUsu = request.getParameter("txtNombreUsu");
        String claveUsu = request.getParameter("txtClaveUsu");
        String estadoUsu = request.getParameter("txtEstadoUsu");
        
        UsuarioVO usuVO = new UsuarioVO(idUsu, nombreUsu, claveUsu, estadoUsu);
        UsuarioDAO usuDAO = new UsuarioDAO(usuVO);

        switch (opcion) {
            case "1":
                    if (usuDAO.insertarRegistro()) {
                        request.setAttribute("Mensaje_Exito", "¡El Usuario fue Insertado Correctamente.!");
                    } else {
                        request.setAttribute("Mensaje_Error", "¡Ocurrio un error. No se inserto el Usuario!");
                    }
                
                request.getRequestDispatcher("Usuarios.jsp").forward(request, response);
                break;

            case "2":
                    if (usuDAO.actualizarRegistro()) {
                        request.setAttribute("Mensaje_Exito", "Los datos del Usuario fueron Actualizados correctamente.");
                    } else {
                        request.setAttribute("Mensaje_Error", "¡Ocurrio un error. No se Actualizó el Usuario!");
                    }
                
                request.getRequestDispatcher("Usuarios.jsp").forward(request, response);
                break;

            case "3":
                    UsuarioVO usuVO1 = UsuarioDAO.consultarporId(idUsu);

                    if (usuVO1 != null) {
                        request.setAttribute("voLleno", usuVO1);
                        request.getRequestDispatcher("Usuarios.jsp").forward(request, response);
                    } else {
                        request.setAttribute("Mensaje_Error", "¡El Usuario No existe!");
                    }
                
                request.getRequestDispatcher("Usuarios.jsp").forward(request, response);
                break;

            case "4":
                    if (usuDAO.eliminarRegistro()) {
                        request.setAttribute("MensajeExito", "¡El Usuario fue Inactivado!");
                    }
                
                request.getRequestDispatcher("FrmUsuario.jsp").forward(request, response);
                break;
                
            case "5": 
                UsuarioVO UsuVO2 = UsuarioDAO.RecuperarClave(nombreUsu);
                PersonasVO perVO = new PersonasVO();
                PersonasDAO perDAO = new PersonasDAO(perVO);
                String resultado = "";
                String receptor = "";
                String asunto = "Recuperar contraseña";
                String contenido = "Su contraseña es: ";
                    if (UsuVO2 != null) {
                        perVO = perDAO.buscarRegistro(UsuVO2.getIdUsu());
                        receptor = perVO.getCorreoPer();
                        contenido = contenido + UsuVO2.getClaveUsu();
                        try {
                            PropiedadesCorreo.envioCorreo(host, puerto, usuario, clave, receptor, asunto, contenido);
                        } catch (MessagingException e) {
                            resultado = "Error al enviar el mensaje "+e.toString();
                        }
                        response.sendRedirect("FrmLogin.jsp");
                    } else {
                        request.setAttribute("Mensaje_Error", "El usuario no existe o dato incorrecto.");
                        request.getRequestDispatcher("IngreseCorreo.jsp").forward(request, response);
                    }
                    break;
            case "7":
                    if (usuDAO.habilitarRegistro()) {
                        request.setAttribute("MensajeExito", "¡El Usuario fue Activado!");
                    }
                    
                request.getRequestDispatcher("FrmUsuario.jsp").forward(request, response);
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
