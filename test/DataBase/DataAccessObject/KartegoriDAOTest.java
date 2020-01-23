/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataBase.DataAccessObject;

import DataBase.DataTransferObject.Kategori;

/**
 *
 * @author (DESSAS)
 */
public class KartegoriDAOTest {

    public static void main(String[] args) {
        insertTest();
    }

    public static void insertTest() {
        Kategori kategori = new Kategori(0, "Bilgisayar", "Son Teknoloji Bilgisayarlari Burada Bulabilirsiniz");

        KartegoriDAO kartegoriDAO = new KartegoriDAO();
        int etkilenen = kartegoriDAO.insert(kategori);
        if (etkilenen > 0) {
            System.out.println("etkilenen satir sayici : " + 1);
            System.out.println("eklenmistir");
        } else {
            System.out.println("hata eklenmedi");
        }

    }

}
