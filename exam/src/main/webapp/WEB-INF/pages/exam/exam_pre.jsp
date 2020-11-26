<%--
  Created by IntelliJ IDEA.
  Date: 2015/4/29
  Time: 8:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../include/include_header_exam.jsp" %>
<style>
    .my-button{
        color:white;
        background: #12a5eb;
    }
    .my-button:hover {
        text-decoration: none;
        background-color: #048cb9;
        transition: all 0.15s ease 0s;
        border: 3px solid #cccccc;
        color:white;
    }
</style>
<%--<div class="page-content" style="background-image:url(${basePath}assets/system/pufa/img/bgImg.png)!important;background-repeat:no-repeat!important;background-position: center;padding-top: 30px !important;height: 500px!important;padding-left: 0px;padding-right: 0px;border-left: 1px solid #cccccc;border-right:1px solid #cccccc;height: 540px!important;";>--%>
<div class="page-content widget-body"
     style="background:#d0f6e3;padding-top: 30px !important;height: 500px!important;padding-left: 0px;padding-right: 0px;border-left: 1px solid #cccccc;border-right:1px solid #cccccc;height: 540px!important;">

    <div style="font-size: 24px;margin-top:20px;font-weight: 800;text-align: center;width: 100%;letter-spacing: 0.3em;">考试须知</div>
    <div class="my-test-pre">
        <div style="margin: 30px 30px;">
            <p>（1）&nbsp;考试时间为50分钟，如果到时间未交卷，系统会自动收卷。</p>

            <p>（2）&nbsp;系统随机抽题，共80题。满分100分，及格线为80分。</p>

            <p>（3）&nbsp;题型及分值：</p>

            <p class="my-p-ind"> 判断30题，每题1分，共30分。</p>

            <p class="my-p-ind"> 单选30题，每题1分，共30分。</p>

            <p class="my-p-ind"> 多选20题，每题2分，共40分。</p>
        </div>
    </div>

    <div style="text-align: center;margin-top: 50px;">
        <a class="my-button"
           style="width: 180px;font-size: 20px;border: 0px;border-radius: 10px;"
           id="my-btn-pre-test-id"
           onclick="gotoTest();">开始考试</a>
    </div>
    <form id="form-to-exam" style="display: none;" action="LpExamCtrl.gotoExam.do"></form>
</div>

<script src="${basePath}assets/system/pufa/js/pre-test.js"></script>
<script type="text/javascript">
    function gotoTest() {
        $.ajax({
            url: Routers.pufa.exam.checkExamTime,
            type: 'POST',
            success: function (data) {
                var succ = data.success;
                if (succ) {
                    $('#form-to-exam').submit();
                }
//                    window.localStorage.setItem('__canJumpOtherCard', 'false');
            },
            error: function () {
            }
        });

//        openForFullScreen('CommonCtrl.goTo.do?path=/WEB-INF/system/pufa/exam.jsp');
    }
</script>
<%@include file="../include/include_footer_exam.jsp" %>
