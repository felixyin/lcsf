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

    function addEffectAnswerTimes(questionId) {
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
     * 初始化答题卡
     */
    function initQuestionCardXuexi() {
        var my_question = '';

        $.ajax({
            type: 'post',
            data: {
                type: '判断题'
            },
            url: Routers.pufa.study.listQuestionsOptimize,
            success: function (data) {

                var danxuanHtmlStr = '';
                var panduanHtmlStr = '';
                var duoxuanHtmlStr = '';
                var questionAllStr = '';//2000个question的空div
                var htmlFirstDiv = '<div class="my-question-card-tab" data-ye="{ye}" style="display: none;">';
                var templateHtml = $('#template-xuexi-question-card-id').html();
                var yeti = 0;
                var danxuanYeshu = 0;
                var panduanYeshu = 0;
                var duoxuanYeshu = 0;
                var cardNumbers = data.cardNumbers;
                my_question = {
                    questionId: cardNumbers[0][0]
                };

                for (var i = 0; i < cardNumbers.length; i++) {
                    var question = {};
                    question.type = data.type;
                    question.userId = data.userId;
                    question.categoryCode = data.categoryCode;

                    var d = cardNumbers[i];
                    question.questionId = d[0];
                    question.collectTime = d[1];
                    question.answerTime = d[2];
                    question.seq = d[3];

                    question.isDisplay = 'none';
                    question.lightClass = '';
                    if (question.answerTime) {
                        question.isDisplay = 'block';
                        question.lightClass = 'my-btn-tihao-answer';
                    }
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
                    questionAllStr += initEmptyQuestionListDomXuexi(question);
                }

                //初始化questionCard
                //$('#xuexi-danxuanti-id').append(danxuanHtmlStr).children().first().fadeIn(500);
                //var danxuanBtns = $('#xuexi-danxuanti-id').next().next().children();
                //var danxuanBtnPre = danxuanBtns.eq(0).attr('data-prev', '0');
                //var danxuanBtnNext = danxuanBtns.eq(2).attr('data-all-ye', danxuanYeshu).attr('data-next', 2);
                //var danxuanSpans = danxuanBtns.eq(1).children();
                //danxuanSpans.eq(1).html(danxuanYeshu);
                //danxuanSpans.eq(0).html(1);
                $('#xuexi-panduanti-id').append(panduanHtmlStr).children().first().fadeIn(500);
                var panduanBtns = $('#xuexi-panduanti-id').next().next().children();
                var panduanBtnPre = panduanBtns.eq(0).attr('data-prev', '0');
                var panduanBtnNext = panduanBtns.eq(2).attr('data-all-ye', panduanYeshu).attr('data-next', 2);
                var panduanSpans = panduanBtns.eq(1).children();
                panduanSpans.eq(1).html(panduanYeshu);
                panduanSpans.eq(0).val(1);
                //$('#xuexi-duoxuanti-id').append(duoxuanHtmlStr).children().first().fadeIn(500);
                //var duoxuanBtns = $('#xuexi-duoxuanti-id').next().next().children();
                //var duoxuanBtnPre = duoxuanBtns.eq(0).attr('data-prev', '0');
                //var duoxuanBtnNext = duoxuanBtns.eq(2).attr('data-all-ye', duoxuanYeshu).attr('data-next', 2);
                //var duoxuanSpans = duoxuanBtns.eq(1).children();
                //duoxuanSpans.eq(1).html(duoxuanYeshu);
                //duoxuanSpans.eq(0).html(1);

                //初始化2000个空的QuestionDetail的div，用来存储2000个question
                //点击单个question时加载详细的question
                $('#xuexi-question-detail-id').html(questionAllStr);
                var ___questionId = window.localStorage.getItem('__currentUserQuestionId');
                if (!___questionId) {
                    ___questionId = 1;
                }
                var _cl = $('#xuexi-' + ___questionId).children().length;
                if (_cl < 1) {
                    getQuestion(___questionId);
                }
                $('#xuexi-question-detail-id').children().hide();
                $('#xuexi-' + ___questionId).fadeIn(500);
                //setUpdateStatus($('#xuexi-' + ___questionId));
                //$('#xuexi-'+___questionId).fadeIn(500);

                traceQuestionTab(___questionId);
                traceQuestion(___questionId);
                window.___questionId__ = ___questionId;
            }
        })
    }

    /**
     * 注册分页按钮点击事件
     */
    function eventFenyeBtnXuexi() {
        $('.my-btn-xuexi-fenye-pre').on('click', function () {
            var yeSpans = $(this).next().children();
            var dangqianye = parseInt($(yeSpans).eq(0).val());

            if (dangqianye > 1) {
                $(this).parent().prev().prev().children().eq(dangqianye - 1).hide().prev().fadeIn(500);
                $(yeSpans).eq(0).val(dangqianye - 1);
            }
        });
        $('.my-btn-xuexi-fenye-next').on('click', function () {
            var yeSpans = $(this).prev().children();
            var dangqianye = parseInt($(yeSpans).eq(0).val());
            var suoyouye = parseInt($(yeSpans).eq(1).html());

            if (dangqianye < suoyouye) {
                $(this).parent().prev().prev().children().eq(dangqianye - 1).hide().next().fadeIn(500);
                $(yeSpans).eq(0).val(dangqianye + 1);
            }
        });
    }

    /**
     * 点击每题事件
     */
    function eventQuestionClickXuexi() {
        $('.tab-content').delegate('.my-btn-xuexi-tihao', 'click', function () {
            if (Common.timeLimit()) {
                var _questionId = $(this).attr('data-question-id');
                var _cl = $('#xuexi-' + _questionId).children().length;
                if (_cl < 1) {
                    getQuestion(_questionId);
                }
                $('#xuexi-question-detail-id').children().hide();
                $('#xuexi-' + _questionId).fadeIn(500);
                setUpdateStatus($('#xuexi-' + _questionId));
                traceQuestion(_questionId);
            }
        });
    }

    /**
     * 获取空questionDom
     * 每个空的div带questionId
     * @param data
     */
    function initEmptyQuestionListDomXuexi(questionDetail) {
        var templateDetailHtml = $('#template-xuexi-question-detail-empty-id').html();
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
                var templateOption = $('#template-xuexi-option-id').html();
                var options = data.options;
                var questiontype = data.type;
                var _type = 'radio';
                if (questiontype == '多选题') {
                    _type = 'checkbox';
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
                if (data.collectionType == '1') {
                    data.collectionText = '取消收藏';
                } else {
                    data.collectionText = '收藏本题';
                }
                //初始化question
                var QuestionStr = '';
                var templateQuestionUp = $('#template-xuexi-question-detail-up-id').html();
                var templateQuestionDown = $('#template-xuexi-question-detail-down-id').html();
                QuestionStr += render(templateQuestionUp, data);
                QuestionStr += htmlOptionsStr;
                QuestionStr += render(templateQuestionDown, data);
                var $question = $('#xuexi-' + questionId).html(QuestionStr);
                if (window.__is_scan_model) {
                    $question.find('.my-btn-xuexi-daan').removeAttr('disabled').trigger('click').attr('disabled', 'disabled');
                }
            }
        });
    }

    /**
     * 注册切换题事件
     */
    function eventXuexiQuestionChangeXuexi() {
        $('#xuexi-question-detail-id').delegate('.my-btn-xuexi-question-prev', 'click', function () {
            if (Common.timeLimit()) {
                var _questionId = $(this).attr('data-question-id');
                var options = $(this).parent().parent().prev().children();
                //用户作答答案
                var userAnswer = [];
                for (var f = 0; f < options.length; f++) {
                    var _option = options[f];
                    var _ukey = $(_option).children().first().prop('checked');
                    if (_ukey) {
                        userAnswer.push($(_option).attr('data-label'));
                    }
                }
                if (userAnswer.length > 0) {
                    judgeAnswer(options, _questionId);
                }
                var prev = $(this).parent().parent().parent().prev();
                if (prev.length > 0) {
                    var nQuestionId = parseInt(_questionId) - 1;
                    var exist = $('#xuexi-' + nQuestionId).children().size();
                    if (exist == 0) {
                        getQuestion(nQuestionId);
                    }
                    $('#xuexi-' + _questionId).hide();
                    $('#xuexi-' + nQuestionId).fadeIn(500);
                    setUpdateStatus($('#xuexi-' + nQuestionId));
                    traceQuestionTab(nQuestionId);
                    traceQuestion(nQuestionId);
                }
            }
        });
        $('#xuexi-question-detail-id').delegate('.my-btn-xuexi-question-next', 'click', function () {
            if (Common.timeLimit()) {
                var _questionId = $(this).attr('data-question-id');
                var next = $(this).parent().parent().parent().next();
                var options = $(this).parent().parent().prev().children();
                //用户作答答案
                var userAnswer = [];
                for (var f = 0; f < options.length; f++) {
                    var _option = options[f];
                    var _ukey = $(_option).children().first().prop('checked');
                    if (_ukey) {
                        userAnswer.push($(_option).attr('data-label'));
                    }
                }
                if (userAnswer.length > 0) {
                    judgeAnswer(options, _questionId);
                }
                if (next.length > 0) {
                    var nQuestionId = parseInt(_questionId) + 1;
                    var exist = $('#xuexi-' + nQuestionId).children().size();
                    if (exist == 0) {
                        getQuestion(nQuestionId);
                    }
                    $('#xuexi-' + _questionId).hide();
                    $('#xuexi-' + nQuestionId).fadeIn(500);
                    setUpdateStatus($('#xuexi-' + nQuestionId));
                    traceQuestionTab(nQuestionId);
                    traceQuestion(nQuestionId);
                }
            }
        });
    }

    /**
     * 注册查看答案事件
     */
    function eventSeeAnswerXuexi() {
        $('#xuexi-question-detail-id').delegate('.my-btn-xuexi-daan', 'click', function () {
            var options = $(this).parent().parent().prev().children();
            var _questionId = $(this).attr('data-question-id');
            judgeAnswer(options, _questionId);
            //$(this).parent().siblings().children('button').removeAttr('disabled');
            //$(this).attr('disabled', 'disabled');
            //$(this).parent().parent().prev().children('label').children('input').attr('disabled', 'disabled');
        });
    }

    /**
     * 判断试题答案
     * @param options
     */
    function judgeAnswer(options, questionId) {
        //用户回答是否正确
        var userResult = 'true';
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
                var _size = $(_option).children().length;
                if (_size != 3) {
                    //$(_option).append('<i class="icon-ok bigger-110 green" style="margin-right: 15px;font-size: 30px;"></i>');
                }
            } else if (_ukey) {
                //userResult = 'false';
                var _size = $(_option).children().length;
                if (_size != 3) {
                    //$(_option).append('<i class="icon-remove bigger-110 red" style="margin-right: 15px;font-size: 30px;"></i>');
                }
            }
        }
        var uas = userAnswer.join(',');
        var qas = questionAnswer.join(',');
        if (uas != qas) {
            userResult = 'false';
        }
        if ($('#xuexi-daan-' + questionId).length > 0) {
            return;
        }
        $("#xuexi-" + questionId).children().eq(2).append('<span id="xuexi-daan-' + questionId + '" style="color: red;font-size:18px;margin-left:30px;margin-left:30px;">正确答案：' + qas + '</span>');


        var _firstOption = options.first();
        //yes 存在，则此题已经查看过答案，则不再需要记录错题
        var yes = _firstOption.attr('checkedAnswer');
        if (userAnswer.length > 0) {//此题做了
            if (userResult == 'true') {
                //回答正确，显示证明
                /*$("#xuexi-"+questionId).children().eq(2).append('<img id="xuexi-img-'+questionId+'" src="assets/system/pufa/img/correct.png" style="position: absolute;bottom: 150px;width:30%;height:30%;left:50%;display:none;">');*/
                $('#xuexi-img-' + questionId).fadeIn(500)
            } else {
                /*$("#xuexi-"+questionId).children().eq(2).append('<img id="xuexi-img-'+questionId+'" src="assets/system/pufa/img/error.png" style="position: absolute;bottom: 150px;width:30%;height:30%;left:50%;display:none;">');*/
                $('#xuexi-img-' + questionId).fadeIn(500)
            }
            if (!yes) {
                _firstOption.attr('checkedAnswer', 'yes');

                //设置答题次数和错误次数
                $('#xuexi-card-' + questionId).addClass('my-btn-tihao-answer');
                var _ansTime = $('#xuexi-card-' + questionId).children().first();
                var _timeVal = parseInt($(_ansTime).html()) + 1;
                $(_ansTime).html(_timeVal).show(1000).parent().attr('title', '做过' + _timeVal + '次');
                var _timeSpans = $('#xuexi-question-time-' + questionId).children();
                _timeSpans.eq(0).html(_timeVal);
                if (userResult == 'false') {
                    _timeSpans.eq(1).html(parseInt(_timeSpans.eq(1).html()) + 1);
                }

                //保存错题or删除错题
                $.ajax({
                    type: 'POST',
                    url: Routers.pufa.study.saveQuestionError,
                    data: {
                        questionId: questionId,
                        userAnswer: userAnswer.join(','),
                        userResult: userResult
                    },
                    success: function (data) {
                    }
                });
            }
        }

    }

    /**
     * 设置试题的收藏状态
     * @param obj ：question的最外层div
     */
    function setUpdateStatus(obj) {
        var _yes = $(obj).attr('data-collection-type');
        var questionId = $(obj).attr('data-question-id')
        $('#xuexi-shoucang-id').attr('data-question-id', questionId);
        if (_yes == 1) {
            $('#xuexi-shoucang-id').prop('checked', 'checked');
        } else {
            $('#xuexi-shoucang-id').removeAttr('checked');
        }
    }

    /**
     * 收藏题
     */
    function eventShoucangXuexi() {
        $('#xuexi-question-detail-id').delegate('.my-btn-shoucang-benti', 'click', function () {

            var _checked = $(this).attr('data-collection-type');
            var questionId = $(this).attr('data-question-id');
            var _delete = 'true';
            if (_checked == "0") {
                $(this).html('取消收藏');
                $(this).attr('data-collection-type', '1');
                Common.info('已经收藏本题');
            } else {
                $(this).html('收藏本题');
                _delete = 'false';
                $(this).attr('data-collection-type', '0');
                Common.info('已经取消收藏本题');
            }
            $.ajax({
                type: 'POST',
                url: Routers.pufa.study.saveQuestionCollect,
                data: {
                    questionId: questionId,
                    deleted: _delete
                },
                success: function () {
                }
            })
        });
    }


    /**
     * 浏览模式
     */
    function eventLiulanXuexi() {
        $('#xuexi-liulan-id').change(function () {
            var _checked = $(this).prop('checked');
            var __currentUserQuestionId = window.localStorage.getItem('__currentUserQuestionId');
            var btns = $('#xuexi-' + __currentUserQuestionId).children().eq(3).children('div').children('button');
            if (_checked) {
                $(btns).eq(0).removeAttr('disabled');
                $(btns).eq(2).removeAttr('disabled');
                window.__is_scan_model = true;
            } else {
                window.__is_scan_model = false;
                $(btns).eq(0).attr('disabled', 'disabled');
                $(btns).eq(2).attr('disabled', 'disabled');
            }
            disableOptions(__currentUserQuestionId);
        });
    }

    /**
     * 点击答题区题号事件
     */
    function eventQieTi() {
        $('#xuexi-question-detail-id').delegate('.my-question', 'click', function () {
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
        window.localStorage.setItem('__currentUserQuestionId', questionId);
        disableOptions(questionId);
        $('#my-xuexi-tab-content').find('.my-current-question').removeClass('my-current-question');
        $('#xuexi-card-' + questionId).addClass('my-current-question');
        Common.updateStyTimes(window.___questionId__);
        window.___questionId__ = questionId;
    }

    /**
     * disabled试题选项
     * @param questionId
     */
    function disableOptions(questionId) {
        if (window.__is_scan_model) {
            $('#xuexi-' + questionId).children().eq(2).children('label').children('input').attr('disabled', 'disabled');
        } else {
            $('#xuexi-' + questionId).children().eq(2).children('label').children('input').removeAttr('disabled');
        }
    }

    /**
     * 在答题卡区
     * 显示当前试题所在的页
     */
    function traceQuestionTab(questionId) {
        var obj = $('#xuexi-card-' + questionId);//答题卡区的当前试题
        var ye = $(obj).parent();//当前题所在的页
        var _tabContent = $(ye).parent().parent();//tab的内容：判断题、单选题、多选题
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
            var _href = $(_tabContent).attr('id');
            $(_tabs).each(function () {
                $(this).removeClass('active');
                if ($(this).children().first().attr('href') == ('#' + _href)) {
                    $(this).addClass('active');
                }
            });
        }

        $(ye).siblings().each(function () {
            $(this).hide();
        });
        $(ye).fadeIn(500);
        var _dangqianye = $(ye).attr('data-ye');
        $(ye).parent().next().next().children().eq(1).children().eq(0).val(_dangqianye);
    }

    /**
     * 点击选项，改变上一题、查看答案、下一题按钮的disabled状态
     */
    window.eventBtnChange = function (obj) {
        var divs = $(obj).parent().parent().next().children();
        divs.children().eq(1).removeAttr('disabled');
    };

    function initLiulan() {
        if ($('#xuexi-liulan-id').prop('checked') == true) {
            $('#xuexi-liulan-id').trigger('click')
        }
    }


    var tishu = 50;//每页题数

    $(function () {
        initLiulan();
        initQuestionCardXuexi();
        eventFenyeBtnXuexi();
        eventQuestionClickXuexi();
        eventXuexiQuestionChangeXuexi();
        eventSeeAnswerXuexi();
        eventShoucangXuexi();
        eventLiulanXuexi();
        eventQieTi();
    });

})();

var PANDUANTI_QUESTION = {
    //输入页数，切换到输入页
    changePage: function (obj) {
        var $this = $(obj);
        var suoyouye = $this.next().html();
        var dangqianye = $this.val();
        if (dangqianye > 0 && dangqianye <= parseInt(suoyouye)) {
            var yes = $this.parent().parent().prev().prev().children();
            yes.hide().eq(dangqianye - 1).fadeIn(500);
        }

    }
}