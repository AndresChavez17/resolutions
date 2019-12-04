package modeloVO;

/**
 *
 * @author Andrés Chávez
 */
public class ClienteVO {
    
    //ATRIBUTOS
    
    private String idCli;
    private String nombreCli;
    private String direccionCli;
    private String telefonoCli;
    private String celularCli;
    private String estadoCli;
    
    //CONSTRUCTOR
    
    public ClienteVO(String idCli, String nombreCli,String direccionCli, String telefonoCli, String celularCli, String estadoCli){
        
        this.idCli = idCli;
        this.nombreCli = nombreCli;
        this.direccionCli = direccionCli;
        this.telefonoCli = telefonoCli;        
        this.celularCli = celularCli;
        this.estadoCli = estadoCli;
    }

    public ClienteVO(String idCli, String nombreCli) {
        this.idCli = idCli;
        this.nombreCli = nombreCli;
    }
    
    public ClienteVO(){
        
    }
    
    //METODOS GET & SET

    public String getIdCli() {
        return idCli;
    }

    public void setIdCli(String idCli) {
        this.idCli = idCli;
    }

    public String getNombreCli() {
        return nombreCli;
    }

    public void setNombreCli(String nombreCli) {
        this.nombreCli = nombreCli;
    }

    public String getDireccionCli() {
        return direccionCli;
    }

    public void setDireccionCli(String direccionCli) {
        this.direccionCli = direccionCli;
    }

    public String getTelefonoCli() {
        return telefonoCli;
    }

    public void setTelefonoCli(String telefonoCli) {
        this.telefonoCli = telefonoCli;
    }

    public String getCelularCli() {
        return celularCli;
    }

    public void setCelularCli(String celularCli) {
        this.celularCli = celularCli;
    }    

    public String getEstadoCli() {
        return estadoCli;
    }

    public void setEstadoCli(String estadoCli) {
        this.estadoCli = estadoCli;
    }
    
    
    
}
