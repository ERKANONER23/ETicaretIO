package DataBase.DataTransferObject;

import java.util.Date;

/**
 *
 * @author (DESSAS) veritabanindaki urun tablosuna karsilik gelen bean sinifi
 */
public class Urun {

    private int id;
    private String ad;
    private double alisFiyati;
    private double satisFiyati;
    private String eklemeTarihi;
    private String sonKullanmaTarihi;
    private String aciklama;
    private int kategoriID;
    private int markaID;
    private String resimYolu;

    public Urun() {
    }

    public Urun(int id, String ad, double alisFiyati, double satisFiyati, String eklemeTarihi, String sonKullanmaTarihi, String aciklama, int kategoriID, int markaID, String resimYolu) {
        this.id = id;
        this.ad = ad;
        this.alisFiyati = alisFiyati;
        this.satisFiyati = satisFiyati;
        this.eklemeTarihi = eklemeTarihi;
        this.sonKullanmaTarihi = sonKullanmaTarihi;
        this.aciklama = aciklama;
        this.kategoriID = kategoriID;
        this.markaID = markaID;
        this.resimYolu = resimYolu;
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

    public double getAlisFiyati() {
        return alisFiyati;
    }

    public void setAlisFiyati(double alisFiyati) {
        this.alisFiyati = alisFiyati;
    }

    public double getSatisFiyati() {
        return satisFiyati;
    }

    public void setSatisFiyati(double satisFiyati) {
        this.satisFiyati = satisFiyati;
    }

    public String getEklemeTarihi() {
        return eklemeTarihi;
    }

    public void setEklemeTarihi(String eklemeTarihi) {
        this.eklemeTarihi = eklemeTarihi;
    }

    public String getSonKullanmaTarihi() {
        return sonKullanmaTarihi;
    }

    public void setSonKullanmaTarihi(String sonKullanmaTarihi) {
        this.sonKullanmaTarihi = sonKullanmaTarihi;
    }

    public String getAciklama() {
        return aciklama;
    }

    public void setAciklama(String aciklama) {
        this.aciklama = aciklama;
    }

    public int getKategoriID() {
        return kategoriID;
    }

    public void setKategoriID(int kategoriID) {
        this.kategoriID = kategoriID;
    }

    public int getMarkaID() {
        return markaID;
    }

    public void setMarkaID(int markaID) {
        this.markaID = markaID;
    }

    public String getResimYolu() {
        return resimYolu;
    }

    public void setResimYolu(String resimYolu) {
        this.resimYolu = resimYolu;
    }

    @Override
    public String toString() {
        return "Urun{" + "id=" + id + ", ad=" + ad + ", alisFiyati=" + alisFiyati + ", satisFiyati=" + satisFiyati + ", eklemeTarihi=" + eklemeTarihi + ", sonKullanmaTarihi=" + sonKullanmaTarihi + ", aciklama=" + aciklama + ", kategoriID=" + kategoriID + ", markaID=" + markaID + ", resimYolu=" + resimYolu + '}';
    }

}
