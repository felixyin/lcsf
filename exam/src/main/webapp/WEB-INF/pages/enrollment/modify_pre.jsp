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
<style>
    select {
        width: 292px;
        border: 1px solid #1687d5;
        padding: 0 5px;
    }
</style>
<div class="main-container-inner">
    <div id="main-content-id" class="main-content" style="margin-left:0px;margin-top: 10px;">
        <div class="page-content"
             style="background:none!important;min-height:348px;text-align: center;min-height: 400px;border-radius: .5em!important;">
            <div style="font-size: 20px;padding:100px 0 30px 0;"><strong>第二步 身份验证</strong></div>
            <div style="margin:0 auto;">
                <form id="modify" action="UserCtrl.">
                    <input id="idCard" type="text" placeholder="请输入您报名时填写的身份证号"
                           style="text-align:left; width:290px;height:40px;border: 1px solid #1687d5;line-height:30px;"/>
                </form>
            </div>
            <a class="my-button blue" onclick="checkEvent();"
               style="color:white!important;text-align: center;margin-top:60px;"
               href="javascript:;"><strong>验&nbsp;&nbsp;&nbsp;证</strong></a>
            <%--CommonCtrl.goTo.do?path=/WEB-INF/pages/enrollment/modify.jsp--%>
        </div>
        <script type="text/javascript">

            /**
             * 错误提示信息
             * 提示在不为空的表单对象的下方
             * obj 对象
             * mess 提示信息
             * 返回false
             */

            function errorPrompt(obj, mess) {
                obj.css('border-color', '#d68273');
                obj.parent().after('<div style="margin:0 auto;"><span style="color: #d68273;">' + mess + '</span></div>');
                setTimeout(function () {
                    obj.css('border-color', '');
                    obj.parent().next().remove();
                }, 3000);
                return false;
            }

            function checkEvent() {
                var yes = true;
                var $idCard = $("#idCard");
                var idCard = $idCard.val();
                if (idCard == '') {
                    yes = errorPrompt($idCard, '请填写身份证号');
                } else {
                    var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
                    if (reg.test(idCard) === false) {
                        yes = errorPrompt($idCard, '请填写正确的身份证号');
                    }
                }
                if (yes) {
                    $.ajax()
                }
            }
        </script>


        <%@include file="../include/include_footer.jsp" %>

