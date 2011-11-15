/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package logica;

import datos.Conexiondb;
import java.sql.SQLException;

/**
 *
 * @author edward
 */
public class Datosbd {
    private Conexiondb bd;
    
    public Datosbd(){
        String host = "127.0.0.1";
        int puerto = 3306;
        String nombrebd = "eventos";
        String user = "root";
        String pass = "";
        bd = new Conexiondb(host,puerto,nombrebd,user,pass, Conexiondb.MYSQL);
    }
    
    public void addEvento(Evento e) throws ClassNotFoundException, SQLException{
        /*String strsql;
        strsql = "INSERT INTO evento(nombre_uni,region_uni) ";
        strsql += " VALUES('?','?')";
        String[] parametros = new String[2];
        parametros[0] = e.getNombre();
        parametros[1] = e.getFecha().t
        
        strsql = SQLString.toquery(strsql, parametros);
        bd.conectarEjecutar(strsql);*/
    }
    
    public void addUniversidad(Universidad u) throws ClassNotFoundException, SQLException{
        String strsql;
        String[] parametros = new String[2];
        
        strsql = "INSERT INTO universidad(nombre_uni, region_uni)";
        strsql += " VALUES('?','?')";
        
        parametros[0] = u.getNombre();
        parametros[1] = u.getRegion();
        
        strsql = SQLString.toquery(strsql, parametros);
        bd.conectarEjecutar(strsql);
    }
    
    public void addAsistente()
    
    public static void main(String[] args) throws SQLException, ClassNotFoundException{
        Datosbd db = new Datosbd();
        Universidad u = new Universidad("USAT", "LAMBAYEQUE");
        db.addUniversidad(u);
    }
}
