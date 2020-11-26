package com.hzc.service;

import com.hzc.factory.alias.D;
import com.qtrj.simpleframework.ssh.repository.mybatis.DataTablePager;
import com.qtrj.simpleframework.ssh.service.TrancationType;
import com.qtrj.simpleframework.ssh.service.Transaction;
import com.hzc.model.HisAnswer;
import com.hzc.model.HisCollection;
import com.hzc.model.LpOption;
import com.hzc.model.LpQuestion;
import com.hzc.vo.AnswerCardVO;
import com.hzc.vo.QuestionVO;
import com.hzc.vo.ResultVO;
import com.hzc.vo.UserAnswerVO;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

import java.util.*;

/**
 * Created by HZC on 2015/4/29.
 * 李沧普法系统
 * 试题service
 */
@Transaction(jdbc = TrancationType.CLOSE)
public class LpQuestionService {

    private static Logger log = Logger.getLogger(LpQuestionService.class);

    /**
     * 根据userId
     * 获取学习页答题卡内容
     * 包括：questionId，答题次数，错误次数，试题类型，是否收藏
     *
     * @param userId
     * @return
     */
    public List<AnswerCardVO> getAnserCardList(int userId) {
        return D.lpQuestionMapper().selectForAnswerCardList(userId);
    }

    /**
     * 根据userId
     * 获取模拟页答题卡内容
     * 包括：questionId，答题次数，错误次数，试题类型，是否收藏
     *
     * @param userId
     * @return
     */
    public List<AnswerCardVO> getAnserCardListForTest(int userId) {
        //    模拟题中答题卡数据的缓存
        List<AnswerCardVO> test_panduan_card = new ArrayList<AnswerCardVO>();
        List<AnswerCardVO> test_danxuan_card = new ArrayList<AnswerCardVO>();
        List<AnswerCardVO> test_duoxuan_card = new ArrayList<AnswerCardVO>();

        List<AnswerCardVO> acvList = D.lpQuestionMapper().selectForAnswerCardList(userId);
        for (AnswerCardVO vo : acvList) {
            if ("判断题".equals(vo.getType())) {
                test_panduan_card.add(vo);
            } else if ("单选题".equals(vo.getType())) {
                test_danxuan_card.add(vo);
            } else if ("多选题".equals(vo.getType())) {
                test_duoxuan_card.add(vo);
            }
        }

        Collections.shuffle(test_panduan_card);
        Collections.shuffle(test_danxuan_card);
        Collections.shuffle(test_duoxuan_card);

        List<AnswerCardVO> acVos = new ArrayList<AnswerCardVO>();
        acVos.addAll(test_panduan_card.subList(0, 30));
        acVos.addAll(test_danxuan_card.subList(0, 30));
        acVos.addAll(test_duoxuan_card.subList(0, 20));

        return acVos;
    }

    /**
     * 根据questionId查询用户的试题
     * 包括：questionId，答题次数，错误次数，试题类型，试题信息
     *
     * @param questionId
     * @param userId
     * @return
     */
    public QuestionVO getQuestion(int questionId, int userId) {
        QuestionVO questionVO = D.lpQuestionMapper().selectByPrimaryKeyForUser(questionId, userId);
        List<LpOption> options = getOptionByQuestionId(questionId);
        questionVO.setOptions(options);
        return questionVO;
    }

    /**
     * 根据questionId获取试题选项
     *
     * @param questionId
     * @return
     */
    public List<LpOption> getOptionByQuestionId(int questionId) {
        List<LpOption> lpOptions = D.lpOptionMapper().selectByQuestionId(questionId);
        String[] labels = new String[]{"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O"};
        int i = 0;
        for (LpOption lpOption : lpOptions) {
            lpOption.setLabel(labels[i]);
            i++;
        }
        return lpOptions;
    }

    /**
     * 根据questionId更新用户的答题信息
     * 用户答错次数：如果答错，则answer.collectTime = 1，否则为0
     * 用户答题次数：answer.answerTime = 1
     *
     * @param answer
     */
    @Transaction(jdbc = TrancationType.OPEN)
    public void updateUserAnserInfo(HisAnswer answer) {
        D.hisAnswerMapper().updateAnswerInfoByUserIdAndQuestionId(answer);
    }

