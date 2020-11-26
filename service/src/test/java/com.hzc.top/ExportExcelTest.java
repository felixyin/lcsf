package com.hzc.top;
import com.qtrj.simpleframework.util.ExcelUtil;
import com.hzc.util.alias.S;
import com.hzc.vo.QuestionVO;
import org.junit.Test;

import java.util.List;

/**
 * Created by yinbin on 2015/5/8.
 */
public class ExportExcelTest extends SupperJunit {

    @Test
    public void test1(){
        Integer userId = 1056;
        List<QuestionVO> list = S.lpQuestionService().getAllQuestionsForLimit(0, 20);
        String templateFileName = "template.xlsx";
        String resultFileName = "result.xlsx";
        new ExcelUtil().createExcel(templateFileName,list,resultFileName);
    }
}
