<%--
  Created by IntelliJ IDEA.
  User: HZC
  Date: 2015/7/28
  Time: 10:15
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="com.hzc.util.alias.S" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
  <base href="<%=basePath%>">
  <title>李沧区干部普法学习测试系统</title>
  <meta charset="utf-8"/>
  <meta http-equiv="X-UA-Compatible" content="IE=9">
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <link rel="bookmark" type="image/x-icon" href="${basePath}assets/system/pufa/img/logo.ico"/>
  <link rel="shortcut icon" href="${basePath}assets/system/pufa/img/logo.ico"/>
  <link rel="icon" href="${basePath}assets/system/pufa/img/logo.ico"/>

  <!-- basic styles -->

  <link href="${basePath}assets/css/bootstrap.min.css" rel="stylesheet"/>
  <link rel="stylesheet" href="${basePath}assets/css/font-awesome.min.css"/>

  <!--[if IE 7]>
  <link rel="stylesheet" href="${basePath}assets/css/font-awesome-ie7.min.css"/>
  <![endif]-->

  <!-- page specific plugin styles -->

  <link rel="stylesheet" href="${basePath}assets/css/jquery-ui-1.10.3.custom.min.css"/>
  <link rel="stylesheet" href="${basePath}assets/css/jquery.gritter.css"/>

  <!-- fonts -->

  <!--<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400,300" />-->

  <link rel="stylesheet" href="${basePath}assets/css/ui.jqgrid.css"/>
  <!-- ace styles -->

  <link rel="stylesheet" href="${basePath}assets/css/ace.min.css"/>
  <link rel="stylesheet" href="${basePath}assets/css/ace-rtl.min.css"/>
  <link rel="stylesheet" href="${basePath}assets/css/ace-skins.min.css"/>

  <!--[if lte IE 8]>
  <link rel="stylesheet" href="${basePath}assets/css/ace-ie.min.css"/>
  <![endif]-->

  <%-- 新手引导效果库 --%>
  <link rel="stylesheet" href="${basePath}assets/js/joyride/joyride-2.1.css">

  <!-- inline styles related to this page -->

  <!--        OWN CSS              -->

  <!-- ace settings handler -->
  <link type="text/css" rel="stylesheet" href="${basePath}assets/js/datatables/css/jquery.dataTables.min.css"/>

  <link type="text/css" rel="stylesheet" href="${basePath}assets/css/hzc.datatable.css">

  <!--
    判断IE浏览器版本小于IE8，则直接提示更新。
  -->
  <!--[if lte IE 7]>
  <script>window.location.href = 'http://cdn.dmeng.net/upgrade-your-browser.html?referrer=' + location.href;</script>
  <![endif]-->

  <script src="${basePath}assets/js/ace-extra.min.js"></script>

  <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

  <!--[if lt IE 9]>
  <script src="${basePath}assets/js/html5shiv.js"></script>
  <script src="${basePath}assets/js/respond.min.js"></script>
  <![endif]-->
  <!-- basic scripts -->

  <!--[if !IE]> -->

  <script src="${basePath}assets/js/jquery-2.0.3.min.js"></script>

  <!-- <![endif]-->

  <!--[if IE]>
  <script src="${basePath}assets/js/jquery-1.10.2.min.js"></script>
  <![endif]-->

  <!--[if !IE]> -->

  <script type="text/javascript">
    window.jQuery || document.write("<script src='/assets/js/jquery-2.0.3.min.js'>" + "<" + "/script>");
  </script>

  <!-- <![endif]-->

  <!--[if IE]>
  <script type="text/javascript">
    window.jQuery || document.write("<script src='/assets/js/jquery-1.10.2.min.js'>" + "<" + "/script>");
  </script>
  <![endif]-->

  <script type="text/javascript">
    if ("ontouchend" in document) document.write("<script src='/assets/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
  </script>
  <script src="${basePath}assets/js/bootstrap.min.js"></script>
  <script src="${basePath}assets/js/typeahead-bs2.min.js"></script>

  <!-- page specific plugin scripts -->

  <!--[if lte IE 8]>
  <script src="${basePath}assets/js/excanvas.min.js"></script>
  <![endif]-->

  <script src="${basePath}assets/js/jquery-ui-1.10.3.custom.min.js"></script>
  <script src="${basePath}assets/js/jquery.ui.touch-punch.min.js"></script>
  <script src="${basePath}assets/js/bootbox.min.js"></script>
  <script src="${basePath}assets/js/jquery.easy-pie-chart.min.js"></script>
  <script src="${basePath}assets/js/jquery.gritter.min.js"></script>
  <%--<script src="${basePath}assets/js/spin.min.js"></script>--%>
  <script src="${basePath}assets/js/jquery.knob.min.js"></script>

  <script src="${basePath}assets/js/datatables/js/jquery.dataTables.min.js"></script>
  <script src="${basePath}assets/js/datatables/js/fnReloadAjax.js"></script>

  <!-- ace scripts -->
  <script src="${basePath}assets/js/ace-elements.min.js"></script>
  <script src="${basePath}assets/js/ace.min.js"></script>

  <%-- 新手引导效果脚本 --%>
  <script type="text/javascript" src="${basePath}assets/js/joyride/jquery.cookie.js"></script>
  <script type="text/javascript" src="${basePath}assets/js/joyride/modernizr.mq.js"></script>
  <script type="text/javascript" src="${basePath}assets/js/joyride/jquery.joyride-2.1.js"></script>

  <!-- inline scripts related to this page -->

  <!-- OWN JS -->
  <script src="${basePath}config.js"></script>
  <script src="${basePath}assets/js/jquery.toaster.js"></script>
  <script src="${basePath}assets/js/hzc.common.1.0.js"></script>
  <script src="${basePath}assets/js/hzc.datatable.js"></script>

  <!--[if lte IE 8]>
  <style>
    .my-btn-xuexi-top {
      margin-left: 0px !important;
    }

    input[type='radio'] {
      margin-top: 12px !important;
    }

    input[type='checkbox'] {
      margin-top: 14px !important;
    }

    #btn-fullscreen-id {
      display: none;
    }
  </style>
  <![endif]-->
