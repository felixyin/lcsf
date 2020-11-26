package com.hzc.ctrl;

import com.hzc.model.HisAnswer;
import com.hzc.model.HisCollection;
import com.hzc.model.SysUser;
import com.hzc.util.HttpSessionUtil;
import com.hzc.util.alias.S;
import com.hzc.util.alias.W;
import com.hzc.vo.AnswerCardVO;
import com.hzc.vo.LpQuestionTypeEnum;
import com.hzc.vo.QuestionVO;
import com.hzc.vo.UserAnswerVO;
import org.apache.commons.lang.StringUtils;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by HZC on 2015/4/29.
 * <p/>
 * 李沧干部法律法规学习测试系统
 * <p/>
 * 试题controller
 */
public class LpQuestionCtrl {

    /**
     * 学习页，答题卡列表
     * 返回questionList
     */
    public void getCardQuestionList() {
        int userId = HttpSessionUtil.getUserId();
        List<AnswerCardVO> anserCardList = S.lpQuestionService().getAnserCardList(userId);
        W.writeJsonArray(anserCardList);
    }

    /**
     * 学习页，答题卡列表 --> 针对模拟测试
     * 返回questionList
     */
    public void getCardQuestionListForTest() {
        int userId = HttpSessionUtil.getUserId();
        List<AnswerCardVO> anserCardList = S.lpQuestionService().getAnserCardListForTest(userId);
        W.writeJsonArray(anserCardList);
    }


    /**
     * 获取用户的question的详息
     * 包括：questionId，答题次数，错误次数，试题类型
     */
    public void getQuestionDetail() {
        Integer questionId = W.getInteger("questionId");
        if (questionId < 1) {
            throw new IllegalArgumentException("questionId is null");
        }
        QuestionVO question = S.lpQuestionService().getQuestion(questionId, HttpSessionUtil.getUserId());
        W.writeJsonObject(question);
    }

    /**
     * 保存、删除用户错题
     */
    public void saveQuestionError() throws InterruptedException {
        UserAnswerVO userAnswerVO = W.packBean(UserAnswerVO.class);
        int userId = HttpSessionUtil.getUserId();
        userAnswerVO.setUserId(userId);

        S.lpQuestionService().saveQuestionError(userAnswerVO);

        W.writeJson(true, "");
    }

    /**
     * 删除错题
     */
    public void deleteQuestionError() {
        Integer questionId = W.getInteger("questionId");
        int userId = HttpSessionUtil.getUserId();

        HisCollection collection = new HisCollection();
        collection.setQuestionId(questionId);
        collection.setUserId(userId);
        collection.setType(2);// 错题

        S.lpQuestionService().unCollectQuestion(collection);

        W.writeJson(true, "");
    }

    /**
     * 保存、删除用户收藏
     */
    public void saveQuestionCollect() {
        Integer questionId = W.getInteger("questionId");
        Boolean isWillSave = W.getBoolean("deleted");//是否删除收藏，true 保存，false 删除
        if (questionId < 1) {
            throw new IllegalArgumentException("questionId is null");
        }

        HisCollection collection = new HisCollection();
        collection.setUserId(HttpSessionUtil.getUserId());
        collection.setQuestionId(questionId);
        collection.setType(1);

        S.lpQuestionService().saveOrDeleteCollect(collection, isWillSave);

        W.writeJson(true, "");
    }

    /**
     * 获取用户收藏试题
     */
    public void getCollectQuestions() {
        int userId = HttpSessionUtil.getUserId();
        List<AnswerCardVO> anserCardList = S.lpQuestionService().getCollectQuestions(userId);
        W.writeJsonArray(anserCardList);
    }

    /**
     * 获取用户的错题
     */
    public void getErrorQuestions() {
        int userId = HttpSessionUtil.getUserId();
        List<AnswerCardVO> errorQuestions = S.lpQuestionService().getErrorQuestions(userId);
        W.writeJsonArray(errorQuestions);
    }

    /**
     * 总体库模块
     * <p/>
     * 查看所有试题
     * <p/>
     * 分页加载试题
     */
    public void getAllQuestionForLimit() {
        Integer currentNum = W.getInteger("currentNum");
        Integer pageSize = W.getInteger("pageSize");
        List<QuestionVO> list = S.lpQuestionService().getAllQuestionsForLimit(currentNum, pageSize);
        W.writeJsonArray(list);
    }


