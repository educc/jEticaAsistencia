/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package logica;

import datos.Conexiondb;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author edward
 */
public class Datosbd {
    private Conexiondb bd;
    
    public Datosbd(){
        String host = "localhost";
        int puerto = 3306;
        String nombrebd = "eventos";
        String user = "root";
        String pass = "root";
        bd = new Conexiondb(host,puerto,nombrebd,user,pass, Conexiondb.MYSQL);
    }
    
    public Asistente indexOf(String dni) throws ClassNotFoundException, SQLException{
        Asistente asis = new Asistente();
        
        String strsql;
        String[] parametros = new String[1];
        
        strsql = "SELECT dni_asi, fechaRegistro_asi, nombres_asi, " +
                " apellidos_asi, correo_asi, tipo_asi " +
                " FROM asistente WHERE dni_asi like '?'";
        parametros[0] = dni;
                
        strsql = SQLString.toquery(strsql, parametros);
        ResultSet rs = bd.conectarConsultar(strsql);
        while( rs.next() ){
            asis.setDni( rs.getString("dni_asi"));
            asis.setFechaRegistro( rs.getDate("fechaRegistro_asi"));
            asis.setNombres( rs.getString("nombres_asi"));
            asis.setApellidos( rs.getString("apellidos_asi"));
            asis.setCorreo( rs.getString( "correo_asi"));
            asis.setTipo( rs.getString("tipo_asi"));
        }
        bd.cerrarConexion();
        
        return asis;
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
        
        strsql = "INSERT INTO universidad(nombre_uni, region_uni)" +
                 " VALUES('?','?')";
        
        parametros[0] = u.getNombre();
        parametros[1] = u.getRegion();
        
        strsql = SQLString.toquery(strsql, parametros);
        bd.conectarEjecutar(strsql);
        
    }
    
    public void addAsistente(Asistente asis) 
            throws ClassNotFoundException, SQLException
    {
        String strsql;
        String[] parametros = new String[5];
        
        strsql = "INSERT INTO asistente " +
                " (dni_asi, nombres_asi, apellidos_asi, correo_asi, tipo_asi, fechaRegistro_asi) " +
                " VALUES ('?','?','?','?','?', now() )";
        
        parametros[0] = asis.getDni();
        parametros[1] = asis.getNombres();
        parametros[2] = asis.getApellidos();
        parametros[3] = asis.getCorreo();
        parametros[4] = asis.getTipo();
        
        
        strsql = SQLString.toquery(strsql, parametros);
        bd.conectarEjecutar(strsql);
    }
    
    public List<Conferencia> allConferencias(Evento e) throws ClassNotFoundException, SQLException{
        List<Conferencia> conferencias = new ArrayList();
        
        String strsql;
        String[] parametros = new String[1];
        
        strsql = "SELECT id_con, tema_con, fechaInicio_con, fechaFin_con,";
        strsql += "aforo_con, vacantes_con,lugar_con FROM conferencia ";
        strsql += " WHERE id_eve=?";
        parametros[0] = String.valueOf(e.getId());
        
        strsql = SQLString.toquery(strsql, parametros);
        ResultSet rs = bd.conectarConsultar(strsql);
        while( rs.next() ){
            Conferencia c = new Conferencia();
            
            c.setId( rs.getInt("id_con") );
            c.setTema( rs.getString("tema_con") );
            c.setFechaInicio( rs.getDate("fechaInicio_con"));
            c.setFechaFin( rs.getDate("fechaFin_con"));
            c.setAforo( rs.getInt("aforo_con"));
            c.setVacantes( rs.getInt("vacantes_con"));
            c.setLugar( rs.getString("lugar_con"));
            
            conferencias.add(c);
        }
        bd.cerrarConexion();
        return conferencias;
    }
    
