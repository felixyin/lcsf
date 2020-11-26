package com.hzc.service;

import com.hzc.factory.alias.D;
import com.hzc.framework.ssh.repository.mybatis.DataTablePager;
import com.hzc.framework.ssh.service.TrancationType;
import com.hzc.framework.ssh.service.Transaction;
import com.hzc.model.SysCompany;
import com.hzc.vo.PageVO;
import com.hzc.vo.ResultVO;

import java.util.Date;
import java.util.List;

/**
 * 李沧干部法律法规学习考试系统学员单位类
 * Created by HZC on 2015/5/26.
 */
@Transaction(jdbc = TrancationType.CLOSE)
public class SysCompanyService {

    /**
     * 查询单位
     * 说明：
     * 根据companyId获取单位
     *
     * @param id companyId
     * @return SysCompany
     */
    public SysCompany getCompanyById(Integer id) {
        return D.sysCompanyMapper().selectByPrimaryKey(id);
    }

    /**
     * 返回所有单位
     * <pre>
     *     说明：
     *     查询所有非其他类的单位
     * </pre>
     *
     * @return
     */
    public List<SysCompany> listStandardCompanies() {
        return D.sysCompanyMapper().selectStandardCompanies();
    }

    /**
     * 返回所有其他类的单位
     *
     * @return
     */
    public List<SysCompany> listOtherCompanies() {
        return D.sysCompanyMapper().selectOtherCompanies();
    }

    /**
     * 返回新添加单位的id
     * <pre>
     *    用户手动添加自己的单位（其他类）
     *    参数设置
     *    SysCompany company = new SysCompany();
     *    company.setDeleted(1);
     *    company.setName(companyName);
     *    company.setPassword("123456");
     *    company.setPid(8);
     * </pre>
     *
     * @param company
     */
    @Transaction(jdbc = TrancationType.OPEN)
    public Integer addSelfCompany(SysCompany company) {
        D.sysCompanyMapper().insertSelfCompany(company);
        return company.getId();
    }

    /**
     * @return
     */
    @DataTablePager
    public List<SysCompany> ajaxGetCompanyGroupList() {
        return D.sysCompanyMapper().selectCmpByPid();
    }

    /**
     * @return
     */

    public List<SysCompany> listCmpByPid() {
        return D.sysCompanyMapper().selectCmpGroup();
    }

    /**
     * 返回添加部门组信息结果
     *
     * @param group
     * @return
     */
    public ResultVO addCompanyGroup(SysCompany group) {
        Date date = new Date();
        group.setUpdateTime(date);
        Integer integer = insertCompanyGroup(group);
        if (integer == 1) {
            return new ResultVO(Boolean.TRUE, "成功");
        } else {
            return new ResultVO(Boolean.FALSE, "失败");
        }
    }

    /**
     * 返回部门组信息的更新结果
     *
     * @param group
     * @return
     */
    public ResultVO updateCompanyGroup(SysCompany group) {
        Integer integer = updateCompanyGroupById(group);
        if (integer == 1) {
            return new ResultVO(Boolean.TRUE, "成功");
        } else {
            return new ResultVO(Boolean.FALSE, "失败");
        }
    }

    /**
     * 返回部门组信息更新条数
     *
     * @param group
     * @return
     */
    public Integer updateCompanyGroupById(SysCompany group) {
        return D.sysCompanyMapper().updateByPrimaryKeySelective(group);
    }

    /**
     * 返回添加SysCompany条数
     *
     * @param group
     * @return
     */
    private Integer insertCompanyGroup(SysCompany group) {
        return D.sysCompanyMapper().insertCompanyGroup(group);
    }

    /**
     * 返回单位分组中的具体单位
     *
     * @param vo  分页结果和查询参数
     * @param pid 单位的父id
     * @return
     */
    @DataTablePager
    public List<SysCompany> getJuniorCompanyList(PageVO vo, Integer pid) {
        return D.sysCompanyMapper().selectJuniorCompanyList(vo, pid);
    }

    /**
     * 返回删除部门信息
     *
     * @param id
     * @return
     */
    public ResultVO deleteCompany(Integer id) {
        Integer integer = deleteCompanyById(id);
        if (integer == 1) {
            return new ResultVO(Boolean.TRUE, "成功");
        } else {
            return new ResultVO(Boolean.FALSE, "失败");
        }
    }
    /**
     * 返回删除SysCompany的条数
     *
     * @param id
     * @return
     */
    private Integer deleteCompanyById(Integer id) {
        return D.sysCompanyMapper().deleteById(id);
    }
    /**
     * 返回添加部门分组下的部门信息结果
     *
     * @param company
     * @return
     */
    public ResultVO addCompany(SysCompany company,Integer id) {
        Date date = new Date();
        company.setUpdateTime(date);
        company.setPid(id);
        Integer integer = insertCompanyGroup(company);
        if (integer == 1) {
            return new ResultVO(Boolean.TRUE, "成功");
        } else {
            return new ResultVO(Boolean.FALSE, "失败");
        }
    }
}
