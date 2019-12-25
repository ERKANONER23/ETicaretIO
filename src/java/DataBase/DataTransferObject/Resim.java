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
    private String buyukYol;
    private String ortaYol;
    private String kucukYol;
    private boolean varsayilan;
    private int sirano;
    private int urunID;

    public Resim() {
    }

    public Resim(int id, String buyukYol, String ortaYol, String kucukYol, boolean varsayilan, int sirano) {
        this.id = id;
        this.buyukYol = buyukYol;
        this.ortaYol = ortaYol;
        this.kucukYol = kucukYol;
        this.varsayilan = varsayilan;
        this.sirano = sirano;
    }

    public int getSirano() {
        return sirano;
    }

    public void setSirano(int sirano) {
        this.sirano = sirano;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getBuyukYol() {
        return buyukYol;
    }

    public void setBuyukYol(String buyukYol) {
        this.buyukYol = buyukYol;
    }

    public String getOrtaYol() {
        return ortaYol;
    }

    public void setOrtaYol(String ortaYol) {
        this.ortaYol = ortaYol;
    }

    public String getKucukYol() {
        return kucukYol;
    }

    public void setKucukYol(String kucukYol) {
        this.kucukYol = kucukYol;
    }

    public boolean isVarsayilan() {
        return varsayilan;
    }

    public void setVarsayilan(boolean varsayilan) {
        this.varsayilan = varsayilan;
    }

    public int getUrunID() {
        return urunID;
    }

    public void setUrunID(int urunID) {
        this.urunID = urunID;
    }

    @Override
    public String toString() {
        return "ResimID{" + "id=" + id + ", buyukYol=" + buyukYol + ", ortaYol=" + ortaYol + ", kucukYol=" + kucukYol + ", varsayilan=" + varsayilan + ", sirano=" + sirano + ", urunID=" + urunID + '}';
    }

}
