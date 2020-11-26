<%@ page import="com.hzc.util.alias.S" %>
<%--
  Created by HZC.
  User: yinbin
  Date: 2015/4/28
  Time: 13:13
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

  <!--
    判断IE浏览器版本小于IE8，则直接提示更新。
  -->
  <!--[if lte IE 7]>
  <script>window.location.href = 'http://cdn.dmeng.net/upgrade-your-browser.html?referrer=' + location.href;</script>
  <![endif]-->
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
    .my-button {
      width: 170px;
      height: 40px;
      color: white;
      font-weight: 500;
      text-align: center;
      line-height: 18px;
      font-size: 18px;
      background: #004c82 !important;
      border-radius: 5px;
      border: 2px solid #004c82 !important;
      font-family: "Microsoft YaHei";
      letter-spacing: 0.3em !important;
    }
    .my-button:hover{
       border: 1px solid #cccccc!important;
        }
    .my-button-join {
      width: 100px;
      height: 35px;
      color: white;
      text-align: center;
      background: #12a5eb;
      transition: all 0.15s ease 0s;
      font-weight: 800;
      /*float: right;*/
      border-radius: 5px;
    }

    .my-button-join:hover {
      text-decoration: none;
      background-color: #048cb9!important;
      border: 1px solid #005aa7;
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
      text-shadow: 1px  1px  1px rgb(0,0,0,0.1);
      *filter: Glow(Color=#000, Strength=1);
    }

    .my-border-radius {
      border-radius: 20px;
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
<div class="main-container" style="margin-top:5%;">
  <div class="main-content">
    <div>
      <div class="center">
        <h1>
          <img src="${basePath}assets/system/pufa/img/biaozi.png">
          <span class="my-title-font">李沧区干部法律法规学习测试系统</span>
        </h1>
      </div>
    </div>
    <div class="login-container" style="width: 700px !important; position: relative;">
      <div id="login-box" class="login-box visible widget-box no-border my-border-radius"
           style="background-color: #B0B0B0 !important;position: relative!important;">
        <div class="widget-body my-border-radius">
          <div class="widget-main my-border-radius">
            <%--<div class="row" style="height: 100px;"></div>--%>
            <div id="login-form-id" class="row" style="height: 260px !important;display: block;">
              <div class="col-xs-7">
                <h4 class="header blue lighter bigger" style="font-weight: 800;">
                  <img src="${basepath}assets/system/pufa/img/logo-user.png"
                       style="width:22px;height:auto;margin-top: -5px;">
                  <%--<i class="icon-coffee blue"></i>--%>
                  学员登录

                </h4>

                <div class="space-6"></div>
                <form action="UserCtrl.lcpf.do" method="post"
                      onsubmit="return validate(this);"
                      style="padding: 0px 40px 10px 0px !important;border-right: 1px solid lightgray;margin-right: -10px;">
                  <fieldset>
                    <div style="margin-bottom: 15px;margin-top:10px;font-size: 15px;font-weight: bold;">
                      身份证号码：
                    </div>
                    <label class="block clearfix" style="margin-top: 15px !important;">
														<span class="block input-icon input-icon-right">
															<input id="idCard" name="username" type="text"
                                     class="form-control"
                                     placeholder="请输入您的身份证号"/>
															<%--<i class="icon-user"></i>--%>
														</span>
                    </label>

                    <div id="login-message-id" style="color: red;text-align: center;height: 1px;"></div>
                    <div class="clearfix"
                         style="margin-top: 20px !important;text-align: right;">
                      <%--<label class="inline" style="display: none;">--%>
                      <%--<input id="remember-me-id" type="checkbox" class="ace"/>--%>
                      <%--<span class="lbl"> 记住我</span>--%>
                      <%--</label>--%>
                      <button id="submit-btn-id" type="submit"
                              class="my-button-join">
                        登&nbsp;&nbsp;录
                      </button>
                      <button id="enroll-btn-id" type="button" onclick="nextStep()"
                              class="my-button-join">
                        注&nbsp;&nbsp;册
                      </button>
                    </div>

                    <div class="space-4"></div>
                  </fieldset>
                </form>
              </div>
              <div class="col-xs-5">
                <h4 class="header blue lighter bigger" style="font-weight: 800;">
                  <img src="${basepath}assets/system/pufa/img/logo-shaomiao.png"
                       style="width:22px;height:auto;margin-top: 0px;">
                  <%--<i class="icon-group blue"></i>--%>
                  请扫描二维码下载安装
                </h4>

                <div class="space-6"></div>
                <div class="row">
                  <!--
                  <div class="col-xs-6">安卓手机:</br>
                    <img src="assets/system/pufa/img/erweima/android-ccstudy-8090.png"
                         style="width: 100%;">
                  </div>
                  <div class="col-xs-6">苹果手机:</br>
                    <img src="assets/system/pufa/img/erweima/lp-ios.png"
                         style="width: 100%;">
                  </div>
                  -->
                  <div class="col-xs-2"></div>
                  <div class="col-xs-8" style="text-align: center;">
                    <img src="${basePath}assets/system/pufa/img/erweima/licangsifa.png"
                         style="width: 100%;">
                  </div>
                </div>
              </div>
            </div>
            <%--学员注册--%>
            <div id="enroll-form-div-id" class="row" style="display: none;">
              <div class="col-xs-12">
                <h4 class="header blue lighter bigger" style="font-weight: 800;">
                  <img src="${basepath}assets/system/pufa/img/logo-user.png"
                       style="width:22px;height:auto;margin-top: -5px;">
                  学员注册
                </h4>

                <div class="space-6"></div>
                <form id="enroll-form" action="UserCtrl.enroll.do" method="post" class="form-horizontal"
                      style="padding: 0px 40px 10px 0px !important;">
                  <fieldset>

                    <div class="form-group">
                      <label class="col-sm-5 control-label no-padding-right"> 身份证号码：</label>

                      <div class="col-sm-7">
                        <input type="text" id="enrollIdCard" name="idCard" class="col-xs-10 col-sm-10"
                               placeholder="请输入您的身份证号" onblur="checkUser(this);">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-5 control-label no-padding-right"> 姓名：</label>

                      <div class="col-sm-7">
                        <input type="text" id="enrollUserName" name="username" class="col-xs-10 col-sm-10"
                               placeholder="请输入您的姓名">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-5 control-label no-padding-right"> 单位：</label>

                      <div class="col-sm-7">
                        <c:set var="companys"
                               value="<%=S.sysCompanyService().listStandardCompanies()%>"/>
                        <select id="company" onchange="setCompany();" class="col-xs-10 col-sm-10">
                          <option value="">请选择单位</option>
                          <c:forEach items="${companys}" var="company" varStatus="status">
                            <option value="${company.id}"
                                    data-val="${company.name}">${company.name}</option>
                          </c:forEach>
                        </select>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-5 control-label no-padding-right"> </label>

                      <div class="col-sm-7">
                        如果没有您的单位，请点击<a href="javascript:void(0);" onclick="addOtherCompany()">[其他]</a>
                      </div>
                    </div>
                    <div class="form-group" id="otherCompanyDiv" style="display:none;">
                      <label class="col-sm-5 control-label no-padding-right"> </label>

                      <div class="col-sm-7">
                        <span id="otherCompanySpan" class="my-self-company"></span>
                        <input type="hidden" name="companyId" id="otherCompanyInput">
                        <button type="button" onclick="setCompany();" class="my-button-join btn-info"
                                style="height: 28px;width:60px;margin:0 10px;">删除
                        </button>
                      </div>
                    </div>
                    <div class="form-group">
                      <div id="enroll-message-id" class="col-sm-12"
                           style="color: red;height: 15px;text-align: center;"></div>
                    </div>
                    <div class="clearfix"
                         style="margin-top: 25px !important;text-align: center;">
                      <button type="button" onclick="prevStep()"
                              class="my-button-join" >
                        返&nbsp;&nbsp;回
                      </button>
                      <button type="button" onclick="enroll()"
                              class="my-button-join">
                        注&nbsp;&nbsp;册
                      </button>
                    </div>
                    <div class="space-4"></div>
                  </fieldset>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- /widget-body -->

      <div class="center position-relative my-login-btns-for-ie"
           style="position: relative!important;padding-top: 50px;">
        <div class="row">
          <div class="col-xs-4">
            <a  class="btn btn-primary my-button
                       <%--disabled" href="javascript:;">--%>
              " href="CommonCtrl.goWithCompanyJsp.do?path=/WEB-INF/pages/enrollment/sign.jsp">
              网上报名
            </a>
          </div>
          <div class="col-xs-4">
            <!--== href="CommonCtrl.goTo.do?path=/WEB-INF/pages/card/print_card.jsp;"-->
            <a class="btn btn-primary my-button
            <%--disabled" href="javascript:;">--%>
              " href="CommonCtrl.goWithCompanyJsp.do?path=/WEB-INF/pages/card/print_card.jsp">
              打印准考证
            </a>
          </div>
          <div class="col-xs-4">
            <%--href="javascript:openForFullScreen('CommonCtrl.goTo.do?path=/WEB-INF/pages/exam/login.jsp');">--%>
            <a class="btn btn-primary my-button
            <%--disabled" href="javascript:void(0);">--%>
              " href="CommonCtrl.goTo.do?path=/WEB-INF/pages/exam/login.jsp">
              网上考试
            </a>
          </div>
          <%--<div class="col-xs-3">--%>
            <!--
                 href="CommonCtrl.goTo.do?path=/WEB-INF/pages/management/menu.jsp;" -->
            <%--<a class="btn btn-primary my-button--%>
            <%--disabled" href="javascript:;">--%>
              <%--" href="CommonCtrl.goTo.do?path=/WEB-INF/pages/management/menu.jsp">--%>
              <%--考试管理--%>
            <%--</a>--%>
          </div>
        </div>
      </div>
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
<style>
  .my-self-company {
    margin-right: 15px;
    cursor: pointer;
    text-decoration: none;
    display: inline-table;
    height: 25px;
    border: 1px solid;
    margin-top: 5px;
    padding: 3px 2px 0px 2px;
  }

  .modal-dialog {
    padding-top: 10%;
  }
</style>
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
   * 删除其他类单位，同时设置companyid的值
   */
  function setCompany() {
    $('#otherCompanyDiv').hide();
    $('#otherCompanyInput').val($('#company').val());
  }
  /**
   * 选择其他类中的单位
   */
  function selectCompany(obj) {
    $('#otherCompanyDiv').show();
    var companyId = $(obj).attr('data-id');
    var companyName = $(obj).attr('data-name');
    $('#otherCompanySpan').html(companyName);
    $('#otherCompanyInput').val(companyId);
    $('.bootbox-close-button').click();
    $('#company').val('');
  }
  /**
   * 用户手动添加单位
   */
  function addSelfCompany() {
    var company = $.trim($('#newCompany').val());
    if (company == "") {
      setMessage('companyMess', '请填写单位');
      return;
    }
    $.ajax({
      url: Routers.pufa.user.addSelfCompany,
      type: 'post',
      data: {company: company},
      success: function (data) {
        if (data.success) {
          var companyId = data.message;
          var html = '<div class="my-self-company" onclick="selectCompany(this)" data-id="' + companyId + '" data-name="' + company + '">' + company + '</div>';
          $('#addCompany').before(html);
        } else {
          setMessage('companyMess', data.message);
        }
      }, error: function () {
        setMessage('companyMess', '系统繁忙，请稍候再试');
        return;
      }
    })
  }
  /**
   * 选择其他单位
   */
  function addOtherCompany() {
    $.ajax({
      type: 'POST',
      url: Routers.pufa.user.getOtherCompanies,
      success: function (data) {
        var html = '<div style="height: 30px;font-weight: 700;border-bottom: 1px solid;margin-bottom: 5px;">请选择其他单位</div>';
        if (data.length > 0) {
          for (var i = 0; i < data.length; i++) {
            var com = data[i];
            html += '<div class="my-self-company" onclick="selectCompany(this)" data-id="' + com.id + '" data-name="' + com.name + '">' + com.name + '</div>'
          }
        }
        html += '<div id="addCompany" style="margin-top: 10px;border-top:1px solid;">' +
            '<div>如果依然没有，请手动添加：</div><input id="newCompany" type="text">' +
            '<button type="button" onclick="addSelfCompany();" class="my-button-join btn-info" style="height: 28px;width:60px;margin:0 10px;">添加</button>' +
            '<span id="companyMess" style="color:red;"><span>' +
            '</div>';
        bootbox.dialog({
          message: html
        });
      }
    });
  }
  /**
   * 检查注册时，身份证是否可用
   */
  function checkUser(obj) {
    var idCard = $(obj).val();
    $.post(Routers.pufa.enrollment.ajaxCheckIdCardDup, {idCard: idCard}, function (json) {
      if (json && !json.success) {
        setMessage('enroll-message-id', json.message)
        $(obj).focus();
      }
    }, 'JSON');
  }

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
   * 注册
   */
  function enroll() {
    var idCard = $.trim($('#enrollIdCard').val());
    var userName = $.trim($('#enrollUserName').val());
    var r = new RegExp('^[1-9]([0-9]{16}|[0-9]{13})[xX0-9]$');
    if (idCard.length != 18 || !r.test(idCard)) {
      setMessage('enroll-message-id', '请输入合法的身份证号');
      $('#enrollIdCard').focus();
      return;
    }
    if (userName == "") {
      setMessage('enroll-message-id', '请输入您的姓名');
      return;
    }
    if ($.trim($('#otherCompanyInput').val()) == "") {
      setMessage('enroll-message-id', '请选择单位');
      return;
    }
    $('#enroll-form').submit();
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

    try {
      window.localStorage.setItem('__idCard', idCard);
    } catch (e) {
    }
  }

  // 如果已经登录过，则显示上次登录的身份证号码
  try {
    var ID_CARD = window.localStorage.getItem('__idCard');
    if (ID_CARD) {
      $('#idCard').val(ID_CARD);
    }
  } catch (e) {
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
