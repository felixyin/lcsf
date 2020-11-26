<%--
  Created by IntelliJ IDEA.
  User: yinbin
  Date: 2015/4/29
  Time: 8:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../include/include_header.jsp" %>
<div class="page-content" style="background:#d0f6e3;padding-left: 0px;padding-right: 0px;border-left: 1px solid #cccccc;border-right:1px solid #cccccc;" >
    <div class="container" style="padding-top: 20px">
        <a class="btn btn-info" target="_blank" href="${basePath}resources/download/all.docx">
            导出题库
            <%--<i class="icon-print  align-top bigger-125 icon-on-right"></i>--%>
        </a>
        <%--<a class="btn btn-info" target="_blank" href="LpExportExcelCtrl.exportForAllQuestion.do?currentNum=0">--%>
            <%--导出1-500题--%>
            <%--<i class="icon-print  align-top bigger-125 icon-on-right"></i>--%>
        <%--</a>--%>
         <%--<a class="btn btn-info" target="_blank" href="LpExportExcelCtrl.exportForAllQuestion.do?currentNum=500">--%>
            <%--导出501-1000题--%>
            <%--<i class="icon-print  align-top bigger-125 icon-on-right"></i>--%>
        <%--</a>--%>
         <%--<a class="btn btn-info" target="_blank" href="LpExportExcelCtrl.exportForAllQuestion.do?currentNum=1000">--%>
            <%--导出1001-1500题--%>
            <%--<i class="icon-print  align-top bigger-125 icon-on-right"></i>--%>
        <%--</a>--%>
         <%--<a class="btn btn-info" target="_blank" href="LpExportExcelCtrl.exportForAllQuestion.do?currentNum=1500">--%>
            <%--导出1501-2000题--%>
            <%--<i class="icon-print  align-top bigger-125 icon-on-right"></i>--%>
        <%--</a>--%>
    </div>
    <div id="all-question-limit-id"></div>
    <script id="template-all-question-detail-up-id" type="text/html">
        <hr style="border: 1px solid #ffffff;"/>
        <div id="all-{questionId}" data-collection-type="{collectionType}" data-question-id="{questionId}"
             class="widget-main" style="padding: 20px;padding-top: 0px!important;padding-left: 50px;">
            <div style="margin-top: 20px;">

                <p style="font-size: 18px;line-height: 40px;">
           <span>
            <span style="font-size: 18px;font-weight: 600;font-family: '楷体'">
                {seq}、</span><span style="font-family: '楷体';font-size: 18px;font-weight: 400;">（{type}）</span>{name}
            </span>
                </p>
            </div>
            <div class="control-group">

    </script>
    <script id="template-all-question-detail-down-id" type="text/html">
        </div>
        </div>
    </script>
    <script id="template-all-option-id" type="text/html">
        <label class="radio my-radio-disable" data-key="{key}" data-label="{label}">
            <%--<input type="{type}" class="ace" {checked} name="all-option-{questionId}" disabled="disabled">--%>
        <span class="lbl">
            <span style="font-weight: 700;">
                {label}、
            </span>
                {name}
        </span>
            <img src="assets/system/pufa/img/icon/ok.png" style="margin-right: 15px;width:20px;height:20px;display: {show}">
            <%--<i class="icon-ok bigger-110 green" style="margin-right: 15px;font-size: 30px;display: {show}"></i>--%>
        </label>
    </script>
</div>
<script src="${basePath}assets/system/pufa/js/all.js"></script>
<%@include file="../include/include_footer_second.jsp" %>
