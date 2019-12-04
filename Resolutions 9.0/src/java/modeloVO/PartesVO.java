/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modeloVO;

/**
 *
 * @author SHAMAN
 */
public class PartesVO {
    //Atributos
    private String idPart;
    private String idEq;
    private String idEst;
    private String nombrePart;
    private String tipoPart;
    private String comentarioPart;

    //Constructor

    public PartesVO(String idPart, String idEq, String idEst, String nombrePart, String tipoPart, String comentarioPart) {
        this.idPart = idPart;
        this.idEq = idEq;
        this.idEst = idEst;
        this.nombrePart = nombrePart;
        this.tipoPart = tipoPart;
        this.comentarioPart = comentarioPart;
    }
    
    
    public PartesVO(){
        
    }

    //Get y Set

    public String getIdPart() {
        return idPart;
    }

    public void setIdPart(String idPart) {
        this.idPart = idPart;
    }

    public String getIdEq() {
        return idEq;
    }

    public void setIdEq(String idEq) {
        this.idEq = idEq;
    }

    public String getIdEst() {
        return idEst;
    }

    public void setIdEst(String idEst) {
        this.idEst = idEst;
    }

    public String getNombrePart() {
        return nombrePart;
    }

    public void setNombrePart(String nombrePart) {
        this.nombrePart = nombrePart;
    }

    public String getTipoPart() {
        return tipoPart;
    }

    public void setTipoPart(String tipoPart) {
        this.tipoPart = tipoPart;
    }

    public String getComentarioPart() {
        return comentarioPart;
    }

    public void setComentarioPart(String comentarioPart) {
        this.comentarioPart = comentarioPart;
    }

    
    
}
