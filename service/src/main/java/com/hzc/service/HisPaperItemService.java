package com.hzc.service;

import com.hzc.factory.alias.D;
import com.qtrj.simpleframework.ssh.service.TrancationType;
import com.qtrj.simpleframework.ssh.service.Transaction;
import com.hzc.model.HisPaper;
import com.hzc.model.LpOption;
import com.hzc.vo.HisPaperItemVO;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by yue on 2015/7/24.
 */
@Transaction(jdbc = TrancationType.CLOSE)
public class HisPaperItemService {
    /**
     * 分页查询该用户的试题信息
     *
     * @param currentNum
     * @param pageSize
     * @return
     */
   // public List<HisPaperItem> getUserPaperInformation1(Integer currentNum, Integer pageSize) {
   //     List<HisPaperItem> list = D.hisPaperItemMapper().selectAllQuestionForLimit(currentNum, pageSize);
//        ArrayList<HisPaperItem> vos = new ArrayList<HisPaperItem>();
//        for (int i = 0; i < list.size(); i++) {
//            HisPaperItem hisPaperItem = list.get(i);
//            List<LpOption> options = getOptionByQuestionId(hisPaperItem.getId());
//
//            vos.add(hisPaperItem);
//        }
    //    return list;
  //  }
    /**
     * 找到用户的试卷
     * 用户的userId
     */
    public HisPaper getUserPaper(Integer userId)
    {
        HisPaper paper= D.hisPaperMapper().selectByUserId(userId);
        return paper;
    }

    /**
     * 分页进行查询考试的答题情况
     * @param currentNum
     * @param pageSize
     * @return
     */
    public List<HisPaperItemVO> getUserPaperInformation(Integer currentNum, Integer pageSize,Integer paperId) {
        List<HisPaperItemVO> list = D.hisPaperItemMapper().selectAllQuestionForLimit(currentNum, pageSize,paperId);
        ArrayList<HisPaperItemVO> vos = new ArrayList<HisPaperItemVO>();
        for (int i = 0; i < list.size(); i++) {
            HisPaperItemVO hisPaperItemVO = list.get(i);
            List<LpOption> options = getOptionByQuestionId(hisPaperItemVO.getId());
            hisPaperItemVO.setOptions(options);
            vos.add(hisPaperItemVO);
        }
        return vos;
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
}
