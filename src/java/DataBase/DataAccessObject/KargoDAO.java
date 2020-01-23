package DataBase.DataAccessObject;

import DataBase.DataTransferObject.Kargo;
import DataBase.DatabaseConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class KargoDAO {

    /**
     * bu metod kargo tablosuna ekleme yapar
     *
     * @param kargo nesnesinin aldigi propertylerini veritabanindaki sutunlara ekler
     * @return veritabaninda etkilenen satir sayisini donderir
     */
    // public int insert(String sirketAd, String adres, String telefon, String website, String eposta) {
    public int insert(Kargo kargo) {
        int etkilenen = 0;
        try {
            // INSERT INTO eticaretio.kargo (1-sirket_ad, 2-adres, 3-telefon,4- website,5- email) VALUES('?', '?', '?', '?', '?');
            String sql = "INSERT INTO kargo (sirket_ad, adres, telefon, website, email) VALUES(?, ?, ?, ?, ?)";
            Connection connection = DatabaseConnection.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, kargo.getSirketAdi());
            preparedStatement.setString(2, kargo.getAdres());
            preparedStatement.setString(3, kargo.getTelefon());
            preparedStatement.setString(4, kargo.getWebsite());
            preparedStatement.setString(5, kargo.getEmail());

            etkilenen = preparedStatement.executeUpdate();

            DatabaseConnection.close(null, preparedStatement, connection);

        } catch (SQLException ex) {

            System.out.println("KargoDAO sinifinda insert metodunda hata : " + ex.toString());
            return -1;
        }
        return etkilenen;
    }
    /**
     * kargo tablosundaki tum bilgileri getiren metod
     * @exception  eger null deger donderirse hata vardir
     * @return geriye arraylist yapisinda kargo listesini donderir
     */
    public List<Kargo> kargoFullList() {

        String sql = "SELECT id, sirket_ad, adres, telefon, website, email FROM eticaretio.kargo;";
        List<Kargo> kargoArrayList = new ArrayList<>();

        try {
            // SELECT id, sirket_ad, adres, telefon, website, email FROM eticaretio.kargo;

            Connection connection = DatabaseConnection.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {

                Kargo kargo = new Kargo();

                kargo.setId(resultSet.getInt("id"));
                kargo.setSirketAdi(resultSet.getString("sirket_ad"));
                kargo.setAdres(resultSet.getString("adres"));
                kargo.setTelefon(resultSet.getString("telefon"));
                kargo.setWebsite(resultSet.getString("website"));
                kargo.setEmail(resultSet.getString("email"));

                kargoArrayList.add(kargo);

            }

        } catch (SQLException ex) {
            System.out.println("kargodao sinifi kargofulllist metodu : " + ex.toString());
            return null;
        }
        return kargoArrayList;
    }

}
