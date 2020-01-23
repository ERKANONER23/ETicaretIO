/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataBase.DataAccessObject;

import DataBase.DataTransferObject.Resim;
import DataBase.DatabaseConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author (DESSAS)
 */
public class ResimDAO {

    public int insert(Resim resim) {

        int etkilenen = -1;

        try {

            //INSERT INTO eticaretio.resim (1 id, 2 yol,3  sirano, 4 urun_id) VALUES(0, '', 0, 0);
            String sql = "INSERT INTO eticaretio.resim (id, yol, sirano, urun_id) VALUES(?, ?, ?, ?);";

            Connection connection = DatabaseConnection.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, 0);
            preparedStatement.setString(2, resim.getYol());
            preparedStatement.setInt(3, resim.getSirano());
            preparedStatement.setInt(4, resim.getUrunID());

            etkilenen = preparedStatement.executeUpdate();

        } catch (SQLException ex) {

            System.out.println("resimdao sinifinda insert metodunda hata : " + ex.toString());
            return -1;
        }
        return etkilenen;
    }
}
