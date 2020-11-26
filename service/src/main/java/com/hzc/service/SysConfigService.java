package com.hzc.service;

import com.hzc.factory.alias.D;
import com.qtrj.simpleframework.ssh.repository.mybatis.DataTablePager;
import com.qtrj.simpleframework.ssh.service.TrancationType;
import com.qtrj.simpleframework.ssh.service.Transaction;
import com.hzc.model.SysConfig;
import com.hzc.vo.ResultVO;

import java.util.List;

/**
 * 系统配置类
 * 说明：
 * 加载考试系统配置的相关信息
 * Created by HZC on 2015/5/26.
 */
@Transaction(jdbc = TrancationType.CLOSE)
public class SysConfigService {

    /**
     * 获取考试系统的相关配置信息
     *
     * @return SysConfig
     */
    public SysConfig get() {
        return D.sysConfigMapper().select();
    }

    /**
     * 返回考试配置列表
     *
     * @return
     */
    @DataTablePager
    public List<SysConfig> getConfigList() {
        return D.sysConfigMapper().selectConfigList();
    }

    /**
     * 返回一个考试配置
     * <pre>
     *     根据id返回考试配置
     * </pre>
     *
     * @param id
     * @return
     */
    public SysConfig getConfig(Integer id) {
        return D.sysConfigMapper().selectByPrimaryKey(id);
    }

    /**
     * 更新考试配置
     *
     * @param config
     * @return
     */
    public ResultVO updateConfig(SysConfig config) {
        Integer integer = updateSysConfig(config);
        if (integer == 1) {
            return new ResultVO(Boolean.TRUE, "成功");
        } else {
            return new ResultVO(Boolean.FALSE, "失败");
        }
    }

    /**
     * 更新考试配置
     *
     * @param config
     * @return
     */
    private Integer updateSysConfig(SysConfig config) {
        return D.sysConfigMapper().updateByPrimaryKeySelective(config);
    }

}
