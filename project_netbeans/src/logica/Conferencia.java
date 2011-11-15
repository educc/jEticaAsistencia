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
public class Conferencia {
    private int id;
    private String tema;
    private Date horaInicio;
    private Date horaFin;
    private char tipo;
    private int aforo;
    private int vacantes;

    public static final char CONFERENCIA = 'c';
    public static final char TALLER = 't';
    
    public Conferencia() {
        id = -1;
        tema = "";
        horaInicio = new Date("1/1/1");
        horaFin = new Date("1/1/1");
        tipo = 'x';
        aforo = 0;
        vacantes = 0;
    }
    
    

    public int getAforo() {
        return aforo;
    }

    public void setAforo(int aforo) {
        this.aforo = aforo;
    }

    public Date getHoraFin() {
        return horaFin;
    }

    public void setHoraFin(Date horaFin) {
        this.horaFin = horaFin;
    }

    public Date getHoraInicio() {
        return horaInicio;
    }

    public void setHoraInicio(Date horaInicio) {
        this.horaInicio = horaInicio;
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

    public char getTipo() {
        return tipo;
    }

    public void setTipo(char tipo) {
        this.tipo = tipo;
    }

    public int getVacantes() {
        return vacantes;
    }

    public void setVacantes(int vacantes) {
        this.vacantes = vacantes;
    }
}
