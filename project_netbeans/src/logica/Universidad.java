/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package logica;

/**
 *
 * @author edward
 */
public class Universidad {
    private int id;
    private String nombre;
    private String region;

    public Universidad() {
        this.id = -1;
        this.nombre = "";
        this.region = "";
    }    
    
    public Universidad(int id, String nombre, String region) {
        this.id = id;
        this.nombre = nombre;
        this.region = region;
    }

    public Universidad(String nombre, String region) {
        this.id = -1;
        this.nombre = nombre;
        this.region = region;
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

    public String getRegion() {
        return region;
    }

    public void setRegion(String region) {
        this.region = region;
    }
    
    
           
}
