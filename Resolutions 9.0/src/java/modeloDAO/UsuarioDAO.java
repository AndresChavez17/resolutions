/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modeloDAO;

import modeloVO.UsuarioVO;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import util.*;

/**
 *
 * @author SHAMAN
 */
public class UsuarioDAO extends ConexionBD implements InterfaceCRUD {

    //Declaro variables para la conexiòn
    private Connection conexion = null;
    private Statement puente = null;
    private ResultSet mensajero = null;
    private CallableStatement proceso;
    private ArrayList<UsuarioVO>listado;
    private CallableStatement procedimiento;

    //Declaro variables del modelo VO
    private String idUsu = "";
    private String nombreUsu = "";
    private String claveUsu = "";
    private String estadoUsu = "";
    private boolean operacion = false;
    private boolean autentificacion = false;

    //CONSTRUCTOR
    
    public UsuarioDAO(UsuarioVO usuVO) {
        super();
        try {
            this.conexion = obtenerConexion();
            this.puente = conexion.createStatement();
            this.idUsu = usuVO.getIdUsu();
            this.nombreUsu = usuVO.getNombreUsu();
            this.claveUsu = usuVO.getClaveUsu();
            this.estadoUsu = usuVO.getEstadoUsu();
        } catch (SQLException ex) {
            System.out.println("Error Class: "+ ex.getMessage());
            System.out.println("Error ClienteDAO!: " + ex.toString());
        }
    }

    public UsuarioDAO() {

    }
    
    public UsuarioVO consulta(String id) {
        UsuarioVO usuConVO = null;
        try {
            mensajero = puente.executeQuery("SELECT * FROM USUARIOS WHERE IDUSU = '"+id+"'");
            while(mensajero.next()){
                idUsu = mensajero.getString(1);
                nombreUsu = mensajero.getString(2);
                claveUsu = mensajero.getString(3);
                estadoUsu = mensajero.getString(4);
                usuConVO = new UsuarioVO(idUsu, nombreUsu, claveUsu, estadoUsu);
            }
        } catch (SQLException ex) {
            System.out.println("¡Error: "+ex.toString()+"!");
        }finally {
            conexion = desconectar();
        }
        return usuConVO;
    }
    
    public UsuarioVO validarAcceso(String nombre, String contrasena) {
        UsuarioVO usuVO = null;
        try {
            proceso = conexion.prepareCall("CALL VALIDAR_ACCESO(?,?)");
            proceso.setString("REGNOMBREUSU", nombre);
            proceso.setString("REGCLAVEUSU", contrasena);
            mensajero = proceso.executeQuery();
            if(mensajero.next()){
                idUsu = mensajero.getString(1);
                nombreUsu = mensajero.getString(2);
                claveUsu = mensajero.getString(3);
                estadoUsu = mensajero.getString(4);
                usuVO = new UsuarioVO(idUsu, nombreUsu, claveUsu, estadoUsu);
                autentificacion = true;
            }
            return usuVO;
        } catch (SQLException ex) {
            System.out.println("¡Error validarAcceso: "+ex);
            return usuVO;
        }
    }

    public UsuarioVO consultar(Object id) {
        UsuarioVO usuConVO = null;
        try {
            proceso = conexion.prepareCall("CALL BUSCAR_EST(?)");
            proceso.setString("REGIDEST", (String) id);
            mensajero = proceso.executeQuery();
            if(mensajero.next()){
                idUsu = mensajero.getString(1);
                nombreUsu = mensajero.getString(2);
                claveUsu = mensajero.getString(3);
                estadoUsu = mensajero.getString(4);
            }
            usuConVO = new UsuarioVO(idUsu, nombreUsu, claveUsu, estadoUsu);
        } catch (SQLException ex) {
            System.out.println("¡Error: "+ex.toString()+"!");
        }finally {
            conexion = desconectar();
        }
        return usuConVO;
    }

    @Override
    public boolean insertarRegistro() {
        try {
            proceso = conexion.prepareCall("CALL REGISTRAR_USU(?,?,?)");
            proceso.setString("REGIDUSU", idUsu);
            proceso.setString("REGNOMBREUSU", nombreUsu);
            proceso.setString("REGCLAVEUSU", claveUsu);
            proceso.executeQuery();
            operacion = true;
            
        } catch (Exception e) {
            System.out.println("Error " + e.toString());
        }
        return operacion;
    }

    @Override
    public boolean actualizarRegistro() {
        try {
            puente.executeUpdate("UPDATE USUARIOS SET NOMBREUSU= '"+nombreUsu+"', CLAVEUSU='"+claveUsu+"', ESTADOUSU = '"+estadoUsu+"' WHERE IDUSU='"+idUsu+"'; ");
            operacion = true;
        } catch (Exception e) {
            System.out.println("!ERROR¡" + e.toString());
        }
        return operacion;

    }
    
