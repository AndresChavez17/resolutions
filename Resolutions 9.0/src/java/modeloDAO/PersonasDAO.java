/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modeloDAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import modeloVO.PersonasVO;
import util.ConexionBD;
import util.InterfaceCRUD;

/**
 *
 * @author AFCHT
 */
public class PersonasDAO extends ConexionBD implements InterfaceCRUD{
    
    //ATRIBUTOS
    
    private Connection conexion = null;
    private Statement puente = null;
    private ResultSet mensajero = null;
    private String idPer = "";
    private String idUsu = "";
    private String tipoPer = "";
    private String nombrePer = "";
    private String apellidoPer = "";
    private String tipoDocumentoPer = "";
    private String identificacionPer = "";
    private String correoPer = "";
    private CallableStatement proceso;
    private boolean operacion = false;
    
    //CONSTRUCTOR
    
    public PersonasDAO(PersonasVO perVO){
        
        super();
        
        try {
            this.conexion = obtenerConexion();
            this.puente = conexion.createStatement();
            idPer = perVO.getIdPer();
            idUsu = perVO.getIdUsu();
            tipoPer = perVO.getTipoPer();
            nombrePer = perVO.getNombrePer();
            apellidoPer = perVO.getApellidoPer();
            tipoDocumentoPer = perVO.getTipoDocumentoPer();
            identificacionPer = perVO.getIdentificacionPer();
            correoPer = perVO.getCorreoPer();
            
        } catch (Exception e) {
            System.out.println("¡Error en el DAO!"+e.toString());
        }
    }

    @Override
    public boolean insertarRegistro() {
        
        try {
            proceso = conexion.prepareCall("CALL REGISTRAR_PER(?,?,?,?,?,?,?,?)");
            proceso.setString("REGIDPER", idPer);
            proceso.setString("REGIDUSU", idUsu);
            proceso.setString("REGTIPOPER", tipoPer);
            proceso.setString("REGNOMBREPER", nombrePer);
            proceso.setString("REGAPELLIDOPER", apellidoPer);
            proceso.setString("REGTIPODOCUMENTOPER", tipoDocumentoPer);
            proceso.setString("REGIDENTIFICACIONPER", identificacionPer);
            proceso.setString("REGCORREOPER", correoPer);
            proceso.executeQuery();
            operacion = true;
            
        } catch (Exception e) {
            System.out.println("¡Error Insert!"+e.toString());
            operacion = false;
        }
        return operacion;
    }

    @Override
    public boolean actualizarRegistro() {
        
        try {
            puente.executeUpdate("UPDATE PERSONAS SET NOMBREPER = '"+nombrePer+"', APELLIDOPER = '"+apellidoPer+"', TIPODOCUMENTOPER = '"+tipoDocumentoPer+"', IDENTIFICACIONPER = '"+identificacionPer+"', CORREOPER = '"+correoPer+"' WHERE IDPER = '"+idPer+"';");
            operacion = true;
        } catch (Exception e) {
            System.out.println("¡Error Update!"+e.toString());
        }
        return operacion;
    }

    @Override
    public boolean eliminarRegistro() {
        try {
            puente.executeUpdate("DELETE FROM PERSONAS WHERE IDPER = '"+idPer+"'");
            operacion = true;
            
        } catch (Exception e) {
            System.out.println("¡Error!"+e.toString());
        }
        return operacion;
    }
    
    public PersonasVO buscarRegistro(String idPer) {
        PersonasVO perVO = null;
        
        try {
            ConexionBD conexionBd = new ConexionBD();
            Connection conexion = conexionBd.obtenerConexion();
            Statement puente = conexion.createStatement();
            ResultSet mensajero = puente.executeQuery("SELECT * FROM PERSONAS WHERE IDUSU='"+idPer+"' ");
            while(mensajero.next()){
                
                perVO = new PersonasVO(idPer, mensajero.getString(2), mensajero.getString(3), mensajero.getString(4), mensajero.getString(5), mensajero.getString(6), mensajero.getString(7), mensajero.getString(8));                
            }
            mensajero.close();
            puente.close();
        } catch (Exception e) {
            System.out.println("¡Error!"+e.toString());
        }
        return perVO;
    }
    
    public static PersonasVO buscarRegistro2(String idPer) {
        PersonasVO perVO = null;
        
        try {
            ConexionBD conexionBd = new ConexionBD();
            Connection conexion = conexionBd.obtenerConexion();
            Statement puente = conexion.createStatement();
            ResultSet mensajero = puente.executeQuery("SELECT * FROM PERSONAS WHERE IDPER='"+idPer+"' ");
            while(mensajero.next()){
                
                perVO = new PersonasVO(idPer, mensajero.getString(2), mensajero.getString(3), mensajero.getString(4), mensajero.getString(5), mensajero.getString(6), mensajero.getString(7), mensajero.getString(8));                
            }
            mensajero.close();
            puente.close();
        } catch (Exception e) {
            System.out.println("¡Error!"+e.toString());
        }
        return perVO;
    }
    
    public ArrayList<PersonasVO> listar(){
            ConexionBD conexionBd = new ConexionBD();
            ArrayList<PersonasVO>listaPersonas = new ArrayList<>();
            
            try {
                puente = conexionBd.obtenerConexion().createStatement();
                mensajero = puente.executeQuery("SELECT * FROM PERSONAS");
                while(mensajero.next()){
                    idPer = mensajero.getString(1);
                    idUsu = mensajero.getString(2);
                    tipoPer = mensajero.getString(3);
                    nombrePer = mensajero.getString(4);
                    apellidoPer = mensajero.getString(5);
                    tipoDocumentoPer = mensajero.getString(6);
                    identificacionPer = mensajero.getString(7);
                    correoPer = mensajero.getString(8);
                    
                    PersonasVO perVO = new PersonasVO(idPer, idUsu, tipoPer, nombrePer, apellidoPer, tipoDocumentoPer, identificacionPer, correoPer);
                    listaPersonas.add(perVO);
                }
            } catch (Exception e) {
                System.out.println("¡Error!"+e.toString());
            }
            return listaPersonas;
        }
    
    public static PersonasVO RecuperarCorreo(String identificacion) {
        PersonasVO perVO = null;
        
        try {
            ConexionBD conexionBd = new ConexionBD();
            Connection conexion = conexionBd.obtenerConexion();
            Statement puente = conexion.createStatement();
            ResultSet mensajero = puente.executeQuery("SELECT * FROM PERSONAS WHERE IDENTIFICACIONPER='"+identificacion+"' ");
            while(mensajero.next()){
                perVO = new PersonasVO(mensajero.getString(1), mensajero.getString(2), mensajero.getString(3), mensajero.getString(4), mensajero.getString(5), mensajero.getString(6), identificacion, mensajero.getString(8));                
            }
            mensajero.close();
            puente.close();
        } catch (Exception e) {
            System.out.println("¡Error!"+e.toString());
        }
        return perVO;
    }
    
    public PersonasDAO(){
        
    }
}
