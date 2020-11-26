<%--
  Created by IntelliJ IDEA.
  Date: 2015/4/29
  Time: 8:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../include/include_header.jsp" %>
<div class="page-content">
    <div class="row">
        <div class="col-xs-12">
            <!-- PAGE CONTENT BEGINS -->

            <div class="row">
                <%--style="border: 2px solid red;"--%>
                <div class="col-sm-6 col-md-5 col-lg-4">
                    <div class="widget-box">
                        <%--<div class="widget-header">--%>
                        <%--<h4 class="smaller">--%>
                        <%--答题卡--%>
                        <%--</h4>--%>
                        <%--</div>--%>
                        <div class="widget-header">
                            <h4 class="smaller">
                                答题卡
                            </h4>
                             <span class="widget-toolbar " style="display: none;">
                                    <label class="pull-right inline">
                                        <small class="muted" style="font-weight: bold;">浏览模式</small>
                                        <input id="xuexi-liulan-id"
                                               class="ace ace-switch ace-switch-1 my-ace-switch-1"
                                               type="checkbox">
                                        <span class="lbl"
                                              style="margin-left: 10px;margin-right: 10px;"></span>
                                    </label>
                            </span>
                        </div>
                        <div class="widget-body">
                            <div class="widget-main my-content-height" style="min-height: 510px !important;">
                                <span style="font-size: 18px;display: none;" class="text-primary ">
                                    <i class="icon-group" style="margin-right: 10px;"></i>370724108510270756<small>
                                    &nbsp;学习总进度：
                                </small></span>

                                <%--<div style="display: none;" class="progress  progress-striped" data-percent="35%">--%>
                                <%--<div class="progress-bar progress-bar-success"--%>
                                <%--style="width: 35%;"></div>--%>
                                <%--</div>--%>
                                <div class="tabbable">
                                    <ul class="nav nav-tabs my-nav-tabs">

                                        <li class="active">
                                            <a data-toggle="tab" href="#study-panduan-tab">
                                                判断题
                                            </a>
                                        </li>

                                        <li>
                                            <a data-toggle="tab" href="#study-danxuan-tab">
                                                单选题
                                            </a>
                                        </li>


                                        <li>
                                            <a data-toggle="tab" href="#study-duoxuan-tab">
                                                多选题
                                            </a>
                                        </li>
                                    </ul>

                                    <div class="tab-content" id="my-xuexi-tab-content">
                                        <div id="study-panduan-tab" class="tab-pane in active">
                                            <div id="xuexi-panduanti-id" style="text-align: left;">
                                                <%--************************* CONTENT ******************************--%>
                                                <!--
                                                <div class="my-question-card-tab" data-ye="{ye}" style="display: none;">
                                                    <a id="xuexi-card-{}" href="javascript:;" data-question-id="{questionId}"
                                                       class="btn btn-app no-radius my-btn-tihao my-btn-xuexi-tihao">
                                                        {seq}
                                                        <span class="badge badge-info">{answerTime}</span>
                                                    </a>
                                                </div>
                                                -->
                                            </div>
                                            <hr>
                                            <div style="text-align: center;margin-top: 40px;">
                                                <button class="btn btn-xs btn-danger  my-btn-xuexi-fenye-pre my-btn-xuexi-padding">
                                                    <i class="icon-arrow-left icon-on-left"></i>
                                                    上50题
                                                </button>
                                                <span style="margin:0px 10px !important;font-size: 15px !important">
                                                    第<span></span>页，共<span></span>页
                                                </span>
                                                <button class="btn btn-xs btn-danger  my-btn-xuexi-fenye-next my-btn-xuexi-padding">
                                                    下50题
                                                    <i class="icon-arrow-right icon-on-right"></i>
                                                </button>
                                            </div>
                                        </div>
                                        <div id="study-danxuan-tab" class="tab-pane">
                                            <div id="xuexi-danxuanti-id">
                                                <%--************************* CONTENT ******************************--%>
                                            </div>
                                            <hr>
                                            <div style="text-align: center;">
                                                <button class="btn btn-xs btn-danger  my-btn-xuexi-fenye-pre my-btn-xuexi-padding">
                                                    <i class="icon-arrow-left icon-on-left"></i>
                                                    上50题
                                                </button>
                                                <span style="margin:0px 10px !important;font-size: 15px !important">
                                                    第<span></span>页，共<span></span>页
                                                </span>
                                                <button class="btn btn-xs btn-danger  my-btn-xuexi-fenye-next my-btn-xuexi-padding">
                                                    下50题
                                                    <i class="icon-arrow-right icon-on-right"></i>
                                                </button>
                                            </div>
                                        </div>

                                        <div id="study-duoxuan-tab" class="tab-pane">
                                            <div id="xuexi-duoxuanti-id">
                                                <%--************************* CONTENT ******************************--%>
                                            </div>
                                            <hr>
                                            <div style="text-align: center;">
                                                <button class="btn btn-xs btn-danger  my-btn-xuexi-fenye-pre my-btn-xuexi-padding">
                                                    <i class="icon-arrow-left icon-on-left"></i>
                                                    上50题
                                                </button>
                                                <span style="margin:0px 10px !important;font-size: 15px !important">
                                                    第<span></span>页，共<span></span>页
                                                </span>
                                                <button class="btn btn-xs btn-danger  my-btn-xuexi-fenye-next my-btn-xuexi-padding">
                                                    下50题
                                                    <i class="icon-arrow-right icon-on-right"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                    <div style="color: lightsteelblue; font-size: 12px; position: absolute; bottom: 2px; height: 50px;margin: 0px; padding: 2px;width: 90%;">
                                        <hr style="margin-bottom: 0px;padding-bottom: 0px;">
                                        <a class="btn no-radius my-btn-xuexi-tihao my-btn-tihao-answer"
                                              style="width: 12px!important;"></a>已做过&nbsp;&nbsp;
                                        <a class="btn no-radius my-btn-xuexi-tihao my-btn-tihao-answer my-current-question"
                                           style="width: 12px!important;"></a>当前题&nbsp;&nbsp;
                                        <a class="btn no-radius my-btn-xuexi-tihao my-btn-tihao-answer my-current-question"
                                           style="width: 12px!important;background: linear-gradient(to bottom, #ffffff, #ffffff 100%) repeat-x scroll 0 0 #ffffff !important;"></a>未作答&nbsp;&nbsp;
                                        <%--<span class="badge badge-info my-badge-info">2</span>&nbsp;做题次数--%>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /span -->

                <div class="col-sm-6 col-md-7 col-lg-8">
                    <div class="widget-box">
                        <div class="widget-header">
                            <h4 class="smaller">
                                答题区
                            </h4>
                             <span class="widget-toolbar " style="display: none;" >
                                    <label class="pull-right inline">
                                        <small class="muted" style="font-weight: bold;">收藏</small>
                                        <input id="xuexi-shoucang-id2"
                                               class="ace ace-switch ace-switch-1 my-ace-switch-1"
                                               type="checkbox">
                                        <span class="lbl"
                                              style="margin-left: 10px;margin-right: 10px;"></span>
                                    </label>
                            </span>
                        </div>

                        <div id="xuexi-question-detail-id" class="widget-body" style="padding-bottom: 30px !important;">
                            <%--***************************** CONTENT ******************************--%>
                        </div>
                    </div>

                </div>
            </div>
            <!-- /row -->

            <script type="text/javascript">
                var $path_assets = "assets";//this will be used in gritter alerts containing images
            </script>

            <!-- PAGE CONTENT ENDS -->
        </div>
        <!-- /.col -->
    </div>
    <!-- /.row -->

    <script id="template-xuexi-question-card-id" type="text/html">
        <a id="xuexi-card-{questionId}" href="javascript:;" data-question-id="{questionId}"
           class="btn btn-app no-radius my-btn-tihao my-btn-xuexi-tihao {lightClass}" title="做过{answerTime}次">
            {seq}
            <span class="badge badge-info my-badge-info" style="display:{isDisplay}">{answerTime}</span>
        </a>
    </script>
    <script id="template-xuexi-question-detail-empty-id" type="text/html">
        <div id="xuexi-{questionId}" data-collection-type="{collectionType}" data-question-id="{questionId}"
             class="widget-main my-content-height" style="padding: 20px;display: none;">
        </div>
    </script>
    <script id="template-xuexi-question-detail-up-id" type="text/html">
        <div data-collection-type="{collectionType}">
        <span class="my-span-question-title my-question" data-question-id="{questionId}">
            第{seq}题
        </span>
        <span id="xuexi-question-time-{questionId}" class="label label-lg arrowed-in pull-right my-label-info"
              style="display: none;">已做<span>{answerTime}</span>次
            错了<span>{collectTime}</span>次
        </span>
        </div>
        <div style="margin-top: 20px;">

            <p style="font-size: 20px;line-height: 40px;">
           <span style="margin-left: 50px;">
            {name}
            </span>
            </p>
        </div>
        <div class="control-group">

    </script>
    <script id="template-xuexi-question-detail-down-id" type="text/html">
        </div>
        <div class="row" style=" bottom: 30px;float: right;position: absolute;right: 41px;">
            <div class="col-xs-1 my-col-xs">
                <button class="btn my-btn-qiehuanti  btn-danger my-btn-shoucang-benti" data-collection-type="{collectionType}"
                        data-question-id="{questionId}" style="width: 120px!important;">
                    {collectionText}
                </button>
            </div>
            <div class="col-xs-1 my-col-xs">
                <button class="btn btn-danger my-btn-qiehuanti my-btn-xuexi-question-prev "
                        data-question-id="{questionId}">
                    上一题
                </button>
            </div>
            <div class="col-xs-2 my-col-xs" style="display: {isDisplay};">
                <button class="btn  btn-danger my-btn-qiehuanti my-btn-xuexi-daan "
                        data-question-id="{questionId}" title="请先答题" style="width: 120px !important;">
                    <%--onclick="eventShowNextPrev(this);">--%>
                    查看答案
                </button>
            </div>
            <div class="col-xs-1 my-col-xs">
                <button class="btn  btn-danger my-btn-qiehuanti my-btn-xuexi-question-next"
                        data-question-id="{questionId}">
                    下一题
                </button>
            </div>
        </div>
    </script>
    <script id="template-xuexi-option-id" type="text/html">
        <label class="radio my-radio" data-key="{key}" data-label="{label}">
            <input type="{type}" class="ace" name="xuexi-option-{questionId}" onclick="eventBtnChange(this);">
            <span class="lbl">
                <span style="font-weight: 700;">
                    {label}、
                </span>
                    {name}
            </span>
        </label>
    </script>
</div>
<script src="${basePath}assets/system/pufa/js/study.js"></script>
<%@include file="../include/include_footer.jsp" %>
