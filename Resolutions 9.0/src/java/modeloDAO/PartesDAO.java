/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modeloDAO;

import modeloVO.PartesVO;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import modeloVO.EquipoVO;
import modeloVO.EstadoVO;
import util.ConexionBD;
import util.InterfaceCRUD;

/**
 *
 * @author SHAMAN
 */
public class PartesDAO extends ConexionBD implements InterfaceCRUD{

    private Connection conexion = null;
    private Statement puente = null;
    private ResultSet mensajero = null;
    
    private String idPart="";
    private String idEq="";
    private String idEst="";
    private String nombrePart="";
    private String tipoPart="";    
    private String comentarioPart="";
    
    private String idEqCli="";
    private String nombreEq="";
    private String nombreEst="";
    
    private boolean operacion=false;

    public PartesDAO(PartesVO partVO) {
        super();
        try {
            conexion=this.obtenerConexion();
            puente=conexion.createStatement();
            idPart=partVO.getIdPart();
            idEq=partVO.getIdEq();
            idEst=partVO.getIdEst();
            nombrePart=partVO.getNombrePart();
            tipoPart=partVO.getTipoPart();            
            comentarioPart=partVO.getComentarioPart();
        } catch (Exception e) {
            System.out.println("Error en el DAO "+e.toString());
        }
    }
    
    public PartesDAO(){
     
    }
    
    @Override
    public boolean insertarRegistro() {
        try {
            puente.executeUpdate("INSERT INTO PARTES (IDPART, IDEQ, IDEST, NOMBREPART, TIPOPART, COMENTARIOPART) VALUES ('"+idPart+"', '"+idEq+"', '"+idEst+"', '"+nombrePart+"', '"+tipoPart+"', '"+comentarioPart+"');");
            operacion=true;
        } catch (Exception e) {
            System.out.println("Error "+e.toString());
        }
        return operacion;
    }

    @Override
    public boolean actualizarRegistro() {
        try {
            puente.executeUpdate("UPDATE PARTES SET IDEQ = '"+idEq+"', IDEST = '"+idEst+"', NOMBREPART = '"+nombrePart+"', TIPOPART = '" +tipoPart+"', COMENTARIOPART = '"+comentarioPart+"' WHERE IDPART = '"+idPart+"'");
            operacion = true;
        } catch (Exception e) {
            System.out.println("!ERROR¡" + e.toString());
        }
        return operacion;
    }
    
    public static PartesVO consultarporId(String idPart) {
        PartesVO partVO = null;
        try {
            ConexionBD conexionBD = new ConexionBD();
            Connection conexion = conexionBD.obtenerConexion();
            Statement puente = conexion.createStatement();
            ResultSet mensajero = puente.executeQuery("SELECT * FROM PARTES WHERE IDPART = '"+idPart+"';");
            while (mensajero.next()) {
                partVO = new PartesVO(idPart, mensajero.getString(2), mensajero.getString(3), mensajero.getString(4), mensajero.getString(5), mensajero.getString(6));
            }
            mensajero.close();
            puente.close();
        } catch (Exception e) {
            System.out.println("¡Error en la consulta!" + e.toString());
        }
        return partVO;
    }
    
    public static PartesVO consultarporId2(String idPart) {
        PartesVO partVO = null;
        try {
            ConexionBD conexionBD = new ConexionBD();
            Connection conexion = conexionBD.obtenerConexion();
            Statement puente = conexion.createStatement();
            ResultSet mensajero = puente.executeQuery("SELECT * FROM PARTES WHERE IDPART = '"+idPart+"';");
            while (mensajero.next()) {
                partVO = new PartesVO(idPart, mensajero.getString(2), mensajero.getString(3), mensajero.getString(4), mensajero.getString(5), mensajero.getString(6));
            }
            mensajero.close();
            puente.close();
        } catch (Exception e) {
            System.out.println("¡Error en la consulta!" + e.toString());
        }
        return partVO;
    }

    public ArrayList<PartesVO> listar() {
        ConexionBD conexionBD = new ConexionBD();
        ArrayList<PartesVO> listaPartes = new ArrayList<>();
        try {
            puente = conexionBD.obtenerConexion().createStatement();
            mensajero = puente.executeQuery("SELECT * FROM PARTES");

            while (mensajero.next()) {
                idPart = mensajero.getString(1);
                idEq = mensajero.getString(2);
                idEst = mensajero.getString(3);
                nombrePart = mensajero.getString(4);
                tipoPart = mensajero.getString(5);                
                comentarioPart = mensajero.getString(6);
                PartesVO PartVO = new PartesVO(idPart, idEq, idEst, nombrePart, tipoPart, comentarioPart);
                listaPartes.add(PartVO);
            }

        } catch (Exception e) {
            System.out.println("¡Error en el ArrayList!" + e.toString());
        }
        return listaPartes;
    }
    
    @Override
    public boolean eliminarRegistro() {
        try {
            puente.executeUpdate("DELETE FROM PARTES WHERE IDPART ='"+idPart+"'");
            operacion = true;
        } catch (Exception e) {
            System.out.println("Error "+e.toString());
        }
        return operacion;
    }
    
    public ArrayList<EquipoVO> listarEquipos(){
            ConexionBD conexionBd = new ConexionBD();
            ArrayList<EquipoVO>listaEquipos = new ArrayList<>();
            
            try {
                puente = conexionBd.obtenerConexion().createStatement();
                mensajero = puente.executeQuery("SELECT * FROM EQUIPOS");
                while(mensajero.next()){
                    idEq = mensajero.getString(1);
                    idEqCli = mensajero.getString(2);
                    nombreEq = mensajero.getString(4);
                    
                    EquipoVO eqVO = new EquipoVO(idEq, idEqCli, idEst, nombreEq, comentarioPart, idEq, idEq, idEq);
                    listaEquipos.add(eqVO);
                }
            } catch (Exception e) {
                System.out.println("¡Error!"+e.toString());
            }
            return listaEquipos;
        }
        
        public ArrayList<EstadoVO> listarEstados(){
            ConexionBD conexionBd = new ConexionBD();
            ArrayList<EstadoVO>listaEstados = new ArrayList<>();
            
            try {
                puente = conexionBd.obtenerConexion().createStatement();
                mensajero = puente.executeQuery("SELECT IDEST, NOMBREEST FROM ESTADOS WHERE IDEST = 4 OR IDEST = 5 OR IDEST = 6");
                while(mensajero.next()){
                    idEst = mensajero.getString(1);
                    nombreEst = mensajero.getString(2);
                    
                    EstadoVO estVO = new EstadoVO(idEst, nombreEst);
                    listaEstados.add(estVO);
                }
            } catch (Exception e) {
                System.out.println("¡Error!"+e.toString());
            }
            return listaEstados;
        }
    
}
