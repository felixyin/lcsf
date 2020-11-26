<%--
  Created by HZC.
  User: yinbin
  Date: 2015/4/28
  Time: 13:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8"/>
  <title>李沧区干部普法学习测试系统</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <link rel="bookmark" type="image/x-icon" href="${basePath}assets/system/pufa/img/logo.ico"/>
  <link rel="shortcut icon" href="${basePath}assets/system/pufa/img/logo.ico"/>
  <link rel="icon" href="${basePath}assets/system/pufa/img/logo.ico"/>

  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

  <!-- basic styles -->

  <link href="assets/css/bootstrap.min.css" rel="stylesheet"/>
  <link rel="stylesheet" href="assets/css/font-awesome.min.css"/>

  <!--[if IE 7]>
  <link rel="stylesheet" href="assets/css/font-awesome-ie7.min.css"/>
  <![endif]-->

  <!-- page specific plugin styles -->

  <!-- fonts -->


  <link rel="stylesheet" href="assets/css/ace.min.css"/>
  <link rel="stylesheet" href="assets/css/ace-rtl.min.css"/>

  <!--[if lte IE 8]>
  <link rel="stylesheet" href="assets/css/ace-ie.min.css"/>
  <![endif]-->


  <!--
    判断IE浏览器版本小于IE8，则直接提示更新。
  -->
  <!--[if lte IE 7]>
  <script>window.location.href = 'http://cdn.dmeng.net/upgrade-your-browser.html?referrer=' + location.href;</script>
  <![endif]-->

  <!-- inline styles related to this page -->

  <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

  <!--[if lt IE 9]>
  <script src="assets/js/html5shiv.js"></script>
  <script src="assets/js/respond.min.js"></script>
  <![endif]-->

  <style type="text/css">
    .bg {
      /*background: url(assets/system/pufa/img/dw0.jpg);*/
      filter: "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod='scale')";
      -moz-background-size: 100% 100%;
      background-size: 100% 100%;
      background-color: #1687d5;
    }
  </style>
  <!--[if lte IE 8]>
  <style>
    .my-login-btns-for-ie {

    .my-login-btns-for-ie {
      top: 50px !important;
    }
  </style>
  <![endif]-->

</head>

<body class="login-layout bg">

<div class="progress progress-mini progress-striped active pro" style="height: 5px;">
  <div id="pre-login-progress-id" style="width: 1%;" class="progress-bar progress-bar-warning"></div>
</div>

<div id="backgroundId" class="main-container text-center">
  <%--<div style='background: url("/assets/images/forward.png") no-repeat;z-index: 999'></div>--%>
  <img id="jinRuBtn" src="assets/images/forward.png" style="width: 1000px;">
</div>
<!-- /.main-container -->

<!-- basic scripts -->

<!--[if !IE]> -->

<script src="assets/js/jquery-2.0.3.min.js"></script>

<!-- <![endif]-->

<!--[if IE]>
<script src="assets/js/jquery-1.10.2.min.js"></script>
<![endif]-->

<!--[if !IE]> -->

<script type="text/javascript">
  window.jQuery || document.write("<script src='assets/js/jquery-2.0.3.min.js'>" + "<" + "/script>");
</script>

<!-- <![endif]-->

<!--[if IE]>
<script type="text/javascript">
  window.jQuery || document.write("<script src='assets/js/jquery-1.10.2.min.js'>" + "<" + "/script>");
</script>
<![endif]-->

<script type="text/javascript">
  if ("ontouchend" in document) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
</script>
<!-- ace scripts -->

<script src="assets/js/ace-elements.min.js"></script>
<!-- inline scripts related to this page -->
<script type="text/javascript">
  $(function () {
    var gogogo = function () {
      window.location.href = 'CommonCtrl.goTo.do?path=/WEB-INF/pages/study/pre/about2.jsp'
    };

    $(document).click(gogogo);
    setTimeout(gogogo, 1000 * 10);

    var i = 1;
    setInterval(function () {
      var step = 1;
      var baiFenBi = i * step;
      $('#pre-login-progress-id').css('width', baiFenBi + '%');
      i++;
    }, 100);
  });
</script>
</body>
</html>
