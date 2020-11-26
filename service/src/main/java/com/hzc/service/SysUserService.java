package com.hzc.service;

import com.hzc.factory.alias.D;
import com.hzc.framework.ssh.repository.mybatis.DataTablePager;
import com.hzc.framework.ssh.service.TrancationType;
import com.hzc.framework.ssh.service.Transaction;
import com.hzc.model.SysUser;
import com.hzc.util.utils.MySecurity;
import com.hzc.util.utils.SecurityConstants;
import com.hzc.vo.ResultVO;
import com.hzc.vo.SysUserVO;
import com.hzc.vo.SystemEnum;

import java.util.List;
import java.util.Random;

/**
 * 用户类
 * 说明：
 * 用户（sys_user）的相关方法
 * Created by HZC on 2015/3/4.
 */
@Transaction
public class SysUserService {

    /**
     * 手机端用户登录
     * 传入登录用户名（手机号）和密码（明文）
     * 判断用户名和密码是否匹配
     * 返回登录结果：1、登录成功返回加密算法的key；2、用户名不存在；3、账号密码错误
     *
     * @param phone
     * @param password
     * @return
     */
    public ResultVO login(String phone, String password) {
        ResultVO resultVO;
        SysUser user = getUserByPhone(phone);
        if (null != user) {//此用户存在
            password = MySecurity.encode_sda(SecurityConstants.LOGIN_PASSKEY, password);
            if (user.getPasswd().equals(password)) {
                if (user.getStatus() == 1 && user.getDeleted() == 1) {
                    Random random = new Random();
                    int i = 1;
                    String key = "";
                    while (i < 4) {
                        key = String.valueOf(random.nextInt(10)) + "," + key;
                        i++;
                    }
                    user.setDeskey(key);
                    user.setOnline(1);
                    updateSysUser(user);
                    resultVO = new ResultVO(true, key);
                } else {
                    resultVO = new ResultVO(false, "此用户已被锁定");
                }
            } else {
                resultVO = new ResultVO(false, "用户名密码错误");
            }
        } else {
            resultVO = new ResultVO(false, "用户名不存在");
        }
        return resultVO;
    }

    /**
     * 查询用户是否已经注册
     * 传入查询用户名（手机号）
     * 匹配数据库是否存在此账号
     * 返回查询结果：1、已存在；2、不存在
     *
     * @param phone
     * @return
     */
    public ResultVO checkUserByPhone(String phone) {
        ResultVO resultVO;
        SysUser user = getUserByPhone(phone);
        if (null != user) {
            resultVO = new ResultVO(true, "此账号已存在");
        } else {
            resultVO = new ResultVO(false, "此帐号未被注册");
        }
        return resultVO;
    }

    /**
     * 根据用户名（手机）获取用户信息
     * 返回用户信息
     *
     * @param phone
     * @return
     */
    public SysUser getUserByPhone(String phone) {
        return D.sysUserMapper().selectByPhone(phone);
    }

    /**
     * 手机端用户注册
     * 传入注册用户名（手机号）、密码（明文）、验证码（明文）
     * 返回注册结果：1、注册成功；2、验证码错误；
     *
     * @param phone
     * @param password
     * @param verifycode
     * @param app        哪个app的用户注册
     * @return
     */
    public ResultVO register(String phone, String password, String verifycode, String app, int system) {
        ResultVO resultVO;
        if (true) {
            SysUser user = getUserByPhone(phone);
            if (null == user) {
                password = MySecurity.encode_sda(SecurityConstants.LOGIN_PASSKEY, password);
                SysUser sysUser = new SysUser();
                sysUser.setPhone(phone);
                sysUser.setPasswd(password);

                saveSysUser(sysUser);
                resultVO = new ResultVO(true, "注册成功");
            } else {
                resultVO = new ResultVO(false, "用户已存在");
            }
        } else {
            resultVO = new ResultVO(false, "验证码错误");
        }
        return resultVO;
    }

