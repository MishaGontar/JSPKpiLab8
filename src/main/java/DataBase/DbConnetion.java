package DataBase;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnetion {
    private static String url = "jdbc:mysql://localhost:3306/laba";
    private static String user = "root";
    private static String password = "root";
    private static Connection connection ;


    public static Connection getConnection(){
        if(connection!=null){
            return connection;
        }
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(url,user,password);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }
}
