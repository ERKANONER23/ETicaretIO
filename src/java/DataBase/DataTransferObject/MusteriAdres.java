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
public class MusteriAdres {
    private int id;
     private int musteriID;
    private String adres;
    private String ad;

    public MusteriAdres() {
    }

    public MusteriAdres(int id, String adres, String ad) {
        this.id = id;
        this.adres = adres;
        this.ad = ad;
    }

    public String getAd() {
        return ad;
    }

    public void setAd(String ad) {
        this.ad = ad;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getMusteriID() {
        return musteriID;
    }

    public void setMusteriID(int musteriID) {
        this.musteriID = musteriID;
    }

    public String getAdres() {
        return adres;
    }

    public void setAdres(String adres) {
        this.adres = adres;
    }

    @Override
    public String toString() {
        return "MusteriAdres{" + "id=" + id + ", musteriID=" + musteriID + ", adres=" + adres + ", ad=" + ad + '}';
    }
    
    
    
}
