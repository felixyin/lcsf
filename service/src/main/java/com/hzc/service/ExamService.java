package com.hzc.service;

import com.hzc.factory.alias.D;
import com.hzc.framework.ssh.controller.WebUtil;
import com.hzc.framework.ssh.service.TrancationType;
import com.hzc.framework.ssh.service.Transaction;
import com.hzc.model.HisPaper;
import com.hzc.model.HisPaperItem;
import com.hzc.model.LpOption;
import com.hzc.vo.AnswerCardVO;
import com.hzc.vo.QuestionVO;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

/**
 * Created by yinbin on 2015/5/28.
 * 在线考试模块的业务逻辑
 */
@Transaction(jdbc = TrancationType.CLOSE)
public class ExamService {

    /**
     * 根据userId
     * 获取模拟页答题卡内容
     * 包括：questionId，答题次数，错误次数，试题类型，是否收藏
     *
     * @param userId
     * @param type:考试类型，1：开卷考试，2：闭卷考试
     * @return
     */
    public List<AnswerCardVO> loadCardList(int userId, Integer type) {
        //TODO 修改获取试题题库，同时把paperId记录到session中
        HisPaper paper = getPaperByUserId(userId);

        List<AnswerCardVO> acVos = new ArrayList<AnswerCardVO>();
        //已经存在该试卷，直接返回该试卷
        if (null != paper) {

            acVos = getPaperItemByPaperId(paper.getId());
        } else {
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

            acVos.addAll(test_panduan_card.subList(0, 30));
            acVos.addAll(test_danxuan_card.subList(0, 30));
            acVos.addAll(test_duoxuan_card.subList(0, 20));

            saveUserPaper(userId, acVos, type);

        }
        return acVos;
    }

    /**
     * 返回某个试卷试题
     * <pre>
     *     根据paperId获取该试卷的所有试题
     *     包括：questionId，categoryCode，type
     * </pre>
     *
     * @param id
     * @return
     */
    private List<AnswerCardVO> getPaperItemByPaperId(Integer id) {
        return D.hisPaperItemMapper().selectByPaperId(id);
    }

    /**
     * 返回用户的试卷
     * <pre>
     *     根据userId返回his_paper
     * </pre>
     *
     * @param userId
     * @return
     */
    public HisPaper getPaperByUserId(int userId) {
        return D.hisPaperMapper().selectByUserId(userId);
    }

    /**
     * 保存用户试卷信息
     * <pre>
     *     保存his_paper
     *     保存his_paper_item，仅包括paper_id，seq，create_time，categoryCode，type 其他不保存
     *     其他列在用户答题时保存
     * </pre>
     *
     * @param userId
     * @param acVos  用户考试试题
     * @param type   考试类型：1：开卷考试，2：闭卷考试
     */
    @Transaction(jdbc = TrancationType.OPEN)
    private void saveUserPaper(int userId, List<AnswerCardVO> acVos, Integer type) {
        HisPaper hisPaper = new HisPaper();
        Date createTime = new Date();
        hisPaper.setAnswerStartTime(createTime);
        hisPaper.setType(type);
        hisPaper.setCloseExam(type == 1 ? 2 : 1);
        hisPaper.setCreateTime(createTime);
        hisPaper.setDeleted(1);
        hisPaper.setUserId(userId);
        Integer paperId = addHisPaper(hisPaper);
        addHisPaperItem(paperId, acVos, createTime);
    }

    /**
     * 保存his_paper_item
     * <pre>
     *     根据paperId和所有的试卷试题
     *     保存paperId，seq（questionId），create_time,create_time，categoryCode，type
     * </pre>
     *
     * @param paperId
     * @param list
     * @param createTime
     */
    @Transaction(jdbc = TrancationType.OPEN)
    private void addHisPaperItem(Integer paperId, List<AnswerCardVO> list, Date createTime) {
        D.hisPaperItemMapper().insertAllQuestionForOnePaper(paperId, list, createTime);
    }

    /**
     * 返回paperId
     * <pre>
     *     插入一条新的his_paper
     *     返回主键
     * </pre>
     *
     * @param hisPaper
     * @return
     */
    @Transaction(jdbc = TrancationType.OPEN)
    private Integer addHisPaper(HisPaper hisPaper) {
        D.hisPaperMapper().insertSelective(hisPaper);
        return hisPaper.getId();
    }

