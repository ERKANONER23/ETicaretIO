/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataBase.DataAccessObject;

import DataBase.DataTransferObject.Marka;
import DataBase.DataTransferObject.Musteri;
import DataBase.DataTransferObject.Satis;
import DataBase.DatabaseConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author (DESSAS)
 */
public class SatisDAO {

    public int insert(Satis satis) {
        int etkilenen = 0;
        try {
            // INSERT INTO eticaretio.satis (1 musteri_id, 2 satis_tarihi,3  toplam_tutar,4 kargo_id, 5 kargo_takip_no) VALUES(0, '', 0, 0, '');

            String sql = "INSERT INTO eticaretio.satis (musteri_id, satis_tarihi, toplam_tutar, kargo_id, kargo_takip_no) VALUES(?, ?, ?, ?, ?);";
            Connection connection = DatabaseConnection.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, satis.getMusteriID());
            preparedStatement.setString(2, satis.getSatistarihi());
            preparedStatement.setDouble(3, satis.getToplamTutar());
            preparedStatement.setInt(4, satis.getKargoID());
            preparedStatement.setString(5, satis.getKargoTakipNo());

            etkilenen = preparedStatement.executeUpdate();

            DatabaseConnection.close(null, preparedStatement, connection);

        } catch (SQLException ex) {

            System.out.println("SatisDAO sinifinda insert metodunda hata : " + ex.toString());
            return -1;
        }
        return etkilenen;
    }

    public int sayisIDBySatisTarihi(String satisTarihi) {
        // SELECT id, ad, alisfiyati, satisfiyati, ekleme_tarihi, son_kullanma_tarihi, aciklama, kategori_id, marka_id FROM eticaretio.urun;

        String sql = "SELECT id FROM eticaretio.satis where satis_tarihi=?;";
        int sonuc = 0;
        try {

            Connection connection = DatabaseConnection.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, satisTarihi);

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                sonuc = resultSet.getInt("id");

            }

        } catch (SQLException ex) {
            System.out.println("SatisDAO sinifi urun  sayisIDBySatisTarihi metodunda hata: " + ex.toString());
            return 0;
        }
        return sonuc;
    }

}
