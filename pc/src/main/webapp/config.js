/**
 * Created by yinbin on 2015/4/1.
 */

var Routers = {
    user: {},

    // 李沧普法APP
    pufa: {
        user: {
            searchList: 'UserCtrl.searchUserForPufaLexue.do',
            //获取所有非其他类的单位
            getCompany: 'SysCompanyCtrl.ajaxListStandardCompanies.do',
            //获取所有其他类的单位
            getOtherCompanies: 'SysCompanyCtrl.ajaxListOtherCompanies.do',
            //手动添加自己的单位（其他类）
            addSelfCompany: 'SysCompanyCtrl.ajaxAddSelfCompany.do'
        },
        // 学习页
        study: {
            //获取学习页试题答题卡的questionList
            getQuestionCardList: 'LpQuestionCtrl.getCardQuestionList.do',
            //获取用户的question的详细信息
            getQuestionDetail: 'LpQuestionCtrl.getQuestionDetail.do',
            //保存、删除用户错题
            saveQuestionError: 'LpQuestionCtrl.saveQuestionError.do',
            //保存、删除用户收藏
            saveQuestionCollect: 'LpQuestionCtrl.saveQuestionCollect.do',
            //获取模拟页试题答题卡的questionList （针对模拟测试）
            getCardQuestionListForTest: 'LpQuestionCtrl.getCardQuestionListForTest.do',
            //根据试题类型获取试题
            getQuestions: 'LpQuestionCtrl.listQuestions.do',
            //优化答题卡的查询
            listQuestionsOptimize: 'LpQuestionCtrl.listQuestionsOptimize.do',
            //保存用户看题次数，看题次数+1
            updateStyTimes: 'LpQuestionCtrl.ajaxUpdateStyTimes.do',
            //保存用户有效答题次数
            updateEffectStyTimes: 'LpQuestionCtrl.ajaxUpdateEffectStyTimes.do',
            //保存用户查看收藏次数，错题次数，查看次数+1
            updateBMCLTTimes: 'LpQuestionCtrl.ajaxUpdateBMCLTTimes.do'
        },
        //线上考试
        exam: {
            //获取试题答题卡的questionList （针对测试）
            getCardQuestionListForTest: 'LpExamCtrl.getCardQuestionListForTest.do',
            //获取用户的question的详细信息
            getQuestionDetail: 'LpExamCtrl.getQuestionDetail.do',
            //保存用户错题
            saveErrors: 'LpExamCtrl.saveErrors.do',
            //考试考试
            checkExamTime: 'LpExamCtrl.ajaxCheckExamTime.do',
            //保存用户的答题答案
            saveUserAnswer:'LpExamCtrl.ajaxSaveUserAnswer.do'
        },
        //模拟页
        test: {
            //addEffectAnswerTimes
            addEffectAnswerTimes: 'LpQuestionCtrl.ajaxAddEffectAnswerTimes.do',
            //addAnswerTimes
            addAnswerTimes: 'LpQuestionCtrl.ajaxAddAnswerTimes.do'
        },
        //收藏本
        collect: {
            //获取收藏薄试题
            getCollectQuestions: 'LpQuestionCtrl.getCollectQuestions.do',
            //清空收藏题库、错题题库
            clearCollect: 'LpQuestionCtrl.clearCollection.do',
            //获取用户需要打印的所有的收藏题或错题
            getQuestionsForPrint: 'LpQuestionCtrl.getQuestionsForPrint.do'
        },
        //错题本
        error: {
            //获取用户的错题
            getErrorQuestions: 'LpQuestionCtrl.getErrorQuestions.do',
            //删除用户错题
            deleteErrorQuestion: 'LpQuestionCtrl.deleteQuestionError.do',
            //保存用户错题
            saveErrors: 'LpQuestionCtrl.saveErrors.do'
        },
        //所有题
        all: {
            //分页加载试题
            getAllQuestionForLimit: 'LpQuestionCtrl.getAllQuestionForLimit.do'
        },
        // 供管理人员使用
        report: {
            enrollmentList: 'ManageCtrl.ajaxEnrollmentList.do',
            cardList: 'ManageCtrl.ajaxCardList.do',
            gradeList: 'ManageCtrl.ajaxGradeList.do'
        },
        //打印准考证相关
        card: {
            enrollmentList: 'ManageCtrl.ajaxEnrollmentList.do'
        },
        // 用户注册
        enrollment: {
            // 检查 身份证号是否已经注册测过了？
            ajaxCheckIdCardDup: 'UserCtrl.ajaxCheckIdCardDup.do'
        }
    }
};