    /**
     * 修改手机端用户的密码
     * 传入修改用户的信息，用户名（手机号）、新密码（明文）、验证码（明文）
     * 返回修改结果：1、修改密码成功；2、验证码错误；
     *
     * @param phone
     * @param password
     * @param code
     * @return
     */
    public ResultVO updatePassword(String phone, String password, String code) {
        ResultVO resultVo;
        if (true) {
            SysUser user = getUserByPhone(phone);
            if (null != user) {
                if (user.getDeleted() == 1 && user.getStatus() == 1) {
                    password = MySecurity.encode_sda(SecurityConstants.LOGIN_PASSKEY, password);
                    user.setPasswd(password);
                    updateSysUser(user);
                    resultVo = new ResultVO(true, "更新密码成功");
                } else {
                    resultVo = new ResultVO(false, "用户已被锁定");
                }
            } else {
                resultVo = new ResultVO(false, "用户不存在");
            }
        } else {
            resultVo = new ResultVO(false, "验证码错误");
        }
        return resultVo;
    }

    /**
     * 根据id更新用户（SysUser）
     *
     * @param user
     */
    public boolean updateSysUser(SysUser user) {
        return D.sysUserMapper().updateByPrimaryKeySelective(user) == 1;
    }

    /**
     * 用户退出
     *
     * @param phone
     * @return
     */
    public ResultVO logout(String phone) {
        SysUser user = getUserByPhone(phone);
        user.setOnline(0);
        updateSysUser(user);
        return new ResultVO(true, "退出成功");
    }

    /**
     * 李沧司法局干部普法app，后台收集、管理用户
     * 分页管理列表
     *
     * @param user
     * @return
     */
    @DataTablePager
    public List<SysUser> searchEmpowerList(SysUser user) {
        return D.sysUserMapper().selectList(user, SystemEnum.HELP_STUDY.getValue());
    }

    /**
     * 李沧干部普法app，后台收集、管理用户
     * 分页管理列表
     *
     * @param user
     * @return
     */
    @DataTablePager
    public List<SysUser> searchPufaLexueList(SysUser user) {
        return D.sysUserMapper().selectList(user, SystemEnum.PUFA_LEXU.getValue());
    }

    @DataTablePager
    public List<SysUser> searchBaoMingList(SysUser user) {
        return D.sysUserMapper().selectList(user, SystemEnum.BAO_MING.getValue());
    }

    /**
     * 青岛司法局 普法教育APP
     * 根据用户身份证号查询用户，如果用户存在，则返回userId；
     * 用户不存在，返回userId=0
     *
     * @param account（身份证号）
     * @return
     */
    public int loginForPufa(String account) {
        //2：青岛李沧司法局普法app
        SysUser user = getUserByIdCard(account);
        int userId = 0;
        if (null != user) {//此用户不存在，则注册此用户
            userId = user.getId();
        }
        return userId;
    }

    /**
     * 根据用户的身份证号获取用户
     *
     * @param idCard：身份证号
     * @return
     */
    public SysUser getUserByIdCard(String idCard) {
        return D.sysUserMapper().selectByIdCard(idCard);
    }

    /**
     * 保存用户信息
     * 返回userId
     *
     * @param sysUser
     * @return
     */
    @Transaction(jdbc = TrancationType.OPEN)
    public int saveSysUser(SysUser sysUser) {
        return D.sysUserMapper().insertSelective(sysUser);
    }

    /**
     * 根据userId更新用户的状态
     *
     * @param userIds userIds
     * @param status  status 1、激活；2、锁定；3、报名；4、闭卷
     */
    @Transaction(jdbc = TrancationType.OPEN)
    public void updateStatusById(Integer[] userIds, Integer status) {
        D.sysUserMapper().updateStatus(userIds, status);
    }


    /**
     * 手机端用户注册
     * 传入注册用户名（手机号）、密码（明文）、验证码（明文）
     * 返回注册结果：1、注册成功；2、验证码错误；
     *
     * @param phone
     * @param password
     * @param verifycode
     * @return
     */
    public ResultVO register(String phone, String password, String verifycode) {
        ResultVO resultVO;
        if (true) {
            SysUser user = getUserByPhone(phone);
            if (null == user) {
                password = MySecurity.encode_sda(SecurityConstants.LOGIN_PASSKEY, password);
                SysUser sysUser = new SysUser();
                sysUser.setPhone(phone);
                sysUser.setPasswd(password);
                D.sysUserMapper().insertSelective(sysUser);
                resultVO = new ResultVO(true, "注册成功");
            } else {
                resultVO = new ResultVO(false, "用户已存在");
            }
        } else {
            resultVO = new ResultVO(false, "验证码错误");
        }
        return resultVO;
    }


