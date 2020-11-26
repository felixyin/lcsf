package com.hzc.ctrl;

import com.hzc.model.HisCollection;
import com.hzc.model.SysUser;
import com.hzc.util.HttpSessionUtil;
import com.hzc.util.alias.S;
import com.hzc.util.alias.W;
import org.apache.commons.lang.StringUtils;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by yinbin on 2015/4/29.
 * 用于同步手机的用户操作数据和后台的数据
 */
public class LpSyncCtrl {

    /**
     * 保存手机本地数据（收藏和错题）到服务器，加载服务器数据（收藏和错题）到手机本地
     */
    public void saveAndLoad() {
        String idCard = W.getString("idCard"); // 身份证号码

        String updateTimeStr = W.getString("updateTimeStr");
        Date updateTime = null;
        if (StringUtils.isNotBlank(updateTimeStr)) {
            updateTime = new Date(Long.parseLong(updateTimeStr));
        }

        String dataStr = W.getString("dataStr");
        HisCollection[] hisCollections = (HisCollection[]) W.jsonConvertJavaArray(HisCollection.class, dataStr);

//        根据userId查询时间大于currDate的数据。如果currDate没有的话查询所有数据。
        List<HisCollection> list = S.lpSyncService().loadRemoteData(idCard, updateTime);

//        直接存储dataStr，根据userId。如果dataStr没有数据则不进行存储。
        Date date = S.lpSyncService().saveLocalData(idCard, hisCollections);

        Map<String, Object> map = new HashMap<String, Object>();
        map.put("date", date.getTime());
        map.put("data", list);
        W.writeJsonObject(map);
    }

    /**
     * 保存，用户的收藏数据或错题数据，到服务器
     */
    public void saveCollection() {
        String idCard = W.getString("idCard");
        SysUser sysUser = S.sysUserService().getUserByIdCard(idCard);

        HisCollection hisCollection = W.packBean(HisCollection.class);

        hisCollection.setUpdateTime(new Date());
        hisCollection.setUserId(sysUser.getId());

        boolean b = S.lpSyncService().saveCollection(hisCollection);

        W.writeJson(b, "");
    }

    /**
     * 删除，用户收藏数据或错题数据，从服务器
     */
    public void deleteCollection() {
        String idCard = W.getString("idCard");
        SysUser sysUser = S.sysUserService().getUserByIdCard(idCard);

        HisCollection hisCollection = W.packBean(HisCollection.class);

        hisCollection.setUpdateTime(new Date());
        hisCollection.setUserId(sysUser.getId());

        boolean b = S.lpSyncService().deleteCollection(hisCollection);

        W.writeJson(b, "");
    }

    /**
     * 加载，用户收藏数据或错题数据，从服务器
     */
    public void loadCollection() {
        String idCard = W.getString("idCard");
        SysUser sysUser = S.sysUserService().getUserByIdCard(idCard);

        HisCollection hisCollection = W.packBean(HisCollection.class);
        hisCollection.setUserId(sysUser.getId());

        List<HisCollection> list = S.lpSyncService().loadCollection(hisCollection);

        W.writeJsonArray(list);
    }

    /**
     * app清空错题题库、收藏题库
     */
    public void clearCollectionApp() {
        Integer type = W.getInteger("type"); // 1收藏，2错题
        String idCard = W.getString("idCard");

        if (StringUtils.isBlank(idCard) || type < 1) {
            throw new IllegalArgumentException("type or idCard is wrong");
        }

        SysUser sysUser = S.sysUserService().getUserByIdCard(idCard);
        if (null == sysUser) {
            throw new IllegalArgumentException("SysUser is null");
        }

        S.lpQuestionService().clearCollectionByUserId(sysUser.getId(), type);

        W.writeJson(true, "");
    }

    /**
     * 清空所有单选题或者多选题或者判断题的错题或者收藏
     */
    public void clearCollectionAppForSection() {
        Integer type = W.getInteger("type");
        String idCard = W.getString("idCard");
        String sectionId = W.getString("sectionId");

        if (StringUtils.isBlank(idCard) || type < 1) {
            throw new IllegalArgumentException("type or idCard is wrong");
        }

        SysUser sysUser = S.sysUserService().getUserByIdCard(idCard);
        if (null == sysUser) {
            throw new IllegalArgumentException("SysUser is null");
        }

        S.lpQuestionService().clearCollectionByUserId(sysUser.getId(), type, sectionId);

        W.writeJson(true, "");
    }


    /**
     * 手机app，用户在做题过程中做题的次数累加
     */
    public void addAnswerTimes() {
//        System.out.println("addAnswerTimes");
        Integer questionId = W.getInteger("questionId");
        String idCard = W.getString("idCard");
        SysUser sysUser = S.sysUserService().selectUserByIdCard(idCard);
        int userId = sysUser.getId();
        boolean b = S.hisAnswerService().addAnswerTimes(userId, questionId);
//        如果间隔时间大于五秒，则记录真正的访问次数
        if (!HttpSessionUtil.checkLessFiveMinutes()) {
//            System.out.println("addEffectAnswerTimes2");
            S.hisAnswerService().addEffectAnswerTimes2(userId, questionId);
        }
        W.writeJson(b, "");
    }

    /**
     * 手机app，用户在做题过程中学习的次数累加
     */
    public void addStudyTimes() throws InterruptedException {
//        System.out.println("addStudyTimes");
        if (HttpSessionUtil.checkLessFiveMinutes()) {
            W.writeJson(false, "");
            return;
        }
        Integer questionId = W.getInteger("questionId");
        String idCard = W.getString("idCard");
        SysUser sysUser = S.sysUserService().selectUserByIdCard(idCard);
        int userId = sysUser.getId();
        boolean b = S.hisAnswerService().addStudyTimes(userId, questionId);
        W.writeJson(b, "");
    }


    /**
     * 手机app，累加用户做错题的次数
     */
    public void addCollectTimes() throws InterruptedException {
        Thread.sleep(5000L); // 处理数据库中可能存在重复数据的问题
//        System.out.println("addCollectTimes");
        Integer questionId = W.getInteger("questionId");
        String idCard = W.getString("idCard");
        SysUser sysUser = S.sysUserService().selectUserByIdCard(idCard);
        int userId = sysUser.getId();
        boolean b = S.hisAnswerService().addCollectTimes(userId, questionId);
        W.writeJson(b, "");
    }

    /**
     * 累加收藏夹中学习的次数
     */
    public void addTimesForBookmark() {
//        System.out.println("addTimesForBookmark");
        if (HttpSessionUtil.checkLessFiveMinutes()) {
            W.writeJson(false, "");
            return;
        }
        Integer questionId = W.getInteger("questionId");
        String idCard = W.getString("idCard");
        SysUser sysUser = S.sysUserService().selectUserByIdCard(idCard);
        int userId = sysUser.getId();
        boolean b = S.hisAnswerService().addTimesForBookmark(userId, questionId);
        W.writeJson(b, "");
    }

    /**
     * 累加错题库中学习的次数
     */
    public void addTimesForError() {
//        System.out.println("addTimesForError");
        if (HttpSessionUtil.checkLessFiveMinutes()) {
            W.writeJson(false, "");
            return;
        }
        Integer questionId = W.getInteger("questionId");
        String idCard = W.getString("idCard");
        SysUser sysUser = S.sysUserService().selectUserByIdCard(idCard);
        int userId = sysUser.getId();
        boolean b = S.hisAnswerService().addTimesForError(userId, questionId);
        W.writeJson(b, "");
    }

}
