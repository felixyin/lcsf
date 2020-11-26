<%--
  Created by IntelliJ IDEA.
  User: chenal
  Date: 2015/5/26
  Time: 11:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--
页面头部是否居中？ 默认为居左并且显示导航菜单
页面内容区域的背景，默认为白色
--%>
<%--<%@include file="../include/include_header.jsp"%>--%>
<jsp:include page="../include/include_header.jsp">
    <jsp:param name="headAlign" value="center"></jsp:param>
    <jsp:param name="contentBackground" value="#d0f6e3"></jsp:param>
</jsp:include>
<script src="${basePath}assets/js/jquery-migrate-1.1.0.js"></script>
<script src="${basePath}assets/js/jquery.jqprint.js"></script>
<style type="text/css">
    td, th, tbody, table {
        border: 0px;
    }
</style>

<div class="page-content" style="background:none!important;min-height:348px;text-align: center;">
    <div class="row">
        <div id="zhunkaozheng"
             style="height: auto !important;border:0px;  width: 800px;height: 574px;margin: 20px auto;">
            <div id="my-print-id" class="widget-body my-content-question"
                 style="min-height: auto!important;text-align:left;border:0px;">
                <%--***************************** CONTENT ******************************--%>
                <table class="my-print-cls " width="100%" cellspacing="0" cellpadding="5" border="0">
                    <thead>
                    <tr onmouseout="this.style.backgroundColor=currentcolor"
                        onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#feefc6'">
                        <td style="height:50px;font-size: 20px;font-weight: 700;background: #1687d5;color:white;font-family:微软雅黑;letter-spacing:0.3em;text-align: center;"
                            class="my-border-top">
                            李沧区干部法律法规考试
                        </td>
                    </tr>
                    </thead>
                    <tr>
                        <td>
                            <tbody id="shoucang-question-detail-id">
                            <table class="my-print-cls" width="100%" cellspacing="0" cellpadding="5" >
                                <tr>
                                    <td style="font-size:14px;vertical-align: top;border-right:1px dotted darkgray;padding:20px;width:400px;">
                                        <table class="my-print-cls" width="100%" height="425px" cellspacing="1" cellpadding="5"
                                               style="border:1px solid darkgray;">
                                            <tr>
                                                <td colspan="2"
                                                    style="height:60px;font-size: 18px;text-align: center;font-family: 微软雅黑;font-weight: 400;letter-spacing: 0.3em;">
                                                    准考证
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="font-size:14px;vertical-align: top;">
                                                    <img src="ManageCtrl.writeUserPhoto.do?id=${requestScope.card.userId}"
                                                         style="width: 150px;height:170px;margin-left:5px;"/>
                                                </td>
                                                <td style="font-size:14px;vertical-align: top;">
                                                    <table style="margin-left:5px;">
                                                        <tr>
                                                            <td style="width:80px;">准考证号：</td>
                                                            <td>${requestScope.card.cardNo}</td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width:80px;">姓名：</td>
                                                            <td>${requestScope.card.name}</td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width:80px;">出生年月：</td>
                                                            <td>${requestScope.card.birthday}</td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width:80px;">性别：</td>
                                                            <td>${requestScope.card.sex}</td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width:80px;">工作单位：</td>
                                                            <td>${requestScope.card.company}</td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width:80px;">职级：</td>
                                                            <td>${requestScope.card.jobGrade}</td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                            <tr>
                                                <td style="height:25px;"></td>
                                            </tr>
                                            <td colspan="2" style="padding-left:15px;">
                                                考试时间：${requestScope.card.examTimeStartStr}
                                                到 ${requestScope.card.examTimeEndStr}</td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" style="padding-left:15px;">
                                                    考试地点：${requestScope.card.address}</td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" style="padding-left:15px;">
                                                    考&nbsp;场&nbsp;号：${requestScope.card.roomNo}</td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" style="padding-left:15px;">
                                                    座&nbsp;&nbsp;&nbsp;&nbsp;次：${requestScope.card.seatNo}</td>
                                            </tr>
                                            <tr>
                                                <td style="height:15px;"></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td style="font-size:14px;vertical-align: top;padding:20px;">
                                        <table class="my-print-cls" width="100%" height="425px" cellspacing="0" cellpadding="5"
                                               style="border:1px solid darkgray;">
                                            <tr>
                                                <td style="font-size: 18px;text-align: center;height:60px;font-family: 微软雅黑;font-weight:400;letter-spacing: 0.3em;">
                                                    应试人员须知
                                                </td>
                                            </tr>

                                            <tr>
                                                <td style="padding:0 15px;width:400px!important;">
                                                    <ol>
                                                        <li>应试人员一律凭准考证和有效身份证件进入指定考场参加考试，准考证、身份证件不全者不得参加考试。</li>
                                                        <li>应试人员除携带必需文具外，不得随身携带其他纸张、电子用品、通讯工具、钟表等物品参加考试。禁带物品请在入场检查前自行整理，作好标记，放至指定位置。</li>
                                                        <li>提前15分钟入场，开考30分钟后，禁止入场；考试结束前30分钟内，应试人员可以交卷出场。</li>
                                                        <li>应试人员在考试期间需严格遵守考试纪律，听从监考人员指令，配合监考人员工作。</li>
                                                        <li>应试人员交卷后，请立即撤离考试区域，禁止喧哗。</li>
                                                        <li>考试过程中，禁止关闭电源，禁止刷新浏览器，禁止拔掉网线，否则后果自负。</li>
                                                    </ol>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div><a onclick="printme()" class="my-button blue"
                style="color:white!important;text-align: center;margin-bottom: 20px;"><strong>打印准考证</strong></a>
            <script language="javascript">
                function printme() {
                    $('#zhunkaozheng').jqprint({
                        //debug: true,
                        importCSS: true
                    });
                }
            </script>
        </div>
    </div>
</div>
<%@include file="../include/include_footer.jsp" %>
