/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.mail.MessagingException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modeloDAO.*;
import modeloVO.*;
import util.PropiedadesCorreo;

/**
 *
 * @author Jaxx
 */
@WebServlet(name = "PersonaControlador", urlPatterns = {"/Persona"})
public class PersonaControlador extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String seleccion = request.getParameter("seleccion");
            String idUsu = request.getParameter("idUsu");
            String nombreUsu = request.getParameter("nombreUsu");
            String claveUsu = request.getParameter("claveUsu");
            String tipoPer = request.getParameter("tipoPer");
            String nombrePer = request.getParameter("nombrePer");
            String apellidoPer = request.getParameter("apellidoPer");
            String tipoDocumenoPer = request.getParameter("tipoDocumenoPer");
            String identificacionPer = request.getParameter("identificacionPer");
            String correoPer = request.getParameter("correoPer");
            
            UsuarioVO usuVO;
            UsuarioDAO usuDAO;
            PersonasVO perVO;
            PersonasDAO perDAO;
            
            switch(seleccion){
                case "insertar":
                    try {
                        String[] symbols = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f", "g", "i", "j", "k"};
                        int length = 10;
                        Random random = SecureRandom.getInstanceStrong(); // as of JDK 8, this should return the strongest algorithm available to the JVM
                        StringBuilder sb = new StringBuilder(length);
                        for (int i = 0; i < length; i++) {
                            int indexRandom = random.nextInt( symbols.length );
                            sb.append( symbols[indexRandom] );
                        }
                        claveUsu = sb.toString();
                        final String claveEncriptacion = "secreto!";
                        String datosOriginales = claveUsu;

                        Cripto_Inator encriptador = new Cripto_Inator();

                        String encriptado = encriptador.encriptar(datosOriginales, claveEncriptacion);
                        String desencriptado = encriptador.desencriptar(encriptado, claveEncriptacion);

                        System.out.println("Cadena Original: " + datosOriginales);
                        System.out.println("Escriptado     : " + encriptado);
                        System.out.println("Desencriptado  : " + desencriptado);
                    } catch (UnsupportedEncodingException | NoSuchAlgorithmException | InvalidKeyException | NoSuchPaddingException | IllegalBlockSizeException | BadPaddingException ex) {
                        Logger.getLogger(Cripto_Inator.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    
                    String receptor = "";
                    String asunto = "Usuario registrado";
                    String contenido = "Gracias por estar con nosotros \nSu usuario es: ";

                    String resultado = "";
                    
                    usuVO = new UsuarioVO(idUsu, nombreUsu, claveUsu, "");
                    usuDAO = new UsuarioDAO(usuVO);
                    perVO = new PersonasVO(idUsu, idUsu, tipoPer, nombrePer, apellidoPer, tipoDocumenoPer, identificacionPer, correoPer);
                    perDAO = new PersonasDAO(perVO);
                    if(usuDAO.insertarRegistro()){
                        if(perDAO.insertarRegistro()){
                            receptor = perVO.getCorreoPer();
                            contenido = contenido + usuVO.getNombreUsu() +"\nSu contraseña es: " + usuVO.getClaveUsu();
                            try {
                                PropiedadesCorreo.envioCorreo(host, puerto, usuario, clave, receptor, asunto, contenido);
                            } catch (MessagingException e) {
                                resultado = " pero no se envio el mensaje al correo";
                                System.out.println(""+ e.toString());
                            }
                            request.setAttribute("MensajeB", "Se inserto correctamente "+resultado);
                        }else{
                            usuDAO.deshabilitarRegistro();
                            request.setAttribute("MensajeM", "No se pudo realizar el registro ");
                        }
                    }else{
                        request.setAttribute("MensajeM", "No se pudo realizar el registro ");
                    }
                        request.getRequestDispatcher("FrmUsuario.jsp").forward(request, response);
                    break;
                case "":
                    break;
                default:
                    out.println("<h1 class=\"text-center\">¿Que hiciste?</h1>");
                    break;
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
