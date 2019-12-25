/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataBase.DataTransferObject;

import java.util.Date;

/**
 *
 * @author (DESSAS)
 */
public class Satis {

    private int id;
    private Date satisTarihi;
    private double toplamTutar;
    private boolean sepettemi;
    private String kargoTakipNo;
    
    private int musteriID;
    private int kargoID;
    private int siparisDurumID;
    
    public Satis() {
    }

    public Satis(int id, Date satisTarihi, double toplamTutar, boolean sepettemi, String kargoTakipNo) {
        this.id = id;
        this.satisTarihi = satisTarihi;
        this.toplamTutar = toplamTutar;
        this.sepettemi = sepettemi;
        this.kargoTakipNo = kargoTakipNo;
    }

    public String getKargoTakipNo() {
        return kargoTakipNo;
    }

    public void setKargoTakipNo(String kargoTakipNo) {
        this.kargoTakipNo = kargoTakipNo;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getSatisTarihi() {
        return satisTarihi;
    }

    public void setSatisTarihi(Date satisTarihi) {
        this.satisTarihi = satisTarihi;
    }

    public double getToplamTutar() {
        return toplamTutar;
    }

    public void setToplamTutar(double toplamTutar) {
        this.toplamTutar = toplamTutar;
    }

    public boolean isSepettemi() {
        return sepettemi;
    }

    public void setSepettemi(boolean sepettemi) {
        this.sepettemi = sepettemi;
    }

    public int getMusteriID() {
        return musteriID;
    }

    public void setMusteriID(int musteriID) {
        this.musteriID = musteriID;
    }

    public int getKargoID() {
        return kargoID;
    }

    public void setKargoID(int kargoID) {
        this.kargoID = kargoID;
    }

    public int getSiparisDurumID() {
        return siparisDurumID;
    }

    public void setSiparisDurumID(int siparisDurumID) {
        this.siparisDurumID = siparisDurumID;
    }

    @Override
    public String toString() {
        return "Satis{" + "id=" + id + ", satisTarihi=" + satisTarihi + ", toplamTutar=" + toplamTutar + ", sepettemi=" + sepettemi + ", kargoTakipNo=" + kargoTakipNo + ", musteriID=" + musteriID + ", kargoID=" + kargoID + ", siparisDurumID=" + siparisDurumID + '}';
    }
    
    
    
}
