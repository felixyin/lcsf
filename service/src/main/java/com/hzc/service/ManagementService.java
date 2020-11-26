package com.hzc.service;

import com.hzc.factory.alias.D;
import com.hzc.framework.ssh.repository.mybatis.DataTablePager;
import com.hzc.framework.ssh.service.TrancationType;
import com.hzc.framework.ssh.service.Transaction;
import com.hzc.model.SysCompany;
import com.hzc.model.SysConfig;
import com.hzc.model.SysResource;
import com.hzc.model.SysUser;
import com.hzc.util.alias.S;
import com.hzc.vo.CompanyReportVO;
import com.hzc.vo.PageVO;
import com.hzc.vo.PeopleReportVO;
import com.hzc.vo.ResultVO;

import java.util.List;

/**
 * 考试管理类
 * <pre>
 *     包括：报表管理方法，考试管理方法
 * </pre>
 * Created by HZC on 2015/7/15.
 */
@Transaction(jdbc = TrancationType.CLOSE)
public class ManagementService {

    /**
     * 返回登录结果
     * <pre>
     *      考试管理登录
     * </pre>
     *
     * @param userName 登录用户名
     * @param password 登录密码
     * @return
     */
    public ResultVO login(String userName, String password) {
        SysUser user = S.sysUserService().getUserByIdCard(userName);
        ResultVO vo = new ResultVO(Boolean.FALSE, "登录错误");
        if (null != user && user.getPasswd().equals(password)) {
            vo.setCode(Boolean.TRUE);
            vo.setMessage("登录成功");
            vo.setUser(user);
        }
        return vo;
    }

    /**
     * 返回报表分组
     * <pre>
     *     报表分组为：单位分组
     *     所有单位有一个父
     * </pre>
     *
     * @return
     */
    public List<SysCompany> getReportGroup() {
        return D.sysCompanyMapper().selectReportGroup();
    }

    /**
     * 返回单位报表
     *
     * @param vo  分页结果和查询参数
     * @param pid 单位的父id
     * @return
     */

    public PageVO<CompanyReportVO> getCompanyReportList(PageVO vo, Integer pid) {
        List<CompanyReportVO> list = D.hisPaperMapper().selectCompanyReportList(vo, pid);
        int count = D.hisPaperMapper().selectCompanyReportListCount(vo, pid);
        vo.setData(list);
        vo.setTotalRecords(count);
        vo.setTotalDisplayRecords(count);
        return vo;
    }

    /**
     * 返回用户考试报表
     *
     * @param vo        分页参数和结果参数
     * @param companyId 单位id
     * @return
     */
    public PageVO<PeopleReportVO> getPeopleReportList(PageVO<PeopleReportVO> vo, Integer companyId) {
        List<PeopleReportVO> list = D.hisPaperMapper().selectPeopleReportList(vo, companyId);
        int count = D.hisPaperMapper().selectPeopleReportListCount(vo, companyId);
        vo.setData(list);
        vo.setTotalRecords(count);
        vo.setTotalDisplayRecords(count);
        return vo;
    }

    /**
     * 返回考场配置信息列表
     *
     * @return
     */
    @DataTablePager
    public List<SysResource> getResourceList() {
        return D.sysResourceMapper().selectResources();
    }

    /**
     * 返回一个考场配置信息
     *
     * @return
     */
    public SysResource getResource(Integer id) {
        return D.sysResourceMapper().selectByPrimaryKey(id);
    }

    /**
     * 返回考场更新结果
     *
     * @param resource
     * @return
     */
    public ResultVO updateResource(SysResource resource) {
        Integer integer = updateResourceById(resource);
        if (integer == 1) {
            return new ResultVO(Boolean.TRUE, "成功");
        } else {
            return new ResultVO(Boolean.FALSE, "失败");
        }
    }

    /**
     * 返回考场信息更新条数
     *
     * @param resource
     * @return
     */
    public Integer updateResourceById(SysResource resource) {
        return D.sysResourceMapper().updateByPrimaryKeySelective(resource);
    }

    /**
     * 返回删除考场信息
     *
     * @param id
     * @return
     */
    public ResultVO deleteResource(Integer id) {
        Integer integer = deleteResourceById(id);
        if (integer == 1) {
            return new ResultVO(Boolean.TRUE, "成功");
        } else {
            return new ResultVO(Boolean.FALSE, "失败");
        }
    }

    /**
     * 返回删除SysResource的条数
     *
     * @param id
     * @return
     */
    private Integer deleteResourceById(Integer id) {
        return D.sysResourceMapper().deleteByPrimaryKey(id);
    }

    /**
     * 返回添加考场信息结果
     *
     * @param resource
     * @return
     */
    public ResultVO addResource(SysResource resource) {
        Integer integer = insertResource(resource);
        if (integer == 1) {
            return new ResultVO(Boolean.TRUE, "成功");
        } else {
            return new ResultVO(Boolean.FALSE, "失败");
        }
    }

    /**
     * 返回添加SysResource条数
     *
     * @param resource
     * @return
     */
    private Integer insertResource(SysResource resource) {
        return D.sysResourceMapper().insertSelective(resource);
    }


}