    /**
     * 根据questionId查询用户的试题
     * 包括：questionId，试题信息，用户答题答案
     *
     * @param questionId
     * @param userId
     * @return
     */
    public QuestionVO loadQuestionDetail(int questionId, int userId) {
        QuestionVO questionVO = getQuestionByUserIdAndQuestionId(userId, questionId);
        List<LpOption> lpOptions = getOptions(questionId);
        String[] labels = new String[]{"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O"};
        int i = 0;
        for (LpOption lpOption : lpOptions) {
            lpOption.setLabel(labels[i]);
            i++;
        }
        List<LpOption> options = lpOptions;
        questionVO.setOptions(options);
        return questionVO;
    }

    /**
     * 返回试题选项
     * <pre>
     *     根据questionId获取该题的选项
     * </pre>
     *
     * @param questionId
     * @return
     */
    private List<LpOption> getOptions(int questionId) {
        return D.lpOptionMapper().selectByQuestionId(questionId);
    }

    /**
     * 返回用户试卷试题信息
     * <pre>
     *     根据用户userId和questionId获取试题
     *     包括：试题（不包括选项），用户作答信息
     * </pre>
     *
     * @param userId
     * @param questionId
     * @return
     */
    private QuestionVO getQuestionByUserIdAndQuestionId(int userId, int questionId) {
        return D.hisPaperItemMapper().selectQuestionByUserIdAndQuestionId(userId, questionId);
    }

    /**
     * 保存用户错题
     *
     * @param hisPaperStr
     * @param hisPaperItemStr {name:"",seq:"",category_code:"",type:"",option_a:"",option_b:"",option_c:"",option_d:"",key:1,answer:"",answer_time:38}
     * @param userId
     */
    @Transaction(jdbc = TrancationType.OPEN)
    public void saveUserAnswer(String hisPaperStr, String hisPaperItemStr, int userId, Integer cardId) {

//        添加与用户之间的关联
        HisPaper hisPaper = WebUtil.jsonConvertJavaObject(HisPaper.class, hisPaperStr);
        hisPaper.setDeleted(1);
        hisPaper.setUserId(userId);
        hisPaper.setCardId(cardId);
        hisPaper.setUpdateTime(new Date());
        hisPaper.setCreateTime(new Date());
        hisPaper.setCloseExam(2);
        D.hisPaperMapper().insert(hisPaper);
        Integer paperId = hisPaper.getId(); // 下面保存每道题的回答结果用

        HisPaperItem[] hisPaperItems = (HisPaperItem[]) WebUtil.jsonConvertJavaArray(HisPaperItem.class, hisPaperItemStr);

        for (HisPaperItem hisPaperItem : hisPaperItems) {

//            TODO 下面这些代码可以使用一个简单的update sql搞定。
            Integer questionId = hisPaperItem.getSeq();
            System.out.println(questionId);
            QuestionVO questionVO = loadQuestionDetail(questionId, userId);

            hisPaperItem.setName(questionVO.getName());
            hisPaperItem.setCategoryCode("" + questionVO.getCategoryCode());
            hisPaperItem.setType(questionVO.getType());
            List<LpOption> options = questionVO.getOptions();
            if (options.size() > 0) {
                LpOption lpOption = options.get(0);
                hisPaperItem.setOptionA(lpOption.getName());
                if (lpOption.getKey() == 1) {
                    hisPaperItem.setKey("A");
                }
            }
            if (options.size() > 1) {
                LpOption lpOption = options.get(1);
                hisPaperItem.setOptionB(lpOption.getName());
                if (lpOption.getKey() == 1) {
                    hisPaperItem.setKey("B");
                }
            }
            if (options.size() > 2) {
                LpOption lpOption = options.get(2);
                hisPaperItem.setOptionC(lpOption.getName());
                if (lpOption.getKey() == 1) {
                    hisPaperItem.setKey("C");
                }
            }
            if (options.size() > 3) {
                LpOption lpOption = options.get(3);
                hisPaperItem.setOptionD(lpOption.getName());
                if (lpOption.getKey() == 1) {
                    hisPaperItem.setKey("D");
                }
            }
            hisPaperItem.setUpdateTime(new Date());
            hisPaperItem.setCreateTime(new Date());
            hisPaperItem.setDeleted(1);
            hisPaperItem.setPaperId(paperId);

            D.hisPaperItemMapper().insert(hisPaperItem);
        }

    }

