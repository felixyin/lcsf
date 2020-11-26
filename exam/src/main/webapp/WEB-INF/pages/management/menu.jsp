<%--
  Created by IntelliJ IDEA.
  User: chenal
  Date: 2015/5/27
  Time: 9:43
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

<style>
  /*三个大按钮的样式*/
  .my-btn-menu {
    font-family: 微软雅黑;
    font-size: 23px;
    width: 260px;
    height: 73px;
    border: 0px;
    border-radius: 15px;
    padding-top: 18px;
    margin-right: 70px;
    margin-bottom: 40px;
    background-color: #1687d5;
  }

  /*两边黑色竖线的处理*/
  /*.my-border {
    height: inherit;
    border-left: 1px solid #cccccc;
    border-right: 1px solid #cccccc;
  }*/

  .my-vertical-center {
    padding-top: 15%;
  }
</style>

<div class="my-border">
  <div class="text-center my-vertical-center">
    <a href="CommonCtrl.goTo.do?path=/WEB-INF/pages/management/enrollment_list.jsp"
       class="btn btn-info my-btn-menu">报名人员查询
    </a>
    <a href="ManageCtrl.goToSignListJsp.do"
       class="btn btn-info my-btn-menu">准考证查询
    </a>
    <a href="CommonCtrl.goTo.do?path=/WEB-INF/pages/management/grade_list.jsp"
       class="btn btn-info my-btn-menu">考试成绩查询
    </a>
  </div>
</div>

<%@include file="../include/include_footer.jsp" %>
