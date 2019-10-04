/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modeloDAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import modeloVO.ClienteVO;
import modeloVO.EquipoVO;
import modeloVO.EstadoVO;
import util.ConexionBD;
import util.InterfaceCRUD;

/**
 *
 * @author AFCHT
 */
public class EquipoDAO extends ConexionBD implements InterfaceCRUD{
    
    private Connection conexion = null;
    private Statement puente = null;
    private ResultSet mensajero = null;
    private String idEq = "";
    private String idEqCli = "";
    private String idEqEst = "";
    private String nombreEq = "";
    private String inventarioEq = "";
    private String marcaEq = "";
    private String serieEq = "";
    private String ubicacionEq = "";
    private String idCli = "";
    private String nombreCli = "";
    private String idEst = "";
    private String nombreEst = "";
    private boolean operacion = false;
    
    //CONSTRUCTOR

    public EquipoDAO(EquipoVO eqVO) {
        
        super();
        
        try {
            conexion = this.obtenerConexion();
            puente = conexion.createStatement();
            
            idEq = eqVO.getIdEq();
            idEqCli = eqVO.getIdEqCli();
            idEqEst = eqVO.getIdEqEst();
            nombreEq = eqVO.getNombreEq();
            inventarioEq = eqVO.getInventarioEq();
            marcaEq = eqVO.getMarcaEq();
            serieEq = eqVO.getSerieEq();
            ubicacionEq = eqVO.getUbicacionEq();
            
        } catch (Exception e) {
            System.out.println("¡Error!"+e.toString());
        }
        
    }

    @Override
    public boolean insertarRegistro() {
        
        try {
            puente.executeUpdate("INSERT INTO EQUIPOS (IDEQ, IDCLI, IDEST, NOMBREEQ, INVENTARIOEQ, MARCAEQ, SERIEEQ, UBICACIONEQ) VALUES ('"+idEq+"', '"+idEqCli+"', '"+idEqEst+"', '"+nombreEq+"', '"+inventarioEq+"', '"+marcaEq+"', '"+serieEq+"', '"+ubicacionEq+"');");
            operacion = true;
            
        } catch (Exception e) {
           
            System.out.println("¡Error! ololo"+e.toString());
        }
        return operacion;
    }

    @Override
    public boolean actualizarRegistro() {
        
        try {
            puente.executeUpdate("UPDATE EQUIPOS SET IDCLI = '"+idEqCli+"', IDEST = '"+idEqEst+"', NOMBREEQ = '"+nombreEq+"', INVENTARIOEQ = '"+inventarioEq+"', MARCAEQ = '"+marcaEq+"', SERIEEQ = '"+serieEq+"', UBICACIONEQ = '"+ubicacionEq+"' WHERE IDEQ = '"+idEq+"'; ");
            operacion = true;
            
        } catch (Exception e) {
            System.out.println("¡Error!"+e.toString());
        }
        return operacion;
    }

    @Override
    public boolean eliminarRegistro() {
        try {
            puente.executeUpdate("DELETE FROM EQUIPOS WHERE IDEQ = '"+idEq+"'");
            operacion = true;
            
        } catch (Exception e) {
            System.out.println("¡Error!"+e.toString());
        }
        return operacion;
    }
    
    public static EquipoVO buscarRegistro(String idEq) {
        EquipoVO eqVO = null;
        
        try {
            ConexionBD conexionBd = new ConexionBD();
            Connection conexion = conexionBd.obtenerConexion();
            Statement puente = conexion.createStatement();
            ResultSet mensajero = puente.executeQuery("SELECT * FROM EQUIPOS WHERE IDEQ='"+idEq+"' ");
            while(mensajero.next()){
                
                eqVO = new EquipoVO(idEq, mensajero.getString(2), mensajero.getString(3), mensajero.getString(4), mensajero.getString(5), mensajero.getString(6), mensajero.getString(7), mensajero.getString(8));                
            }
            mensajero.close();
            puente.close();
        } catch (Exception e) {
            System.out.println("¡Error!"+e.toString());
        }
        return eqVO;
    }
    
    public static EquipoVO buscarRegistro2(String idEq) {
        EquipoVO eqVO = null;
        
        try {
            ConexionBD conexionBd = new ConexionBD();
            Connection conexion = conexionBd.obtenerConexion();
            Statement puente = conexion.createStatement();
            ResultSet mensajero = puente.executeQuery("SELECT * FROM EQUIPOS WHERE IDEQ='"+idEq+"' ");
            while(mensajero.next()){
                
                eqVO = new EquipoVO(idEq, mensajero.getString(2), mensajero.getString(3), mensajero.getString(4), mensajero.getString(5), mensajero.getString(6), mensajero.getString(7), mensajero.getString(8));                
            }
            mensajero.close();
            puente.close();
        } catch (Exception e) {
            System.out.println("¡Error!"+e.toString());
        }
        return eqVO;
    }
    
    public ArrayList<EquipoVO> listar(){
            ConexionBD conexionBd = new ConexionBD();
            ArrayList<EquipoVO>listaEquipos = new ArrayList<>();
            
            try {
                puente = conexionBd.obtenerConexion().createStatement();
                mensajero = puente.executeQuery("SELECT * FROM EQUIPOS");
                while(mensajero.next()){
                    idEq = mensajero.getString(1);
                    idEqCli = mensajero.getString(2);
                    idEqEst = mensajero.getString(3);
                    nombreEq = mensajero.getString(4);
                    inventarioEq = mensajero.getString(5);
                    marcaEq = mensajero.getString(6);
                    serieEq = mensajero.getString(7);
                    ubicacionEq = mensajero.getString(8);
                    
                    EquipoVO eqVO = new EquipoVO(idEq, idEqCli, idEqEst, nombreEq, inventarioEq, marcaEq, serieEq, ubicacionEq);
                    listaEquipos.add(eqVO);
                }
            } catch (Exception e) {
                System.out.println("¡Error!"+e.toString());
            }
            return listaEquipos;
        }
    
        public ArrayList<ClienteVO> listarClientes(){
            ConexionBD conexionBd = new ConexionBD();
            ArrayList<ClienteVO>listaClientes = new ArrayList<>();
            
            try {
                puente = conexionBd.obtenerConexion().createStatement();
                mensajero = puente.executeQuery("SELECT IDCLI, NOMBRECLI FROM CLIENTES");
                while(mensajero.next()){
                    idCli = mensajero.getString(1);
                    nombreCli = mensajero.getString(2);
                    
                    ClienteVO cliVO = new ClienteVO(idCli, nombreCli);
                    listaClientes.add(cliVO);
                }
            } catch (Exception e) {
                System.out.println("¡Error!"+e.toString());
            }
            return listaClientes;
        }
        
        public ArrayList<EstadoVO> listarEstados(){
            ConexionBD conexionBd = new ConexionBD();
            ArrayList<EstadoVO>listaEstados = new ArrayList<>();
            
            try {
                puente = conexionBd.obtenerConexion().createStatement();
                mensajero = puente.executeQuery("SELECT IDEST, NOMBREEST FROM ESTADOS WHERE IDEST = 1 OR IDEST = 2 OR IDEST = 3");
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
    
    public EquipoDAO() {
    }
}
