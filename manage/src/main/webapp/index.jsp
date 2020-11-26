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

  <!-- inline styles related to this page -->

  <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

  <!--[if lt IE 9]>
  <script src="assets/js/html5shiv.js"></script>
  <script src="assets/js/respond.min.js"></script>
  <![endif]-->

  <style type="text/css">
    .bg {
      filter: "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod='scale')";
      -moz-background-size: 100% 100%;
      background-size: 100% 100%;
      background-color: #1687d5;
    }

    .my-button-join {
      width: 100px;
      height: 35px;
      color: white;
      text-align: center;
      background: #428bca;
      font-weight: 800;
      /*float: right;*/
      border-radius: 5px;
    }

    .my-title-font {
      font-size: 38px;
      font-weight: 600;
      color: white;
      line-height: 48px;
      font-family: "微软雅黑";
      letter-spacing: 3px;
      text-shadow: 1px 1px 3px #cccccc;
      -webkit-text-shadow: #ccc 1px 0 0, #ccc 0 1px 0, #959494 -1px 0 0, #959494 0 -1px 0;
      -moz-text-shadow: #ccc 1px 0 0, #ccc 0 1px 0, #000 -1px 0 0, #000 0 -1px 0;
      text-shadow: #ccc 1px 0 0, #ccc 0 1px 0, #000 -1px 0 0, #000 0 -1px 0;
      *filter: Glow(Color=#000, Strength=1);
    }

    .my-border-radius {
      border-radius: 20px;
    }

    .yhdl {
      width: 100%;
      height: 50px;
      background: #628ba7;
      color: white;
      font-size: 1.5em;
      text-align: center;
      font-weight: 600;
      line-height: 50px;
      border-top-left-radius: 20px;
      border-top-right-radius: 20px;
      letter-spacing: 0.5em;
    }
  </style>
  <!--[if lte IE 8]>
  <style>
    #login-box {
      background-color: #55a0dc;
      height: 280px;
    }

    .widget-main {
      height: 215px;
    }

    #login-form-id {
      height: 215px;
    }
  </style>
  <![endif]-->

</head>

<body class="login-layout bg">
<div class="main-container" style="margin-top:100px;">
  <div class="main-content">
    <div class="center">
      <h1>
        <img src="assets/system/pufa/img/biaozi.png">
        <span class="my-title-font">李沧区干部法律法规管理系统</span>
      </h1>
    </div>
    <div class="login-container" style="width:500px !important; position: relative;margin-top: 3%;">
      <div id="login-box" class="login-box visible widget-box no-border my-border-radius"
           style="background-color: rgba(255, 255, 255,0.3) !important;position: relative!important;">
        <div class="widget-body my-border-radius">
          <div class="yhdl">用户登录</div>
          <div class="widget-main my-border-radius">
            <div id="login-form-id" class="row" style="height: 210px !important;display: block;">
              <form action="SysUserCtrl.login.do" method="post"
                    onsubmit="return validate(this);"
                    style="padding: 20px!important;">

                登录名：<label class="input-icon input-icon-right">
                <input name="username" type="text"
                       class="form-control"
                       placeholder="请输入您的账号" size="45"/>
                <i class="icon-user"></i>
              </label><br/>
                密&nbsp;&nbsp;&nbsp;&nbsp;码：<label class="input-icon input-icon-right">
                <input name="password" type="password"
                       class="form-control"
                       placeholder="请输入您的密码" size="45"/>
                <i class="icon-lock"></i>
              </label>

                <div id="login-message-id"
                     style="color: red;text-align: center;height: 15px;"></div>
                <div class="clearfix"
                     style="margin-top: 15px !important;text-align: center;">
                  <button id="submit-btn-id" type="submit"
                          class="my-button-join btn-info"
                          style="background-color: #2490D7!important;margin-right:10px;">
                    登&nbsp;&nbsp;录
                  </button>
                  <button id="reset-btn-id" type="reset"
                          class="my-button-join btn-info"
                          style="background-color: #2490D7!important;">
                    重&nbsp;&nbsp;置
                  </button>
                </div>
            </div>
          </div>
        </div>
        <!-- /widget-body -->
      </div>
      <!-- /.col -->

    </div>
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
  <script src="assets/js/bootstrap.min.js"></script>
  <script src="assets/js/typeahead-bs2.min.js"></script>
  <script src="assets/js/jquery-ui-1.10.3.custom.min.js"></script>
  <script src="assets/js/jquery.ui.touch-punch.min.js"></script>
  <script src="assets/js/bootbox.min.js"></script>

  <!-- ace scripts -->

  <script src="assets/js/ace-elements.min.js"></script>
  <script src="config.js"></script>
  <!-- inline scripts related to this page -->
  <script type="text/javascript">
    $(function () {
      var loginMessage = '${requestScope.loginMessage}';
      var mess = '${requestScope.message}';
      if (loginMessage && loginMessage != '') {
        setMessage('login-message-id', mess);
      } else if (loginMessage != '') {
        nextStep();
        setMessage('enroll-message-id', mess);
      }
    });
    /**
     * 设置信息
     */
    function setMessage(obj, mess) {
      $('#' + obj).html(mess);
      setTimeout(function () {
        $('#' + obj).html('');
      }, 4000);
    }
    /**
     * 下一步,注册页面
     */
    function nextStep() {
      $('#login-form-id').hide();
      $('#enroll-form-div-id').show();
    }
    /**
     * 上一步，登录界面
     */
    function prevStep() {
      $('#login-form-id').show();
      $('#enroll-form-div-id').hide();
    }

    /**
     *
     * @param id
     */
    function show_box(id) {
      jQuery('.widget-box.visible').removeClass('visible');
      jQuery('#' + id).addClass('visible');
    }

    function validate(form) {
      var idCardDom = $('#idCard');
      var idCard = idCardDom.val();
      var r = new RegExp('^[1-9]([0-9]{16}|[0-9]{13})[xX0-9]$');
      if (idCard.length != 18 || !r.test(idCard)) {
        $('#login-message-id').html('请输入合法的身份证号');
        setTimeout(function () {
          $('#login-message-id').html('');
        }, 4000);
        idCardDom.focus();
        return false;
      }
    }

    //下面代码实现全屏显示
    function openForFullScreen(url) {
      var Request = new Array();//保存参数
      var s = location.search.substring(1);
      if (s && s != "") {
        var list = s.split("&");
        for (var i = 0; i < list.length; i++) {
          var pair = list[i].split("=");
          if (pair[0] && pair[0] != "") {
            Request[unescape(pair[0])] = unescape(pair[1]);
          }
        }
      }
      var fullscreen = Request["fullscreen"];
      if (fullscreen != "yes") {
        var file = url;
        var a = window.open("about:blank", "", "fullscreen=yes")
        self.opener = null
        self.close()
        a.location = file + "?fullscreen=yes";
      }
    }
  </script>
</body>
</html>