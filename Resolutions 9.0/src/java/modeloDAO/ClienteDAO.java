package modeloDAO;

import com.mysql.jdbc.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import modeloVO.ClienteVO;
import util.ConexionBD;
import util.InterfaceCRUD;

/**
 *
 * @author Andrés Chávez
 */
public class ClienteDAO extends ConexionBD implements InterfaceCRUD{
    
    //ATRIBUTOS
    
    private Connection conexion = null;
    private Statement puente = null;
    private ResultSet mensajero = null; 
    private String idCli = "";
    private String nombreCli = "";
    private String direccionCli = "";
    private String telefonoCli = "";
    private String celularCli = "";
    private String estadoCli = "";
    private CallableStatement procedimiento;
    private boolean operacion = false;
    
    //CONSTRUCTOR
    
    public ClienteDAO(ClienteVO cliVO){
        
        super();
        
        try {                        
            conexion = this.obtenerConexion();
            puente = conexion.createStatement();            
            idCli = cliVO.getIdCli();
            nombreCli = cliVO.getNombreCli();
            direccionCli = cliVO.getDireccionCli();
            telefonoCli = cliVO.getTelefonoCli();
            celularCli = cliVO.getCelularCli();
            estadoCli = cliVO.getEstadoCli();
            
        } catch (Exception e) {
            System.out.println("¡Error!"+e.toString());
        }
        
    }

    @Override
    public boolean insertarRegistro() {
     
        try {
            procedimiento = (CallableStatement) conexion.prepareCall("CALL REGISTRAR_CLI(?,?,?,?,?)");
            procedimiento.setString("REGIDCLI", idCli);
            procedimiento.setString("REGNOMBRECLI", nombreCli);
            procedimiento.setString("REGDIRECCIONCLI", direccionCli);
            procedimiento.setString("REGTELEFONOCLI", telefonoCli);
            procedimiento.setString("REGCELULARCLI", celularCli);
            procedimiento.executeQuery();
            operacion = true;
            
        } catch (Exception e) {
           
            System.out.println("¡Error en DAO!"+e.toString());
        }
        return operacion;
    }

    @Override
    public boolean actualizarRegistro() {
        
        try {
            procedimiento = (CallableStatement) conexion.prepareCall("CALL MODIFICAR_CLI(?,?,?,?,?)");
            procedimiento.setString("REGIDCLI", idCli);
            procedimiento.setString("REGNOMBRECLI", nombreCli);
            procedimiento.setString("REGDIRECCIONCLI", direccionCli);
            procedimiento.setString("REGTELEFONOCLI", telefonoCli);
            procedimiento.setString("REGCELULARCLI", celularCli);
            procedimiento.executeQuery();
            operacion = true;
            
        } catch (Exception e) {
            System.out.println("¡Error!"+e.toString());
        }
        return operacion;
    }    

    @Override
    public boolean eliminarRegistro() {
        try {
            procedimiento = (CallableStatement) conexion.prepareCall("CALL DESHABILITAR_CLI(?)");
            procedimiento.setString("REGIDCLI", idCli);
            procedimiento.executeQuery();
            operacion = true;
            
        } catch (Exception e) {
            System.out.println("¡Error!"+e.toString());
        }
        return operacion;
    }
    
    public boolean habilitarRegistro() {
        try {
            procedimiento = (CallableStatement) conexion.prepareCall("CALL HABILITAR_CLI(?)");
            procedimiento.setString("REGIDCLI", idCli);
            procedimiento.executeQuery();
            operacion = true;
            
        } catch (Exception e) {
            System.out.println("¡Error!"+e.toString());
        }
        return operacion;
    }
    
    public static ClienteVO buscarRegistro(String idCli) {
        ClienteVO cliVO = null;
        
        try {
            ConexionBD conexionBd = new ConexionBD();
            Connection conexion = conexionBd.obtenerConexion();
            Statement puente = conexion.createStatement();
            ResultSet mensajero = puente.executeQuery("SELECT * FROM CLIENTES WHERE IDCLI='"+idCli+"' ");
            while(mensajero.next()){
                
                cliVO = new ClienteVO(idCli, mensajero.getString(2), mensajero.getString(3), mensajero.getString(4), mensajero.getString(5), mensajero.getString(6));
            }
            mensajero.close();
            puente.close();
        } catch (Exception e) {
            System.out.println("¡Error!"+e.toString());
        }
        return cliVO;
    }
    
    public static ClienteVO buscarRegistro2(String idCli) {
        ClienteVO cliVO = null;
        
        try {
            ConexionBD conexionBd = new ConexionBD();
            Connection conexion = conexionBd.obtenerConexion();
            Statement puente = conexion.createStatement();
            ResultSet mensajero = puente.executeQuery("SELECT * FROM CLIENTES WHERE IDCLI='"+idCli+"' ");
            while(mensajero.next()){
                
                cliVO = new ClienteVO(idCli, mensajero.getString(2), mensajero.getString(3), mensajero.getString(4), mensajero.getString(5), mensajero.getString(6));
            }
            mensajero.close();
            puente.close();
        } catch (Exception e) {
            System.out.println("¡Error!"+e.toString());
        }
        return cliVO;
    }
    
    public ArrayList<ClienteVO> listar(){
            ConexionBD conexionBd = new ConexionBD();
            ArrayList<ClienteVO>listaClientes = new ArrayList<>();
            
            try {
                puente = conexionBd.obtenerConexion().createStatement();
                mensajero = puente.executeQuery("SELECT * FROM CLIENTES");
                while(mensajero.next()){
                    idCli = mensajero.getString(1);
                    nombreCli = mensajero.getString(2);
                    direccionCli = mensajero.getString(3);
                    telefonoCli = mensajero.getString(4);
                    celularCli = mensajero.getString(5);
                    estadoCli = mensajero.getString(6);
                    
                    ClienteVO cliVO = new ClienteVO(idCli, nombreCli, direccionCli, telefonoCli, celularCli, estadoCli);
                    listaClientes.add(cliVO);
                }
            } catch (Exception e) {
                System.out.println("¡Error!"+e.toString());
            }
            return listaClientes;
        }
    
    public ArrayList<ClienteVO> listarClientesActivos(){
        ConexionBD conexionBd = new ConexionBD();
            ArrayList<ClienteVO>listaClientes = new ArrayList<>();
            
            try {
                puente = conexionBd.obtenerConexion().createStatement();
                mensajero = puente.executeQuery("SELECT * FROM CLIENTES WHERE ESTADOCLI = 1");
                while(mensajero.next()){
                    idCli = mensajero.getString(1);
                    nombreCli = mensajero.getString(2);
                    direccionCli = mensajero.getString(3);
                    telefonoCli = mensajero.getString(4);
                    celularCli = mensajero.getString(5);
                    estadoCli = mensajero.getString(6);
                    
                    ClienteVO cliVO = new ClienteVO(idCli, nombreCli, direccionCli, telefonoCli, celularCli, estadoCli);
                    listaClientes.add(cliVO);
                }
            } catch (Exception e) {
                System.out.println("¡Error!"+e.toString());
            }
            return listaClientes;
        }

    public ClienteDAO() {
    }
    
    
}
