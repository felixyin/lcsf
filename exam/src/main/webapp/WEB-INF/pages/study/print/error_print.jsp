<%--
  Created by IntelliJ IDEA.
  Date: 2015/4/29
  Time: 8:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../include/include_header.jsp" %>
<style>
    .my-collect-print {
        width: 100px !important;
        float: right;
        margin-right: 40px;
    }

    .my-print-cls {
        border-collapse: collapse !important;
        border-color: #000000 !important;
        border-right: 1px solid #000000 !important;
        border-style: solid !important;
        border-width: 1px !important;
    }
</style>
<script src="${basePath}assets/js/jquery-migrate-1.1.0.js"></script>
<script src="${basePath}assets/js/jquery.jqprint.js"></script>
<div class="page-content">
    <div class="row">
        <div class="col-xs-12">
            <!-- PAGE CONTENT BEGINS -->
            <div class="row">
                <div class="col-sm-12 col-md-23">
                    <div class="widget-box">
                        <div class="widget-header">
                            <h4 class="smaller">
                                错题打印
                            </h4>
                            <button class="btn btn-danger my-collect-print">
                                打印
                            </button>
                        </div>

                        <div id="my-print-id" class="widget-body my-content-question">
                            <%--***************************** CONTENT ******************************--%>
                            <table class="my-print-cls" width="100%" cellspacing="0" cellpadding="5" border="1">
                                <thead>
                                <tr onmouseout="this.style.backgroundColor=currentcolor"
                                    onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#feefc6'">
                                    <td style="width: 50px;font-size: 16px;font-weight: 700;" class="my-border-top">序号
                                    </td>
                                    <td style="width: 60px;font-size: 16px;font-weight: 700;" class="my-border-top">题型
                                    </td>
                                    <td style="font-size: 16px;font-weight: 700;" class="my-border-top">题目</td>
                                </tr>
                                </thead>
                                <tbody id="shoucang-question-detail-id">
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script id="template-shoucang-question-detail-empty-id" type="text/html">
        </script>
        <script id="template-shoucang-question-detail-up-id" type="text/html">
            <tr>
                <td style="font-size:14px;vertical-align: top;">{seq}</td>
                <td style="font-size:14px;vertical-align: top;">{type}</td>
                <td style="font-size:14px;">
                    <b>
                        {name}
                    </b>
                    <br>
        </script>
        <script id="template-shoucang-question-detail-down-id" type="text/html">
            </td>
            </tr>
        </script>
        <script id="template-shoucang-option-id" type="text/html">
            <span style="color:#000000;padding-left: 30px;">{label}.{name}</span>
            <br>
        </script>
    </div>
    <script src="${basePath}assets/system/pufa/js/error-print.js"></script>
    <%@include file="../../include/include_footer.jsp" %>


