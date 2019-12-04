/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modeloVO;

/**
 *
 * @author AFCHT
 */
public class UsuarioVO {
    
    //ATRIBUTOS
    
    private String idUsu;
    private String nombreUsu;
    private String claveUsu;
    private String estadoUsu;
    
    //CONSTRUCTOR

    public UsuarioVO(String idUsu, String nombreUsu, String claveUsu, String estadoUsu) {
        
        this.idUsu = idUsu;
        this.nombreUsu = nombreUsu;
        this.claveUsu = claveUsu;
        this.estadoUsu = estadoUsu;
    }
    
    public UsuarioVO(){
        
    }
    
    public UsuarioVO(String nombreUsu) {
        this.nombreUsu = nombreUsu;
    }
    
    /*RECUPERAR CLAVE*/
    public UsuarioVO(String nombreUsu, String claveUsu) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    /*---------------------------------------------------------*/

    public String getIdUsu() {
        return idUsu;
    }

    public void setIdUsu(String idUsu) {
        this.idUsu = idUsu;
    }

    public String getNombreUsu() {
        return nombreUsu;
    }

    public void setNombreUsu(String nombreUsu) {
        this.nombreUsu = nombreUsu;
    }

    public String getClaveUsu() {
        return claveUsu;
    }

    public void setClaveUsu(String claveUsu) {
        this.claveUsu = claveUsu;
    }

    public String getEstadoUsu() {
        return estadoUsu;
    }

    public void setEstadoUsu(String estadoUsu) {
        this.estadoUsu = estadoUsu;
    }
    
    
}
