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
    private int id;
    private String dni;
    private String nombres;
    private String apellidos;
    private String correo;
    private boolean certificado;
    private Date fechaRegistro;

    public Asistente() {
        id = -1;
        dni = "";
        nombres = "";
        apellidos ="";
        correo = "";
        certificado = false;
        fechaRegistro = new Date("1/1/1");
    }

    public Asistente(String nombres, String apellidos, 
                    String correo, boolean certificado) 
    {
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.correo = correo;
        this.certificado = certificado;
    }

    
    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public boolean isCertificado() {
        return certificado;
    }

    public void setCertificado(boolean certificado) {
        this.certificado = certificado;
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

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }
    
    
    
}