    /**
     * 清空所有单选题或者多选题或者判断题的错题或者收藏
     */
    public void clearCollectionAppForSection() {
        Integer type = W.getInteger("type"); // 标志：单选、判断、多选
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
     * 清空错题题库、收藏题库
     */
    public void clearCollection() {
        Integer type = W.getInteger("type");// 1收藏、2错题
        if (type < 1) {
            throw new IllegalArgumentException("type is wrong");
        }
        int userId = HttpSessionUtil.getUserId();

        S.lpQuestionService().clearCollectionByUserId(userId, type);

        W.writeJson(true, "");
    }

    /**
     * 根据试题类型获取答题卡号列表
     */
    public void listQuestions() {
        String type = W.getString("type");// 1收藏、2错题
        if (StringUtils.isBlank(type)) {
            throw new IllegalArgumentException("type is null");
        }
        int userId = HttpSessionUtil.getUserId();

        List<AnswerCardVO> list = S.lpQuestionService().getQuestionByType(userId, type);

        W.writeJsonArray(list);
    }


    /**
     * 优化版本的查询答题卡题号
     */
    public void listQuestionsOptimize() {
        String type = W.getString("type");// 1收藏、2错题
        int userId = HttpSessionUtil.getUserId();

        Object[][] cardNumbers = S.lpQuestionService().getQuestionByTypeOptimize(userId, type);

        Map<String, Object> map = new HashMap<String, Object>();
        map.put("type", type);
        map.put("userId", userId);
        map.put("categoryCode", LpQuestionTypeEnum.get(type));
        map.put("cardNumbers", cardNumbers);

        W.writeJsonObject(map);
    }

    /**
     * 返回用户需要打印的收藏题、错题
     */
    public void getQuestionsForPrint() {
        Integer type = W.getInteger("type");// 1收藏、2错题
        if (type < 1) {
            throw new IllegalArgumentException("type is wrong");
        }
        int userId = HttpSessionUtil.getUserId();

        List<QuestionVO> questionsByType = S.lpQuestionService().getQuestionsByTypeForPrint(userId, type);

        W.writeJsonArray(questionsByType);
    }

    /**
     * 保存用户错题
     */
    public void saveErrors() {
        String data = W.getString("data");
        if (StringUtils.isBlank(data)) {
            throw new IllegalArgumentException("data is null");
        }
        int userId = HttpSessionUtil.getUserId();

        S.lpQuestionService().saveErrors(data, userId);

        W.writeJson(true, "");
    }

    /**
     * 用于：统计用户行为数据
     * <p/>
     * 保存用户看题次数
     */
    public void ajaxUpdateStyTimes() throws InterruptedException {
        boolean b = HttpSessionUtil.checkLessFiveMinutes();
        if (!b) { // 大于5秒
            System.out.println("styTimes");
            Integer questionId = W.getInteger("questionId");
            if (questionId < 1) {
                throw new IllegalArgumentException("hzc Exception: argument is wrong");
            }

            HisAnswer hisAnswer = new HisAnswer();
            hisAnswer.setUserId(HttpSessionUtil.getUserId());
            hisAnswer.setQuestionId(questionId);

            try {
                //因为与保存有效答题次数或看题次数与保存答题次数是同一个试题同时发起的两个请求，不确定是哪一个先执行插入，所以其中一个可能会报错
                // Duplicate entry '1-46' for key 'PRIMARY'，所以报错之后，再执行一次更新即可
                S.lpQuestionService().saveStyTimes(hisAnswer);
            } catch (Exception e) {
                S.lpQuestionService().saveStyTimes(hisAnswer);
            }
        }

        W.writeJson(true, "");
    }

    /**
     * 用于：统计用户行为数据
     * <p/>
     * 保存用户有效答题次数次数
     */
    public void ajaxUpdateEffectStyTimes() throws InterruptedException {
        boolean b = HttpSessionUtil.checkLessFiveMinutes();
        if (!b) { // 大于5秒
            System.out.println("effectTimes");
            Integer questionId = W.getInteger("questionId");
            if (questionId < 1) {
                throw new IllegalArgumentException("hzc Exception: argument is wrong");
            }
            try {
                //因为与保存有效答题次数或看题次数与保存答题次数是同一个试题同时发起的两个请求，不确定是哪一个先执行插入，所以其中一个可能会报错
                // Duplicate entry '1-46' for key 'PRIMARY'，所以报错之后，再执行一次更新即可
                S.hisAnswerService().addEffectAnswerTimes(HttpSessionUtil.getUserId(), questionId);
            } catch (Exception e) {
                S.hisAnswerService().addEffectAnswerTimes(HttpSessionUtil.getUserId(), questionId);
            }
        }

        W.writeJson(true, "");
    }

    /**
     * 用于：统计用户行为数据
     * <p/>
     * 保存收藏题库查看次数或错题题库查看次数
     */
    public void ajaxUpdateBMCLTTimes() {
        boolean b = HttpSessionUtil.checkLessFiveMinutes();
        if (!b) {
            Integer questionId = W.getInteger("questionId");
            Integer type = W.getInteger("type");//1:收藏，2：错题
            if (questionId < 1 || type > 2 || type < 1) {
                throw new IllegalArgumentException("hzc Exception: argument is wrong");
            }

            HisAnswer hisAnswer = new HisAnswer();
            hisAnswer.setUserId(HttpSessionUtil.getUserId());
            hisAnswer.setQuestionId(questionId);

            S.lpQuestionService().saveBMCLTTimes(hisAnswer, type);
        }

        W.writeJson(true, "");
    }

    /**
     * 用于：统计用户行为数据
     * <p/>
     * pc端保存模拟测试有效答题次数
     */
    public void ajaxAddEffectAnswerTimes() {
        Integer questionId = W.getInteger("questionId");
        S.hisAnswerService().addEffectAnswerTimesForTest(questionId, HttpSessionUtil.getUserId());
        W.writeJson(true, "");
    }

    /**
     * 用于：统计用户行为数据
     * <p/>
     * pc端保存模拟测试答题次数
     */
    public void ajaxAddAnswerTimes() {
        Integer questionId = W.getInteger("questionId");
        S.hisAnswerService().addAnswerTimes(HttpSessionUtil.getUserId(), questionId);
        W.writeJson(true, "");
    }
}
