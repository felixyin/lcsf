<%@ page import="com.hzc.util.HttpSessionUtil" %>
<%@ page import="com.hzc.util.alias.S" %>
<%--
  Created by IntelliJ IDEA.
  User: yinbin
  Date: 2015/5/2
  Time: 10:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
  <link rel="bookmark" type="image/x-icon" href="/assets/system/pufa/img/logo.ico"/>
  <link rel="shortcut icon" href="/assets/system/pufa/img/logo.ico"/>
  <link rel="icon" href="/assets/system/pufa/img/logo.ico"/>

  <!-- basic styles -->

  <link href="/assets/css/bootstrap.min.css" rel="stylesheet"/>
  <link rel="stylesheet" href="/assets/css/font-awesome.min.css"/>

  <!--[if IE 7]>
  <link rel="stylesheet" href="/assets/css/font-awesome-ie7.min.css"/>
  <![endif]-->

  <!-- page specific plugin styles -->

  <link rel="stylesheet" href="/assets/css/jquery-ui-1.10.3.custom.min.css"/>
  <link rel="stylesheet" href="/assets/css/jquery.gritter.css"/>

  <!-- fonts -->

  <!--<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400,300" />-->

  <link rel="stylesheet" href="/assets/css/ui.jqgrid.css"/>
  <!-- ace styles -->

  <link rel="stylesheet" href="/assets/css/ace.min.css"/>
  <link rel="stylesheet" href="/assets/css/ace-rtl.min.css"/>
  <link rel="stylesheet" href="/assets/css/ace-skins.min.css"/>

  <!--[if lte IE 8]>
  <link rel="stylesheet" href="/assets/css/ace-ie.min.css"/>
  <![endif]-->

  <%-- 新手引导效果库 --%>
  <link rel="stylesheet" href="/assets/js/joyride/joyride-2.1.css">

  <!-- inline styles related to this page -->

  <!--        OWN CSS              -->
  <link rel="stylesheet" href="/assets/system/pufa/css/header-main.css">

  <!-- ace settings handler -->
  <link type="text/css" rel="stylesheet" href="/assets/js/datatables/css/jquery.dataTables.min.css"/>

  <link type="text/css" rel="stylesheet" href="/assets/css/hzc.datatable.css">

  <!--
    判断IE浏览器版本小于IE8，则直接提示更新。
  -->
  <!--[if lte IE 7]>
  <script>window.location.href = 'http://cdn.dmeng.net/upgrade-your-browser.html?referrer=' + location.href;</script>
  <![endif]-->

  <script src="/assets/js/ace-extra.min.js"></script>

  <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

  <!--[if lt IE 9]>
  <script src="/assets/js/html5shiv.js"></script>
  <script src="/assets/js/respond.min.js"></script>
  <![endif]-->

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

