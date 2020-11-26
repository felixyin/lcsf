/**
 * 考试准备页
 * Created by HZC on 2015/7/14.
 */

var Exam_Pre = {
    /**
     * 设置时间倒计时
     */
    countTime: function () {
        if (window.second > 0) {
            var minute = Math.floor(window.second / 60);
            var seconds = Math.floor(window.second % 60);
            var msg = "距离考试开始还有" + minute + "分" + seconds + "秒";
            $('#second').html(msg);
            --window.second;
        } else {
            $('#second').html('考试已经开始，请点击开始考试进入考试');
            clearInterval(timer);
        }
    },
    /**
     * 获取考试倒计时
     */
    getTime: function () {
        $.ajax({
            url: 'LpExamCtrl.ajaxGetExamTime.do',
            type: 'post',
            success: function (data) {
                if (data.result == 'false') {
                    var second = data.second;
                    window.second = second
                    timer = setInterval("Exam_Pre.countTime()", 1000);
                }else if(data.result == "true"){
                    $('#second').html('考试已经开始，请点击开始考试进入考试');
                }else{
                    $('#second').html('考试已经结束');
                }
            },
            error: function (data) {
            }
        })
    }
    ,
    /**
     * 开始考试
     */
    gotoTest: function () {
        $.ajax({
            url: Routers.pufa.exam.checkExamTime,
            type: 'POST',
            success: function (data) {
                var succ = data.success;
                if (succ) {
                    $('#form-to-exam').submit();
                }
            },
            error: function () {
            }
        });
    }
    ,

}
