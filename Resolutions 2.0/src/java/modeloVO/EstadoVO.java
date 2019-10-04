/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modeloVO;

/**
 *
 * @author Jaxx
 */
public class EstadoVO {
    private String idEst;
    private String nombreEst;

    public EstadoVO(String idEst, String nombreEst) {
        this.idEst = idEst;
        this.nombreEst = nombreEst;
    }
    
    public EstadoVO() {
        
    }

    public String getIdEst() {
        return idEst;
    }

    public void setIdEst(String idEst) {
        this.idEst = idEst;
    }

    public String getNombreEst() {
        return nombreEst;
    }

    public void setNombreEst(String nombreEst) {
        this.nombreEst = nombreEst;
    }
}
