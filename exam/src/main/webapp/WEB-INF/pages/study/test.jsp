<%--
  Created by IntelliJ IDEA.
  Date: 2015/4/29
  Time: 8:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../include/include_header.jsp" %>
<div class="page-content">
    <div class="row" style="min-height:560px;">
        <div class="col-xs-12">
            <div class="row">
                <div class="col-sm-3 col-md-3">
                    <div class="widget-box">
                        <div class="widget-header">
                            <h4 class="smaller">
                                答题卡
                            </h4>
                        </div>
                        <div class="widget-body">
                            <div class="widget-main my-content-height" style="min-height: 510px !important;">
                                <div class="tabbable" style="margin-top:14px;">
                                    <ul class="nav nav-tabs my-nav-tabs">
                                        <li class="active">
                                            <a data-toggle="tab" href="#test-panduan-tab">
                                                判断题
                                            </a>
                                        </li>

                                        <li>
                                            <a data-toggle="tab" href="#test-danxuan-tab">
                                                单选题
                                            </a>
                                        </li>


                                        <li>
                                            <a data-toggle="tab" href="#test-duoxuan-tab">
                                                多选题
                                            </a>
                                        </li>
                                    </ul>

                                    <div class="tab-content" id="my-moni-tab-content">
                                        <div id="test-panduan-tab" class="tab-pane in active my-tab-pane">
                                            <div id="moni-panduanti-id">
                                                <%--************************* CONTENT ******************************--%>
                                            </div>
                                        </div>
                                        <div id="test-danxuan-tab" class="tab-pane">
                                            <div id="moni-danxuanti-id">
                                                <%--************************* CONTENT ******************************--%>
                                            </div>
                                        </div>

                                        <div id="test-duoxuan-tab" class="tab-pane">
                                            <div id="moni-duoxuanti-id">
                                                <%--************************* CONTENT ******************************--%>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div style="color: #328ED9; font-size: 13px; position: absolute; bottom: 10px;width: 90%;">
                                <hr>
                                <div style="padding: 10px 0px 10px 10px;">
                                    <span>说明：</span>
                                    <br>
                                    <a class="btn btn-app no-radius my-btn-tihao my-btn-xuexi-tihao my-btn-tihao-un"
                                       style="width: 12px!important;border: 1px solid #d3d3d3 !important;
                                           background: linear-gradient(to bottom, #ffffff, #ffffff 100%) repeat-x scroll 0 0 #ffffff !important;cursor: default;"></a>
                                    <span>表示该小题尚未选择答案</span>
                                    <br>
                                    <a class="btn no-radius my-btn-xuexi-tihao my-btn-tihao-answer my-btn-tihao-do"
                                       style="width: 12px!important;cursor: default;"></a>
                                    <span>表示该小题已选择答案</span>
                                    <br>
                                    <a class="btn no-radius my-btn-xuexi-tihao my-btn-tihao-answer my-current-question my-btn-tihao-cu"
                                       style="width: 12px!important;border: 1px solid #FCC584 !important;cursor: default;">
                                    </a>
                                    <span>表示当前正在答的题</span>
                                    <br>
                                    <a class="btn btn-app no-radius my-btn-tihao my-btn-moni-tihao my-btn-moni-biaoji my-btn-question-biaoji-miaoshu"
                                       style="width: 12px!important;cursor: default;">
                                    </a>
                                    <span>表示该小题做过标记</span>
                                    <br>
                                    <span>注：选择答案后系统会自动保存答案</span>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="col-sm-7 col-md-7" style="padding-left: 0px;padding-right: 0px;">
                    <div class="widget-box">
                        <div class="widget-header">
                            <h4 class="smaller">
                                答题区
                            </h4>
                        </div>
                        <div id="moni-question-detail-id" class="widget-body" style="background: #d0f6e3;">
                            <%--***************************** CONTENT ******************************--%>
                        </div>
                    </div>
                </div>
                <div class="col-sm-2 col-md-2">
                    <div class="widget-box ">
                        <div class="widget-header">
                            <h4 class="smaller">
                                考试信息
                            </h4>

                        </div>
                        <div class="widget-body my-content-height_test" >
                            <ul id="tasks" class="item-list">
                                <li class=" clearfix">
                                    <label class="inline">
                                        <span class="lbl" style="font-size:17px;"> 考生：<span> ${username}</span></span>
                                    </label>
                                </li>
                                <li class=" clearfix">
                                    <label class="inline">
                                        <span class="lbl" style="font-size:17px;"> 考试总分：<span> 100分</span></span>
                                    </label>
                                </li>

                                <li class=" clearfix">
                                    <label class="inline">
                                        <span class="lbl" style="font-size:17px;"> 考试时间：<span> 50分钟</span></span>
                                    </label>
                                </li>
                                <li class="clearfix" style="">
                                    <label class="inline" style="">
                                                <span class="lbl"
                                                      style="font-size:20px;line-height: 40px;font-weight: 700;">剩余时间：<span style="display: inline-block;"><span
                                                        id="my-shengyu-hours-id">49</span>分<span
                                                        id="my-shengyu-time-id">59</span>秒</span></span>
                                    </label>
                                </li>

                            </ul>
                            <div style="margin-top: 20px;text-align: center;">
                                <button id="submit-exam-btn-id" class="btn btn-lg btn-info" style="width: 80%;">
                                    交&nbsp;&nbsp;&nbsp;卷
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script id="template-moni-question-card-id" type="text/html">
    <a id="moni-card-{questionId}" href="javascript:;" data-question-id="{questionId}"
       class="btn btn-app no-radius my-btn-tihao my-btn-moni-tihao">
        {customIndex}
        <span class="badge badge-info my-badge-info" style="display: none;">{answerTime}</span>
    </a>
</script>
<script id="template-moni-question-detail-empty-id" type="text/html">
    <div id="moni-{questionId}" data-index="{customIndex}" data-collection-type="{collectionType}"
         data-question-id="{questionId}" data-question-type="{type}"
         class="widget-main my-content-height my-question-result" style="padding: 20px;display: none;">
    </div>
</script>
<script id="template-moni-question-detail-up-id" type="text/html">
    <div data-collection-type="{collectionType}" style="">
            <span class="my-span-question-title my-question" data-question-id="{questionId}" style="display:none;">
                第{customIndex}题
            </span>
        <label style="line-height:30px;font-size: 19px;color: black;font-family: 'Open Sans';font-weight: bold;">
                <span style="display: {panduandisplay}">
                    {type}（下列各题，只有一个正确答案，每题1分，共30题。不选、错选均不得分。）
                </span>
                <span style="display: {danxuandisplay}">
                    {type}（下列各题，只有一个正确答案，每题1分，共30题。不选、错选均不得分。）
                </span>
                <span style="display: {duoxuandisplay}">
                    {type}（下列各题，有两个或两个以上正确答案，每题2分，共20题。少选、多选或错选均不得分。）
                </span>

            <div style="display: none;">
                <input type="checkbox" class="ace ace-checkbox-2" name="form-field-checkbox"
                       data-question-id="{questionId}" onclick="eventBiaoji(this);">
                <span class="lbl" style="color: #445566">标记</span>
            </div>
        </label>
            <span id="moni-question-time-{questionId}" class="label label-lg arrowed-in pull-right my-label-info"
                  style="display: none;">已做<span>{answerTime}</span>次
                错了<span>{collectTime}</span>次
            </span>
    </div>
    <div style="margin-top: 5px;border-top:1px solid #88C3D7;">
        <p style="font-size: 20px;line-height: 40px;">
           <span>
            {customIndex}、{name}
            </span>
        </p>
    </div>
    <div class="control-group" style="margin-bottom: 50px">

</script>
<script id="template-moni-question-detail-down-id" type="text/html">
    </div>
    <div class="row" style=" bottom: 30px;float: right;position: absolute;right: 41px;">
        <div class="col-xs-1 my-col-xs">
            <button class="btn btn-info my-btn-qiehuanti" data-question-id="{questionId}"
                    data-type="{type}" onclick="eventBiaoji(this);" style="width: 100px!important;">
                标&nbsp;记
            </button>
        </div>
        <div class="col-xs-1 my-col-xs">
            <button class="btn btn-info my-btn-qiehuanti my-btn-moni-question-prev" data-question-id="{questionId}"
                    data-question-custom-idx="{customIndex}"
                    data-type="{type}">
                上一题
            </button>
        </div>
        <div class="col-xs-1 my-col-xs">
            <button class="btn btn-info my-btn-qiehuanti my-btn-moni-question-next" data-question-id="{questionId}"
                    data-question-custom-idx="{customIndex}"
                    data-type="{type}">
                下一题
            </button>
        </div>

    </div>
</script>
<script id="template-moni-option-id" type="text/html">
    <label class="radio my-radio" data-key="{key}" data-label="{label}">
        <input type="{type}" class="ace" name="moni-option-{questionId}">
        <span class="lbl">
            <span>
                {label}、
            </span>
                {name}
        </span>
    </label>
</script>
<script id="template-test-result-id" type="text/html">
    <img src="${basePath}assets/system/pufa/img/chengjidan.jpg" style="width: 100%;">
    <span class="lbl"
          style="position: absolute;left: 130px;top: 130px;font-size: 25px;font-weight: 800;word-spacing: 10px;letter-spacing: 3px;">{msg}</span>
</script>
<script src="assets/js/hzc.key-mouse.disabled.js"></script>
<script src="assets/system/pufa/js/test.js"></script>
<%@include file="../include/include_footer.jsp" %>
</div>

