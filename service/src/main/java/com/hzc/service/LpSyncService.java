package com.hzc.service;

import com.qtrj.simpleframework.ssh.service.Transaction;
import com.hzc.model.HisCollection;
import com.hzc.model.SysUser;
import com.hzc.factory.alias.D;
import com.hzc.util.alias.S;

import java.util.Date;
import java.util.List;

/**
 * Created by yinbin on 2015/4/29.
 */
@Transaction
public class LpSyncService {


    /**
     * 直接存储dataStr，根据userId。如果dataStr没有数据则不进行存储。
     */
    public Date saveLocalData(String idCard, HisCollection[] hisCollections) {
        Date date = new Date(); // 存储的时间，统一使用服务器的时间

        SysUser sysUser = S.sysUserService().getUserByIdCard(idCard);

        List<Integer> qIds = D.hisCollectionMapper().selectAllCollectQid(sysUser.getId());

        for (HisCollection hisCollection : hisCollections) {

            hisCollection.setUserId(sysUser.getId());
            hisCollection.setUpdateTime(date);

            if (qIds.contains(hisCollection.getQuestionId())) {

                D.hisCollectionMapper().updateByPrimaryKeySelective(hisCollection);
            } else {

                D.hisCollectionMapper().insert(hisCollection);
            }
        }
        return date;
    }


    /**
     * 根据userId查询时间大于currDate的数据。如果currDate没有的话查询所有数据。
     */
    public List<HisCollection> loadRemoteData(String idCard, Date updateTime) {
        SysUser userByPhone = S.sysUserService().getUserByIdCard(idCard);
        Integer userId = userByPhone.getId();
        return D.hisCollectionMapper().selectListGtCurrDate(userId, updateTime);
    }

    public boolean saveCollection(HisCollection hisCollection) {
        int i = 0;
        try {
            i = D.hisCollectionMapper().insertSelective(hisCollection);
        } catch (Exception e) {
        }
        return i == 1;
    }

    public boolean deleteCollection(HisCollection hisCollection) {
        int i = D.hisCollectionMapper().deleteByUserIdAndQuestionId(hisCollection);
        return i == 1;
    }

    public List<HisCollection> loadCollection(HisCollection hisCollection) {
        return D.hisCollectionMapper().selectAllByUserIdAndType(hisCollection);
    }
}