    /**
     * 根据userId 和 questionId 获取用户的答题记录
     *
     * @param userId
     * @param questionId
     * @return
     */
    public HisAnswer selectLpAnswerByUserIdAndQuestionId(int userId, int questionId) {
        return D.hisAnswerMapper().selectByUserIdAndQuestionId(userId, questionId);
    }

    /**
     * 保存用户收藏试题、错题
     * type：1、收藏，2、错题
     *
     * @param collection
     */
    @Transaction(jdbc = TrancationType.OPEN)
    public void saveCollection(HisCollection collection) {
        try {
            D.hisCollectionMapper().insertSelective(collection);
        } catch (Exception e) {
        }
    }

    /**
     * 根据userId、questionId、type删除收藏、错题
     * type：1、收藏，2、错题
     *
     * @param collection
     */
    @Transaction(jdbc = TrancationType.OPEN)
    public void unCollectQuestion(HisCollection collection) {
        D.hisCollectionMapper().deleteByUserIdAndQuestionId(collection);
    }

    /**
     * 保存、删除用户错题
     * <pre>
     * 用户做题次数 +1
     * 如果做错，则错题次数 +1
     * 本方法带逻辑，保存用户答题信息时报错，会再执行一次保存用户答题信息
     * </pre>
     *
     * @param userAnswerVO
     */
    public void saveQuestionError(UserAnswerVO userAnswerVO) {
        String userResult = userAnswerVO.getUserResult();
        Integer questionId = userAnswerVO.getQuestionId();
        int userId = userAnswerVO.getUserId();
        String userAnswer = userAnswerVO.getUserAnswer();

        HisAnswer hisAnswer = selectLpAnswerByUserIdAndQuestionId(userId, questionId);
        if (null == hisAnswer) {//第一次做此题
            hisAnswer = new HisAnswer();
        }
        hisAnswer.setCollectTimes(0);
        hisAnswer.setQuestionId(questionId);
        hisAnswer.setUserId(userId);

        HisCollection collection = getCollectQuestion(questionId, userId, 2);

        //用户做对了此题
        if (userResult.equals("true")) {
            if (null != collection) {//上一次此题做错了，则删除此题
                deleteCollectById(collection.getId());
            }
        } else {
            //用户做错了
            hisAnswer.setCollectTimes(1);
            LpQuestion lpQuestion = D.lpQuestionMapper().selectByPrimaryKey(questionId);
            if (null == collection) {//上一次此题没做错，则保存此题
                collection = new HisCollection();
                collection.setUserId(userId);
                collection.setType(2);
                collection.setCategoryCode(lpQuestion.getCategoryCode());
                collection.setQuestionId(questionId);
                collection.setAnswer(userAnswer);
                collection.setUpdateTime(new Date());
                saveCollection(collection);
            }
        }
        try {
            //因为与保存有效答题次数或看题次数与保存答题次数是同一个试题同时发起的两个请求，不确定是哪一个先执行插入，所以其中一个可能会报错
            // Duplicate entry '1-46' for key 'PRIMARY'，所以报错之后，再执行一次更新即可
            saveAndUpdateUserAnswer(hisAnswer);
        } catch (Exception e) {
            saveAndUpdateUserAnswer(hisAnswer);
        }
    }

    /**
     * 查看次数删除做的次数
     *
     * @param userId
     * @param questionId
     */
    @Transaction(jdbc = TrancationType.OPEN)
    public void subtractStyTimes(Integer userId, Integer questionId) {
        D.hisAnswerMapper().subtractStyTimes(userId, questionId);
    }

    /**
     * 根据id删除collection
     *
     * @param id
     */
    @Transaction(jdbc = TrancationType.OPEN)
    public void deleteCollectById(Integer id) {
        D.hisCollectionMapper().deleteByPrimaryKey(id);
    }

    /**
     * 查询用户收藏、错题
     *
     * @param questionId
     * @param userId
     * @param type       ：类型，1、收藏，2、错题
     * @return
     */
    public HisCollection getCollectQuestion(Integer questionId, int userId, int type) {
        return D.hisCollectionMapper().selectByQIdUIdAndType(questionId, userId, type);
    }

    /**
     * 保存用户答题信息
     * 新建数据
     *
     * @param answer
     */
    @Transaction(jdbc = TrancationType.OPEN)
    public void saveUserAnswer(HisAnswer answer) {
        D.hisAnswerMapper().insertSelective(answer);
    }

