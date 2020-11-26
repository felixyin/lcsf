<%--
  Created by IntelliJ IDEA.
  User: HZC
  Date: 2015/7/16
  Time: 10:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.hzc.util.alias.S" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
页面头部是否居中？ 默认为居左并且显示导航菜单
页面内容区域的背景，默认为白色
--%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="container">
  <form method="post" id="search-company" style="display: none;">
  </form>
  <br/>

  <div class="row" style="margin-bottom: 20px;">
    <div class="col-xs-6">
      <input type="hidden" id="companyGroupId" value="${requestScope.companyGroupId}">
      <div style="color: #285e8e;font-size: 1.4em;font-weight: 600">
        ${requestScope.companyGroupName} 管理

      </div>
    </div>
    <div class="col-xs-6">
      <button type="button" class="btn btn-info btn-sm"
              onclick="COMPANY_MAIN.addGroup();">
        添加
      </button>
      <button type="button" class="btn btn-info btn-sm"
              onclick="menu_click('CommonCtrl.goTo.do?path=/WEB-INF/pages/management/ManageSystem/company_main.jsp')">
        返回
      </button>
    </div>
  </div>

  <table id="company-list" class="table table-striped table-bordered table-hover" style="text-align: left;width: 100%"></table>
</div>
<script type="text/html" id="temp-group-id">
  <form id="group-form" class="form-horizontal">
    <div class="form-group">
      单位信息设置
    </div>
    <div class="form-group">

      <label class="col-sm-3 control-label no-padding-right">单位名称</label>

      <div class="col-sm-9">
        <input type="hidden" name="id" value="{id}">
        <input type="hidden" name="pid" value="${requestScope.companyGroupId}">

        <input type="text" class="col-xs-10 col-sm-5" value="{name}"
               name="name">
      </div>
    </div>

    <div class="form-group">
      <label class="col-sm-3 control-label no-padding-right">单位密码</label>
      <div class="col-sm-9">


        <input type="password" name="password" value="{password}" class="col-xs-10 col-sm-5" />
      </div>

    </div>

  </form>
</script>
<script type="text/javascript">
  function setCompany() {
    $('#otherCompanyDiv').hide();
    $('#otherCompanyInput').val($('#company').val());
  }
</script>
<script src="${basePath}assets/system/pufa/js/company_junior.js"></script>
