package com.hzc.service;

import com.hzc.factory.alias.D;
import com.hzc.framework.ssh.service.TrancationType;
import com.hzc.framework.ssh.service.Transaction;
import com.hzc.model.SysResource;

import java.util.List;

/**
 * 李沧司法考试系统资源类
 * <pre>
 * 说明：
 * 资源类记录内容：考场号，考试人数，考试时间；
 * 该类提供相关方法
 * </pre>
 * Created by HZC on 2015/5/27.
 */
@Transaction(jdbc = TrancationType.CLOSE)
public class SysResourceService {

    /**
     * 查询系统资源
     * <pre>
     *     说明：
     *     获取的资源为考场号、考试人数、考试时间
     *     考场包括：该考场的考试人数，该考场的考试时间
     *     同一个考场根据考试时间不同可以有多场考试
     * </pre>
     *
     * @return List<SysResource>
     */
    public List<SysResource> getResources() {
        return D.sysResourceMapper().selectResources();
    }


    public List<SysResource> getOrderBy(String roomNo, String desc) {
        return D.sysResourceMapper().getOrderBy(roomNo, desc);
    }
}
