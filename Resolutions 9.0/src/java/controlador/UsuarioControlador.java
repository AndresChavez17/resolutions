/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import modeloDAO.UsuarioDAO;
import modeloVO.UsuarioVO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.UnsupportedEncodingException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.mail.MessagingException;
import javax.servlet.ServletContext;
import modeloDAO.PersonasDAO;
import modeloVO.PersonasVO;
import util.PropiedadesCorreo;

/**
 *
 * @author SHAMAN
 */
@WebServlet(name = "UsuarioControlador", urlPatterns = {"/Usuario"})
public class UsuarioControlador extends HttpServlet {
    
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
    public String desencriptarCookie(String enc){
        String desencriptado = "";
        try {
            final String claveEncriptacion = "secreto!";
            String datosOriginales = enc;

            Cripto_Inator encriptador = new Cripto_Inator();

            desencriptado = encriptador.desencriptar(datosOriginales, claveEncriptacion);

            System.out.println("Cadena Original: " + datosOriginales);
            System.out.println("Desencriptado  : " + desencriptado);
        } catch (UnsupportedEncodingException | NoSuchAlgorithmException | InvalidKeyException | NoSuchPaddingException | IllegalBlockSizeException | BadPaddingException ex) {
            Logger.getLogger(Cripto_Inator.class.getName()).log(Level.SEVERE, null, ex);
        }
        return desencriptado;
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
//        int opcion = Integer.parseInt(request.getParameter("option"));
        String idUsu = request.getParameter("txtIdUsu");
        String nombreUsu = request.getParameter("txtNombreUsu");
        String claveUsu = request.getParameter("txtClaveUsu");
        String estadoUsu = request.getParameter("txtEstadoUsu");
        String seleccion = request.getParameter("seleccion");
        String cambiarClave = request.getParameter("cambiarClave");
        String nuevaClave1 = request.getParameter("nuevaClave1");
        String nuevaClave2 = request.getParameter("nuevaClave2");
        String check = request.getParameter("checkno");
        String mensaje = "";
        String encriptado = "";

        UsuarioVO usuVO = new UsuarioVO(idUsu, nombreUsu, claveUsu, estadoUsu);
        UsuarioDAO usuDAO = new UsuarioDAO(usuVO);
                
        switch(seleccion) {
                case "entrar":
                    if(usuDAO.validarAcceso(nombreUsu, claveUsu)!=null){
                        UsuarioVO perfilVO;
                        perfilVO = usuDAO.validarAcceso(nombreUsu, claveUsu);
                        if(check!=null){
                            try {
                                final String claveEncriptacion = "secreto!";
                                String datosOriginales = perfilVO.getIdUsu();
                                
                                Cripto_Inator encriptador = new Cripto_Inator();
                                
                                encriptado = encriptador.encriptar(datosOriginales, claveEncriptacion);
                                String desencriptado = encriptador.desencriptar(encriptado, claveEncriptacion);
                                
                                System.out.println("Cadena Original: " + datosOriginales);
                                System.out.println("Escriptado     : " + encriptado);
                                System.out.println("Desencriptado  : " + desencriptado);
                            } catch (UnsupportedEncodingException | NoSuchAlgorithmException | InvalidKeyException | NoSuchPaddingException | IllegalBlockSizeException | BadPaddingException ex) {
                                Logger.getLogger(Cripto_Inator.class.getName()).log(Level.SEVERE, null, ex);
                            }
                            Cookie galletagalletametralleta = new Cookie("ReUsu", encriptado);
                            galletagalletametralleta.setMaxAge(1*365*24*60*60);
                            response.addCookie(galletagalletametralleta);
                        }
                        HttpSession newSession = request.getSession(true);
                        newSession.setAttribute("dta", perfilVO);
                        response.sendRedirect("index.jsp");
                    }else{
                        request.setAttribute("Mensaje", "Usuario y/o Contraseña ingresados incorrectamente");
                        request.getRequestDispatcher("FrmLogin.jsp").forward(request, response);
                    }
                    break;
                case "cerrar":
                    if(request.getSession().getAttribute("dta")!=null){
                        HttpSession newSession = request.getSession();
                        Cookie[] cookies = request.getCookies();
                        for (int i=0; i<cookies.length; i++) {
                            cookies[i].setMaxAge(0);
                            response.addCookie(cookies[i]);
                        }
                        newSession.invalidate();
                        response.sendRedirect("FrmLogin.jsp");
                    }else{
                        request.setAttribute("Mensaje", "No hay sesiones existentes");
                        response.sendRedirect("FrmLogin.jsp");
                    }
                    break;
                case "cambiar":
                    if(cambiarClave !=null && nuevaClave1 !=null && nuevaClave2 !=null && nuevaClave1.equals(nuevaClave2)){
                        HttpSession currentSession = request.getSession();
                        Object cuenta = currentSession.getAttribute("dta");
                        if(cuenta==null){
                            response.sendRedirect("FrmLogin.jsp");
                        }
                        UsuarioVO perfilVO = (UsuarioVO) cuenta;
                        PersonasVO perVO = new PersonasVO();
                        PersonasDAO perDAO = new PersonasDAO();

                        perVO = perDAO.buscarRegistro(perfilVO.getIdUsu());
                        
                        Date fecha = new Date();
                        String modifiedDate = new SimpleDateFormat("dd-MM-yyyy").format(fecha);
                        
                        String receptor = ""+perVO.getCorreoPer();
                        String asunto = "Cambio de contraseña";
                        String contenido = "Se ha cambiado su contraseña recientemente \nLa fecha: "+modifiedDate;

                        String resultado = "";
                        if(cambiarClave.equals((String)perfilVO.getClaveUsu())){
                            if(usuDAO.cambiarClave(idUsu, cambiarClave, nuevaClave1) == true){
                                contenido=contenido+"\nLa nueva contraseña es: "+nuevaClave1;
                                try {
                                    PropiedadesCorreo.envioCorreo(host, puerto, usuario, clave, receptor, asunto, contenido);
                                } catch (MessagingException e) {
                                    resultado = " pero no se envio el mensaje al correo";
                                    System.out.println(""+ e.toString());
                                }
                                request.setAttribute("MensajeExitoC", "Clave cambiada correctamente");
                                request.getRequestDispatcher("MiCuenta.jsp").forward(request, response);
                            }else{
                                request.setAttribute("MensajeErrorC", "No se pudo cambiar la clave");
                                request.getRequestDispatcher("MiCuenta.jsp").forward(request, response);
                            }
                        }else{
                            request.setAttribute("MensajeErrorC", "Su clave actual es incorrecta");
                            request.getRequestDispatcher("MiCuenta.jsp").forward(request, response);
                        }
                    }else{
                        request.setAttribute("MensajeErrorC", "Se debe rellenar el formulario o no coinciden la nueva clave y su confirmación");
                        request.getRequestDispatcher("MiCuenta.jsp").forward(request, response);
                    }
                    break;
                case "enviarCorreo":
                    String resultado = "";
                    usuVO = usuDAO.consulta(idUsu);
                        if(usuVO !=null){
                            PersonasVO perVO;
                            PersonasDAO perDAO = new PersonasDAO();
                            perVO = perDAO.buscarRegistro(usuVO.getIdUsu());

                            Date fecha = new Date();
                            String modifiedDate = new SimpleDateFormat("dd-MM-yyyy").format(fecha);

                            String receptor = ""+perVO.getCorreoPer();
                            String asunto = "Envio de usuario";
                            String contenido = "Se envia este mensaje por parte de la administración con su usuario y contraseña "
                                    + "\nLa fecha: " + modifiedDate +"\nSu usuario es: " + usuVO.getNombreUsu() + "\nSu contraseña es: " + usuVO.getClaveUsu();

                            try {
                                PropiedadesCorreo.envioCorreo(host, puerto, usuario, clave, receptor, asunto, contenido);
                                resultado = "Se envió el mensaje correctamente";
                                request.setAttribute("MensajeB", resultado);
                            } catch (MessagingException e) {
                                System.out.println(""+ e.toString());
                            }
                        }else{
                            resultado = "No se envió el mensaje";
                            request.setAttribute("MensajeM", resultado);
                        }
                        request.getRequestDispatcher("FrmUsuario.jsp").forward(request, response);
                    break;
                default:
                    out.println("<h1 class=\"text-center\">¿Que hiciste?</h1>");
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
