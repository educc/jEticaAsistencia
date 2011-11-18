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
public class Taller {
    private int id;
    private String tema;
    private Date fechaInicio;
    private Date fechaFin;
    private int aforo;
    private int vacantes;
    String lugar;
    private float costoEstudiante;
    private float costoProfesional;
    
    public Taller(){
        id = -1;
        tema = "";
        fechaInicio = fechaFin = new Date("1/1/1");
        aforo = vacantes = 0;
        costoEstudiante = costoProfesional = 0;
        lugar = "";
    }

    public String getLugar() {
        return lugar;
    }

    public void setLugar(String lugar) {
        this.lugar = lugar;
    }

    public int getAforo() {
        return aforo;
    }

    public void setAforo(int aforo) {
        this.aforo = aforo;
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

    public String getTema() {
        return tema;
    }

    public void setTema(String tema) {
        this.tema = tema;
    }

    public int getVacantes() {
        return vacantes;
    }

    public void setVacantes(int vacantes) {
        this.vacantes = vacantes;
    }
    
    
    
}
