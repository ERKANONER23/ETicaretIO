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
public class OzellikTip {

    private int id;
    private String ad;
    private String aciklama;
    private int kategoriID;

    public OzellikTip() {
    }

    public OzellikTip(int id, String ad, String aciklama) {
        this.id = id;
        this.ad = ad;
        this.aciklama = aciklama;
    }

    public String getAciklama() {
        return aciklama;
    }

    public void setAciklama(String aciklama) {
        this.aciklama = aciklama;
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

    public int getKategoriID() {
        return kategoriID;
    }

    public void setKategoriID(int kategoriID) {
        this.kategoriID = kategoriID;
    }

    @Override
    public String toString() {
        return "OzellikTip{" + "id=" + id + ", ad=" + ad + ", aciklama=" + aciklama + ", kategoriID=" + kategoriID + '}';
    }

}