    /**
     * 保存用户答题信息
     * 用户已答过此题，则更新此题
     * 没有答过，则添加新题
     *
     * @param answer
     */
    public void saveAndUpdateUserAnswer(HisAnswer answer) {
//        log.error("hzcerror:save answerTimes and save errorTimes");
        Integer userId = answer.getUserId();
        Integer questionId = answer.getQuestionId();
        HisAnswer hisAnswer = selectLpAnswerByUserIdAndQuestionId(userId, questionId);
        if (null != hisAnswer) {
            updateUserAnserInfo(answer);
        } else {
            answer.setCollectTimes(1);
            answer.setAnswerTimes(1);
            answer.setCreateTime(new Date());
            answer.setDeleted(1);
            saveUserAnswer(answer);
        }
    }

    /**
     * 保存、删除用户收藏题
     *
     * @param collection
     */
    public void saveOrDeleteCollect(HisCollection collection, boolean deleted) {
        LpQuestion lpQuestion = D.lpQuestionMapper().selectByPrimaryKey(collection.getQuestionId());
        collection.setCategoryCode(lpQuestion.getCategoryCode());

        if (deleted) {
            saveCollection(collection);
        } else {
            unCollectQuestion(collection);
        }
    }

    /**
     * 根据userId获取收藏试题
     * 不带options（选项）
     *
     * @param userId
     * @return
     */
    public List<AnswerCardVO> getCollectQuestions(int userId) {
        return getCollections(userId, 1);
    }

    /**
     * 根据userId获取错题
     * 不带options（选项）
     *
     * @param userId
     * @return
     */
    public List<AnswerCardVO> getErrorQuestions(int userId) {
        return getErrorCollections(userId);
    }

    /**
     * 根据userId，type获取用户收藏题或错题内容
     * 返回的answerCardVo
     * 生成答题卡
     *
     * @param userId
     * @param type
     * @return
     */
    public List<AnswerCardVO> getCollections(int userId, int type) {
        return D.hisCollectionMapper().selectCollectionsByUserIdForCard(userId, type);
    }

    /**
     * 获取用户的错题
     * 带此题是否被收藏过
     *
     * @param userId
     * @return
     */
    public List<AnswerCardVO> getErrorCollections(int userId) {
        return D.hisCollectionMapper().selectErrorCollections(userId);
    }

    /**
     * 分页查询所有试题
     *
     * @param currentNum
     * @param pageSize
     * @return
     */
    public List<QuestionVO> getAllQuestionsForLimit(Integer currentNum, Integer pageSize) {
        List<QuestionVO> list = D.lpQuestionMapper().selectAllQuestionForLimit(currentNum, pageSize);
        ArrayList<QuestionVO> vos = new ArrayList<QuestionVO>();
        for (int i = 0; i < list.size(); i++) {
            QuestionVO questionVO = list.get(i);
            List<LpOption> options = getOptionByQuestionId(questionVO.getQuestionId());
            questionVO.setOptions(options);
            vos.add(questionVO);
        }
        return vos;
    }

    /**
     * 根据userId清空用户的错题本、收藏本
     *
     * @param userId
     * @param type      ：1、收藏本，2、错题本
     * @param sectionId
     */
    @Transaction(jdbc = TrancationType.OPEN)
    public void clearCollectionByUserId(Integer userId, Integer type, String sectionId) {
        int i = D.hisCollectionMapper().deleteByUserIdAndType(userId, type, sectionId);
    }

    /**
     * 根据userId清空用户的错题本、收藏本
     *
     * @param userId
     * @param type   ：1、收藏本，2、错题本
     */
    @Transaction(jdbc = TrancationType.OPEN)
    public void clearCollectionByUserId(Integer userId, Integer type) {
        D.hisCollectionMapper().deleteByUserIdAndType(userId, type, null);
    }

    /**
     * 根据试题类型，获取试题
     * 试题不包括option（选项）
     *
     * @param type
     * @return
     */
    public List<AnswerCardVO> getQuestionByType(int userId, String type) {
        return D.lpQuestionMapper().selectByType(userId, type);
    }

