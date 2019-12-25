/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataBase.DataTransferObject;

/**
 *
 * @author (DESSAS)
 * veritabanidnaki kargo sutununa karsilik gelen bean sinifi
 */
public class Kargo {

    private int id;
    private String sirketAdi;
    private String adres;
    private String telefon;
    private String website;
    private String email;

    public Kargo() {
    }

    public Kargo(int id, String sirketAdi, String adres, String telefon, String website, String email) {
        this.id = id;
        this.sirketAdi = sirketAdi;
        this.adres = adres;
        this.telefon = telefon;
        this.website = website;
        this.email = email;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSirketAdi() {
        return sirketAdi;
    }

    public void setSirketAdi(String sirketAdi) {
        this.sirketAdi = sirketAdi;
    }

    public String getAdres() {
        return adres;
    }

    public void setAdres(String adres) {
        this.adres = adres;
    }

    public String getTelefon() {
        return telefon;
    }

    public void setTelefon(String telefon) {
        this.telefon = telefon;
    }

    public String getWebsite() {
        return website;
    }

    public void setWebsite(String website) {
        this.website = website;
    }

    @Override
    public String toString() {
        return "Kargo{" + "id=" + id + ", sirketAdi=" + sirketAdi + ", adres=" + adres + ", telefon=" + telefon + ", website=" + website + ", email=" + email + '}';
    }

}
