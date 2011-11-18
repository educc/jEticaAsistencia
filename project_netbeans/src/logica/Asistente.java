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
public class Asistente {
    private String dni;
    private String nombres;
    private String apellidos;
    private String correo;
    private String tipo;
    private Date fechaRegistro;

    public Asistente() {
        dni = "";
        nombres = "";
        apellidos ="";
        correo = "";
        tipo = "a";
        fechaRegistro = new Date("1/1/1");
    }

    public Asistente(String nombres, String apellidos, 
                    String correo, boolean certificado) 
    {
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.correo = correo;
        tipo = "a";
    }

    
    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public Date getFechaRegistro() {
        return fechaRegistro;
    }

    public void setFechaRegistro(Date fechaRegistro) {
        this.fechaRegistro = fechaRegistro;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }
}
