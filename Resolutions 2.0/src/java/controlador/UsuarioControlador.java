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

/**
 *
 * @author SHAMAN
 */
@WebServlet(name = "UsuarioControlador", urlPatterns = {"/Usuario"})
public class UsuarioControlador extends HttpServlet {

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
        
//        int opcion = Integer.parseInt(request.getParameter("option"));
        String idUsu = request.getParameter("txtIdUsu");
        String nombreUsu = request.getParameter("txtNombreUsu");
        String claveUsu = request.getParameter("txtClaveUsu");
        String estadoUsu = request.getParameter("txtEstadoUsu");
        String seleccion = request.getParameter("seleccion");
        String check = request.getParameter("checkno");
        String mensaje = "";

        UsuarioVO usuVO = new UsuarioVO(idUsu, nombreUsu, claveUsu, estadoUsu);
        UsuarioDAO usuDAO = new UsuarioDAO(usuVO);
        
        switch(seleccion) {
                case "entrar":
                    if(usuDAO.validarAcceso(nombreUsu, claveUsu)!=null){
                        UsuarioVO perfilVO;
                        perfilVO = usuDAO.validarAcceso(nombreUsu, claveUsu);
                        if(check!=null){
                            Cookie galletagalletametralleta = new Cookie("nUsu", perfilVO.getIdUsu());
                            galletagalletametralleta.setMaxAge(60*60*24*365);
                            response.addCookie(galletagalletametralleta);
                        }
                        HttpSession newSession = request.getSession(true);
                        newSession.setAttribute("dta", perfilVO);
                        response.sendRedirect("index.jsp");
                    }else{
                        request.setAttribute("Mensaje", "Usuario y/o contraseña ingresados incorrectamente");
                        request.getRequestDispatcher("FrmLogin.jsp").forward(request, response);
                    }
                    break;
                case "cerrar":
                    if(request.getSession().getAttribute("dta")!=null){
                        HttpSession newSession = request.getSession();
                        Cookie[] cookies = request.getCookies();
                        newSession.invalidate();
                        if(cookies!=null){
                            for (Cookie cookiee : cookies) {
                                cookiee.setMaxAge(0);
                            }
                        }
                        response.sendRedirect("FrmLogin.jsp");
                    }else{
                        request.setAttribute("Mensaje", "No hay sesiones existentes");
                        response.sendRedirect("FrmLogin.jsp");
                    }
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
