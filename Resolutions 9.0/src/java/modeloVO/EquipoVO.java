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
public class EquipoVO {
    
    //ATRIBUTOS
    
    private String idEq;
    private String idEqCli;
    private String idEqEst;
    private String nombreEq;
    private String inventarioEq;
    private String marcaEq;
    private String serieEq;
    private String ubicacionEq;
    
    //CONSTRUCTOR

    public EquipoVO(String idEq, String idEqCli, String idEqEst, String nombreEq, String inventarioEq, String marcaEq, String serieEq, String ubicacionEq) {
        this.idEq = idEq;
        this.idEqCli = idEqCli;
        this.idEqEst = idEqEst;
        this.nombreEq = nombreEq;
        this.inventarioEq = inventarioEq;
        this.marcaEq = marcaEq;
        this.serieEq = serieEq;
        this.ubicacionEq = ubicacionEq;
    }

    public EquipoVO() {
    }
    
    //METODOS GET & SET

    public String getIdEq() {
        return idEq;
    }

    public void setIdEq(String idEq) {
        this.idEq = idEq;
    }

    public String getIdEqCli() {
        return idEqCli;
    }

    public void setIdEqCli(String idEqCli) {
        this.idEqCli = idEqCli;
    }

    public String getIdEqEst() {
        return idEqEst;
    }

    public void setIdEqEst(String idEqEst) {
        this.idEqEst = idEqEst;
    }

    public String getNombreEq() {
        return nombreEq;
    }

    public void setNombreEq(String nombreEq) {
        this.nombreEq = nombreEq;
    }

    public String getInventarioEq() {
        return inventarioEq;
    }

    public void setInventarioEq(String inventarioEq) {
        this.inventarioEq = inventarioEq;
    }

    public String getMarcaEq() {
        return marcaEq;
    }

    public void setMarcaEq(String marcaEq) {
        this.marcaEq = marcaEq;
    }

    public String getSerieEq() {
        return serieEq;
    }

    public void setSerieEq(String serieEq) {
        this.serieEq = serieEq;
    }

    public String getUbicacionEq() {
        return ubicacionEq;
    }

    public void setUbicacionEq(String ubicacionEq) {
        this.ubicacionEq = ubicacionEq;
    }
    
    
}
