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
      margin-top:  -195px;
    }
  </style>
</head>
<body>
<div class="my-vh-center">
  <img src="${basePath}/assets/error/404.jpg">
</div>
</body>
</html>
