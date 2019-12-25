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
public class User {

    private int id;
    private String username;
    private String kucukHarflerleUsername;
    private String telefonNo;
    private boolean gizlimi;
    private Date sonAktifOlma;

    public User() {
    }

    public User(int id, String username, String kucukHarflerleUsername, String telefonNo, boolean gizlimi, Date sonAktifOlma) {
        this.id = id;
        this.username = username;
        this.kucukHarflerleUsername = kucukHarflerleUsername;
        this.telefonNo = telefonNo;
        this.gizlimi = gizlimi;
        this.sonAktifOlma = sonAktifOlma;
    }

    public Date getSonAktifOlma() {
        return sonAktifOlma;
    }

    public void setSonAktifOlma(Date sonAktifOlma) {
        this.sonAktifOlma = sonAktifOlma;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getKucukHarflerleUsername() {
        return kucukHarflerleUsername;
    }

    public void setKucukHarflerleUsername(String kucukHarflerleUsername) {
        this.kucukHarflerleUsername = kucukHarflerleUsername;
    }

    public String getTelefonNo() {
        return telefonNo;
    }

    public void setTelefonNo(String telefonNo) {
        this.telefonNo = telefonNo;
    }

    public boolean isGizlimi() {
        return gizlimi;
    }

    public void setGizlimi(boolean gizlimi) {
        this.gizlimi = gizlimi;
    }

    @Override
    public String toString() {
        return "User{" + "id=" + id + ", username=" + username + ", kucukHarflerleUsername=" + kucukHarflerleUsername + ", telefonNo=" + telefonNo + ", gizlimi=" + gizlimi + ", sonAktifOlma=" + sonAktifOlma + '}';
    }

}
