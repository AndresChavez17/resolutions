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
public class PersonasVO {
    
    //ATRIBUTOS
    private String idPer;
    private String idUsu;
    private String tipoPer;
    private String nombrePer;
    private String apellidoPer;
    private String tipoDocumentoPer;
    private String identificacionPer;
    private String correoPer;

    public PersonasVO(String idPer, String idUsu, String tipoPer, String nombrePer, String apellidoPer, String tipoDocumentoPer, String identificacionPer, String correoPer) {
        this.idPer = idPer;
        this.idUsu = idUsu;
        this.tipoPer = tipoPer;
        this.nombrePer = nombrePer;
        this.apellidoPer = apellidoPer;
        this.tipoDocumentoPer = tipoDocumentoPer;
        this.identificacionPer = identificacionPer;
        this.correoPer = correoPer;
    }
    
    public PersonasVO(){
        
    }
    
    /*RECUPERAR CLAVE*/
    public PersonasVO(String correoPer) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    /*----------------------------------------------*/

    public String getIdPer() {
        return idPer;
    }

    public void setIdPer(String idPer) {
        this.idPer = idPer;
    }

    public String getIdUsu() {
        return idUsu;
    }

    public void setIdUsu(String idUsu) {
        this.idUsu = idUsu;
    }

    public String getTipoPer() {
        return tipoPer;
    }

    public void setTipoPer(String tipoPer) {
        this.tipoPer = tipoPer;
    }

    public String getNombrePer() {
        return nombrePer;
    }

    public void setNombrePer(String nombrePer) {
        this.nombrePer = nombrePer;
    }

    public String getApellidoPer() {
        return apellidoPer;
    }

    public void setApellidoPer(String apellidoPer) {
        this.apellidoPer = apellidoPer;
    }

    public String getTipoDocumentoPer() {
        return tipoDocumentoPer;
    }

    public void setTipoDocumentoPer(String tipoDocumentoPer) {
        this.tipoDocumentoPer = tipoDocumentoPer;
    }

    public String getIdentificacionPer() {
        return identificacionPer;
    }

    public void setIdentificacionPer(String identificacionPer) {
        this.identificacionPer = identificacionPer;
    }

    public String getCorreoPer() {
        return correoPer;
    }

    public void setCorreoPer(String correoPer) {
        this.correoPer = correoPer;
    }
    
    
    
}
