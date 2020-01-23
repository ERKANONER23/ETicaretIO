package DataBase.DataAccessObject;

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
 * @author (DESSAS) veritabanindaki urun tablosunu kontrol eden sinif
 */
public class UrunDAO {

    public int insert(Urun urun) {
        // INSERT INTO eticaretio.urun (ad, alisfiyati, satisfiyati, ekleme_tarihi, son_kullanma_tarihi, aciklama, kategori_id, marka_id) VALUES('', 0, 0, '', '', '', 0, 0);

        int etkilenen = 0;
        try {
            // INSERT INTO eticaretio.urun (1-ad, 2-alisfiyati, 3-satisfiyati,4 ekleme_tarihi,5 son_kullanma_tarihi,6 aciklama, 7 kategori_id,  8 marka_id) VALUES(?, ?, ?, ?, ?, ?, ?, ?)
            // INSERT INTO eticaretio.urun (ad, alisfiyati, satisfiyati, ekleme_tarihi, son_kullanma_tarihi, aciklama, kategori_id, marka_id, resimyolu) VALUES('', 0, 0, '', '', '', 0, 0, '');

            String sql = "INSERT INTO eticaretio.urun (ad, alisfiyati, satisfiyati, ekleme_tarihi, son_kullanma_tarihi, aciklama, kategori_id, marka_id, resimyolu) VALUES(?, ?, ?, ?, ?, ?, ?, ?,?)";
            Connection connection = DatabaseConnection.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setString(1, urun.getAd());
            preparedStatement.setDouble(2, urun.getAlisFiyati());
            preparedStatement.setDouble(3, urun.getSatisFiyati());
            preparedStatement.setString(4, urun.getEklemeTarihi());
            preparedStatement.setString(5, urun.getSonKullanmaTarihi());
            preparedStatement.setString(6, urun.getAciklama());
            preparedStatement.setInt(7, urun.getKategoriID());
            preparedStatement.setInt(8, urun.getMarkaID());
            preparedStatement.setString(9, urun.getResimYolu());

            etkilenen = preparedStatement.executeUpdate();

            DatabaseConnection.close(null, preparedStatement, connection);

        } catch (SQLException ex) {

            System.out.println("UrunDAO sinifinda insert metodunda hata : " + ex.toString());
            return -1;
        }
        return etkilenen;
    }

    public List<Urun> urunFullList() {
        // SELECT id, ad, alisfiyati, satisfiyati, ekleme_tarihi, son_kullanma_tarihi, aciklama, kategori_id, marka_id FROM eticaretio.urun;

        String sql = "SELECT id, ad, alisfiyati, satisfiyati, ekleme_tarihi, son_kullanma_tarihi, aciklama, kategori_id, marka_id, resimyolu FROM eticaretio.urun;";
        List<Urun> urunArrayList = new ArrayList<>();

        try {

            Connection connection = DatabaseConnection.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {

                Urun urun = new Urun();

                urun.setId(resultSet.getInt("id"));
                urun.setAd(resultSet.getString("ad"));
                urun.setAlisFiyati(resultSet.getDouble("alisfiyati"));
                urun.setSatisFiyati(resultSet.getDouble("satisfiyati"));
                urun.setEklemeTarihi(resultSet.getString("ekleme_tarihi"));
                urun.setSonKullanmaTarihi(resultSet.getString("son_kullanma_tarihi"));
                urun.setAciklama(resultSet.getString("aciklama"));
                urun.setKategoriID(resultSet.getInt("kategori_id"));
                urun.setMarkaID(resultSet.getInt("marka_id"));
                urun.setResimYolu(resultSet.getString("resimyolu"));
                urunArrayList.add(urun);

            }

        } catch (SQLException ex) {
            System.out.println("kategoridao sinifi kategorifulllistmetodu : " + ex.toString());
            return null;
        }
        return urunArrayList;
    }

    public List<Urun> urunByKategoriID(int id) {
        // SELECT id, ad, alisfiyati, satisfiyati, ekleme_tarihi, son_kullanma_tarihi, aciklama, kategori_id, marka_id FROM eticaretio.urun;

        String sql = "SELECT id, ad, alisfiyati, satisfiyati, ekleme_tarihi, son_kullanma_tarihi, aciklama, kategori_id, marka_id, resimyolu FROM eticaretio.urun where kategori_id=?;";
        List<Urun> urunArrayList = new ArrayList<>();

        try {

            Connection connection = DatabaseConnection.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {

                Urun urun = new Urun();

                urun.setId(resultSet.getInt("id"));
                urun.setAd(resultSet.getString("ad"));
                urun.setAlisFiyati(resultSet.getDouble("alisfiyati"));
                urun.setSatisFiyati(resultSet.getDouble("satisfiyati"));
                urun.setEklemeTarihi(resultSet.getString("ekleme_tarihi"));
                urun.setSonKullanmaTarihi(resultSet.getString("son_kullanma_tarihi"));
                urun.setAciklama(resultSet.getString("aciklama"));
                urun.setKategoriID(resultSet.getInt("kategori_id"));
                urun.setMarkaID(resultSet.getInt("marka_id"));
                urun.setResimYolu(resultSet.getString("resimyolu"));
                urunArrayList.add(urun);

            }

        } catch (SQLException ex) {
            System.out.println("kategoridao sinifi kategorifulllistmetodu : " + ex.toString());
            return null;
        }
        return urunArrayList;
    }

