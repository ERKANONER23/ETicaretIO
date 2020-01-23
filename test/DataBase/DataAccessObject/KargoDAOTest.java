/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataBase.DataAccessObject;

import DataBase.DataAccessObject.KargoDAO;
import DataBase.DataTransferObject.Kargo;
import java.util.Iterator;
import java.util.List;

/**
 *
 * @author (DESSAS)
 */
public class KargoDAOTest {

    public static void main(String[] args) {
        // insertTest();
        kargoFullListTest();
    }

    public static void insertTest() {
        KargoDAO kargoDAO = new KargoDAO();
        Kargo kargo = new Kargo(0, "yuarticikargo", "elazig merkez patliyor herkez", "123456", "www.yurticikargo.com", "yuartici@gmail.com");
        int etkilenen = kargoDAO.insert(kargo);
        System.out.println("etkilenen satir sayisi : " + etkilenen);
    }

    public static void kargoFullListTest() {
        KargoDAO kargoDAO = new KargoDAO();
        List<Kargo> kargoList = kargoDAO.kargoFullList();

        Iterator<Kargo> iterator = kargoList.iterator();

        while (iterator.hasNext()) {
            Kargo kargo = iterator.next();
            System.out.println(kargo);
        }

    }

}
