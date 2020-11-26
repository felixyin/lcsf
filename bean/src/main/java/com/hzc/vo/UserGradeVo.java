package com.hzc.vo;

import com.hzc.model.HisPaper;
import com.hzc.model.LpCard;

import java.io.Serializable;

/**
 * Created by yinbin on 2015/6/9.
 */
public class UserGradeVo implements Serializable {
    private HisPaper hisPaper;
    private LpCard lpCard;

    public UserGradeVo() {
    }

    public UserGradeVo(HisPaper hisPaper, LpCard lpCard) {

        this.hisPaper = hisPaper;
        this.lpCard = lpCard;
    }

    public HisPaper getHisPaper() {
        return hisPaper;
    }

    public void setHisPaper(HisPaper hisPaper) {
        this.hisPaper = hisPaper;
    }

    public LpCard getLpCard() {
        return lpCard;
    }

    public void setLpCard(LpCard lpCard) {
        this.lpCard = lpCard;
    }
}
