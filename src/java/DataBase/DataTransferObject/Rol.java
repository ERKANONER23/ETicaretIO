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
public class Rol {
    private int id;
    private String rolName;
    private String kucukHarflerleRolAdi;
    private String aciklama;

    public Rol() {
    }

    public Rol(int id, String rolName, String kucukHarflerleRolAdi, String aciklama) {
        this.id = id;
        this.rolName = rolName;
        this.kucukHarflerleRolAdi = kucukHarflerleRolAdi;
        this.aciklama = aciklama;
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

    public String getRolName() {
        return rolName;
    }

    public void setRolName(String rolName) {
        this.rolName = rolName;
    }

    public String getKucukHarflerleRolAdi() {
        return kucukHarflerleRolAdi;
    }

    public void setKucukHarflerleRolAdi(String kucukHarflerleRolAdi) {
        this.kucukHarflerleRolAdi = kucukHarflerleRolAdi;
    }

    @Override
    public String toString() {
        return "Rol{" + "id=" + id + ", rolName=" + rolName + ", kucukHarflerleRolAdi=" + kucukHarflerleRolAdi + ", aciklama=" + aciklama + '}';
    }
    
    
    
}
