/**
 * Created by LiuJY on 2015/4/29.
 */
(function () {
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
            url: Routers.pufa.study.getCardQuestionListForTest,
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
                window.__questionId__ = firstQuestionId;
            }
        })
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
            $('#moni-' + _questionId).fadeIn(500);
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
            url: Routers.pufa.study.getQuestionDetail,
            data: {questionId: questionId},
            success: function (data) {

                //初始化选项
                var templateOption = $('#template-moni-option-id').html();
                var options = data.options;
                var questiontype = data.type;
                var _type = 'radio';
                data.panduandisplay = 'none';
                data.danxuandisplay = 'none';
                data.duoxuandisplay = 'none';
                if (questiontype == '多选题') {
                    _type = 'checkbox';
                    //data.type = '多项选择题';
                    data.duoxuandisplay = 'block';
                } else if (questiontype == '单选题') {
                    data.danxuandisplay = 'block';
                    //data.type = '单项选择题'
                } else {
                    data.panduandisplay = 'block';
                }

                var htmlOptionsStr = '';
                for (var o = 0; o < options.length; o++) {
                    var option = options[o];
                    option.type = _type;
                    var label = 'A';
                    switch (o) {
                        case 0:
                            break;
                        case 1:
                            label = 'B';
                            break;
                        case 2:
                            label = 'C';
                            break;
                        case 3:
                            label = 'D';
                            break;
                        case 4:
                            label = 'E';
                            break;
                        case 5:
                            label = 'F';
                            break;
                    }
                    option.label = label;
                    htmlOptionsStr += render(templateOption, option);
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
                $('#moni-' + _questionId).hide().prev().fadeIn(500);
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
                $('#moni-' + _questionId).hide().next().fadeIn(500);
                traceQuestion(nQuestionId);
                traceQuestionTab(nQuestionId);
            }
        });
    }

    /**
     * 注册查看答案事件
     */
    function eventSeeAnswerMoni() {
        $('#moni-question-detail-id').delegate('.my-btn-moni-daan', 'click', function () {
            var _questionId = $(this).attr('data-question-id');
            judgeAnswer(_questionId);
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
            addAnswerTimes(questionId);
        } else {
            $('#moni-card-' + questionId).removeClass('my-btn-tihao-answer');
            setResult(questionId, userAnswerStr, questionAnswerStr, userResult);
        }

    }

    /**
     * 模拟考试中，监测在某题上停留等于5秒，增加一次stytime，超过5秒后只记录一次，不到5秒不记录
     * @param questionId
     */
    function intervalAddStyTimes(questionId) {
        var ti = 0;
        clearInterval(window.__intervalTime);
        window.__intervalTime = setInterval(function () {
            ++ti;
            if (ti < 5) {
                $('#moni-' + questionId).prop('timeout', 'false');
            } else if (ti == 5) {
                $('#moni-' + questionId).prop('timeout', 'true');
                $.ajax({
                    url: Routers.pufa.study.updateStyTimes,
                    data: {
                        questionId: questionId
                    },
                    success: function () {
                    },
                    error: function () {
                    }
                });
            } else if (ti > 5) {
                clearInterval(window.__intervalTime);
                $('#moni-' + questionId).prop('timeout', 'true');
            }
        }, 1000);
    }

    function addAnswerTimes(questionId) {
        var resu = $('#moni-' + questionId).prop('timeout');
        if (resu == 'true') {
            $.ajax({
                url: Routers.pufa.test.addEffectAnswerTimes,
                data: {
                    questionId: questionId
                },
                success: function () {
                },
                error: function () {
                }
            })
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
        judgeCurrentQuestionAnswer();
        var __data = [];
        var testPreMsgTemplate = $('#template-test-result-id').html();

        var _questions = $('#moni-question-detail-id').children();

        var fsPandt = 0, fsDanxt = 0, fsDuoxt = 0;

        for (var h = 0; h < _questions.length; h++) {
            var $_question = $(_questions[h]);
            var ua = $_question.prop('userAnswerStr');
            var qa = $_question.prop('questionAnswerStr');
            var ur = $_question.prop('userResult');
            var qi = $_question.attr('data-question-id');
            __data[h] = {
                name: qi,
                val: {
                    ua: ua,
                    qa: qa,
                    ur: ur
                }
            }
            var qt = $_question.attr('data-question-type');
            if (ua) {
                zuoWan += 1;
                if (ur == 'true') {
                    if (qt == '判断题') {
                        fsPandt += 1;
                    } else if (qt == '单选题') {
                        fsDanxt += 1;
                    } else if (qt == '多选题') {
                        fsDuoxt += 2;
                    }
                }
            }
        }
        var zongFenShu = fsPandt + fsDanxt + fsDuoxt;
        var htmlStr = render(testPreMsgTemplate, {
            summary: zongFenShu > 80 ? "及格" : "不及格",
            myUseTime: window._fen_zhong ? window._fen_zhong : 0,
            zongFenShu: zongFenShu,
            fsPandt: fsPandt,
            fsDanxt: fsDanxt,
            fsDuoxt: fsDuoxt
        });
        var msg = '';
        var gritter = true;
        if (zongFenShu >= 80) {
            msg = '<span style="margin-left: 122px;font-size: 1.3em;">恭喜</span></br>您已完成干部法律法规测试</br>您的成绩是' + zongFenShu + '分';
        } else {
            gritter = false;
            msg = '您已完成干部法律法规测试</br>您的成绩是' + zongFenShu + '分</br>请继续努力哦';
        }

        htmlStr = render(testPreMsgTemplate, {
            msg: msg
        });
        var resumtMsg = '';
        if (zuoWan == 80) {
            resumtMsg = '您已经做完题了，确定要提交吗？';
        } else {
            resumtMsg = '<span style="">题还没有做完，您确定要提交吗？</span>';
        }
        if (isAutoSubmit) { // 点击“交卷”按钮则提示确认，否则直接交卷
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
        function queRenResult() {
            var __dataStr = JSON.stringify(__data);
            $.ajax({
                url: Routers.pufa.error.saveErrors,
                type: "POST",
                data: {data: __dataStr},
                success: function () {
                }
            });
            setTimeout(function () {
                if (gritter) {
                    $.gritter.add({
                        title: '',
                        text: '<img src="assets/system/pufa/img/gif/80-100.gif">',
                        class_name: 'gritter-center my-gritter-touming'
                    });
                } else {
                    $.gritter.add({
                        title: '',
                        text: '<img src="assets/system/pufa/img/gif/60.gif">',
                        class_name: 'gritter-center my-gritter-touming'
                    });
                }
            }, 2000);
            bootbox.confirm({
                buttons: {
                    confirm: {
                        label: '确认'
                    },
                    cancel: {
                        label: '取消'
                    }
                },
                message: htmlStr,
                callback: function (result) {
                    if (result) {
                        //window.__canJumpOtherCard = true; // 可以跳出模拟考试区域
                        window.localStorage.setItem('__canJumpOtherCard', 'true');
                        clearInterval(window._myTestIter);
                        // FIXME 重置  模拟考  标签页
                        //window.location.reload();
                        window.location.replace('CommonCtrl.goTo.do?path=/WEB-INF/pages/study/test_pre.jsp');
                        //reInitForTest();
                    } else {
                    }
                },
                title: "模拟考试结果："
            });
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
        intervalAddStyTimes(questionId);
        window.localStorage.setItem('__currentUserQuestionIdMoni', questionId);
        $('#my-moni-tab-content').find('.my-current-question').removeClass('my-current-question');
        $('#moni-card-' + questionId).addClass('my-current-question');
        //Common.updateStyTimes(window.__questionId__);
        window.__questionId__ = questionId;
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
            $('#my-shengyu-time-id').text(window.__second);
        }, 1000);
        var iter = window.setInterval(function () {
            window.__second = 60;
            window.__minutes -= 1;
            if (!window.__minutes) { // 提交试卷
                window.clearInterval(iter);
                window.clearInterval(iter2);
                submitHandler(false);
            }
            $('#my-shengyu-hours-id').text(window.__minutes);
        }, 1000 * 60);
    }

    var reInitForTest = function () {
        initQuestionCardMoni();
        eventQuestionClickMoni();
        eventMoniQuestionChangeMoni();
        eventSeeAnswerMoni();
        eventSubmitExamBtn();
        eventQieTi();
        eventShengYuTime();
    };
    var tishu = 100;//每页题数
    $(function () {
        reInitForTest();
    });
})
();