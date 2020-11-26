<%@ page import="com.hzc.util.alias.S" %>
<%--
  Created by IntelliJ IDEA.
  User: amy
  Date: 2015/5/22
  Time: 15:08
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
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
  .my-span {
    width: 320px;
    padding: 0 5px;
    display: inline-block;
  }
</style>
<div class="main-container-inner">
  <div id="main-content-id" class="main-content" style="margin-left:0px;margin-top: 10px;">
    <div class="page-content" style="background:none!important;min-height:250px;text-align: center;">
      <!--登录信息-->
      <div class="row">
        <div class="col-sm-2"></div>
        <div class="col-sm-8" style="float:left;padding:100px 0 0px 0;">
          <form id="my-form" action="CardCtrl.login.do" method="post" class="form-horizontal">
            <div class="form-group">
              <label class="col-sm-5 control-label no-padding-right">单位</label>

              <div class="col-sm-7">
                <c:set var="companys" value="<%=S.sysCompanyService().listStandardCompanies()%>"/>
                <select name="companyId" id="company" class="col-xs-10 col-sm-5">
                  <c:forEach items="${companys}" var="company" varStatus="status">
                    <option value="${company.id}"
                            data-val="${company.name}">${company.name}</option>
                  </c:forEach>
                </select>
              </div>
            </div>
            <div class="space-4"></div>
            <div class="form-group">
              <label class="col-sm-5 control-label no-padding-right">密码</label>

              <div class="col-sm-7">
                <input type="password" class="col-xs-10 col-sm-5" id="password" name="password">
              </div>
            </div>
            <div class="space-4"></div>
            <div class="form-group">
              <a class="my-button blue" onclick="eventLogin()" style="color:white!important;"
                 href="javascript:void(0);">
                <strong>登&nbsp;&nbsp;&nbsp;录</strong></a>
            </div>
          </form>
        </div>
        <script src="/assets/js/bootstrap.min.js"></script>
        <script src="/assets/js/typeahead-bs2.min.js"></script>
        <script src="/assets/js/jquery-ui-1.10.3.custom.min.js"></script>
        <script src="/assets/js/jquery.ui.touch-punch.min.js"></script>
        <script src="/assets/js/bootbox.min.js"></script>

        <!-- ace scripts -->

        <script src="/assets/js/ace-elements.min.js"></script>
        <script src="/config.js"></script>
        <script src="/assets/system/pufa/js/company.js"></script>
        <script type="text/javascript">
          /**
           * 错误提示信息
           * 提示在不为空的表单对象的下方
           * obj 对象
           * mess 提示信息
           * 返回false
           */

          function errorPrompt(obj, mess) {
            var span = obj.parent().next();
            var biaozhi = span.attr('biaozhi');
            if (!biaozhi) {
              obj.css('border-color', '#d68273');
              obj.parent().after('<span biaozhi="true" style="color: #d68273;">' + mess + '</span>');
              setTimeout(function () {
                obj.css('border-color', '');
                obj.parent().next().remove();
              }, 3000);
            }
            return false;
          }

          /**
           * 管理员登录
           */
          function eventLogin() {
            var password = $.trim($('#password').val());
            var res = true;
            if (password == '') {
              res = errorPrompt($('#password'), '请填写密码');
            }
            if (res) {
              $('#my-form').submit();
            }
          }
          $(function () {
            var mes = '${requestScope.message}'
            if (mes) {
              errorPrompt($('#password'), '密码不正确');
            }
          })
        </script>
        <%@include file="../include/include_footer.jsp" %>
