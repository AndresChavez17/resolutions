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
public class ServicioDAO extends ConexionBD implements InterfaceCRUD1 {
    private Connection conexion;
    private Statement puente;
    private ResultSet mensajero;
    private CallableStatement proceso;
    private ArrayList<ServicioVO>listado;
    
    private String idSer;
    private String idPer;
    private String idEq;
    private String fechaIngresoSer;
    private String fechaEntregaSer;
    private String observacionesSer;

    public ServicioDAO(ServicioVO serVO) {
        super();
        try {
            this.conexion = obtenerConexion();
            this.puente = conexion.createStatement();
            this.idSer = serVO.getIdSer();
            this.idPer = serVO.getIdPer();
            this.idEq = serVO.getIdEq();
            this.fechaIngresoSer = serVO.getFechaIngresoSer();
            this.fechaEntregaSer = serVO.getFechaEntregaSer();
            this.observacionesSer = serVO.getObservacionesSer();
        } catch (SQLException ex) {
            System.out.println("Error Class: "+ ex.getMessage());
            System.out.println("Error ClienteDAO!: " + ex.toString());
        }
    }
    
    @Override
    public String agregarRegistro() {
        try {
            proceso = conexion.prepareCall("CALL REGISTRAR_SER(?,?,?,?,?)");
            proceso.setString("REGIDPER", idPer);
            proceso.setString("REGIDEQ", idEq);
            proceso.setString("REGFECHAINGRESOSER", fechaIngresoSer);
            proceso.setString("REGFECHAENTREGASER", fechaEntregaSer);
            proceso.setString("REGOBSERVACIONESSER", observacionesSer);
            proceso.executeQuery();
            return "Servicio registrado correctamente";
        } catch (SQLException ex) {
            System.out.println("Error Class: "+ ex.getMessage());
            return "No se pudo registrar el servicio";
        } finally {
            conexion = desconectar();
        }
    }

    @Override
    public String actualizarRegistro() {
        try {
            proceso = conexion.prepareCall("CALL MODIFICAR_SER(?,?,?,?,?,?)");
            proceso.setString("REGIDSER", idSer);
            proceso.setString("REGIDPER", idPer);
            proceso.setString("REGIDEQ", idEq);
            proceso.setString("REGFECHAINGRESOSER", fechaIngresoSer);
            proceso.setString("REGFECHAENTREGASER", fechaEntregaSer);
            proceso.setString("REGOBSERVACIONESSER", observacionesSer);
            proceso.executeQuery();
            return "Servicio modificado correctamente";
        } catch (SQLException ex) {
            System.out.println("Error Class: "+ ex.getMessage());
            return "No se pudo modificar el servicio";
        } finally {
            conexion = desconectar();
        }
    }

    @Override
    public String eliminarRegistro() {
        try {
            proceso = conexion.prepareCall("CALL ELIMINAR_SER(?)");
            proceso.setString("REGIDSER", idSer);
            proceso.executeQuery();
            return "Servicio eliminado correctamente";
        } catch (SQLException ex) {
            System.out.println("Error Class: "+ ex.getMessage());
            return "No se pudo eliminar el servicio";
        } finally {
            conexion = desconectar();
        }
    }

    @Override
    public ArrayList listar() {
        listado = new ArrayList<>();
        ServicioVO serListVO;
        try {
            proceso = conexion.prepareCall("CALL LISTAR_SER()");
            mensajero = proceso.executeQuery();
            while(mensajero.next()){
                idSer = mensajero.getString(1);
                idPer = mensajero.getString(2);
                idEq = mensajero.getString(3);
                fechaIngresoSer = mensajero.getString(4);
                fechaEntregaSer = mensajero.getString(5);
                observacionesSer = mensajero.getString(6);
                serListVO = new ServicioVO(idSer, idPer, idEq, fechaIngresoSer, fechaEntregaSer, observacionesSer);
                listado.add(serListVO);
            }
        } catch (SQLException ex) {
            System.out.println("¡Error: "+ex.toString()+"!");
        } finally {
            conexion = desconectar();
        }
        return listado;
    }

    @Override
    public ArrayList consultar(Object id) {
        listado = new ArrayList<>();
        ServicioVO serConVO;
        try {
            proceso = conexion.prepareCall("CALL BUSCAR_SER(?)");
            proceso.setString("REGIDSER", (String) id);
            mensajero = proceso.executeQuery();
            while(mensajero.next()){
                idSer = mensajero.getString(1);
                idPer = mensajero.getString(2);
                idEq = mensajero.getString(3);
                fechaIngresoSer = mensajero.getString(4);
                fechaEntregaSer = mensajero.getString(5);
                observacionesSer = mensajero.getString(6);
                serConVO = new ServicioVO(idSer, idPer, idEq, fechaIngresoSer, fechaEntregaSer, observacionesSer);
                listado.add(serConVO);
            }
        } catch (SQLException ex) {
            System.out.println("¡Error: "+ex.toString()+"!");
        }finally {
            conexion = desconectar();
        }
        return listado;
    }
}