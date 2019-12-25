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
public class OzellkDeger {

    private int id;
    private String ad;
    private String aciklama;
    private int ozellikTipID;

    public OzellkDeger() {
    }

    public OzellkDeger(int id, String ad, String aciklama) {
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

    public int getOzellikTipID() {
        return ozellikTipID;
    }

    public void setOzellikTipID(int ozellikTipID) {
        this.ozellikTipID = ozellikTipID;
    }

    @Override
    public String toString() {
        return "OzellkDeger{" + "id=" + id + ", ad=" + ad + ", aciklama=" + aciklama + ", ozellikTipID=" + ozellikTipID + '}';
    }

}
