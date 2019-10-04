package controlador;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import util.PropiedadesCorreo;
import java.io.IOException;
import javax.mail.MessagingException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author APRENDIZ
 */
@WebServlet(urlPatterns = {"/EnvioCorreo"})
public class EnvioCorreo extends HttpServlet {

    private String host, puerto, usuario, clave;

    public void init() {
        ServletContext context = getServletContext();

        host = context.getInitParameter("host");
        puerto = context.getInitParameter("puerto");
        usuario = context.getInitParameter("usuario");
        clave = context.getInitParameter("clave");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String receptor = request.getParameter("receptor");
        String asunto = request.getParameter("asunto");
        String contenido = request.getParameter("contenido");
            
        String resultado = "";
        
        try {
            PropiedadesCorreo.envioCorreo(host, puerto, usuario, clave, receptor, asunto, contenido);
            resultado = "El mensaje se envió correctamente";
        } catch (Exception e) {
            resultado="Error al enviar el mensaje " + e.toString();
        }finally{
            request.setAttribute("respuesta", resultado);
            getServletContext().getRequestDispatcher("/FrmLogin.jsp").forward(request, response);
        }
    }
}