    @Override
    public boolean eliminarRegistro() {
        try {
            proceso =  conexion.prepareCall("CALL DESHABILITAR_USU(?)");
            proceso.setString("REGIDUSU", idUsu);
            proceso.executeQuery();
            operacion = true;
        } catch (Exception e) {
            System.out.println("!ERROR¡" + e.toString());
        }
        return operacion;
    }
    
    public boolean deshabilitarRegistro() {
        try {
            proceso =  conexion.prepareCall("CALL ELIMINAR_USU(?)");
            proceso.setString("REGIDUSU", idUsu);
            proceso.executeQuery();
            operacion = true;
        } catch (Exception e) {
            System.out.println("!ERROR¡" + e.toString());
        }
        return operacion;
    }
    
    public boolean habilitarRegistro() {
        try {
            proceso =  conexion.prepareCall("CALL HABILITAR_USU(?)");
            proceso.setString("REGIDUSU", idUsu);
            proceso.executeQuery();
            operacion = true;
        } catch (Exception e) {
            System.out.println("!ERROR¡" + e.toString());
        }
        return operacion;
    }

    public static UsuarioVO consultarporId(String idUsu) {
        UsuarioVO usuVO = null;
        try {
            ConexionBD conexionBD = new ConexionBD();
            Connection conexion = conexionBD.obtenerConexion();
            Statement puente = conexion.createStatement();
            ResultSet mensajero = puente.executeQuery("SELECT * FROM USUARIOS WHERE IDUSU= '"+idUsu+"';");
            while (mensajero.next()) {
                usuVO = new UsuarioVO(idUsu, mensajero.getString(2), mensajero.getString(3), mensajero.getString(4));
            }
            mensajero.close();
            puente.close();
        } catch (Exception e) {
            System.out.println("¡Error en la consulta!" + e.toString());
        }
        return usuVO;
    }

    public ArrayList<UsuarioVO> listar() {
        ConexionBD conexionBD = new ConexionBD();
        ArrayList<UsuarioVO> listaUsuarios = new ArrayList<>();
        try {
            puente = conexionBD.obtenerConexion().createStatement();
            mensajero = puente.executeQuery("SELECT * FROM USUARIOS");

            while (mensajero.next()) {
                idUsu = mensajero.getString(1);
                nombreUsu = mensajero.getString(2);
                claveUsu = mensajero.getString(3);
                estadoUsu = mensajero.getString(4);                
                UsuarioVO usuVO = new UsuarioVO(idUsu, nombreUsu, claveUsu, estadoUsu);
                listaUsuarios.add(usuVO);
            }

        } catch (Exception e) {
            System.out.println("¡Error en el ArrayList!" + e.toString());
        }
        return listaUsuarios;
    }
    
    public static UsuarioVO RecuperarClave(String nombreUsu) {
        UsuarioVO UsuVO2 = null;
        try {
            ConexionBD conexionBD = new ConexionBD();
            Connection conexion = conexionBD.obtenerConexion();
            Statement puente = conexion.createStatement();
            ResultSet mensajero = puente.executeQuery("SELECT * FROM USUARIOS WHERE NOMBREUSU = '"+nombreUsu+"';");
            while (mensajero.next()) {
                UsuVO2 = new UsuarioVO(mensajero.getString(1), mensajero.getString(2), mensajero.getString(3), mensajero.getString(4));
            }
            mensajero.close();
            puente.close();
        } catch (Exception e) {
            System.out.println("¡Error en la consulta!" + e.toString());
        }
        return UsuVO2;
    }
    
    public boolean cambiarClave(String nUsu, String claveActual, String claveNueva) {
        try {
            puente.executeUpdate("UPDATE USUARIOS SET CLAVEUSU = '"+claveNueva+"' WHERE CLAVEUSU = '"+ claveActual +"' AND IDUSU = "+nUsu+";");
            operacion = true;
        } catch (SQLException e) {
            System.out.println("!ERROR¡" + e.toString());
        }
        return operacion;
    }
    
//    public boolean ValidarUsuario(String nombreUsu, String claveUsu){
//        try {
//            conexion=this.obtenerConexion();
//            puente=conexion.createStatement();
//            mensajero=puente.executeQuery("SELECT * FROM USUARIOS WHERE NOMBREUSU='"+nombreUsu+"' AND CLAVEUSU='"+claveUsu+"'");
//            if (mensajero.next()) {
//                operacion=true;
//            }
//            this.cerrarConexion();
//        } catch (Exception e) {
//            System.out.println("¡Error! en el DAO"+e.toString());
//        }
//        return operacion;
//    }
}
