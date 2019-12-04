/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import java.util.ArrayList;

/**
 *
 * @author Jaxx
 */
public interface InterfaceCRUD1 {
    public abstract String agregarRegistro();
    public abstract String actualizarRegistro();
    public abstract String eliminarRegistro();
    public abstract ArrayList listar();
    public abstract ArrayList consultar(Object id);
}
