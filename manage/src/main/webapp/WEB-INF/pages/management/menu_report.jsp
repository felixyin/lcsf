<%--
  Created by IntelliJ IDEA.
  User: chenal
  Date: 2015/5/27
  Time: 9:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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

  .my-vertical-center {
    padding-top: 15%;
  }

  .my-group-list {
    cursor: pointer;
  }
</style>

<div class="my-border">
  <div id="group-list" class="row" style="padding-top: 20px;">
  </div>
</div>
<script id="group-temp" type="text/html">
  <div class="col-sm-6 col-md-offset-3 ">
    <div class="alert alert-warning my-group-list" data-group-id="{id}" data-group-name="{name}"
         onclick="MENU_REPORT.listCompany(this);">
      {name}
      <br>
    </div>
  </div>
</script>
<script src="${basePath}assets/system/pufa/js/menu-report.js"></script>
<script src="${basePath}assets/js/hzc.common.1.0.js"></script>
