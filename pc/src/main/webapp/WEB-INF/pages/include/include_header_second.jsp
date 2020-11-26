<%--
  Created by IntelliJ IDEA.
  User: LiuJY
  Date: 2015/5/6
  Time: 15:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <%@include file="../common_jstl.jsp" %>
  <meta charset="utf-8"/>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>李沧区干部普法学习测试系统</title>
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
  <link rel="stylesheet" href="${basePath}assets/system/pufa/css/header-main.css">

  <!-- ace settings handler -->

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

  <!-- ace scripts -->
  <script src="${basePath}assets/js/ace-elements.min.js"></script>
  <script src="${basePath}assets/js/ace.min.js"></script>

  <%-- 新手引导效果脚本 --%>
  <script type="text/javascript" src="${basePath}assets/js/joyride/jquery.cookie.js"></script>
  <script type="text/javascript" src="${basePath}assets/js/joyride/modernizr.mq.js"></script>
  <script type="text/javascript" src="${basePath}assets/js/joyride/jquery.joyride-2.1.js"></script>

  <!-- inline scripts related to this page -->

  <script src="${basePath}assets/js/jquery.dataTables.min.js"></script>
  <script src="${basePath}assets/js/jquery.dataTables.bootstrap.js"></script>

  <!-- OWN JS -->
  <script src="${basePath}config.js"></script>
  <script src="${basePath}assets/js/jquery.toaster.js"></script>
  <script src="${basePath}assets/js/hzc.common.1.0.js"></script>
  <script src="${basePath}assets/js/hzc.datatable.js"></script>

  <!-- jquery 打印插件 -->
  <script src="${basePath}assets/js/jquery.jqprint-0.3.js"></script>

  <!-- inline styles related to this page -->

  <style type="text/css">

    .dropdown-preview > .dropdown-menu {
      display: block;
      position: static;
      margin-bottom: 5px;
    }

    .my-menu li {
      width: 140px;
      font-size: 18px;
      font-weight: bold;
    }

    input[type=radio].ace + .lbl::before {
      border-radius: 100%;
      font-size: 18px;
      font-family: FontAwesome;
      text-shadow: 0 0 1px #32a3ce;
      line-height: 28px;
      height: 28px;
      min-width: 28px;
    }

    input[type=checkbox].ace + .lbl::before {
      font-size: 18px;
      text-shadow: 0 0 1px #32a3ce;
      line-height: 28px;
      height: 28px;
      min-width: 28px;
    }

    input[type=radio].ace-all + .lbl-all::before {
      border-radius: 100%;
      font-size: 14px !important;
      font-family: FontAwesome;
      text-shadow: 0 0 1px #32a3ce;
      line-height: 25px !important;
      height: 25px !important;
      min-width: 25px !important;
    }

    input[type=checkbox].ace-all + .lbl-all::before {
      font-size: 14px !important;
      text-shadow: 0 0 1px #32a3ce;
      line-height: 25px !important;
      height: 25px !important;
      min-width: 25px !important;
    }

    .my-menu-item-active {
      height: 55px !important;
      margin-top: -8px;
      border-top-color: #f59942 !important;
      border-top-width: 5px !important;
    }

    .my-menu-item-active > a {
      padding-top: 8px !important;
    }

    .my-menu-item-active:active {
      opacity: 0.6 !important;
    }

    .page-content {
      padding: 0px !important;
    }

    .footer {
      float: left;
      width: 100%;
      height: 110px;
      background-color: #1687D5;
      color: #fff;
      min-height: 40px;
      text-align: center;
      padding: 20px;
      font-size: 14px;
      line-height: 30px;
    }

    .button {
      display: inline-block;
      outline: none;
      cursor: pointer;
      text-align: center;
      text-decoration: none;
      padding: .3em 1em .35em;
      text-shadow: 0 1px 1px rgba(0, 0, 0, .3);
      -webkit-border-radius: .5em;
      -moz-border-radius: .5em;
      border-radius: .5em;
      -webkit-box-shadow: 0 1px 2px rgba(0, 0, 0, .2);
      -moz-box-shadow: 0 1px 2px rgba(0, 0, 0, .2);
      box-shadow: 0 2px 3px rgba(0, 0, 0, .2);
      width: 260px;
      border: 3px solid #e4e4e4;
      background: #1687D5;
      float: right;
      margin-right: 60px;
      line-height: 35px;
      margin-top: 30px;
      color: white;
      font-family: "微软雅黑";
      letter-spacing: 2px;
      font-size: 18px;
    }

    a {
      text-decoration: none;
    }

    a:hover {
      color: #ffffff;
      text-decoration: none;
    }
  </style>

  <!--
    判断IE浏览器版本小于IE8，则直接提示更新。
  -->
  <!--[if lte IE 7]>
  <script>window.location.href = 'http://cdn.dmeng.net/upgrade-your-browser.html?referrer=' + location.href;</script>
  <![endif]-->

  <!--[if lte IE 8]>

  <script src="${basePath}assets/js/jquery-1.11.0.min.js"></script>
  <script src="${basePath}assets/js/jquery.placeholder.js"></script>
  <script type="text/javascript">
    $(function () {
      $('input, textarea').placeholder();
    });
  </script>

  <![endif]-->
  <script src="${basePath}assets/js/ace-extra.min.js"></script>

  <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

  <!--[if lt IE 9]>
  <script src="${basePath}assets/js/html5shiv.js"></script>
  <script src="${basePath}assets/js/respond.min.js"></script>
  <![endif]-->

</head>
