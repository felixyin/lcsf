<%--
  Created by IntelliJ IDEA.
  User: yinbin
  Date: 2015/6/15
  Time: 9:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head lang="en">
  <meta charset="UTF-8">
  <title>错误页面</title>
  <meta charset="UTF-8">

  <style type="text/css">
    .my-vh-center {
      position: fixed;
      top: 50%;
      left: 50%;
      margin-left: -200px;
      margin-top: -195px;
    }
  </style>
</head>
<body>
<div class="my-vh-center">
  <img src="${basePath}/assets/error/404.jpg">

  <h3><span id="time-span-id">5</span>秒钟后会自动跳转回上一页面或系统主页</h3>
</div>
<script type="text/javascript">
  var timeSpan = document.getElementById('time-span-id');
  var totalTime = 5;
  var inter = setInterval(function () {
    totalTime = totalTime - 1;
    timeSpan.innerHTML = totalTime + "";
  }, 1000);

  var timeout = setTimeout(function () {
    var isBack = window.history.back();
    if (undefined == isBack) {
      window.location.href = 'http://lcsf.oltop.cn';
    }
    clearInterval(inter);
    clearTimeout(timeout);
  }, 5000);
</script>
</body>
</html>
