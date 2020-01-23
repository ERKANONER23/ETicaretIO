
package DataBase;

import java.sql.Connection;

/**
 *
 * @author (DESSAS)
 */
public class DatabaseConnectionTest {
    
    public static void main(String[] args) {
        connectionTest();
    }
    
    private static void connectionTest(){
        Connection connection=DatabaseConnection.getConnection();
        if (connection==null) {
            System.out.println("connection null");
        }else{
            System.out.println("connection nesnesi olsuturuldu");
        }
        DatabaseConnection.close(null, null, connection);
    }
    
}