    public List<Evento> allEventos() throws ClassNotFoundException, SQLException{
        List<Evento> eventos = new ArrayList();
        
        String strsql;
        
        strsql = "SELECT id_eve, nombre_eve, fechaInicio_eve, fechaFin_eve,";
        strsql += " costoEstudiante_eve, costoProfesional_eve ";
        strsql += " FROM evento";

        ResultSet rs = bd.conectarConsultar(strsql);
        while( rs.next() ){
            Evento e = new Evento();
            
            e.setId( rs.getInt("id_eve"));
            e.setNombre( rs.getString("nombre_eve"));
            e.setFechaInicio( rs.getDate("fechaInicio_eve"));
            e.setFechaFin( rs.getDate("fechaFin_eve"));
            e.setCostoEstudiante( rs.getFloat( "costoEstudiante_eve" ));
            e.setCostoProfesional( rs.getFloat( "costoProfesional_eve" ));
            
            eventos.add(e);
        }      
        bd.cerrarConexion();
        return eventos;
    }
    
    public List<Taller> allTaller(Evento e) throws ClassNotFoundException, SQLException{
        List<Taller> talleres = new ArrayList();
        
        String strsql;
        String[] parametros = new String[1];
        
        strsql = "SELECT id_tal, tema_tal, fechaInicio_tal, fechaFin_tal," +
                 "aforo_tal, vacantes_tal,lugar_tal, costoEstudiante_tal, " +
                 "costoProfesional_tal " +
                 "FROM conferencia WHERE id_eve=?";
        parametros[0] = String.valueOf(e.getId());
        
        strsql = SQLString.toquery(strsql, parametros);
        ResultSet rs = bd.conectarConsultar(strsql);
        while( rs.next() ){
            Taller t = new Taller();
            
            t.setId( rs.getInt("id_tal") );
            t.setTema( rs.getString("tema_tal") );
            t.setFechaInicio( rs.getDate("fechaInicio_tal"));
            t.setFechaFin( rs.getDate("fechaFin_tal"));
            t.setAforo( rs.getInt("aforo_tal"));
            t.setVacantes( rs.getInt("vacantes_tal"));
            t.setLugar( rs.getString("lugar_tal"));
            t.setCostoEstudiante( rs.getFloat("costoEstudiante_tal"));
            t.setCostoProfesional( rs.getFloat("costoProfesional_tal"));
            
            talleres.add(t);
        }
        bd.cerrarConexion();
        return talleres;
    }
    
    /**
     * 
     * @param asis
     * @param conf
     * @param certificado 0 = no paga por certificado; 1 = paga por certificado
     * @throws ClassNotFoundException
     * @throws SQLException 
     */
    
    public void addAsistenciaConferencia
            (Asistente asis, Conferencia conf, int certificado) 
            throws ClassNotFoundException, SQLException
    {
        String strsql;
        String[] parametros = new String[3];
        
        strsql = "INSERT INTO asistencia_conferencia(dni_asi,id_con, certificado_detasi) " +
                 " VALUES('?', ?, ?)";
        parametros[0] = asis.getDni();
        parametros[1] = String.valueOf( conf.getId() );
        parametros[2] = String.valueOf( certificado);
        
        strsql = SQLString.toquery(strsql, parametros);
        bd.conectarEjecutar(strsql);
    }
    
    public void addAsistenciaTaller
            (Asistente asis, Taller tal, int certificado)
            throws ClassNotFoundException, SQLException
    {
        String strsql;
        String[] parametros = new String[3];
        
        strsql = "INSERT INTO asistencia_taller(dni_asi,id_tal, certificado_detasi) " +
                 " VALUES('?', ?, ?)";
        parametros[0] = asis.getDni();
        parametros[1] = String.valueOf( tal.getId() );
        parametros[2] = String.valueOf( certificado);
        
        strsql = SQLString.toquery(strsql, parametros);
        bd.conectarEjecutar(strsql);
    } 
    
    public static void main(String[] args) throws SQLException, ClassNotFoundException{
        Datosbd db = new Datosbd();
        /*Universidad u = new Universidad("USAT", "LAMBAYEQUE");
        db.addUniversidad(u);*/
        List<Evento> list = db.allEventos();
        for( Object obj: list){
            System.out.println(obj);
        }
    }
}

