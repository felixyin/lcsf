package com.hzc.service;

import com.hzc.factory.alias.D;
import com.hzc.framework.ssh.repository.mybatis.DataTablePager;
import com.hzc.framework.ssh.service.TrancationType;
import com.hzc.framework.ssh.service.Transaction;
import com.hzc.model.LpCard;
import com.hzc.model.LpOption;
import com.hzc.model.SysUser;
import com.hzc.vo.UserGradeVo;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

/**
 * Created by yinbin on 2015/6/1.
 */
@Transaction
public class ManageService {

    @DataTablePager
    public List<SysUser> enrollmentList(SysUser user) {
        return D.sysUserMapper().searchList(user);
    }

    @DataTablePager
    public List<LpCard> cardList(LpCard card) {
        return D.lpCardMapper().searchList(card);
    }

    @DataTablePager
    public List<UserGradeVo> gradeList(LpCard card) {
        List<UserGradeVo> userGradeVos = D.lpCardMapper().searchMapList(card);
        return userGradeVos;
    }

    @Transaction(jdbc = TrancationType.CLOSE)
    public InputStream getUserPhotoIs(Integer id) {
        SysUser sysUser = D.sysUserMapper().selectByPrimaryKey(id);
        String photoPath = sysUser.getPhotoPath();
        FileInputStream fileInputStream = null;
        try {
            fileInputStream = new FileInputStream(new File(photoPath));
        } catch (FileNotFoundException e) {
            try {
                return new FileInputStream(new File("/var/local/lcsf_lts/photo/DefaultIdCard.png")); // 如果没有找到用户的头像，返回一个默认的头像
            } catch (FileNotFoundException e1) { // 不允许默认的身份证头像文件不存在，不需处理异常
            }
        }
        return fileInputStream;
    }

}
