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
public class SatisDetay {
    
    
    private int satisID;
    private int urunID;
    private int adet;
    private double fiyat;
    private double indirim;

    public SatisDetay() {
    }

    public SatisDetay(int adet, double fiyat, double indirim) {
        this.adet = adet;
        this.fiyat = fiyat;
        this.indirim = indirim;
    }

    public double getIndirim() {
        return indirim;
    }

    public void setIndirim(double indirim) {
        this.indirim = indirim;
    }

    public int getSatisID() {
        return satisID;
    }

    public void setSatisID(int satisID) {
        this.satisID = satisID;
    }

    public int getUrunID() {
        return urunID;
    }

    public void setUrunID(int urunID) {
        this.urunID = urunID;
    }

    public int getAdet() {
        return adet;
    }

    public void setAdet(int adet) {
        this.adet = adet;
    }

    public double getFiyat() {
        return fiyat;
    }

    public void setFiyat(double fiyat) {
        this.fiyat = fiyat;
    }

    @Override
    public String toString() {
        return "SatisDetay{" + "satisID=" + satisID + ", urunID=" + urunID + ", adet=" + adet + ", fiyat=" + fiyat + ", indirim=" + indirim + '}';
    }
    
    
    
}
