package com.hzc.service;

import com.hzc.model.LpCard;
import com.hzc.util.alias.S;
import org.junit.Test;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class LpCardServiceTest extends SupperJunit {

    @Test
    public void testCheckPermission() throws Exception {

    }

    @Test
    public void testGetUserInfo() throws Exception {

    }

    @Test
    public void testSetClosedBookExam() throws Exception {

    }

    @Test
    public void testSaveCards() throws Exception {
        new DaoRollback() {
            @Override
            public void invoke() {
                try {
                    LpCardService a = new LpCardService();
                    List<LpCard> list = new ArrayList<LpCard>();
                    Date date = new Date();
                    LpCard lpCard = new LpCard("wo", "320202020", date, "nan", "司法局", "局级", date, date, "金水路", 1, 1, "////", date, date, 1, 1);
                    list.add(lpCard);
                    Method[] declaredMethods = a.getClass().getDeclaredMethods();
                    Method method = null;
                    for (int i = 0; i < declaredMethods.length; i++) {
                        String name = declaredMethods[i].getName();
                        if (name.equals("saveCards")) {
                            method = declaredMethods[i];
                        }
                    }
                    method.setAccessible(true);
                    method.invoke(a, list);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }.execute();
    }

    @Test
    public void testCreateCard() throws Exception {
        Integer[] ids = {1, 2, 3};
        S.lpCardService().createCard(ids);

    }
}