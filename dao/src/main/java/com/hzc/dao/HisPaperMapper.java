package com.hzc.dao;

import com.hzc.model.HisPaper;
import com.hzc.vo.CompanyReportVO;
import com.hzc.vo.PageVO;
import com.hzc.vo.PeopleReportVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface HisPaperMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(HisPaper record);

    int insertSelective(HisPaper record);

    HisPaper selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(HisPaper record);

    int updateByPrimaryKey(HisPaper record);

    /**
     * 返回用户的试卷
     * <pre>
     *     根据userId返回his_paper
     * </pre>
     *
     * @param userId
     * @return
     */
    HisPaper selectByUserId(int userId);

    /**
     * 返回单位报表
     *
     * @param pid 分组id（单位的父id）
     * @return
     * @parem vo 分页参数
     */
    List<CompanyReportVO> selectCompanyReportList(@Param("vo") PageVO vo, @Param("pid") Integer pid);

    int selectCompanyReportListCount(@Param("vo") PageVO vo, @Param("pid") Integer pid);

    /**
     * 返回用户考试报表
     *
     * @param vo        分页参数
     * @param companyId 单位id
     * @return
     */
    List<PeopleReportVO> selectPeopleReportList(@Param("vo") PageVO<PeopleReportVO> vo, @Param("companyId") Integer companyId);

    int selectPeopleReportListCount(@Param("vo") PageVO<PeopleReportVO> vo, @Param("companyId")Integer companyId);
}