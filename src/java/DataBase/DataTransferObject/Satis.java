package DataBase.DataTransferObject;

import java.util.Date;

/**
 *
 * @author (DESSAS)
 */
public class Satis {

    private int id;
    private int musteriID;
    private String satistarihi;
    private double toplamTutar;
    private String kargoTakipNo;
    private int kargoID;

    public Satis() {
    }

    public Satis(int id, int musteriID, String satistarihi, double toplamTutar, String kargoTakipNo, int kargoID) {
        this.id = id;
        this.musteriID = musteriID;
        this.satistarihi = satistarihi;
        this.toplamTutar = toplamTutar;
        this.kargoTakipNo = kargoTakipNo;
        this.kargoID = kargoID;
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

    public String getSatistarihi() {
        return satistarihi;
    }

    public void setSatistarihi(String satistarihi) {
        this.satistarihi = satistarihi;
    }

    public double getToplamTutar() {
        return toplamTutar;
    }

    public void setToplamTutar(double toplamTutar) {
        this.toplamTutar = toplamTutar;
    }

    public String getKargoTakipNo() {
        return kargoTakipNo;
    }

    public void setKargoTakipNo(String kargoTakipNo) {
        this.kargoTakipNo = kargoTakipNo;
    }

    public int getKargoID() {
        return kargoID;
    }

    public void setKargoID(int kargoID) {
        this.kargoID = kargoID;
    }

    @Override
    public String toString() {
        return "Satis{" + "id=" + id + ", musteriID=" + musteriID + ", satistarihi=" + satistarihi + ", toplamTutar=" + toplamTutar + ", kargoTakipNo=" + kargoTakipNo + ", kargoID=" + kargoID + '}';
    }

}