</head>
<body>
<div class="container">
  <form method="post" id="search-question" style="display: none;">
  </form>
  <br/>

  <div class="row" style="margin-bottom: 20px;">
    <div class="col-xs-6">
      <input type="hidden" id="questionGroupId" value="${requestScope.questionGroupId}">

      <div style="color: #285e8e;font-size: 1.4em;font-weight: 600">
        选项管理
      </div>
    </div>
    <div class="col-xs-6">
      <button type="button" class="btn btn-info btn-sm"
              onclick="QUESTION_MAIN.addGroup();">
        添加
      </button>
    </div>
  </div>

  <table id="question-list" class="table table-striped table-bordered table-hover"
         style="text-align: left;width: 100%"></table>
</div>
<script type="text/html" id="temp-group-id">
  <form id="group-form" class="form-horizontal">
    <div class="form-group">
      <label class="col-sm-3 control-label no-padding-right">选项内容：</label>

      <div class="col-sm-9">
        <input type="hidden" name="id" value="{id}">
        <input type="hidden" name="questionId" value="${requestScope.questionGroupId}">
        <input type="text" class="col-xs-10 col-sm-10" value="{name}"
               name="name">
      </div>
    </div>
    <div class="form-group">
      <label class="col-sm-3 control-label no-padding-right">是否为正确答案：</label>

      <div class="col-sm-9">
        <select name="key" class="col-xs-10 col-sm-10">
          <option value="1">是</option>
          <option value="-1">否</option>
        </select>
      </div>
    </div>
  </form>
</script>
<script type="text/javascript">
  function setQuestion() {
    $('#otherQuestionDiv').hide();
    $('#otherQuestionInput').val($('#queston').val());
  }
</script>
<script src="${basePath}assets/system/pufa/js/question_junior.js"></script>
</body>
</html>
