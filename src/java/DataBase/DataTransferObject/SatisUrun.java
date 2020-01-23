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
public class SatisUrun {

    private int id;
    private int satisID;
    private int urunID;

    public SatisUrun() {
    }

    public SatisUrun(int id, int satisID, int urunID) {
        this.id = id;
        this.satisID = satisID;
        this.urunID = urunID;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    @Override
    public String toString() {
        return "SatisUrun{" + "id=" + id + ", satisID=" + satisID + ", urunID=" + urunID + '}';
    }

}
