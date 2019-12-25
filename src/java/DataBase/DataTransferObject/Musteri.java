/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataBase.DataTransferObject;

/**
 *
 * @author (DESSAS)
 */
public class Musteri {

    private int id;
    private String ad;
    private String soyad;
    private String kullaniciadi;
    private String email;
    private String telefon;

    public Musteri() {
    }

    public Musteri(int id, String ad, String soyad, String kullaniciadi, String email, String telefon) {
        this.id = id;
        this.ad = ad;
        this.soyad = soyad;
        this.kullaniciadi = kullaniciadi;
        this.email = email;
        this.telefon = telefon;
    }

    public String getTelefon() {
        return telefon;
    }

    public void setTelefon(String telefon) {
        this.telefon = telefon;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAd() {
        return ad;
    }

    public void setAd(String ad) {
        this.ad = ad;
    }

    public String getSoyad() {
        return soyad;
    }

    public void setSoyad(String soyad) {
        this.soyad = soyad;
    }

    public String getKullaniciadi() {
        return kullaniciadi;
    }

    public void setKullaniciadi(String kullaniciadi) {
        this.kullaniciadi = kullaniciadi;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return "Musteri{" + "id=" + id + ", ad=" + ad + ", soyad=" + soyad + ", kullaniciadi=" + kullaniciadi + ", email=" + email + ", telefon=" + telefon + '}';
    }

}
