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
public class Marka {

    private int id;
    private String ad;
    private String aciklama;
    private String resimYol;

    public Marka() {
    }

    public Marka(int id, String ad, String aciklama, String resimYol) {
        this.id = id;
        this.ad = ad;
        this.aciklama = aciklama;
        this.resimYol = resimYol;
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

    public String getResimYol() {
        return resimYol;
    }

    public void setResimYol(String resimYol) {
        this.resimYol = resimYol;
    }

    @Override
    public String toString() {
        return "Marka{" + "id=" + id + ", ad=" + ad + ", aciklama=" + aciklama + ", resimYol=" + resimYol + '}';
    }

}
