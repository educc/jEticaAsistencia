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
    private Date fechaInicio;
    private Date fechaFin;
    private float costoEstudiante;
    private float costoProfesional;
    

    public Evento() {
       this.id = -1;
       this.nombre = "";
       fechaInicio = fechaFin = new Date("1/1/1");
       costoEstudiante = costoProfesional = 0;
    }

    public float getCostoEstudiante() {
        return costoEstudiante;
    }

    public void setCostoEstudiante(float costoEstudiante) {
        this.costoEstudiante = costoEstudiante;
    }

    public float getCostoProfesional() {
        return costoProfesional;
    }

    public void setCostoProfesional(float costoProfesional) {
        this.costoProfesional = costoProfesional;
    }

    public Date getFechaFin() {
        return fechaFin;
    }

    public void setFechaFin(Date fechaFin) {
        this.fechaFin = fechaFin;
    }

    public Date getFechaInicio() {
        return fechaInicio;
    }

    public void setFechaInicio(Date fechaInicio) {
        this.fechaInicio = fechaInicio;
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

    @Override
    public String toString() {
        return this.nombre;
    }
    
    
}