    @DataTablePager
    public List<SysUser> searchList(SysUser user) {
        return D.sysUserMapper().selectList(user, SystemEnum.HELP_STUDY.ordinal());
    }

    /**
     * 返回用户列表
     * <pre>
     *     根据所有用户的id，查询对应的用户列表
     *     包括用户所属公司
     * </pre>
     *
     * @param userIds
     * @return List<SysUserVO>
     */
    @Transaction(jdbc = TrancationType.CLOSE)
    public List<SysUserVO> getUsersById(Integer[] userIds) {
        return D.sysUserMapper().selectByIds(userIds);
    }

    /**
     * 用户报名考试
     * <pre>
     *     用户之前已经学习过，用户已存在，则直接更新用户信息
     *     用户不存在，则创建用户
     * </pre>
     *
     * @param user SysUser
     */
    public void enrollUser(SysUser user) {
        String idCard = user.getIdCard();
        SysUser existUser = getUserByIdCard(idCard);
        if (existUser != null) {
            user.setId(existUser.getId());
            updateSysUser(user);
        } else {
            saveSysUser(user);
        }
    }

    /**
     * 用户注册
     * <pre>
     *     返回true，注册成功，返回false，注册失败，用户已存在
     * </pre>
     *
     * @param user
     * @return
     */
    public boolean signUser(SysUser user) {
        String idCard = user.getIdCard();
        SysUser existUser = getUserByIdCard(idCard);
        if (existUser != null) {
            return false;
        } else {
            saveSysUser(user);
            return true;
        }
    }

    public SysUser selectUserByIdCard(String idCard) {
        return D.sysUserMapper().selectByIdCard(idCard);
    }

    /**
     * 根据idCard返回数量
     *
     * @param idCard
     * @return
     */
    public Integer selectUserCountByIdCard(String idCard) {
        return D.sysUserMapper().selectCountByIdCard(idCard);
    }

    /**
     * 返回用户列表，带单位信息
     *
     * @param sysUserVO
     * @return
     */
    @DataTablePager
    @Transaction(jdbc = TrancationType.CLOSE)
    public List<SysUserVO> getUserManageList(SysUserVO sysUserVO) {
        return D.sysUserMapper().getUserManageList(sysUserVO);
    }

    /**
     * 返回用户信息
     * <pre>
     *     根据id（sys_user主键）返回该条记录
     * </pre>
     *
     * @param id
     * @return
     */
    public SysUser getUserById(Integer id) {
        return D.sysUserMapper().selectByPrimaryKey(id);
    }

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
    public SysUser getUserByStatus(String idCard, Integer status) {
        return D.sysUserMapper().selectByStatus(idCard, status);
    }

    /**
     * 返回添加部门组信息结果
     *
     * @param sysUser
     * @return
     */
    public ResultVO addSysUser(SysUser sysUser) {
        int count=saveSysUser(sysUser);
        if (count==1) {
            return new ResultVO(Boolean.TRUE, "成功");
        } else {
            return new ResultVO(Boolean.FALSE, "失败");
        }
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
     * 返回一个考场配置信息
     *
     * @return
     */
    public SysUser getResource(Integer id) {
        return D.sysUserMapper().selectByPrimaryKey(id);
    }
    /**
     * 返回考场更新结果
     *
     * @param resource
     * @return
     */
    public ResultVO updateResource(SysUser resource) {
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
    public Integer updateResourceById(SysUser resource) {
        return D.sysUserMapper().updateByPrimaryKeySelective(resource);
    }

    /**
     * 根据phone返回数量
     * @param phone
     * @return
     */
    public Integer selectUserCountByPhone(String phone) {
        return D.sysUserMapper().selectCountByPhone(phone);
    }

    /**
     *
     * @return
     */
    @DataTablePager
    public List<SysUser> ajaxGetUserList(SysUser user) {
        return D.sysUserMapper().selectGroupUser(user);
    }
    /**
     * 返回删除SysResource的条数
     *
     * @param id
     * @return
     */
    private Integer deleteResourceById(Integer id) {
        return D.sysUserMapper().deleteByPrimaryKey(id);
    }
}
