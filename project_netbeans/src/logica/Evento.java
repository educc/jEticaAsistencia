/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package logica;

import java.util.Date;

/**
 *
 * @author edward
 */
public class Evento {
    private int id;
    private String nombre;
    private Date fecha;

    public Evento() {
       this.id = -1;
       this.nombre = "";
       this.fecha = new Date("1/1/1");
    }
    
    public Evento(String nombre, Date fecha) {
        this.nombre = nombre;
        this.fecha = fecha;
    }

    public Evento(int id, String nombre, Date fecha) {
        this.id = id;
        this.nombre = nombre;
        this.fecha = fecha;
    }

    
    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    
}
