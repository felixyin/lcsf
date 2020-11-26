package com.hzc.service;

import com.hzc.factory.alias.D;
import com.hzc.framework.ssh.service.TrancationType;
import com.hzc.framework.ssh.service.Transaction;
import com.hzc.model.SysResource;
import com.hzc.model.SysSeat;
import com.hzc.util.alias.S;
import com.hzc.vo.SysSeatVO;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * 考试坐位信息类
 * 说明：
 * 记录考场座位号，用户信息
 * Created by HZC on 2015/5/27.
 */
@Transaction(jdbc = TrancationType.CLOSE)
public class SysSeatService {

    /**
     * 查询坐位信息
     * 说明：
     * 查询已经生成的坐位信息；
     * 该坐位信息包括没有用户的坐位和已经有用户的坐位
     *
     * @return List<SysSeat>
     */
    public List<SysSeat> get() {
        return D.sysSeatMapper().select();
    }

    /**
     * 查询空座位
     * 说明：
     * 查询还没有分配考试用户的空座位
     * 空座位信息包括，考试时间，考场号
     *
     * @return List<SysSeatVO>
     */
    public List<SysSeatVO> getEmptySeat() {
        return D.sysSeatMapper().selectEmpty();
    }

    /**
     * 返回空座位
     * <pre>
     * 说明：
     * 随机坐位
     * 根据需要生成准考证的人数获取所需的空座位
     * 如果空座位为空，则说明非法操作，抛出异常
     * 如果空座位数小于需要生成准考证的人数，则返回非法操作，抛出异常
     * </pre>
     *
     * @param number 需要生成准考证的人数
     * @return List<SysSeat>
     */
    public List<SysSeatVO> shuffleSeat(Integer number) throws Exception {
        List<SysSeatVO> emptySeat = getEmptySeat();
        if (emptySeat.isEmpty()) {
            throw new Exception("hzc exception：illegal action.empty seat is null.");
        }
        int size = emptySeat.size();
        if (size < number) {
            throw new Exception("hzc exception：illegal action.number of participants for exam is overflow.");
        }
        Collections.shuffle(emptySeat);
        return emptySeat.subList(0, number);
    }

    /**
     * 生成所有的空坐位
     * <pre>
     *     根据所有的考场场次的信息（考场号，座位数），生成所有的空座位
     *     这些空的坐位没有安排考试人，供后期随机考试人的座位号
     * </pre>
     *
     * @param list
     */
    @Transaction(jdbc = TrancationType.OPEN)
    public void createAllSeats(List<SysSeat> list) {
        D.sysSeatMapper().insertAllSeats(list);
    }

    /**
     * 生成所有考试场次的坐位信息
     * <pre>
     *     根据所有的考试场次可以确定所有参考的人数
     *     每个参考人都有一个固定的考试时间、考场号、考场坐位号
     *     根据所有的人数生成一个空的坐位信息，但是还没有把考试人对号入座
     *     考试人数和坐位数相等
     *     如果查询系统资源为空，则抛出异常
     * </pre>
     */
    public void createSeat() throws Exception {
        List<SysResource> resources = S.sysResourceService().getResources();
        if (resources.isEmpty()) {
            throw new Exception("hzc exception:metadata is wrong,please complate sys_resource.");
        }

        List<SysSeat> list = new ArrayList<SysSeat>();
        for (int i = 0; i < resources.size(); i++) {
            SysResource sysResource = resources.get(i);
            //考场场次
            Integer id = sysResource.getId();
            //座位数
            Integer count = sysResource.getSeatCount();
            for (int j = 0; j < count; j++) {
                SysSeat sysSeat = new SysSeat(id, j + 1);
                list.add(sysSeat);
            }
        }
        createAllSeats(list);
    }

    /**
     * 为空座位添加考试人
     *
     * @param list 坐位信息
     */
    @Transaction(jdbc = TrancationType.OPEN)
    public void fillUser(List<SysSeatVO> list) {
        D.sysSeatMapper().updateEmptySeat(list);
    }
}
