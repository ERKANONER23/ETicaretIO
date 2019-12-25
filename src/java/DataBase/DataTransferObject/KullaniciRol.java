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
public class KullaniciRol {
    
    private int userID;
    private int rolID;

    public KullaniciRol() {
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getRolID() {
        return rolID;
    }

    public void setRolID(int rolID) {
        this.rolID = rolID;
    }

    @Override
    public String toString() {
        return "KullaniciRol{" + "userID=" + userID + ", rolID=" + rolID + '}';
    }
    
    
}
