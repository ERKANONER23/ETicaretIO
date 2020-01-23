/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataBase.DataAccessObject;

import DataBase.DataTransferObject.Satis;
import DataBase.DataTransferObject.SatisUrun;
import DataBase.DatabaseConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author (DESSAS)
 */
public class SatisUrunDAO {

    public int insert(SatisUrun satisUrun) {
        int etkilenen = 0;
        try {
            // INSERT INTO eticaretio.satis_urun (satis_id, urun_id) VALUES(0, 0);

            String sql = "INSERT INTO eticaretio.satis_urun (satis_id, urun_id) VALUES(?, ?);";
            Connection connection = DatabaseConnection.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, satisUrun.getSatisID());
            preparedStatement.setInt(2, satisUrun.getUrunID());

            etkilenen = preparedStatement.executeUpdate();

            DatabaseConnection.close(null, preparedStatement, connection);

        } catch (SQLException ex) {

            System.out.println("SatisUrunDAO sinifinda insert metodunda hata : " + ex.toString());
            return -1;
        }
        return etkilenen;
    }
}
