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

    <link href="/assets/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="/assets/css/font-awesome.min.css"/>

    <!--[if IE 7]>
    <link rel="stylesheet" href="/assets/css/font-awesome-ie7.min.css"/>
    <![endif]-->

    <!-- page specific plugin styles -->

    <!-- fonts -->


    <link rel="stylesheet" href="/assets/css/ace.min.css"/>
    <link rel="stylesheet" href="/assets/css/ace-rtl.min.css"/>

    <!--[if lte IE 8]>
    <link rel="stylesheet" href="/assets/css/ace-ie.min.css"/>
    <![endif]-->

    <!-- inline styles related to this page -->

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

    <!--[if lt IE 9]>
    <script src="/assets/js/html5shiv.js"></script>
    <script src="/assets/js/respond.min.js"></script>
    <![endif]-->

    <style type="text/css">
        .bg {
            /*background: url(assets/system/pufa/img/dw0.jpg);*/
            filter: "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod='scale')";
            -moz-background-size: 100% 100%;
            background-size: 100% 100%;
            background-color: #1687d5;
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

        }

        .my-border-radius {
            border-radius: 20px;
        }
        .my-button {
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
            width: 200px;
            border: 3px solid #f0fdf7;
            background: #12a5eb;
            float: right;
            line-height: 35px;
            color: white;
            font-family: "微软雅黑";
            letter-spacing: 0.3em;
            font-size: 18px;
            float: right;
            margin-top: 20px;
        }

        .my-button:hover {
            text-decoration: none;
            background-color: #048cb9;
            transition: all 0.15s ease 0s;
            color:white!important;
            border: 3px solid #cccccc;
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
<div class="main-container bg" style="margin-top:5%;">
    <div class="main-content">
        <div class="center">
            <h1>
                <img src="/assets/system/pufa/img/biaozi.png">
                <span class="my-title-font">李沧区干部法律法规学习测试系统</span>
            </h1>
        </div>
    </div>
    <div class="login-container"
         style="width:850px !important; position: relative;min-height:560px">
        <div id="login-box" class="login-box visible widget-box no-border my-border-radius"
             style="background-color: #ffffff !important;position: relative!important;">
            <div class="widget-body my-border-radius">
                <div class="widget-main my-border-radius" style="background: #daeff9;">
                    <div id="login-form-id" class="row" style="display: block;padding:15px;">
                        <div class="col-xs-12">
                            <div style="font-size: 18px;text-indent: 2em;text-align:left;line-height: 30px;">
                                <p>
                                    为深入贯彻党的十八大和十八届三中、四中全会精神，进一步提高全区干部依法行政能力，加快推进法治李沧建设进程，根据《李沧区2015年干部培训计划》和全区“六五”普法工作要求，区委组织部、区人力资源和社会保障局、区司法局联合开发了《李沧区干部法律法规学习测试系统》学习软件。
                                </p>

                                <p>
                                    该学习软件题库共有2000题，主要包括党的十八大、十八届三中、四中全会议精神和党内法规、干部廉洁自律的有关规定以及公务员依法履职应当掌握的法律法规等内容，旨在通过干部学法用法，带动全民学法守法，努力营造办事依法、遇事找法、解决问题用法、化解矛盾靠法的良好法治氛围。
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- /widget-body -->
        <a class="my-button" href="CommonCtrl.goTo.do?path=index_user.jsp">进入系统</a>
    </div>
    <!-- /.col -->
</div>
</div>
<!-- /.main-container -->
<!-- basic scripts -->
<!--[if !IE]> -->
<script src="/assets/js/jquery-2.0.3.min.js"></script>
<!-- <![endif]-->
<!--[if IE]>
<script src="/assets/js/jquery-1.10.2.min.js"></script>
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
<script src="/assets/js/bootstrap.min.js"></script>
<script src="/assets/js/typeahead-bs2.min.js"></script>
<script src="/assets/js/jquery-ui-1.10.3.custom.min.js"></script>
<script src="/assets/js/jquery.ui.touch-punch.min.js"></script>
<script src="/assets/js/bootbox.min.js"></script>

<!-- ace scripts -->

<script src="/assets/js/ace-elements.min.js"></script>
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
