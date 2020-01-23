/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataBase.DataAccessObject;

import DataBase.DataTransferObject.Kargo;
import DataBase.DataTransferObject.Marka;
import DataBase.DataTransferObject.Musteri;
import DataBase.DataTransferObject.Urun;
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
public class MusteriDAO {

    public int insert(Musteri musteri) {
        int etkilenen = 0;
        try {

            String sql = "INSERT INTO eticaretio.musteri (ad, soyad, email, telefon, adres,sifre) VALUES(?, ?, ?, ?, ?,?);";
            Connection connection = DatabaseConnection.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, musteri.getAd());
            preparedStatement.setString(2, musteri.getSoyad());
            preparedStatement.setString(3, musteri.getEmail());
            preparedStatement.setString(4, musteri.getTelefon());
            preparedStatement.setString(5, musteri.getAdres());
            preparedStatement.setString(6, musteri.getSifre());

            etkilenen = preparedStatement.executeUpdate();

            DatabaseConnection.close(null, preparedStatement, connection);

        } catch (SQLException ex) {

            System.out.println("musteridao sinifinda insert metodunda hata : " + ex.toString());
            return -1;
        }
        return etkilenen;
    }

    public int toplamMusteri() {

        int musteriSayisi = 0;

        String sql = "SELECT COUNT(musteri.id) AS 'musterisayisi' FROM eticaretio.musteri";

        try {
            // SELECT id, sirket_ad, adres, telefon, website, email FROM eticaretio.kargo;

            Connection connection = DatabaseConnection.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {

                musteriSayisi = resultSet.getInt("musterisayisi");

            } else {
                musteriSayisi = -2;
            }

        } catch (SQLException ex) {
            System.out.println("kargodao sinifi kargofulllist metodu : " + ex.toString());
            return -1;
        }
        return musteriSayisi;
    }

    public boolean musteriLogin(String eposta, String password) {
        // SELECT id, ad, alisfiyati, satisfiyati, ekleme_tarihi, son_kullanma_tarihi, aciklama, kategori_id, marka_id FROM eticaretio.urun;
        boolean sonuc = false;
        String sql = "SELECT id, ad, soyad, email, telefon, adres FROM eticaretio.musteri where email=? and sifre=?";
        Musteri musteri = null;

        try {

            Connection connection = DatabaseConnection.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, eposta);
            preparedStatement.setString(2, password);

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {

                musteri = new Musteri();

                musteri.setId(resultSet.getInt("id"));
                musteri.setAd(resultSet.getString("ad"));
                musteri.setSoyad(resultSet.getString("soyad"));
                musteri.setEmail(resultSet.getString("email"));
                musteri.setTelefon(resultSet.getString("telefon"));
                musteri.setAdres(resultSet.getString("adres"));
                sonuc = true;
            }

        } catch (SQLException ex) {
            System.out.println("musteridao sinifinda  sinifi urun  musteriLogin metodunda hata: " + ex.toString());
            return false;
        }
        return sonuc;
    }

    public Musteri musteriByEposta(String eposta) {
        // SELECT id, ad, alisfiyati, satisfiyati, ekleme_tarihi, son_kullanma_tarihi, aciklama, kategori_id, marka_id FROM eticaretio.urun;

        String sql = "SELECT id, ad, soyad, email, telefon, adres FROM eticaretio.musteri  where email=?;";
        Musteri musteri = null;

        try {

            Connection connection = DatabaseConnection.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, eposta);

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {

                musteri = new Musteri();

                musteri.setId(resultSet.getInt("id"));
                musteri.setAd(resultSet.getString("ad"));
                musteri.setSoyad(resultSet.getString("soyad"));
                musteri.setEmail(resultSet.getString("email"));
                musteri.setTelefon(resultSet.getString("telefon"));
                musteri.setAdres(resultSet.getString("adres"));

            }

        } catch (SQLException ex) {
            System.out.println("nusteridao sinifi urun  musteriByEposta metodunda hata: " + ex.toString());
            return null;
        }
        return musteri;
    }

}
