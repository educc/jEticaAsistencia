/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package logica;



/**
 *
 * @author edward
 */
public class SQLString {
    
    public static String toquery(String cadenasql, String[] parametros){
        String sqlquery = "";
        int i,j,n,nParametros;
        nParametros = parametros.length;
        n = cadenasql.length();
        j = 0;
        for(i = 0; i < n; i++){
            char c = cadenasql.charAt(i);
            
            if( c == '?' && j < nParametros){
                sqlquery += escapeSQL(parametros[j]);
                j++;
            }else{
                sqlquery += c;
            }
        }
        return sqlquery;
    }
    
    public static String escapeSQL(String cadena){
        return cadena.replace("\\", "\\\\").replace("'", "\\'");
    }

    
    public static void main(String args[]) {
        String sql = "INSERT INTO tabla(a,b,c) VALUES('?',?,'?');";
        String [] parametros = {"intro1","intro2","intro3","asdf"};
        System.out.println( SQLString.toquery(sql, parametros) );
    }
        
    
}
