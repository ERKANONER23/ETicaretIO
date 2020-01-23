/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataBase.DataAccessObject;

import DataBase.DataTransferObject.Kategori;
import DataBase.DatabaseConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author (DESSAS)
 */
public class KartegoriDAO {

    /**
     *
     * @param kategori aldigi kategori nesnesini veritabanindaki kategori
     * tablosuna ekler
     * @return eger eklenmisse geriye int deger donderir -1 donerse
     * eklenmemisitr
     *
     */
    public int insert(Kategori kategori) {
        int etkilenen = 0;
        try {
            //INSERT INTO eticaretio.kategori (ad, aciklama) VALUES('', '');
            String sql = "INSERT INTO eticaretio.kategori (ad, aciklama) VALUES(?, ?)";
            Connection connection = DatabaseConnection.getConnection();
            
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, kategori.getAd());
            preparedStatement.setString(2, kategori.getAciklama());
            
            etkilenen = preparedStatement.executeUpdate();
            
            DatabaseConnection.close(null, preparedStatement, connection);
            
        } catch (SQLException ex) {
            
            System.out.println("KategoriDAO sinifinda insert metodunda hata : " + ex.toString());
            return -1;
        }
        return etkilenen;
    }

    /**
     *
     * kategori tablosundaki tum bilgileri doderen metod geriye arraylis
     * seklinde verileri donderir
     */
    public List<Kategori> kategoriFullList() {
        
        String sql = "SELECT id, ad, aciklama FROM eticaretio.kategori;";
        List<Kategori> kategoriArrayList = new ArrayList<>();
        
        try {
            // SELECT id, sirket_ad, adres, telefon, website, email FROM eticaretio.kargo;

            Connection connection = DatabaseConnection.getConnection();
            
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();
            
            while (resultSet.next()) {
                
                Kategori kategori = new Kategori();
                
                kategori.setId(resultSet.getInt("id"));
                kategori.setAd(resultSet.getString("ad"));
                kategori.setAciklama(resultSet.getString("aciklama"));
                
                kategoriArrayList.add(kategori);
                
            }
            
        } catch (SQLException ex) {
            System.out.println("kategoridao sinifi kategorifulllistmetodu : " + ex.toString());
            return null;
        }
        return kategoriArrayList;
    }

    /**
     * bu metod kategori tablosunda id ve ad degerlerini dondermeketedir
     */
    public Map<Integer, String> kategoriIDAdList() {
        
        String sql = "SELECT id, ad FROM eticaretio.kategori;";
        // List<Kategori> kategoriArrayList = new ArrayList<>();
        Map<Integer, String> IDAdList = new LinkedHashMap<>();
        
        try {
            // SELECT id, sirket_ad, adres, telefon, website, email FROM eticaretio.kargo;

            Connection connection = DatabaseConnection.getConnection();
            
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();
            
            while (resultSet.next()) {
                
                int id = resultSet.getInt("id");
                String ad = resultSet.getString("ad");
                
                IDAdList.put(id, ad);
                
            }
            
        } catch (SQLException ex) {
            System.out.println("kategoridao sinifi kategoriidad metodudna hata : " + ex.toString());
            return null;
        }
        return IDAdList;
    }

}
