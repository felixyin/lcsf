package com.hzc.service;

import com.hzc.util.alias.S;
import com.hzc.vo.SysSeatVO;
import org.junit.Test;

import javax.xml.crypto.Data;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class SysSeatServiceTest extends SupperJunit {

    @Test
    public void testGet() throws Exception {

    }

    @Test
    public void testGetEmptySeat() throws Exception {

    }

    @Test
    public void testShuffleSeat() throws Exception {
        List<SysSeatVO> sysSeats = S.sysSeatService().shuffleSeat(5);
        if (!sysSeats.isEmpty()) {
            for (int i = 0; i < sysSeats.size(); i++) {
                System.out.println(sysSeats.get(i).getId());
            }
        }
    }

    @Test
    public void testCreateSeat() throws Exception {
        S.sysSeatService().createSeat();
    }
    @Test
    public void Test(){
        Date date = new Date();
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd-HH-mm");
        String s = format.format(date);
        String[] split = s.split("-");

        String y = split[0];
        String M = split[1];
        String d = split[2];
        String h = split[3];
        String m = split[4];

    }
}