    /**
     * 根据试题类型，获取试题 优化版本的
     * 试题不包括option（选项）
     *
     * @param type
     * @return
     */
    public Object[][] getQuestionByTypeOptimize(int userId, String type) {
        List<Map> list = D.lpQuestionMapper().selectByTypeOptimize(userId, type);
        Object[][] ret = new Object[list.size()][];
        for (int i = 0; i < list.size(); i++) {
            Map map = list.get(i);
            Object questionId = map.get("questionId");
            Object collectTime = map.get("collectTimes");
            Object answerTime = map.get("answerTimes");
            Object seq = map.get("seq");
            ret[i] = new Object[]{questionId, collectTime, answerTime, seq};
        }
        return ret;
    }

    /**
     * 根据用户Id获取收藏题或错题
     * type：1、收藏，2、错题
     * 带options
     *
     * @param userId
     * @param type
     * @return
     */
    public List<QuestionVO> getQuestionsByTypeForPrint(int userId, int type) {
        List<AnswerCardVO> list = getCollectionsForPrint(userId, type);
        ArrayList<QuestionVO> vos = new ArrayList<QuestionVO>();
        for (int i = 0; i < list.size(); i++) {
            AnswerCardVO vo = list.get(i);
            QuestionVO questionVO = new QuestionVO();
            questionVO.setQuestionId(vo.getQuestionId());
            questionVO.setName(vo.getName());
            questionVO.setType(vo.getType());
            questionVO.setSeq(vo.getSeq());
            questionVO.setCollectTime(vo.getCollectTime());
            questionVO.setAnswerTime(vo.getAnswerTime());
            questionVO.setCategoryCode(vo.getCategoryCode());
            List<LpOption> options = getOptionByQuestionId(vo.getQuestionId());
            questionVO.setOptions(options);
            vos.add(questionVO);
        }
        return vos;
    }

    /**
     * 根据userId和type获取用户的错题、收藏题
     * 获取的结果用于打印
     *
     * @param userId
     * @param type：1、收藏题，2、错题
     * @return
     */
    private List<AnswerCardVO> getCollectionsForPrint(int userId, int type) {
        return D.hisCollectionMapper().selectCollectionsByUserIdForPrint(userId, type);
    }

    /**
     * 保存用户错题
     *
     * @param data
     * @param userId
     */
    public void saveErrors(String data, int userId) {
//        log.error("hzcerror:saveErrors for test");
        JSONArray jsonArray = JSONArray.fromObject(data);
        Object[] array = jsonArray.toArray();
        UserAnswerVO userAnswerVO = new UserAnswerVO();
        for (int i = 0; i < array.length; i++) {
            Object o = array[i];
            JSONObject jsonObject = JSONObject.fromObject(o);
            String qid = jsonObject.getString("name");
            JSONObject val = jsonObject.getJSONObject("val");
            if (val.size() > 0 && StringUtils.isNotBlank(val.getString("ua"))) {
                String ua = val.getString("ua");
                String ur = val.getString("ur");
                userAnswerVO.setUserId(userId);
                userAnswerVO.setQuestionId(Integer.parseInt(qid));
                userAnswerVO.setUserAnswer(ua);
                userAnswerVO.setUserResult(ur);
                saveQuestionError(userAnswerVO);
            }
        }
    }

    /**
     * 更新用户答题次数
     *
     * @param answer
     */
    @Transaction(jdbc = TrancationType.OPEN)
    public void saveStyTimes(HisAnswer answer) {
//        log.error("hzcerror:add styTimes for test");
        Integer userId = answer.getUserId();
        Integer questionId = answer.getQuestionId();
        HisAnswer hisAnswer = selectLpAnswerByUserIdAndQuestionId(userId, questionId);
        if (null != hisAnswer) {
            D.hisAnswerMapper().addStudyTimes(userId, questionId);
        } else {
            answer.setStyTimes(1);
            answer.setCreateTime(new Date());
            answer.setDeleted(1);
            saveUserAnswer(answer);
        }
    }

