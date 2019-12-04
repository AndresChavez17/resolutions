package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Andres Chávez
 */
public class ConexionBD {
    
    private String driver, urlBD, bd, userBD, passwordBD;
    private Connection conexion;
    
    public ConexionBD(){
        driver = "com.mysql.jdbc.Driver";
        bd = "resolutions";
        userBD = "root";
        passwordBD = "";
        urlBD = "jdbc:mysql://localhost:3306/"+bd;
        
        try {
            Class.forName(driver).newInstance();
            conexion = DriverManager.getConnection(urlBD, userBD, passwordBD);
            System.out.println("Se ha conectado correctamente a la base de datos");
        } catch (Exception e) {
            System.out.println("No se ha conectado correctamente a la base de datos"+e.toString());
        }
        
    }
    
    public Connection obtenerConexion(){
        return conexion;
    }
    
    public Connection cerrarConexion() throws SQLException{
        conexion.close();
        conexion = null;
        return conexion;
    }
    
    final public Connection desconectar() {
        Connection conn = obtenerConexion();
        try {
            conn.close();
        } catch (SQLException ex) {
            System.out.println("Error desconectar: "+ ex.getMessage());
        }
        return conn;
    }
    
    public static void main(String[] args){
        new ConexionBD();
    }
    
}
