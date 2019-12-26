package DataBase;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * 
 * bu sinif veritabani ile connetion olusturur ve
 * bu sinif static siniftir 
 * siniftan nesne olsuturulmaz
 * sadece static metodlar olusturulur
 *
 */
public class DatabaseConnection {

    private DatabaseConnection() {
    }
    /**
     * veritabani ile connectin nesnesi olusturup donderir
     * @return null gerlise eger baglanti olusturulmamistir
     * @return connection nesnesi olusturulursa connection nesnesi donderilir
     */
    public static Connection getConnection() {
        Connection connection = null;
        try {
            // Class.forName("com.mysql.jdbc.Driver");
            Class.forName("com.mysql.cj.jdbc.Driver");
            // veri tabani konumunu belirlelme ve veritabanini belirtme
        String url = "jdbc:mysql://localhost:3306/eticaretio?useUnicode=true&useLegacyDatetimeCode=false&serverTimezone=Turkey";
            // veritabani kullanici adi
            String user = "root";
            // veritabani sifresi
            String password = "DESSAS";
            // veri tabani ile baglanti kurma
            connection = DriverManager.getConnection(url, user, password);
        } catch (Exception e) {
            connection = null;
            System.out.println("verıtabanı ıle baglantı olsuturulamadı ");
            System.out.println("databaseconnectıon sınıfı getconnectıon metodu");
            System.out.println(e.toString());
            return null;
        } finally {
            return connection;
        }
    }

    /**
     * veritabani ile olsuturulan baglantilari sonlandiran metod
     */
    public static  boolean close(ResultSet resultSet, PreparedStatement preparedStatement, Connection connection) {
        boolean sonuc = false;
        if (resultSet != null) {
            try {
                resultSet.close();
                sonuc = true;
            } catch (SQLException ex) {
                System.out.println("resultset sonlandirilirken ata alindi ");
                System.out.println("databaseconnection sinifi close metodu");
                System.out.println(ex.toString());
                return false;

            }
        }
        if (preparedStatement != null) {
            try {
                preparedStatement.close();
                sonuc = true;
            } catch (SQLException ex) {
                System.out.println("resultset sonlandirilirken ata alindi ");
                System.out.println("databaseconnection sinifi close metodu");
                System.out.println(ex.toString());
                return false;
            }
        }
        if (connection != null) {
            try {
                connection.close();
                sonuc = true;
            } catch (SQLException ex) {
                System.out.println("resultset sonlandirilirken ata alindi ");
                System.out.println("databaseconnection sinifi close metodu");
                System.out.println(ex.toString());
                return false;
            }
        }
        return sonuc;
    }

}