    public Urun urunByID(int id) {
        // SELECT id, ad, alisfiyati, satisfiyati, ekleme_tarihi, son_kullanma_tarihi, aciklama, kategori_id, marka_id FROM eticaretio.urun;

        String sql = "SELECT id, ad, alisfiyati, satisfiyati, ekleme_tarihi, son_kullanma_tarihi, aciklama, kategori_id, marka_id, resimyolu FROM eticaretio.urun where id=?;";
        Urun urun = null;

        try {

            Connection connection = DatabaseConnection.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, id);

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {

                urun = new Urun();

                urun.setId(resultSet.getInt("id"));
                urun.setAd(resultSet.getString("ad"));
                urun.setAlisFiyati(resultSet.getDouble("alisfiyati"));
                urun.setSatisFiyati(resultSet.getDouble("satisfiyati"));
                urun.setEklemeTarihi(resultSet.getString("ekleme_tarihi"));
                urun.setSonKullanmaTarihi(resultSet.getString("son_kullanma_tarihi"));
                urun.setAciklama(resultSet.getString("aciklama"));
                urun.setKategoriID(resultSet.getInt("kategori_id"));
                urun.setMarkaID(resultSet.getInt("marka_id"));
                urun.setResimYolu(resultSet.getString("resimyolu"));

            }

        } catch (SQLException ex) {
            System.out.println("kategoridao sinifi urun  urunByID metodunda hata: " + ex.toString());
            return null;
        }
        return urun;
    }

    public List<Urun> sonEklenenUrunler() {
        // SELECT id, ad, alisfiyati, satisfiyati, ekleme_tarihi, son_kullanma_tarihi, aciklama, kategori_id, marka_id FROM eticaretio.urun;

        String sql = "SELECT * FROM eticaretio.urun ORDER by  eticaretio.urun.id DESC LIMIT 5;";
        List<Urun> urunArrayList = new ArrayList<>();

        try {

            Connection connection = DatabaseConnection.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {

                Urun urun = new Urun();

                urun.setId(resultSet.getInt("id"));
                urun.setAd(resultSet.getString("ad"));
                urun.setAlisFiyati(resultSet.getDouble("alisfiyati"));
                urun.setSatisFiyati(resultSet.getDouble("satisfiyati"));
                urun.setEklemeTarihi(resultSet.getString("ekleme_tarihi"));
                urun.setSonKullanmaTarihi(resultSet.getString("son_kullanma_tarihi"));
                urun.setAciklama(resultSet.getString("aciklama"));
                urun.setKategoriID(resultSet.getInt("kategori_id"));
                urun.setMarkaID(resultSet.getInt("marka_id"));
                urun.setResimYolu(resultSet.getString("resimyolu"));
                urunArrayList.add(urun);

            }

        } catch (SQLException ex) {
            System.out.println("kategoridao sinifi sonEklenenUrunler hata : " + ex.toString());
            return null;
        }
        return urunArrayList;
    }

    public List<Urun> ayniKategoridekiUrunler(int kategoirid) {
        // SELECT id, ad, alisfiyati, satisfiyati, ekleme_tarihi, son_kullanma_tarihi, aciklama, kategori_id, marka_id FROM eticaretio.urun;

        String sql = "SELECT * FROM eticaretio.urun WHERE urun.kategori_id=? ORDER by  eticaretio.urun.id DESC LIMIT 5 ;";
        List<Urun> urunArrayList = new ArrayList<>();

        try {

            Connection connection = DatabaseConnection.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, kategoirid);

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {

                Urun urun = new Urun();

                urun.setId(resultSet.getInt("id"));
                urun.setAd(resultSet.getString("ad"));
                urun.setAlisFiyati(resultSet.getDouble("alisfiyati"));
                urun.setSatisFiyati(resultSet.getDouble("satisfiyati"));
                urun.setEklemeTarihi(resultSet.getString("ekleme_tarihi"));
                urun.setSonKullanmaTarihi(resultSet.getString("son_kullanma_tarihi"));
                urun.setAciklama(resultSet.getString("aciklama"));
                urun.setKategoriID(resultSet.getInt("kategori_id"));
                urun.setMarkaID(resultSet.getInt("marka_id"));
                urun.setResimYolu(resultSet.getString("resimyolu"));
                urunArrayList.add(urun);

            }

        } catch (SQLException ex) {
            System.out.println("kategoridao sinifi ayniKategoridekiUrunler hata : " + ex.toString());
            return null;
        }
        return urunArrayList;
    }

}
