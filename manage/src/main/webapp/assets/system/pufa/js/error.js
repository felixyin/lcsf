(function () {
    /**
     * Created by LiuJY on 2015/4/29.
     */

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
     * 更新用户答题次数+1
     * @param questionId
     */
    function updateAnswerTimes() {
        Common.setTimeLimit();
        if (window.__questionId__)
            $.ajax({
                type: 'POST',
                url: Routers.pufa.study.updateBMCLTTimes,
                data: {
                    questionId: window.__questionId__,
                    type: 2
                },
                success: function (data) {
                },
                error: function () {
                }
            });
    }


    /**
     * 初始化答题卡
     */
    function initQuestionCardCuoti() {
        $.ajax({
            type: 'post',
            url: Routers.pufa.error.getErrorQuestions,
            success: function (data) {

                var my_question = data[0];
                var panduan = [];
                var danxuan = [];
                var duoxuan = [];
                for (var a = 0; a < data.length; a++) {
                    var _question = data[a];
                    switch (_question.type) {
                        case '判断题':
                            panduan.push(_question);
                            break;
                        case '单选题':
                            danxuan.push(_question);
                            break;
                        case '多选题':
                            duoxuan.push(_question);
                            break;
                    }
                }
                var panduanYeshu = 1;
                var danxuanYeshu = 1;
                var duoxuanYeshu = 1;
                var panduanHtmlStr = '';
                var danxuanHtmlStr = '';
                var duoxuanHtmlStr = '';
                var questionAllStr = '';//question的空div
                var htmlFirstDiv = '<div class="my-question-card-tab" data-ye="{ye}">';
                var templateHtml = $('#template-cuoti-question-card-id').html();
                panduanHtmlStr += render(htmlFirstDiv, {ye: panduanYeshu});
                for (var b = 0; b < panduan.length; b++) {
                    var question = panduan[b];
                    panduanHtmlStr += render(templateHtml, question);
                    questionAllStr += initEmptyQuestionListDomCuoti(question);
                }
                panduanHtmlStr += '</div>';
                danxuanHtmlStr += render(htmlFirstDiv, {ye: danxuanYeshu});
                for (var b = 0; b < danxuan.length; b++) {
                    var question = danxuan[b];
                    danxuanHtmlStr += render(templateHtml, question);
                    questionAllStr += initEmptyQuestionListDomCuoti(question);
                }
                danxuanHtmlStr += '</div>';
                duoxuanHtmlStr += render(htmlFirstDiv, {ye: duoxuanYeshu});
                for (var c = 0; c < duoxuan.length; c++) {
                    var question = duoxuan[c];
                    duoxuanHtmlStr += render(templateHtml, question);
                    questionAllStr += initEmptyQuestionListDomCuoti(question);
                }
                duoxuanHtmlStr += '</div>';

                //初始化questionCard
                $('#cuoti-danxuanti-id').append(danxuanHtmlStr);
                $('#cuoti-panduanti-id').append(panduanHtmlStr);
                $('#cuoti-duoxuanti-id').append(duoxuanHtmlStr);

                /**
                 * 排序标题
                 */
                refreshSortNum();

                //初始化所有的QuestionDetail的div，用来存储所有的question
                //点击单个question时加载详细的question
                $('#cuoti-question-detail-id').html(questionAllStr);
                try {
                    var _____questionId = my_question.questionId;
                    getQuestion(_____questionId);
                } catch (e) {
                }
                $('#cuoti-question-detail-id').children().first().fadeIn(500);
                traceQuestion(_____questionId);
                traceQuestionTab(_____questionId);
                updateAnswerTimes();
                window.__questionId__ = _____questionId;
            }
        })
    }

    /**
     * 点击每题事件
     */
    function eventQuestionClickCuoti() {
        $('.tab-content').delegate('.my-btn-cuoti-tihao', 'click', function () {
            if (Common.timeLimit()) {
                var _questionId = $(this).attr('data-question-id');
                var _cl = $('#cuoti-' + _questionId).children().length;
                if (_cl < 1) {
                    getQuestion(_questionId);
                }
                $('#cuoti-question-detail-id').children().hide();
                $('#cuoti-' + _questionId).fadeIn(500);
                setUpdateStatus($('#cuoti-' + _questionId));
                traceQuestion(_questionId);
                traceQuestionTab(_questionId);
                updateAnswerTimes();
                window.__questionId__ = _questionId;
            }
        });
    }

    /**
     * 获取空questionDom
     * 每个空的div带questionId
     * @param data
     */
    function initEmptyQuestionListDomCuoti(questionDetail) {
        var templateDetailHtml = $('#template-cuoti-question-detail-empty-id').html();
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
                var templateOption = $('#template-cuoti-option-id').html();
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
                //初始化question
                var QuestionStr = '';
                var templateQuestionUp = $('#template-cuoti-question-detail-up-id').html();
                var templateQuestionDown = $('#template-cuoti-question-detail-down-id').html();
                QuestionStr += render(templateQuestionUp, data);
                QuestionStr += htmlOptionsStr;
                QuestionStr += render(templateQuestionDown, data);
                $('#cuoti-' + questionId).html(QuestionStr);
                var options = $('#cuoti-' + questionId).children().eq(2).children();
                judgeAnswer(options, questionId);
                traceQuestion(questionId)
            }
        });
    }

    /**
     * 注册切换题事件
     */
    function eventCuotiQuestionChangeCuoti() {
        $('#cuoti-question-detail-id').delegate('.my-btn-cuoti-question-prev', 'click', function () {
            if (Common.timeLimit()) {
                var _questionId = $(this).attr('data-question-id');

                var prevQuestion = $('#cuoti-' + _questionId).prev();
                if (prevQuestion[0]) {
                    var nQuestionId = $(prevQuestion).attr('data-question-id');
                    var exist = $('#cuoti-' + nQuestionId).children().size();
                    if (exist == 0) {
                        getQuestion(nQuestionId);
                    }
                    $('#cuoti-' + _questionId).hide().prev().fadeIn(500);
                    traceQuestion(nQuestionId);
                    traceQuestionTab(nQuestionId);
                    updateAnswerTimes();
                    window.__questionId__ = nQuestionId;
                }
            }
        });
        $('#cuoti-question-detail-id').delegate('.my-btn-cuoti-question-next', 'click', function () {
            if (Common.timeLimit()) {
                var options = $(this).parent().parent().prev().children();
                var _questionId = $(this).attr('data-question-id');
                judgeAnswer(options, _questionId);

                var nextQuestion = $('#cuoti-' + _questionId).next();
                if (nextQuestion[0]) {
                    var nQuestionId = $(nextQuestion).attr('data-question-id');
                    var exist = $('#cuoti-' + nQuestionId).children().size();
                    if (exist == 0) {
                        getQuestion(nQuestionId);
                    }
                    $('#cuoti-' + _questionId).hide().next().fadeIn(500);
                    traceQuestion(nQuestionId);
                    traceQuestionTab(nQuestionId);
                    updateAnswerTimes();
                    window.__questionId__ = nQuestionId;
                }
            }
        });
    }

    /**
     * 判断试题答案
     * @param options
     */
    function judgeAnswer(options, questionId) {
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
        if ($("#xuexi-daan-" + questionId).length > 0) {
            return;
        }
        $("#cuoti-" + questionId).children().eq(2).append('<span id="xuexi-daan-' + questionId + '" style="color: red;font-size:18px;margin-left:30px;">正确答案：' + questionAnswer.join(',') + '</span>');
    }

    /**
     * 删除错题
     */
    function eventDeleteCuoti() {
        $('#cuoti-question-detail-id').delegate('.my-error-shanchu', 'click', function () {
            var $this = $(this);
            bootbox.confirm({
                buttons: {
                    confirm: {
                        label: '确认'
                    },
                    cancel: {
                        label: '取消',
                        className: 'hidden-cancel-btn'
                    }
                },
                message: '<span style="font-size:22px!important;">确定要删除本错题吗？</span>',
                callback: function (result) {
                    if (result) {


                        var questionId = $this.attr('data-question-id');
                        var nQuestionId = '';
                        var _delete = 'false';
                        if ($('#cuoti-' + questionId).next().size() > 0) {
                            nQuestionId = $('#cuoti-' + questionId).next().attr('data-question-id');
                            var exist = $('#cuoti-' + nQuestionId).children().size();
                            if (exist == 0) {
                                getQuestion(nQuestionId);
                            }
                            $('#cuoti-' + questionId).next().fadeIn(500);
                            _sync(questionId, nQuestionId);
                            return;
                        }
                        if ($('#cuoti-' + questionId).prev().size() > 0) {
                            nQuestionId = $('#cuoti-' + questionId).prev().attr('data-question-id');
                            var exist = $('#cuoti-' + nQuestionId).children().size();
                            if (exist == 0) {
                                getQuestion(nQuestionId);
                            }
                            $('#cuoti-' + questionId).prev().fadeIn(500);
                            _sync(questionId, nQuestionId);
                            return;
                        }
                        $('#cuoti-' + questionId).remove();
                        $('#cuoti-card-' + questionId).remove();
                        _sync(questionId, nQuestionId);
                    }
                },
                title: "提示"
            });
        });
    }

    /**
     * 同步错题
     * @private
     */
    function _sync(questionId, nQuestionId) {
        $('#cuoti-' + questionId).remove();
        $('#cuoti-card-' + questionId).remove();
        refreshSortNum();
        traceQuestion(nQuestionId);
        traceQuestionTab(nQuestionId);

        $.ajax({
            type: 'POST',
            url: Routers.pufa.error.deleteErrorQuestion,
            data: {
                questionId: questionId
            },
            success: function () {

            }
        })
    }

    /**
     * 重新排序
     */
    function refreshSortNum() {
        var panduanas = $('#cuoti-panduanti-id').children().children();
        $(panduanas).each(function (i) {
            $(this).html(i + 1);
        });
        var danxuanas = $('#cuoti-danxuanti-id').children().children();
        $(danxuanas).each(function (i) {
            $(this).html(i + 1);
        });
        var duoxuanas = $('#cuoti-duoxuanti-id').children().children();
        $(duoxuanas).each(function (i) {
            $(this).html(i + 1);
        });
    }

    /**
     * 点击答题区题号事件
     */
    function eventQieTi() {
        $('#cuoti-question-detail-id').delegate('.my-question', 'click', function () {
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
        window.localStorage.setItem('__currentUserQuestionIdCuoti', questionId);
        $('#my-cuoti-tab-content').find('.my-current-question').removeClass('my-current-question');
        $('#cuoti-card-' + questionId).addClass('my-current-question');
        var num = $('#cuoti-card-' + questionId).html();
        $('#cuoti-' + questionId).children().eq(1).children('p').children().children('span').html(num);
    }

    /**
     * 在答题卡区
     * 显示当前试题所在的页
     */
    function traceQuestionTab(questionId) {
        var obj = $('#cuoti-card-' + questionId);//答题卡区的当前试题
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
    }

    /**
     * 清空收藏题库
     */
    function clearBankCollect() {
        $('.my-clear-bank').on('click', function () {
            var type = $(this).attr('data-type');
            bootbox.confirm({
                buttons: {
                    confirm: {
                        label: '确认'
                    },
                    cancel: {
                        label: '取消',
                        className: 'hidden-cancel-btn'
                    }
                },
                message: '<span style="font-size:22px!important;">清空题库后不能恢复，确认清空吗？</span>',
                callback: function (result) {
                    if (result) {
                        $.ajax({
                            url: Routers.pufa.collect.clearCollect,
                            type: 'POST',
                            data: {type: type},
                            success: function (data) {
                                $('#cuoti-question-detail-id').html('');
                                $('#cuoti-panduanti-id').html('');
                                $('#cuoti-danxuanti-id').html('');
                                $('#cuoti-duoxuanti-id').html('');
                            }
                        });
                    }
                },
                title: "提示"
            });

        });
    }

    $(function () {
        initQuestionCardCuoti();
        eventQuestionClickCuoti();
        eventCuotiQuestionChangeCuoti();
        eventQieTi();
        eventDeleteCuoti();
        clearBankCollect();
    });

})();