    /**
     * 保存用户单道试题做题答案
     * <pre>
     *     传入userId，questionId，userAnswer（用户该题的作答答案）
     *     保存该题内容到his_paper_item表中
     * </pre>
     *
     * @param userId
     * @param questionId
     * @param userAnswer
     */
    public boolean saveUserAnswer(int userId, Integer questionId, String userAnswer) {
        // TODO 修改考试题库为管理员手动生成之后，则把所有题的信息保存到paper_itemzhong
        // TODO 此时只需要更新answer即可
        //获取试题详细信息
        QuestionVO vo = loadQuestionDetail(questionId, userId);

        //获取试卷信息
        HisPaper paper = getPaperByUserId(userId);
        Integer paperId = paper.getId();

        //获取用户的paperItem
        HisPaperItem item = getPaperItemByQuestionIdAndPaperId(questionId, paperId);

        Date date = new Date();
        item.setName(vo.getName());
        List<LpOption> options = vo.getOptions();
        String questionKey = "";

        //获取试题选项和正确答案
        for (int i = 0; i < options.size(); i++) {
            LpOption option = options.get(i);
            String name = option.getName();
            Integer key = option.getKey();
            if (key > 0) {
                questionKey += option.getLabel();
            }
            switch (i) {
                case 0:
                    item.setOptionA(name);
                    break;
                case 1:
                    item.setOptionB(name);
                    break;
                case 2:
                    item.setOptionC(name);
                    break;
                case 3:
                    item.setOptionD(name);
                    break;
                case 4:
                    item.setOptionE(name);
                    break;
                case 5:
                    item.setOptionF(name);
                    break;
            }
        }

        item.setKey(questionKey);
        item.setAnswer(userAnswer);
        item.setUpdateTime(date);
        item.setPaperId(paperId);

        //更新his_paper_item
        return updatePaperItemById(item);
    }

    /**
     * 返回paper_item
     * <pre>
     *     根据questionId和paperId查询用户答题信息
     * </pre>
     *
     * @param questionId
     * @param paperId
     */
    public HisPaperItem getPaperItemByQuestionIdAndPaperId(Integer questionId, Integer paperId) {
        return D.hisPaperItemMapper().selectByQuestionIdAndPaperId(questionId, paperId);
    }

    /**
     * 更新用户的考试试题答题信息
     * <pre>
     *     根据id（主键）更新his_paper_item
     * </pre>
     *
     * @param item
     */
    @Transaction(jdbc = TrancationType.OPEN)
    public boolean updatePaperItemById(HisPaperItem item) {
        return D.hisPaperItemMapper().updateByPrimaryKeySelective(item) == 1;
    }

    /**
     * 返回保存成绩是否成功
     * <pre>
     *      保存用户考试试卷成绩
     * </pre>
     *
     * @param userId
     */
    public boolean saveExam(int userId) {
        // TODO 一个用户多个考卷，则需从session中获取该用户的该次考试试卷
        HisPaper paper = getPaperByUserId(userId);
        Integer score = calculateScore(paper.getId());
        paper.setScore(score.floatValue());
        paper.setAnswerEndTime(new Date());
        return updatePaperById(paper);
    }

    /**
     * 返回更新试卷是否成功
     * <pre>
     *     根据id（主键）更新试卷信息
     * </pre>
     *
     * @param paper
     * @return
     */
    @Transaction(jdbc = TrancationType.OPEN)
    private boolean updatePaperById(HisPaper paper) {
        return D.hisPaperMapper().updateByPrimaryKeySelective(paper) == 1;
    }

    /**
     * 返回用户考试成绩（分数）
     * <pre>
     *     根据paperId返回该试卷的总成绩
     * </pre>
     *
     * @param paperId
     * @return
     */
    private Integer calculateScore(Integer paperId) {
        return D.hisPaperItemMapper().calculateScore(paperId);
    }

    /**
     * 返回一张试卷中正确的试题列表
     *
     * @param paperId
     * @return
     */
    public List<HisPaperItem> getCorrectQuestions(Integer paperId) {
        return D.hisPaperItemMapper().selectCorrectQuestions(paperId);
    }
}
