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
public class UrunOzellik {

    private int urunID;
    private int ozelliktipID;
    private int ozellikDegerID;

    public UrunOzellik() {
    }

    public int getUrunID() {
        return urunID;
    }

    public void setUrunID(int urunID) {
        this.urunID = urunID;
    }

    public int getOzelliktipID() {
        return ozelliktipID;
    }

    public void setOzelliktipID(int ozelliktipID) {
        this.ozelliktipID = ozelliktipID;
    }

    public int getOzellikDegerID() {
        return ozellikDegerID;
    }

    public void setOzellikDegerID(int ozellikDegerID) {
        this.ozellikDegerID = ozellikDegerID;
    }

    @Override
    public String toString() {
        return "UrunOzellik{" + "urunID=" + urunID + ", ozelliktipID=" + ozelliktipID + ", ozellikDegerID=" + ozellikDegerID + '}';
    }

}
