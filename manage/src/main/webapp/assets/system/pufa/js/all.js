/**
 * Created by LiuJY on 2015/4/30.
 */
(function () {

    var OPTION_LABEL = ['A', 'B', 'C', 'D', 'E', 'F'];

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

    window.all_question_currentNum = 0;
    window.all_question_pageSize = 20;
    /**
     * 加载试题
     */
    function initDomAllQuestions() {
        $.ajax({
            type: 'post',
            url: Routers.pufa.all.getAllQuestionForLimit,
            data: {
                currentNum: window.all_question_currentNum,
                pageSize: window.all_question_pageSize
            },
            success: function (data) {

                window.all_question_currentNum += window.all_question_pageSize;
                var allStr = '';
                var htmlUp = $('#template-all-question-detail-up-id').html();
                var htmlDown = $('#template-all-question-detail-down-id').html();
                var htmlOption = $('#template-all-option-id').html();
                for (var d = 0; d < data.length; d++) {
                    var question = data[d];

                    var otype = 'radio';
                    if (question.type == '多选题') {
                        otype = 'checkbox';
                    }

                    allStr += render(htmlUp, question);
                    var options = question.options;
                    for (var e = 0; e < options.length; e++) {
                        var option = options[e];
                        option.type = otype;
                        option.label = OPTION_LABEL[e];

                        if(option.key ==1){
                            //option.checked = 'checked="checked"';
                            option.show = 'inline-block';
                        }else{
                            option.show = 'none';
                        }

                        allStr += render(htmlOption, option);
                    }
                    allStr += render(htmlDown, question);
                }
                $('#all-question-limit-id').append(allStr);
                window._closeScrollBar = false;
            }
        });
    }

    /**
     * 滚动加载试题
     */
    function eventScroll() {
        $(window).scroll(function () {
            setTimeout(function () {
                if (window._closeScrollBar)return;
                if ($(document).scrollTop() >= ($(document).height() - $(window).height() - 400)) {
                    //var ztk = window.localStorage.getItem('__zongtiku');
                    //if (ztk == 'true') {
                    window._closeScrollBar = true;
                    initDomAllQuestions();
                    //}
                }
            });
        });
    }

    function initGun(){
        var winHeight = $(document).scrollTop();

        $(window).scroll(function() {
            var scrollY = $(document).scrollTop();// 获取垂直滚动的距离，即滚动了多少

            if (scrollY > 550){ //如果滚动距离大于550px则隐藏，否则删除隐藏类
                $('.top-title').addClass('hiddened');
            }
            else {
                $('.top-title').removeClass('hiddened');
            }

            if (scrollY > winHeight){ //如果没滚动到顶部，删除显示类，否则添加显示类
                $('.top-title').removeClass('showed');
            }
            else {
                $('.top-title').addClass('showed');
            }

        });
    }

    $(function () {
        initDomAllQuestions();
        eventScroll();
        //initGun();
    })
})();