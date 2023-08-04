package cart;

import java.sql.Connection;
import java.sql.DriverManager;
 
public class ConnectDBFactory {
    private static Connection con;
 
    public static Connection CreateMySqlConnection
    (String database)throws Exception{
        String url="com.mysql.jdbc.Driver";
        Class.forName(url);
        String dbURL = "jdbc:mysql://localhost:3306/"
            +database+"?user=root&password=";   
        con=DriverManager.getConnection(dbURL);
 
        return con;
    }
}