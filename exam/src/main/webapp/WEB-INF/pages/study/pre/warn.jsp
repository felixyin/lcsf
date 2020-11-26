<%--
  Created by IntelliJ IDEA.
  User: LiuJY
  Date: 2015/5/6
  Time: 15:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../../include/include_header.jsp">
  <jsp:param name="headAlign" value="center"></jsp:param>
  <jsp:param name="contentBackground" value="#d0f6e3"></jsp:param>
</jsp:include>
<style>
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
    width: 260px;
    border: 3px solid #f0fdf7;
    background: #12a5eb;
    float: right;
    line-height: 35px;
    margin-top: 30px;
    color: white;
    font-family: "微软雅黑";
    letter-spacing: 2px;
    font-size: 18px;
    font-weight: 400;
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
    width: 250px;
    border: 3px solid #ffffff;
    background: #12a5eb;
    float: right;
    line-height: 35px;
    color: white;
    font-family: "微软雅黑";
    letter-spacing: 0.1em;
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
<div style="border-left: 1px solid #cccccc;border-right:1px solid #cccccc;">
  <div class="page-content" style="background:#d0f6e3;min-height:560px;">
    <div class="row">
      <div class="col-xs-1"></div>
      <div class="col-xs-10">
        <div style="font-size: 18px;text-indent: 2em;line-height: 32px;margin-top:70px;text-align: left">
          <h1 style="text-align:center;margin-bottom:40px;font-weight: bold">
            <%--<img src="assets/system/pufa/img/xingxing.png" style="margin-right:30px;width:60px;"/>--%>
            <%--border-bottom:3px double #000;--%>
            <span
                style="padding-bottom:7px;">注&nbsp;&nbsp;意&nbsp;&nbsp;事&nbsp;&nbsp;项</span>
          </h1>

          <p>
            本期<span style="color:red;">《李沧区提高干部依法行政能力网络研修班》</span>的网上学习时间为<span style="color:red;">20小时</span>。通过网页版与手机版学习同步累计学习时间。每做一题系统会自动计时30秒，<span
              style="color:red;">做题时间低于5秒不计时</span>，请务必于9月30日前完成20小时的学习任务。</p>

          <p>
            在学习过程中，做错的题目会自动加入错题题库，通过错题题库查看错题；想反复学习的题目可进行收藏，通过收藏题库查看收藏的题目。通过网页版与手机版学习错题题库和收藏题库中的题目，也会同步累计学习时间。</p>

          <p>
            手机版进行学习时，需要联网才能与网页版进行数据同步。
          </p>
        </div>
        <a class="my-button" href="CommonCtrl.goTo.do?path=/WEB-INF/pages/study/pre/menu.jsp">我已阅读，开始学习
        </a>
      </div>
    </div>
    <div class="col-xs-1"></div>
  </div>
</div>
<%@include file="../../include/include_footer.jsp" %>
