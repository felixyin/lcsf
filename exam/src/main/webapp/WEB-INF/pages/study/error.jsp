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
            <!-- PAGE CONTENT BEGINS -->
            <div class="row">
                <div class="col-sm-3 col-md-3">
                    <div class="widget-box">
                        <div class="widget-header">
                            <h4 class="smaller">
                                错题题号
                            </h4>
                        </div>
                        <div class="widget-body">
                            <div class="widget-main my-content-height my-content-bgcolor"
                                 style="min-height: 510px !important;background: none;">
                                <div style="margin-bottom: 50px;" class="tabbable">
                                    <ul class="nav nav-tabs my-nav-tabs">
                                        <li class="active">
                                            <a data-toggle="tab" href="#error-panduan-tab">
                                                判断题
                                            </a>
                                        </li>
                                        <li>
                                            <a data-toggle="tab" href="#error-danxuan-tab">
                                                单选题
                                            </a>
                                        </li>
                                        <li>
                                            <a data-toggle="tab" href="#error-duoxuan-tab">
                                                多选题
                                            </a>
                                        </li>
                                    </ul>
                                    <div class="tab-content" id="my-cuoti-tab-content">
                                        <div id="error-panduan-tab" class="tab-pane in active my-tab-pane">
                                            <div id="cuoti-panduanti-id">
                                                <%--************************* CONTENT ******************************--%>
                                            </div>
                                        </div>
                                        <div id="error-danxuan-tab" class="tab-pane my-tab-pane">
                                            <div id="cuoti-danxuanti-id">
                                                <%--************************* CONTENT ******************************--%>
                                            </div>
                                        </div>

                                        <div id="error-duoxuan-tab" class="tab-pane my-tab-pane">
                                            <div id="cuoti-duoxuanti-id">
                                                <%--************************* CONTENT ******************************--%>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div style=" bottom: 28px;left: 9%;position: absolute;">
                                    <a href="${basePath}CommonCtrl.goTo.do?path=/WEB-INF/pages/study/print/error_print.jsp"
                                       class="btn btn-info" data-type="1"
                                       style="padding: 10px auto !important;font-size: 16px !important;">
                                        打印所有错题
                                    </a>
                                    <button class="btn my-clear-bank btn-info" data-type="2"
                                            style="margin: 10px auto !important;font-size: 16px !important;">
                                        清空所有错题
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /span -->
                <div class="col-sm-9 col-md-9" style="padding-left: 0px;">
                    <div class="widget-box">
                        <div class="widget-header">
                            <h4 class="smaller">
                                错题
                            </h4>
                        </div>

                        <div id="cuoti-question-detail-id" class="widget-body"
                             style="padding-bottom: 30px !important;min-height: 510px !important;background: #d0f6e3!important;">
                            <%--***************************** CONTENT ******************************--%>
                        </div>
                    </div>

                </div>
            </div>
            <!-- /row -->
            <!-- PAGE CONTENT ENDS -->
        </div>
        <!-- /.col -->
    </div>
    <!-- /.row -->
    <script id="template-cuoti-question-card-id" type="text/html">
        <a id="cuoti-card-{questionId}" href="javascript:;" data-question-id="{questionId}"
           class="btn btn-app no-radius my-btn-tihao my-btn-cuoti-tihao">
            {seq}
        </a>
    </script>
    <script id="template-cuoti-question-detail-empty-id" type="text/html">
        <div id="cuoti-{questionId}" data-collection-type="{collectionType}" data-question-id="{questionId}"
             class="widget-main my-content-height" style="padding: 20px;display: none;">
        </div>
    </script>
    <script id="template-cuoti-question-detail-up-id" type="text/html">
        <div style="display: none;">
        </div>
        <div style="margin-top: 20px;">
            <p style="font-size: 18px;line-height: 40px;">
                <span>
                   <span style="font-weight: 600;font-size: 18px;">{seq}</span>、<a
                        style="color: #000000;font-size: 18px;text-decoration: none;font-weight: 400;">（{type}）</a>{name}
                </span>
            </p>
        </div>
        <div class="control-group">
    </script>
    <script id="template-cuoti-question-detail-down-id" type="text/html">
        </div>
        <div class="row" style=" bottom: 30px;float: right;position: absolute;right: 41px;">
            <div class="col-xs-1 my-col-xs">
                <button class="btn btn-info my-btn-qiehuanti my-error-shanchu"
                        style="width:100px !important;" data-question-id="{questionId}">
                    删除错题
                </button>
            </div>
            <div class="col-xs-1 my-col-xs">
                <button class="btn btn-info my-btn-qiehuanti my-btn-cuoti-question-prev"
                        data-question-id="{questionId}">
                    上一题
                </button>
            </div>
            <div class="col-xs-1 my-col-xs">
                <button class="btn btn-info my-btn-qiehuanti my-btn-cuoti-question-next"
                        data-question-id="{questionId}">

                    下一题
                </button>
            </div>
        </div>
    </script>
    <script id="template-cuoti-option-id" type="text/html">
        <label class="radio my-radio-disable" data-key="{key}" data-label="{label}">
            <input type="{type}" class="ace" name="cuoti-option-{questionId}" disabled="disabled">
        <span class="lbl">
            <span>
                {label}、
            </span>
                {name}
        </span>
        </label>
    </script>
</div>
<script src="${basePath}assets/system/pufa/js/error.js"></script>
<%@include file="../include/include_footer.jsp" %>