    /**
     * 保存用户查看错题次数或收藏题次数
     *
     * @param answer
     * @param type
     */
    @Transaction(jdbc = TrancationType.OPEN)
    public void saveBMCLTTimes(HisAnswer answer, Integer type) {
        Integer userId = answer.getUserId();
        Integer questionId = answer.getQuestionId();
        HisAnswer hisAnswer = selectLpAnswerByUserIdAndQuestionId(userId, questionId);
        if (type == 1) {
            answer.setStyBmTimes(1);
            answer.setStyCltTimes(0);
        } else {
            answer.setStyCltTimes(1);
            answer.setStyBmTimes(0);
        }
        if (null != hisAnswer) {
            answer.setId(hisAnswer.getId());
            D.hisAnswerMapper().updateBMCLTTimes(answer);
        } else {
            answer.setCreateTime(new Date());
            answer.setDeleted(1);
            saveUserAnswer(answer);
        }
    }
    /**
     *
     * @return
     */
    @DataTablePager
    public List<LpQuestion> ajaxGetQuestionsList(LpQuestion question) {
        return D.lpQuestionMapper().selectGroupQuestions(question);
    }
    /**
     * 返回删除试题信息
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
        return D.lpQuestionMapper().deleteByPrimaryKey(id);
    }
    /**
     * 返回添加试题信息结果
     *
     * @param question
     * @return
     */
    public ResultVO addLpQuestion(LpQuestion question) {
        int count=saveQuestion(question);
        if (count==1) {
            return new ResultVO(Boolean.TRUE, "成功");
        } else {
            return new ResultVO(Boolean.FALSE, "失败");
        }
    }
    /**
     * 保存试题信息
     *
     * @param question
     * @return
     */
    @Transaction(jdbc = TrancationType.OPEN)
    public int saveQuestion(LpQuestion question) {
        return D.lpQuestionMapper().insertSelective(question);
    }

    public int selectMaxseq(String type){
        return D.lpQuestionMapper().selectMaxseq(type);
    }
    /**
     * 返回一个试题信息
     *
     * @return
     */
    public LpQuestion getResource(Integer id) {
        return D.lpQuestionMapper().selectByPrimaryKey(id);
    }
    /**
     * 返回试题更新结果
     *
     * @param resource
     * @return
     */
    public ResultVO updateResource(LpQuestion resource) {
        Integer integer = updateResourceById(resource);
        if (integer == 1) {
            return new ResultVO(Boolean.TRUE, "成功");
        } else {
            return new ResultVO(Boolean.FALSE, "失败");
        }
    }
    /**
     * 返回试题信息更新条数
     *
     * @param resource
     * @return
     */
    public Integer updateResourceById(LpQuestion resource) {
        return D.lpQuestionMapper().updateByPrimaryKeySelective(resource);
    }
    /**
     * 返回试题的选项
     * @param qid 单位的父id
     * @return
     */
    @DataTablePager
    public List<LpOption> getJuniorQuestionList(Integer qid) {
        return D.lpOptionMapper().selectJuniorOptionList(qid);
    }
    /**
     * 返回添加试题选项结果
     *
     * @param option
     * @return
     */
    public ResultVO AddOption(LpOption option) {
        Integer integer = insertOptionGroup(option);
        if (integer == 1) {
            return new ResultVO(Boolean.TRUE, "成功");
        } else {
            return new ResultVO(Boolean.FALSE, "失败");
        }
    }
    /**
     * 返回添加选项条数
     *
     * @param group
     * @return
     */
    private Integer insertOptionGroup(LpOption group) {
        return D.lpOptionMapper().insertSelective(group);
    }
    /**
     * 返回删除试题下的选项信息
     *
     * @param id
     * @return
     */
    public ResultVO deleteOptio(Integer id) {
        Integer integer = deleteOptionById(id);
        if (integer == 1) {
            return new ResultVO(Boolean.TRUE, "成功");
        } else {
            return new ResultVO(Boolean.FALSE, "失败");
        }
    }
    /**
     * 返回删除选项的条数
     *
     * @param id
     * @return
     */
    private Integer deleteOptionById(Integer id) {
        return D.lpOptionMapper().deleteByPrimaryKey(id);
    }
    /**
     * 返回一个选项信息
     *
     * @return
     */
    public LpOption getOption(Integer id) {
        return D.lpOptionMapper().selectByPrimaryKey(id);
    }
    /**
     * 返回选项更新结果
     *
     * @param resource
     * @return
     */
    public ResultVO updateOption(LpOption resource) {
        Integer integer = updateOptionById(resource);
        if (integer == 1) {
            return new ResultVO(Boolean.TRUE, "成功");
        } else {
            return new ResultVO(Boolean.FALSE, "失败");
        }
    }
    /**
     * 返回选项更新条数
     *
     * @param resource
     * @return
     */
    public Integer updateOptionById(LpOption resource) {
        return D.lpOptionMapper().updateByPrimaryKeySelective(resource);
    }

}
