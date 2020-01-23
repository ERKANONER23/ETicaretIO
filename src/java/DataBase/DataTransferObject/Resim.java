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
public class Resim {

    private int id;
    private String yol;
    private int sirano;
    private int urunID;

    public Resim() {
    }

    public Resim(int id, String yol, int sirano, int urunID) {
        this.id = id;
        this.yol = yol;
        this.sirano = sirano;
        this.urunID = urunID;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getYol() {
        return yol;
    }

    public void setYol(String yol) {
        this.yol = yol;
    }

    public int getSirano() {
        return sirano;
    }

    public void setSirano(int sirano) {
        this.sirano = sirano;
    }

    public int getUrunID() {
        return urunID;
    }

    public void setUrunID(int urunID) {
        this.urunID = urunID;
    }

    @Override
    public String toString() {
        return "Resim{" + "id=" + id + ", yol=" + yol + ", sirano=" + sirano + ", urunID=" + urunID + '}';
    }

}
