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
            addSelfCompany: 'SysCompanyCtrl.ajaxAddSelfCompany.do',
            //获取所有的单位组列表
            companyGroupList:'SysCompanyCtrl.ajaxGetCompanyGroupList.do',
            //添加单位组
            addCompanyGroups:'SysCompanyCtrl.ajaxAddCompanyGroups.do',
            //根据Id获取到某个单位的信息
            getCompanyGroup:'SysCompanyCtrl.ajaxGetCompanyGroup.do',
            //更改某个单位组的信息
            updateCompanyGroup:'SysCompanyCtrl.ajaxUpdateCompanyGroup.do',
            //获取到某个单位组下面的具体单位
            getJuniorCompanyList: 'SysCompanyCtrl.ajaxGetJuniorCompanyList.do',
            //删除单位分组下的某个单位
            deleteCompany: 'SysCompanyCtrl.ajaxDeleteCompany.do',
            //获取用户信息别表
            userList:'UserCtrl.ajaxGetUserList.do',
            //添加用户信息
            addResource:'UserCtrl.ajaxAddResource.do',
            //删除用户信息
            deleteResource: 'UserCtrl.ajaxDeleteRresouce.do',
            //获得单个用户的信息
            getResource: 'UserCtrl.ajaxGetResource.do',
            //更新用户的信息
            updateResource: 'UserCtrl.ajaxUpdateResource.do',
            addCompany:'SysCompanyCtrl.ajaxAddCompany.do'
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
            updateBMCLTTimes: 'LpQuestionCtrl.ajaxUpdateBMCLTTimes.do',
            //获取试题集合
            questionList:'LpQuestionCtrl.ajaxGetQuestionsList.do',
            //删除试题信息
            deleteResource:'LpQuestionCtrl.ajaxDeleteRresouce.do',
            //添加试题信息
            addResource:'LpQuestionCtrl.ajaxAddResource.do',
            //通过id查询试题信息
            getResource:'LpQuestionCtrl.ajaxGetResource.do',
            //更新试题的信息
            updateResource: 'LpQuestionCtrl.ajaxUpdateResource.do',
            //获取到某个试题下的选项
            getJuniorQuestionList: 'LpQuestionCtrl.ajaxGetJuniorQuestionList.do',
            //添加问题下的选项
            addOption:'LpQuestionCtrl.ajaxAddOption.do',
            //删除问题下的选项
            deleteOption:'LpQuestionCtrl.ajaxDeleteOption.do',
            //获取一个选项的数据
            getOptionGroup:'LpQuestionCtrl.ajaxGetOption.do',
            //跟新一个选项的信息
            updateOption:'LpQuestionCtrl.ajaxUpdateOption.do'
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
            saveUserAnswer: 'LpExamCtrl.ajaxSaveUserAnswer.do',
            //查看用户的试卷答题情况的信息
            getUserPaperInformation: 'LpExamCtrl.getUserPaperInformation.do'
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
            gradeList: 'ManageCtrl.ajaxGradeList.do',
            // todo
            //获取单位统计列表
            companyReportList: 'ManagementCtrl.ajaxGetCompanyReportList.do',
            //获取用户统计列表
            peopleReportList: 'ManagementCtrl.ajaxGetPeopleReportList.do'
        },
        //打印准考证相关
        card: {
            enrollmentList: 'ManageCtrl.ajaxEnrollmentList.do'
        },
        // 用户注册
        enrollment: {
            // 检查 身份证号是否已经注册测过了？
            ajaxCheckIdCardDup: 'UserCtrl.ajaxCheckIdCardDup.do',
            // 检查 用户名是否已经注册测过了？
            ajaxCheckPhoneDup: 'UserCtrl.ajaxCheckPhoneDup.do'
        },
        // todo
        management: {
            //考场配置信息
            resourceList: 'ManagementCtrl.ajaxGetResourceList.do',
            deleteResource: 'ManagementCtrl.ajaxDeleteResource.do',
            getResource: 'ManagementCtrl.ajaxGetResource.do',
            updateResource: 'ManagementCtrl.ajaxUpdateResource.do',
            addResource: 'ManagementCtrl.ajaxAddResource.do',
            //考试配置信息
            configList: 'ManagementCtrl.ajaxGetConfigList.do',
            getConfig: 'ManagementCtrl.ajaxGetConfig.do',
            updateConfig: 'ManagementCtrl.ajaxUpdateConfig.do',

        }
    }
};

