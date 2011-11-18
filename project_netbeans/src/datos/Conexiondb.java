/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package datos;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author edward
 */
public class Conexiondb {
    private String driver;
    private String connectString;
    private String user;
    private String password;
    private Connection con;
    
    public static final int MYSQL = 1;
    public static final int POSTGRESQL = 2;
    public static final int MSSQL = 3;
    
    public Conexiondb(String host, int puerto, String basedatos, 
                      String xuser, String xpass, int gestorbd){
        this.connectString = "";
        this.driver = "";
        
        switch( gestorbd ){
            case MYSQL:
                driver = "com.mysql.jdbc.Driver";
                connectString = "jdbc:mysql://" + host + ":" + puerto;
                connectString += "/" + basedatos;   
                break;
            case POSTGRESQL:
                driver = "org.postgresql.Driver";
                connectString = "jdbc:postgresql://" + host + ":" + puerto;
                connectString += "/" + basedatos;
                 break;
            case MSSQL:
                
                break;
        }
        
        user = xuser;
        password = xpass;
        con = null;
    }

    public Connection getConexion() {
        return con;
    }
    
    public boolean abrirConexion() throws ClassNotFoundException, SQLException{
        boolean exito = true;
            Class.forName(driver);
            con = DriverManager.getConnection(connectString,user,password);
        return exito;
    }
    
    public boolean cerrarConexion() throws SQLException{
        boolean exito = false;
        if( con != null){
                con.close();
                exito = true;
        }
        return exito;
    }
    
    public boolean abrirConexionTrans(){
        return false;
    }
    
    public void cerrarConexionTrans() throws SQLException{
        con.close();
    }
    
    //cancelar
    
    public ResultSet conectarConsultar(String strSql) throws ClassNotFoundException, SQLException{
        ResultSet rs = null;
        if( this.abrirConexion() ){
                Statement stmt = con.createStatement();
                rs = stmt.executeQuery(strSql);
        }
        //con.close();
        return rs;
    }
    
    public ResultSet consultar(String strSql) throws SQLException{
        ResultSet rs = null;
        Statement stmt = con.createStatement();
        rs = stmt.executeQuery(strSql);
        //con.close();       
        return rs;
    }
    
    
    public void ejectuar(String strSQL) throws SQLException{
        Statement stmt = con.createStatement();
        stmt.execute(strSQL);
        con.close();
    }
    
    public void conectarEjecutar(String strSQL) throws ClassNotFoundException, SQLException{
        if( abrirConexion() ){
            Statement stmt = con.createStatement();
            stmt.execute(strSQL);
        }
        con.close();
    }
    
}
