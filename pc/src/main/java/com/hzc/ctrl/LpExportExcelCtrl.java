package com.hzc.ctrl;

import com.qtrj.simpleframework.ssh.controller.ActionContext;
import com.qtrj.simpleframework.util.ExcelUtil;
import com.hzc.model.LpOption;
import com.hzc.util.alias.S;
import com.hzc.util.alias.W;
import com.hzc.vo.QuestionVO;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Created by yinbin on 2015/5/8.
 */
public class LpExportExcelCtrl {

    public void exportForAllQuestion() throws IOException {
//        Integer currentNum, Integer pageSize)
        Integer currentNum = W.getInteger("currentNum");
        Integer pageSize = 500;
//        int start = currentNum * pageSize + 1;
        List<QuestionVO> list = S.lpQuestionService().getAllQuestionsForLimit(currentNum, pageSize);
        for (QuestionVO qvo : list) {
            List<LpOption> options = qvo.getOptions();
            String answer = "";
            for (LpOption lo : options) {
                if (lo.getKey() >0) {
                    answer += lo.getLabel();
                }
            }
            qvo.setQuestionAnswer(answer);
        }
        String templateFileName = "template.xlsx";
        String downloadFileName = new String(("总体库" +( currentNum + 1) + "至" + (currentNum + list.size()) + "题").getBytes("UTF-8"), "ISO8859_1");
        writeExcel(templateFileName, downloadFileName, list);
    }

    public static void writeExcel(String templateFile, String fileName, List list) throws IOException {
        HttpServletResponse resp = ActionContext.getResp();
        resp.setContentType("application/vnd.ms-excel");
        resp.addHeader("Content-Disposition", "attachment;   filename=\"" + fileName + ".xls" + "\"");
        (new ExcelUtil()).writeExcel(templateFile, list, resp.getOutputStream());
    }

}
