/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modeloDAO;

import java.sql.*;
import java.util.*;
import modeloVO.*;
import util.*;

/**
 *
 * @author Jaxx
 */
public class EstadoDAO extends ConexionBD implements InterfaceCRUD1 {
    private Connection conexion;
    private Statement puente;
    private ResultSet mensajero;
    private CallableStatement proceso;
    private ArrayList<EstadoVO>listado;
    
    private String idEst;
    private String nombreEst;
    
    public EstadoDAO(EstadoVO estVO) {
        super();
        try {
            this.conexion = obtenerConexion();
            this.puente = conexion.createStatement();
            this.idEst = estVO.getIdEst();
            this.nombreEst = estVO.getNombreEst();
        } catch (SQLException ex) {
            System.out.println("Error Class: "+ ex.getMessage());
            System.out.println("Error ClienteDAO!: " + ex.toString());
        }
    }

    @Override
    public String agregarRegistro() {
        try {
            proceso = conexion.prepareCall("CALL REGISTRAR_EST(?)");
            proceso.setString("REGNOMBREEST", nombreEst);
            proceso.executeQuery();
            return "Estado registrado correctamente";
        } catch (SQLException ex) {
            System.out.println("Error Class: "+ ex.getMessage());
            return "No se pudo registrar el estado :"+ex;
        } finally {
            conexion = desconectar();
        }
    }

    @Override
    public String actualizarRegistro() {
        try {
            proceso = conexion.prepareCall("CALL MODIFICAR_EST(?,?)");
            proceso.setString("REGIDEST", idEst);
            proceso.setString("REGNOMBREEST", nombreEst);
            proceso.executeQuery();
            return "Estado modificado correctamente";
        } catch (SQLException ex) {
            System.out.println("Error Class: "+ ex.getMessage());
            return "No se pudo modificar el estado :"+ex;
        } finally {
            conexion = desconectar();
        }
    }

    @Override
    public String eliminarRegistro() {
        try {
            proceso = conexion.prepareCall("CALL ELIMINAR_EST(?)");
            proceso.setString("REGIDEST", idEst);
            proceso.executeQuery();
            return "Estado eliminado correctamente";
        } catch (SQLException ex) {
            System.out.println("Error Class: "+ ex.getMessage());
            return "No se pudo eliminar el estado :"+ex;
        } finally {
            conexion = desconectar();
        }
    }

    @Override
    public ArrayList listar() {
        listado = new ArrayList<>();
        EstadoVO estListVO;
        try {
            proceso = conexion.prepareCall("CALL LISTAR_EST()");
            mensajero = proceso.executeQuery();
            while(mensajero.next()){
                idEst = mensajero.getString(1);
                nombreEst = mensajero.getString(2);
                estListVO = new EstadoVO(idEst, nombreEst);
                listado.add(estListVO);
            }
        } catch (SQLException ex) {
            System.out.println("¡Error: "+ex.toString()+"!");
        } finally {
            desconectar();
        }
        return listado;
    }

    @Override
    public ArrayList consultar(Object id) {
        listado = new ArrayList<>();
        EstadoVO estConVO;
        try {
            proceso = conexion.prepareCall("CALL BUSCAR_EST(?)");
            proceso.setString("REGIDEST", (String) id);
            mensajero = proceso.executeQuery();
            while(mensajero.next()){
                idEst = mensajero.getString(1);
                nombreEst = mensajero.getString(2);
                estConVO = new EstadoVO(idEst, nombreEst);
                listado.add(estConVO);
            }
        } catch (SQLException ex) {
            System.out.println("¡Error: "+ex.toString()+"!");
        }finally {
            conexion = desconectar();
        }
        return listado;
    }
}
