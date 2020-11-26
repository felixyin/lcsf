<%--
  Created by IntelliJ IDEA.
  User: HZC
  Date: 2015/6/30
  Time: 14:20
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
    <title>李沧区干部普法考试系统</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Expires" CONTENT="0">
    <meta http-equiv="Cache-Control" CONTENT="no-cache">
    <meta http-equiv="Pragma" CONTENT="no-cache">
    <link rel="bookmark" type="image/x-icon" href="${basePath}assets/system/pufa/img/logo.ico"/>
    <link rel="shortcut icon" href="${basePath}assets/system/pufa/img/logo.ico"/>
    <link rel="icon" href="${basePath}assets/system/pufa/img/logo.ico"/>

    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

    <!-- basic styles -->

    <link href="${basePath}assets/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="${basePath}assets/css/font-awesome.min.css"/>

    <!--[if IE 7]>
    <link rel="stylesheet" href="${basePath}assets/css/font-awesome-ie7.min.css"/>
    <![endif]-->

    <!-- page specific plugin styles -->

    <!-- fonts -->

    <!-- ace styles -->

    <link rel="stylesheet" href="${basePath}assets/css/ace.min.css"/>
    <link rel="stylesheet" href="${basePath}assets/css/ace-rtl.min.css"/>

    <!--[if lte IE 8]>
    <link rel="stylesheet" href="${basePath}assets/css/ace-ie.min.css"/>
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
    <script src="${basePath}assets/js/html5shiv.js"></script>
    <script src="${basePath}assets/js/respond.min.js"></script>
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
            width: 190px;
            height: 40px;
            color: white;
            text-align: center;
            line-height: 18px;
            font-size: 18px;
            background: #1687D5;
            border-radius: 5px;
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
            font-weight: 800;
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

        .my-font-green {
            font-size: 3em;
            color: green;
        }

        .my-font-grey {
            color: grey;
        }

        .my-font-red {
            font-size: 3em;
            color: red;
        }

        .my-box {
            border: 4px solid lightgray;
            border-radius: 8px;
            margin: 20px 10px 40px;
            padding: 9px 30px !important;
        }

        .my-center {
            text-align: center;;
        }
    </style>

</head>

<body class="login-layout bg" style="margin-top:9%;">
<div class="main-container">
    <div class="main-content" style="margin-top: 4%;">
        <div style="margin-top: 30px;">
            <div class="center">
                <h1>
                    <img src="${basePath}assets/system/pufa/img/biaozi.png">
                    <span class="my-title-font" style="font-size: 1em !important;">2015年李沧区干部法律法规学习系统考试成绩单</span>
                </h1>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-8 col-sm-offset-2">

                <div class="space-6"></div>

                <div class="position-relative">
                    <div id="login-box" class="login-box visible widget-box no-border my-border-radius"
                         style="background-color: #B0B0B0 !important;">
                        <div class="widget-body my-border-radius">
                            <div class="widget-main my-border-radius">
                                <div class="row">
                                    <div class="col-sm-1"></div>
                                    <div class="form-horizontal col-sm-6">
                                        <div class="form-group">
                                            <label class="col-sm-4 control-label">姓名</label>

                                            <div class="col-sm-8">
                                                <p class="form-control-static">${requestScope.user.userName}</p>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-4 control-label">身份证号</label>

                                            <div class="col-sm-8">
                                                <p class="form-control-static">${requestScope.user.idCard}</p>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-4 control-label">交卷时间</label>

                                            <div class="col-sm-8">
                                                <p class="form-control-static">${requestScope.answerEndTime}</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-5">
                                        <div class="col-sm-1"></div>
                                        <div class="col-sm-8">
                                            <div style="text-align: right;padding-top: 10px;">
                                            <span style="font-size: 7em;color: red;font-family: 微软雅黑">
                                                ${requestScope.paper.score}
                                            </span>
                                            </div>
                                        </div>
                                        <div class="col-sm-2"></div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-1"></div>
                                    <div class="col-sm-10">
                                        <div class="col-sm-4">
                                            <div class="my-box">

                                                <div class="row">
                                                <span class="my-font-grey">
                                                    试卷得分
                                                </span>
                                                </div>
                                                <div class="row my-center">
                                                    <span class="my-font-red">${requestScope.paper.score}分</span>
                                                </div>
                                                <div class="row">
                                                <span class="my-font-grey">
                                                    总分：<span>100分</span>
                                                </span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="my-box">
                                                <div class="row">
                                                    <span class="my-font-grey">作答时间</span>
                                                </div>
                                                <div class="row my-center">
                                                    <span class="my-font-green">${requestScope.answerTime}分钟</span>
                                                </div>
                                                <div class="row">
                                                <span class="my-font-grey">
                                                    总时：50分钟
                                                </span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="my-box">
                                                <div class="row">
                                                    <span class="my-font-grey">你答对了</span>
                                                </div>
                                                <div class="row my-center">
                                                    <span class="my-font-green">${requestScope.correctQuestions}道</span>
                                                </div>
                                                <div class="row">
                                                    <span class="my-font-grey">题量：共80题</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-1"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /widget-body -->
                </div>
                <!-- /login-box -->
                <!-- /.col -->
            </div>
            <!-- /.row -->
        </div>
    </div>
</div>
<!-- /.main-container -->

<!-- basic scripts -->

<!--[if !IE]> -->

<script src="${basePath}assets/js/jquery-2.0.3.min.js"></script>

<!-- <![endif]-->

<!--[if IE]>
<script src="${basePath}assets/js/jquery-1.10.2.min.js"></script>
<![endif]-->

<!--[if !IE]> -->

<script type="text/javascript">
    window.jQuery || document.write("<script src='${basePath}assets/js/jquery-2.0.3.min.js'>" + "<" + "/script>");
</script>

<!-- <![endif]-->

<!--[if IE]>
<script type="text/javascript">
    window.jQuery || document.write("<script src='${basePath}assets/js/jquery-1.10.2.min.js'>" + "<" + "/script>");
</script>
<![endif]-->

<script type="text/javascript">
    if ("ontouchend" in document) document.write("<script src='${basePath}assets/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
</script>
</body>
</html>
