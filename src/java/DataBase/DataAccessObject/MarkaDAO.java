/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataBase.DataAccessObject;

import DataBase.DataTransferObject.Kargo;
import DataBase.DataTransferObject.Kategori;
import DataBase.DataTransferObject.Marka;
import DataBase.DatabaseConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author (DESSAS)
 */
public class MarkaDAO {

    public int insert(Marka marka) {
        int etkilenen = 0;
        try {

            String sql = "INSERT INTO eticaretio.marka (ad, aciklama, resimyolu) VALUES(?, ?, ?);";
            Connection connection = DatabaseConnection.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, marka.getAd());
            preparedStatement.setString(2, marka.getAciklama());
            preparedStatement.setString(3, marka.getResimYol());

            etkilenen = preparedStatement.executeUpdate();

            DatabaseConnection.close(null, preparedStatement, connection);

        } catch (SQLException ex) {

            System.out.println("MarkaDAO sinifinda insert metodunda hata : " + ex.toString());
            return -1;
        }
        return etkilenen;
    }

    /**
     *
     * kategori tablosundaki tum bilgileri doderen metod geriye arraylis
     * seklinde verileri donderir
     */
    public List<Marka> markaFullList() {

        String sql = "SELECT id, ad, aciklama, resimyolu FROM eticaretio.marka;";
        List<Marka> markaArrayList = new ArrayList<>();

        try {
            // SELECT id, sirket_ad, adres, telefon, website, email FROM eticaretio.kargo;

            Connection connection = DatabaseConnection.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {

                Marka marka = new Marka();

                marka.setId(resultSet.getInt("id"));
                marka.setAd(resultSet.getString("ad"));
                marka.setAciklama(resultSet.getString("aciklama"));
                marka.setResimYol(resultSet.getString("resimyolu"));

                markaArrayList.add(marka);

            }

        } catch (SQLException ex) {
            System.out.println("markadao sinifi markaifulllistmetodu : " + ex.toString());
            return null;
        }
        return markaArrayList;
    }

}
