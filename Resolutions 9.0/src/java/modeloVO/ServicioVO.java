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
public class ServicioVO {
    private String idSer;
    private String idPer;
    private String idEq;
    private String fechaIngresoSer;
    private String fechaEntregaSer;
    private String observacionesSer;

    public ServicioVO(String idSer, String idPer, String idEq, String fechaIngresoSer, String fechaEntregaSer, String observacionesSer) {
        this.idSer = idSer;
        this.idPer = idPer;
        this.idEq = idEq;
        this.fechaIngresoSer = fechaIngresoSer;
        this.fechaEntregaSer = fechaEntregaSer;
        this.observacionesSer = observacionesSer;
    }
    
    public ServicioVO() {
        
    }
    
    public String getIdSer() {
        return idSer;
    }

    public void setIdSer(String idSer) {
        this.idSer = idSer;
    }

    public String getIdPer() {
        return idPer;
    }

    public void setIdPer(String idPer) {
        this.idPer = idPer;
    }

    public String getIdEq() {
        return idEq;
    }

    public void setIdEq(String idEq) {
        this.idEq = idEq;
    }

    public String getFechaIngresoSer() {
        return fechaIngresoSer;
    }

    public void setFechaIngresoSer(String fechaIngresoSer) {
        this.fechaIngresoSer = fechaIngresoSer;
    }

    public String getFechaEntregaSer() {
        return fechaEntregaSer;
    }

    public void setFechaEntregaSer(String fechaEntregaSer) {
        this.fechaEntregaSer = fechaEntregaSer;
    }

    public String getObservacionesSer() {
        return observacionesSer;
    }

    public void setObservacionesSer(String observacionesSer) {
        this.observacionesSer = observacionesSer;
    }
}
