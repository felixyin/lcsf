/**
 * Created by HZC on 2015/4/29.
 */
(function () {
    var answerStartTime = new Date().toLocaleString();
    window.localStorage.setItem('_answerStartTime', answerStartTime);

    /**
     * 生成js模板
     * @param {Object} templateStr
     * @param {Object} data
     */
    function render(templateStr, data) {
        return templateStr.replace(/\{([\w\.]*)\}/g, function (str, key) {
            var keys = key.split("."),
                v = data[keys.shift()];
            for (var i = 0, l = keys.length; i < l; i++)
                v = v[keys[i]];
            return (typeof v !== "undefined" && v !== null) ? v : "";
        });
    }

    /**
     * 初始化答题卡
     */
    function initQuestionCardMoni() {
        var firstQuestionId = 1;
        $.ajax({
            type: 'post',
            data: {type: 1},//1：开卷考试，2：闭卷考试
            url: Routers.pufa.exam.getCardQuestionListForTest,
            success: function (data) {

                firstQuestionId = data[0].questionId;
                var danxuanHtmlStr = '';
                var panduanHtmlStr = '';
                var duoxuanHtmlStr = '';
                var questionAllStr = '';//2000个question的空div
                var htmlFirstDiv = '<div class="my-question-card-tab" data-ye="{ye}" style="display: none;">';
                var templateHtml = $('#template-moni-question-card-id').html();
                var yeti = 0;
                var danxuanYeshu = 0;
                var panduanYeshu = 0;
                var duoxuanYeshu = 0;
                for (var i = 0; i < data.length; i++) {
                    var question = data[i];
                    //用户此题做了，添加做过的样式
                    if (question.userAnswer) {
                        question.answer = 'my-btn-tihao-answer';
                    }
                    question.customIndex = i + 1;
                    if (question.type == '单选题') {
                        var yu = question.questionId % tishu;
                        if (yu == 1 && yeti == 0) {
                            yeti++;
                            danxuanHtmlStr += render(htmlFirstDiv, {ye: danxuanYeshu + 1});
                            danxuanHtmlStr += render(templateHtml, question);
                        } else {
                            if (yeti == tishu - 1) {//每页，最后一题
                                yeti = 0;
                                danxuanYeshu++;
                                danxuanHtmlStr += render(templateHtml, question);
                                danxuanHtmlStr += '</div>';
                            } else {//中间题
                                yeti++;
                                danxuanHtmlStr += render(templateHtml, question);
                            }
                        }
                    } else if (question.type == '判断题') {
                        var yu = question.seq % tishu;
                        if (yu == 1 && yeti == 0) {
                            yeti++;
                            panduanHtmlStr += render(htmlFirstDiv, {ye: panduanYeshu + 1});
                            panduanHtmlStr += render(templateHtml, question);
                        } else {
                            if (yeti == tishu - 1) {//每页，最后一题
                                yeti = 0;
                                panduanYeshu++;
                                panduanHtmlStr += render(templateHtml, question);
                                panduanHtmlStr += '</div>';
                            } else {//中间题
                                yeti++;
                                panduanHtmlStr += render(templateHtml, question);
                            }
                        }
                    } else {
                        var yu = question.seq % tishu;
                        if (yu == 1 && yeti == 0) {
                            yeti++;
                            duoxuanHtmlStr += render(htmlFirstDiv, {ye: duoxuanYeshu + 1});
                            duoxuanHtmlStr += render(templateHtml, question);
                        } else {
                            if (yeti == tishu - 1) {//每页，最后一题
                                yeti = 0;
                                duoxuanYeshu++;
                                duoxuanHtmlStr += render(templateHtml, question);
                                duoxuanHtmlStr += '</div>';
                            } else {//中间题
                                yeti++;
                                duoxuanHtmlStr += render(templateHtml, question);
                            }
                        }
                    }
                    questionAllStr += initEmptyQuestionListDomMoni(question);
                }

                //初始化questionCard
                $('#moni-danxuanti-id').empty().append(danxuanHtmlStr).children().first().show();
                $('#moni-panduanti-id').empty().append(panduanHtmlStr).children().first().show();
                $('#moni-duoxuanti-id').empty().append(duoxuanHtmlStr).children().first().show();

                //初始化2000个空的QuestionDetail的div，用来存储2000个question
                //点击单个question时加载详细的question
                $('#moni-question-detail-id').empty().html(questionAllStr);

                getQuestion(firstQuestionId);
                $('#moni-question-detail-id').children().first().show();
                traceQuestion(firstQuestionId);
                traceQuestionTab(firstQuestionId);
            }
        });
    }

    /**
     * 点击每题事件
     */
    function eventQuestionClickMoni() {
        $('.tab-content').delegate('.my-btn-moni-tihao', 'click', function () {
            judgeCurrentQuestionAnswer();
            var _questionId = $(this).attr('data-question-id');
            var _cl = $('#moni-' + _questionId).children().length;
            if (_cl < 1) {
                getQuestion(_questionId);
            }
            $('#moni-question-detail-id').children().hide();
            $('#moni-' + _questionId).show();
            traceQuestion(_questionId);
            traceQuestionTab(_questionId);
        });
    }

    /**
     * 获取空questionDom
     * 每个空的div带questionId
     * @param data
     */
    function initEmptyQuestionListDomMoni(questionDetail) {
        var templateDetailHtml = $('#template-moni-question-detail-empty-id').html();
        return render(templateDetailHtml, questionDetail);
    }

    /**
     * 获取question
     * @param questionId
     */
    function getQuestion(questionId) {
        $.ajax({
            type: "POST",
            url: Routers.pufa.exam.getQuestionDetail,
            data: {questionId: questionId},
            success: function (data) {

                //初始化选项
                var templateOption = $('#template-moni-option-id').html();
                var templateOptionChecked = $('#template-moni-option-checked-id').html();
                var options = data.options;
                var questiontype = data.type;
                var _type = 'radio';
                data.panduandisplay = 'none';
                data.danxuandisplay = 'none';
                data.duoxuandisplay = 'none';
                if (questiontype == '多选题') {
                    _type = 'checkbox';
                    data.duoxuandisplay = 'block';
                } else if (questiontype == '单选题') {
                    data.danxuandisplay = 'block';
                } else {
                    data.panduandisplay = 'block';
                }

                var htmlOptionsStr = '';
                var userAnswer = data.userAnswer;
                for (var o = 0; o < options.length; o++) {
                    var option = options[o];
                    option.type = _type;
                    if (userAnswer.indexOf(option.label) < 0) {
                        htmlOptionsStr += render(templateOption, option);
                    } else {
                        htmlOptionsStr += render(templateOptionChecked, option);
                    }
                }
                //初始化question
                var QuestionStr = '';

                var templateQuestionUp = $('#template-moni-question-detail-up-id').html();
                var templateQuestionDown = $('#template-moni-question-detail-down-id').html();

                data.customIndex = $('#moni-' + questionId).attr('data-index');
                QuestionStr += render(templateQuestionUp, data);
                QuestionStr += htmlOptionsStr;
                QuestionStr += render(templateQuestionDown, data);
                $('#moni-' + questionId).html(QuestionStr);
            }
        });
    }

    /**
     * 注册切换题事件
     */
    function eventMoniQuestionChangeMoni() {
        $('#moni-question-detail-id').delegate('.my-btn-moni-question-prev', 'click', function () {
            var _questionId = $(this).attr('data-question-id');
            judgeAnswer(_questionId);

            var prevQuestion = $('#moni-' + _questionId).prev();
            if (prevQuestion[0]) {
                var nQuestionId = $(prevQuestion).attr('data-question-id');
                var exist = $('#moni-' + nQuestionId).children().size();
                if (exist == 0) {
                    getQuestion(nQuestionId);
                }
                $('#moni-' + _questionId).hide().prev().show();
                traceQuestion(nQuestionId);
                traceQuestionTab(nQuestionId);
            }
        });
        $('#moni-question-detail-id').delegate('.my-btn-moni-question-next', 'click', function () {
            var _questionId = $(this).attr('data-question-id');
            judgeAnswer(_questionId);

            var nextQuestion = $('#moni-' + _questionId).next();
            if (nextQuestion[0]) {
                var nQuestionId = $(nextQuestion).attr('data-question-id');
                var exist = $('#moni-' + nQuestionId).children().size();
                if (exist == 0) {
                    getQuestion(nQuestionId);
                }
                $('#moni-' + _questionId).hide().next().show();
                traceQuestion(nQuestionId);
                traceQuestionTab(nQuestionId);
            }
        });
    }

    /**
     * 在dom中记录用户答题记录
     * @param questionId
     * @param userAnswerStr
     * @param questionAnswerStr
     * @param userResult
     */
    function setResult(questionId, userAnswerStr, questionAnswerStr, userResult) {
        var $q = $('#moni-' + questionId);
        $q.prop('userAnswerStr', userAnswerStr);
        $q.prop('questionAnswerStr', questionAnswerStr);
        $q.prop('userResult', userResult);
    }

    /**
     * 判断试题答案
     * @param options
     */
    function judgeAnswer(questionId) {
        var $q = $('#moni-' + questionId);
        var type = $q.attr('data-question-type');
        var options = $q.children().eq(2).children();
        //用户回答是否正确
        var userResult = 'false';
        //用户作答答案
        var userAnswer = [];
        //正确答案
        var questionAnswer = [];
        for (var p = 0; p < options.length; p++) {
            var _option = options[p];
            var key = $(_option).attr('data-key');
            var _ukey = $(_option).children().first().prop('checked');
            if (_ukey) {
                userAnswer.push($(_option).attr('data-label'));
            }
            if (key == 1) {
                questionAnswer.push($(_option).attr('data-label'));
            }
        }
        var userAnswerStr = userAnswer.join(',');
        var questionAnswerStr = questionAnswer.join(',');
        if (userAnswerStr == questionAnswerStr) {
            userResult = 'true';
        }
        if (userAnswer.length > 0) {//此题做了
            //设置答题状态
            $('#moni-card-' + questionId).addClass('my-btn-tihao-answer');
            setResult(questionId, userAnswerStr, questionAnswerStr, userResult);
        } else {
            $('#moni-card-' + questionId).removeClass('my-btn-tihao-answer');
            setResult(questionId, userAnswerStr, questionAnswerStr, userResult);
        }

    }

    /**
     * 计算当前题是否回答正确
     */
    function judgeCurrentQuestionAnswer() {
        var showedQuestionDom = $('#moni-question-detail-id').children().filter(function (index) {
            return $(this).css('display') != 'none';
        }).find('.my-btn-moni-question-next');
        var _questionId = $(showedQuestionDom).attr('data-question-id');
        judgeAnswer(_questionId);
    }

    /**
     * 提交按钮 处理函数
     */
    function submitHandler(isAutoSubmit) {
        var zuoWan = 0;//用户做题题数
        var testPreMsgTemplate = $('#template-test-result-id').html();
        var _questions = $('#moni-question-detail-id').children();
        for (var h = 0; h < _questions.length; h++) {
            var $_question = $(_questions[h]);
            var ua = $_question.prop('userAnswerStr');
            if (ua) {
                zuoWan += 1;
            }
        }
        var score = '';
        var msg = '';
        if (score >= 80) {
            msg = '<span style="margin-left: 122px;font-size: 1.3em;">恭喜</span></br>您已完成干部法律法规测试</br>您的成绩是' + score + '分';
        } else {
            msg = '您已完成干部法律法规测试</br>您的成绩是' + score + '分</br>请继续努力哦';
        }
        var htmlStr = render(testPreMsgTemplate, {
            msg: msg
        });
        var resumtMsg = '';
        if (zuoWan == 80) {
            resumtMsg = '您已经做完题了，确定要提交吗？';
        } else {
            resumtMsg = '<span style="">题还没有做完，您确定要提交吗？</span>';
        }
        if (isAutoSubmit) { // 点击“交卷”按钮则提示确认，否则直接交卷
            // TODO 如果是自动交卷，则不应该再显示一个用户确认窗口。应该直接显示一个3秒到5秒的倒计时，倒计时结束后应该自动交卷（用户无法取消）
            bootbox.confirm({
                buttons: {
                    confirm: {
                        label: '<span style="font-weight: bold;font-size: 20px;">确认</span>'
                    },
                    cancel: {
                        label: '<span style="font-weight: bold;font-size: 20px;">取消</span>',
                        className: 'hidden-cancel-btn'
                    }
                },
                message: '<span style="font-size: 25px;font-family: "微软雅黑"">' + resumtMsg + '</span>',
                callback: function (result) {
                    if (result) {
                        queRenResult();
                    } else {
                    }
                },
                title: '<span style="font-weight: bold;font-size: 20px;">提示</span>'
            });
        } else {
            queRenResult();
        }
        /**
         * 提交考试，然后显示考试结果
         */
        function queRenResult() {
            $(window).unbind('beforeunload');//如果是要交卷，则不应该再显示离开本页面的确认框，so，取消卸载页面的事件绑定。
            window.location.replace('LpExamCtrl.saveExam.do');
        }
    }

    /**
     * 交卷按钮 点击提交试卷
     */
    function eventSubmitExamBtn() {
        $('#submit-exam-btn-id').unbind('click').click(submitHandler);
    }

    /**
     * 点击答题区题号事件
     */
    function eventQieTi() {
        $('#moni-question-detail-id').delegate('.my-question', 'click', function () {
            var _questionId = $(this).attr('data-question-id');
            traceQuestionTab(_questionId);
            traceQuestion(_questionId);
        });
    }

    /**
     * 高亮显示当前题
     * @param questionId
     */
    function traceQuestion(questionId) {
        window.localStorage.setItem('__currentUserQuestionIdMoni', questionId);
        $('#my-moni-tab-content').find('.my-current-question').removeClass('my-current-question');
        $('#moni-card-' + questionId).addClass('my-current-question');
    }

    /**
     * 在答题卡区
     * 显示当前试题所在的页
     */
    function traceQuestionTab(questionId) {
        var obj = $('#moni-card-' + questionId);//答题卡区的当前试题
        var ye = $(obj).parent();//当前题所在的页
        var _tabContent = $(ye).parent();//tab的内容：判断题、单选题、多选题
        var _tabs = $(_tabContent).parent().prev().children();//答题卡区的tabs
        var _active = $(_tabContent).hasClass('active');//是否当前tab为当前题所在tab

        //切换到当前题所在的tab页
        if (!_active) {
            //显示当前题所在的答题卡区
            $(_tabContent).siblings('.tab-pane').each(function () {
                $(this).removeClass('active');
            });
            $(_tabContent).addClass('active');

            //高亮当前题所在答题卡区的tab
            var _href = $(ye).parent().attr('id');
            $(_tabs).each(function () {
                $(this).removeClass('active');
                if ($(this).children().first().attr('href') == ('#' + _href)) {
                    $(this).addClass('active');
                }
            });
        }
    }

    /**
     * 标记试题
     * @param obj
     */
    window.eventBiaoji = function (obj) {
        var questionId = $(obj).attr('data-question-id');
        var qNo = $('#moni-card-' + questionId);
        if (qNo.hasClass('my-btn-moni-biaoji')) {
            qNo.hide().removeClass('my-btn-moni-biaoji').show();
            $(obj).html('标&nbsp;记');
        } else {
            qNo.hide().addClass('my-btn-moni-biaoji').show();
            $(obj).html('去掉标记');
        }
    };

    window.__second = 59;
    window.__minutes = 49;
    function eventShengYuTime() {
        var iter2 = window.setInterval(function () {
            window.__second -= 1;
            if (window.__second < 0) {
                return;
            }
            $('#my-shengyu-time-id').text(window.__second);
        }, 1000);
        var iter = window.setInterval(function () {
            window.__second = 59;
            window.__minutes -= 1;
            if (window.__minutes == 0) { // 提交试卷
                window.clearInterval(iter2);
                window.clearInterval(iter);
                submitHandler(false);
            }
            $('#my-shengyu-hours-id').text(window.__minutes);
        }, 1000 * 60);
    }

    /**
     * 保存答题内容
     */
    function saveAnswer() {
        $('#moni-question-detail-id').delegate('input', 'click', function () {
            var _$optionDiv = $(this).parent().parent();
            var _$questionDiv = _$optionDiv.parent();
            var questionId = _$questionDiv.attr('data-question-id');
            var options = _$optionDiv.children().children('input:checked');
            var userAnswer = '';
            $.each(options, function (i, n) {
                userAnswer += $(n).parent().attr('data-label');
            });
            $.ajax({
                type: 'POST',
                url: Routers.pufa.exam.saveUserAnswer,
                data: {questionId: questionId, userAnswer: userAnswer},
                success: function (data) {
                },
                error: function () {
                    alert('系统错误，请联系管理员');
                }
            })
        })
    }

    var reInitForTest = function () {
        initQuestionCardMoni();
        eventQuestionClickMoni();
        eventMoniQuestionChangeMoni();
        eventSubmitExamBtn();
        eventQieTi();
        eventShengYuTime();
        saveAnswer();
    };

    var tishu = 100;//每页题数
    $(function () {
        reInitForTest();
    });
})();