<body style="min-width: 1280px;background-color: #ffffff;" class="container">
<div id="my-main-body-id" style="margin: 0 30px;">

  <div class="navbar navbar-default" id="navbar">
    <script type="text/javascript">
      try {
        ace.settings.check('navbar', 'fixed')
      } catch (e) {
      }
    </script>

    <div id="my-header-bar-id"
         style="height: 160px; background: none repeat scroll 0px 0px #1687D5;">

      <div class="my-header" style="padding-left: 5%">
        <img src="/assets/system/pufa/img/biaozi.png">
                    <span class="my-title-index">
                            李沧区干部法律法规学习测试系统
                    </span><!-- /.brand -->
        <%
          String usedTime = "";
          try {
            usedTime = S.reportServcie().getUsedTime(HttpSessionUtil.getUserId());
          } catch (Exception e) {

          }
        %>
        <c:set var="usedTime" value="<%=usedTime%>"></c:set>
        <div class="my-user-msg-text"
             style="color: #f5f5f5;font-size:15px;text-align: center;width: 500px;margin-top: -20px;margin-left: -20px;">
          当前登录用户：${sessionScope.username}<br/>
          总学时：20小时&nbsp;&nbsp;已学：${usedTime}
        </div>
      </div>
      <!-- /.navbar-header -->

      <div class="navbar-header pull-right my-menu" role="navigation" id="yd-menu-id">
        <ul class="nav ace-nav my-ace-nav" style="top: 80px; display:block;">

          <li id="my-all-study-menu" style="min-width: 50px;" data-is-modal="study-bank"
              class="dropdown-toggle btn-group">

            <a href="CommonCtrl.goTo.do?path=/WEB-INF/pages/study/pre/main.jsp" title="点击打开学习题库"
               class="btn dropdown-toggle my-btn-default"
               style="width:116px;font-size: 18px;border-width: 0px;">
              <img src="/assets/system/pufa/img/menu/lx.png" class="my-menu-item">
              学习题库
            </a>

            <button title="鼠标经过自动打开下拉菜单" class="btn  dropdown-toggle my-btn-default"
                    data-toggle="dropdown"
                    style="height:100%;border-width: 0px;width: 18px !important;">
              <img src="/assets/system/pufa/img/icon/dropdown.png" style="height: 30px;">
              <%--<span class="icon-caret-down icon-only "></span>--%>
            </button>

            <ul class="dropdown-menu dropdown-warning my-dropdown-menu" style="text-align: center;">
              <li>
                <a href="CommonCtrl.goTo.do?path=/WEB-INF/pages/study/ti_all.jsp"
                   class="dropdown-toggle my-dropdown-toggle">总题库</a>
              </li>

              <li>
                <a href="CommonCtrl.goTo.do?path=/WEB-INF/pages/study/ti_panduan.jsp"
                   class="dropdown-toggle my-dropdown-toggle">判断题</a>
              </li>

              <li>
                <a href="CommonCtrl.goTo.do?path=/WEB-INF/pages/study/ti_danxuan.jsp"
                   class="dropdown-toggle my-dropdown-toggle">单选题</a>
              </li>
              <li>
                <a href="CommonCtrl.goTo.do?path=/WEB-INF/pages/study/ti_duoxuan.jsp"
                   class="dropdown-toggle my-dropdown-toggle">多选题</a>
              </li>
            </ul>

          </li>
          <li id="my-test-menu" data-is-modal="modal">
            <a data-toggle="dropdown" class="dropdown-toggle" href="#"
               data-href="CommonCtrl.goTo.do?path=/WEB-INF/pages/study/test_pre.jsp">
              <%--<i class="icon-bell-alt icon-animated-bell"></i>--%>
              <img src="/assets/system/pufa/img/menu/mn.png" class="my-menu-item">
              模拟考试
              <%--<span class="badge badge-important">8</span>--%>
            </a>
          </li>
          <li id="my-collect-menu">
            <a data-toggle="dropdown" class="dropdown-toggle" href="#"
               data-href="CommonCtrl.goTo.do?path=/WEB-INF/pages/study/collect.jsp">
              <%--<i class="icon-envelope icon-animated-vertical"></i>--%>
              <img src="/assets/system/pufa/img/menu/sc.png" class="my-menu-item">
              收藏题库
              <%--<span class="badge badge-success">5</span>--%>
            </a>
          </li>

          <li id="my-error-menu">
            <a data-toggle="dropdown" class="dropdown-toggle" href="#"
               data-href="CommonCtrl.goTo.do?path=/WEB-INF/pages/study/error.jsp">
              <%--<i class="icon-envelope icon-animated-vertical"></i>--%>
              <img src="/assets/system/pufa/img/menu/ct.png" class="my-menu-item">
              错题题库
              <%--<span class="badge badge-success">5</span>--%>
            </a>
          </li>

          <li id="my-user-login-menu" data-is-modal="logout" data-href="CommonCtrl.goTo.do?path=/index_user.jsp">
            <a data-toggle="dropdown" class="dropdown-toggle" href="javascript:void(0);">
              <%--<i class="icon-envelope icon-animated-vertical"></i>--%>
              <img src="/assets/system/pufa/img/icon/fanhui.png" class="my-menu-item">
              返回登录
              <%--<span class="badge badge-success">5</span>--%>
            </a>
          </li>
          <li id="my-all-menu" data-is-modal="ztk" style="display: none;">
            <a data-toggle="dropdown" class="dropdown-toggle" href="#"
               data-href="CommonCtrl.goTo.do?path=/WEB-INF/pages/study/ti_all.jsp">
              <%--<i class="icon-tasks"></i>--%>
              <img src="/assets/system/pufa/img/menu/qt.png" class="my-menu-item">
              总题库
              <%--<span class="badge badge-grey">4</span>--%>
            </a>
          </li>
          <%--
          FIXME
          <li data-is-modal="logout" class="pull-right"  data-href="UserCtrl.logoutForLp.do"--%>
          <%--style="width: 50px;margin-left:45px;margin-right: -45px;background-color: inherit!important;border-left:0px!important;">--%>
          <%--<a  data-toggle="dropdown" href="javascript:void(0);"--%>
          <%--style="width: 45px;height: 45px;margin:0px;padding: 0px;background-color: inherit!important;">--%>
          <%--<img class="my-exit-btn" title="退出系统" src="/assets/system/pufa/img/menu/exit1.png"--%>
          <%--style="margin:0px;padding:0px;width: 45px;height: 45px;">--%>
          <%--</a>--%>
          <%--</li>--%>
          <li data-is-modal="logout" class="pull-right" data-href="UserCtrl.logoutForLp.do"
              style="display: none; width: 50px;margin-left:45px;margin-right: -45px;background-color: inherit!important;border-left:0px!important;">
            <a data-toggle="dropdown" href="javascript:void(0);"
               style="width: 45px;height: 45px;margin:0px;padding: 0px;color: #000000; background-color: #d3d3d3!important;border: 1px solid #ffffff;">
              退出
            </a>
          </li>
          <li class="light-blue" style="display: none;">
            <a data-toggle="dropdown" href="#" class="dropdown-toggle">
              <img class="nav-user-photo" src="/assets/avatars/user.jpg"
                   alt="Jason's Photo"/>
								<span class="user-info">
									<small>个人中心,</small>
									隋丽丽
								</span>

            </a>
          </li>
        </ul>
        <!-- /.ace-nav -->
      </div>
      <a id="btn-fullscreen-id" class="pull-right " href="javascript:void(0);"
         style="position: absolute; top: 0px; color: black; right: 0px; display: none;">
        <span class="block white glyphicon glyphicon-resize-full" title="点击进入或退出全屏模式（快捷键是：双击F10）"
              aria-hidden="true"></span>
      </a>
      <!-- /.navbar-header -->
    </div>
    <!-- /.container -->
  </div>

  <div class="main-container" id="main-container">
    <script type="text/javascript">
      try {
        ace.settings.check('main-container', 'fixed')
      } catch (e) {
      }
    </script>

    <div class="main-container-inner">


      <div id="main-content-id" class="main-content" style="margin-left:0px;margin-top: 0px;">


        <!-- basic scripts -->

        <!--[if !IE]> -->

        <script src="/assets/js/jquery-2.0.3.min.js"></script>

        <!-- <![endif]-->

        <!--[if IE]>
        <script src="/assets/js/jquery-1.10.2.min.js"></script>
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
        <script src="/assets/js/bootstrap.min.js"></script>
        <script src="/assets/js/typeahead-bs2.min.js"></script>

        <!-- page specific plugin scripts -->

        <!--[if lte IE 8]>
        <script src="/assets/js/excanvas.min.js"></script>
        <![endif]-->

        <script src="/assets/js/jquery-ui-1.10.3.custom.min.js"></script>
        <script src="/assets/js/jquery.ui.touch-punch.min.js"></script>
        <script src="/assets/js/bootbox.min.js"></script>
        <script src="/assets/js/jquery.easy-pie-chart.min.js"></script>
        <script src="/assets/js/jquery.gritter.min.js"></script>
        <%--<script src="/assets/js/spin.min.js"></script>--%>
        <script src="/assets/js/jquery.knob.min.js"></script>

        <script src="/assets/js/datatables/js/jquery.dataTables.min.js"></script>
        <script src="/assets/js/datatables/js/fnReloadAjax.js"></script>

        <!-- ace scripts -->
        <script src="/assets/js/ace-elements.min.js"></script>
        <script src="/assets/js/ace.min.js"></script>

        <%-- 新手引导效果脚本 --%>
        <script type="text/javascript" src="/assets/js/joyride/jquery.cookie.js"></script>
        <script type="text/javascript" src="/assets/js/joyride/modernizr.mq.js"></script>
        <script type="text/javascript" src="/assets/js/joyride/jquery.joyride-2.1.js"></script>

        <!-- inline scripts related to this page -->

        <!-- OWN JS -->
        <script src="/config.js"></script>
        <script src="/assets/js/jquery.toaster.js"></script>
        <script src="/assets/js/hzc.common.1.0.js"></script>
        <script src="/assets/js/hzc.datatable.js"></script>

        <!-- jquery 打印插件 -->
        <script src="/assets/js/jquery.jqprint-0.3.js"></script>
        <script type="text/javascript">
          var key = '__is_full_screen';
          function minScreen() {
            var body = $('#my-main-body-id');
            body.css('margin', '0 30px');
            $('.my-title-index').show();
            $('.my-header').children('img').show();
            $('#my-header-bar-id').css('height', '160px');
            $('.my-menu').css('top', '112px');
            $('.my-user-msg-text').css('margin-top', '-20px');
            $('.footer').show();
            $('.widget-body').css('min-height', (510));
            $('#btn-fullscreen-id').children('span').removeClass('glyphicon-resize-small').addClass('glyphicon-resize-full');
          }
          function maxScreen() {
            var body = $('#my-main-body-id');
            body.css('margin', '10px 0 0 0');
            $('.my-title-index').hide();
            $('.my-header').children('img').hide();
            $('#my-header-bar-id').css('height', '60px');
            $('.my-menu').css('top', '12px');
            $('.my-user-msg-text').css('margin-top', '5px');
            $('.footer').hide();
            var height = $(window).innerHeight();
            $('.widget-body').css('min-height', (height - 150));
            $('#btn-fullscreen-id').children('span').removeClass('glyphicon-resize-full').addClass('glyphicon-resize-small');
          }
          function myFullScreen() {
            var isFullScreen = window.localStorage.getItem(key);
            if (isFullScreen == 'true') {
              // 最小化
              window.localStorage.setItem(key, false);
              minScreen.apply(this);
            } else {
              //最大化
              window.localStorage.setItem(key, true);
              maxScreen.apply(this);
            }
          }
          /*   var isFullScreen = window.localStorage.getItem(key);
           if(isFullScreen == 'true'){
           //            Common.toast('您已进入全屏模式');
           maxScreen();
           }
           */
          $('#btn-fullscreen-id').click(myFullScreen);
          $(window.document).keydown(function (evt) {
            if (evt.keyCode == 121) {
              myFullScreen.apply($('#btn-fullscreen-id')[0]);
            }
          });

          //          已废弃
          //          $(function () {
          //            var width = $(document).width();
          //            alert(width);
          //            if (width < 1200) {
          //              $('#my-user-login-menu').hide();
          //            }
          //          });
        </script>

        <style>

          /*
           * 自定义标题是否居中
           */
          <c:if test="${param.headAlign == 'center'}">
          .my-menu, .my-user-msg-text {
            display: none;
          }

          .my-header {
            text-align: center;
            padding-left: 0px !important;
          }

          </c:if>

          /*
           * 自定义 内容区的背景
           */
          .main-content {
            background: ${param.contentBackground};
            min-height: 500px;

          }
        </style>




