/**
 * Created by LiuJY on 2015/4/29.
 */

var PRINT_COLLECT = {
    /**
     * 生成js模板
     * @param {Object} templateStr
     * @param {Object} data
     */
    render: function (templateStr, data) {
        return templateStr.replace(/\{([\w\.]*)\}/g, function (str, key) {
            var keys = key.split("."),
                v = data[keys.shift()];
            for (var i = 0, l = keys.length; i < l; i++)
                v = v[keys[i]];
            return (typeof v !== "undefined" && v !== null) ? v : "";
        });
    },
    /**
     * 初始化答题卡
     */
    initQuestionCardShoucang: function () {
        $.ajax({
            type: 'post',
            url: Routers.pufa.collect.getQuestionsForPrint,
            data: {
                type: 1
            },
            success: function (data) {
                var questionAllStr = '';
                var tempQuestionUp = $('#template-shoucang-question-detail-up-id').html();
                var tempQuestionDown = $('#template-shoucang-question-detail-down-id').html();
                var tempOption = $('#template-shoucang-option-id').html();
                questionAllStr += $('#template-shoucang-question-detail-empty-id').html();
                for (var a = 0; a < data.length; a++) {
                    var _question = data[a];
                    _question.seq = a+1;
                    var _options = _question.options;
                    questionAllStr += PRINT_COLLECT.render(tempQuestionUp, _question);
                    var questionAnswer = '';
                    for (var z = 0; z < _options.length; z++) {
                        var option = _options[z];
                        var label = 'A';
                        switch (z) {
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
                        if(option.key>0){
                            questionAnswer += label;
                        }
                        questionAllStr += PRINT_COLLECT.render(tempOption, option);
                    }
                    questionAllStr += ('<span style="color: red;">正确答案：'+ questionAnswer +'</span><br>');
                    questionAllStr += PRINT_COLLECT.render(tempQuestionDown, _question);
                }

                $('#shoucang-question-detail-id').html(questionAllStr);
            }
        });
    },
    /**
     * 获取空questionDom
     * 每个空的div带questionId
     * @param data
     */
    initEmptyQuestionListDomShoucang: function (questionDetail) {
        var templateDetailHtml = $('#template-shoucang-question-detail-empty-id').html();
        return PRINT_COLLECT.render(templateDetailHtml, questionDetail);
    },
    /**
     * 打印
     */
    eventPrintShoucang: function () {
        $('.my-collect-print').on('click', function () {
            $('#my-print-id').jqprint({
                //debug: true,
                importCSS:true
            });
        });
    }
}

$(function () {
    PRINT_COLLECT.eventPrintShoucang();
    PRINT_COLLECT.initQuestionCardShoucang();
});