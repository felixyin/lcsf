package com.hzc.dao;

import com.hzc.model.SysCompany;
import com.hzc.vo.PageVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SysCompanyMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(SysCompany record);

    int insertSelective(SysCompany record);

    SysCompany selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(SysCompany record);

    int updateByPrimaryKey(SysCompany record);

    int deleteById(Integer id);
    /**
     * 返回所有非其他类的单位
     *
     * @return
     */
    List<SysCompany> selectStandardCompanies();

    /**
     * 返回所有其他类的单位
     *
     * @return
     */
    List<SysCompany> selectOtherCompanies();

    /**
     * 返回新添加的单位的id
     * <pre>
     *     用户手动添加自己的单位部门（属于其他类）
     * </pre>
     *
     * @param company
     * @return
     */
    Integer insertSelfCompany(SysCompany company);

    /**
     * 返回报表分组
     * <pre>
     *     报表分组为：单位分组
     *     所有单位有一个父
     * </pre>
     *
     * @return
     */
    List<SysCompany> selectReportGroup();

    List<SysCompany> selectCmpByPid();

    /**
     * 添加部门的组的分类
     */
    int insertCompanyGroup(SysCompany group);

    List<SysCompany> selectCmpGroup();
    /**
     * 返回单位分组列表
     *
     * @param vo        分页参数
     * @param companyGroupId 单位id
     * @return
     */
    List<SysCompany> selectJuniorCompanyList(@Param("vo") PageVO vo, @Param("companyGroupId") Integer companyGroupId);

}