package com.hzc.dao;

import com.hzc.model.SysUser;
import com.hzc.vo.SysUserVO;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import java.util.List;

public interface SysUserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(SysUser record);

    int insertSelective(SysUser record);

    SysUser selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(SysUser record);

    int updateByPrimaryKey(SysUser record);

    /**
     * 根据用户名(手机号）查询用户
     * 返回用户
     *
     * @param phone
     * @return
     */
    SysUser selectByPhone(String phone);

    List<SysUser> selectList(@Param("user") SysUser user, @Param("system") int system);

    List<SysUser> selectList(@Param("user") SysUser user, @Param("system") int system, RowBounds rowBounds);

    /**
     * 根据用户的身份证号获取用户
     *
     * @param idCard：身份证号
     * @return
     */
    SysUser selectByIdCard(@Param("idCard") String idCard);

    /**
     * 查询单位下的所有已报名用户
     *
     * @param companyId
     * @return
     */
    List<SysUser> selectByCompanyId(Integer companyId);

    /**
     * 更新status
     *
     * @param userIds userIds
     * @param status  status 1、激活；2、锁定；3、报名；4、闭卷
     */
    void updateStatus(@Param("userIds") Integer[] userIds, @Param("status") Integer status);

    /**
     * 返回用户列表
     * <pre>
     *     根据所有用户的id，查询对应的用户列表
     * </pre>
     *
     * @param userIds
     * @return List<SysUser>
     */
    List<SysUserVO> selectByIds(@Param("userIds") Integer[] userIds);

    /**
     * 查询所有注册用户报表
     *
     * @param user
     * @return
     */
    List<SysUser> searchList(@Param("user") SysUser user);


    /**
     * 查询一个身份证号在数据库中的数量
     *
     * @param idCard
     * @return
     */
    Integer selectCountByIdCard(String idCard);

    /**
     * 返回用户管理列表，带单位信息
     *
     * @param sysUserVO
     * @return
     */
    List<SysUserVO> getUserManageList(@Param("sysUserVO") SysUserVO sysUserVO);

    /**
     * 返回用户
     * <pre>
     *     根据idcard和status返回一个用户
     *     没有该数据返回空
     * </pre>
     *
     * @param idCard
     * @param status
     * @return
     */
    SysUser selectByStatus(@Param("idCard") String idCard, @Param("status") Integer status);
    /**
     * 查询一个用户名在数据库中的数量
     *
     * @param phone
     * @return
     */
    Integer selectCountByPhone(String phone);

//    List<SysUser> selectGroupUser();

    List<SysUser> selectGroupUser(@Param("user") SysUser user);
}