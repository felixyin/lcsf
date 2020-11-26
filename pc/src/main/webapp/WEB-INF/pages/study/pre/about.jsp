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

  .my-button:hover {
    text-decoration: none;
    color: #ffffff;
  }
</style>
<div style="min-height: 320px;font-size: 20px;padding:5% 10%;line-height:40px;">
  <div style="text-align: center;font-weight: 700;">前言</div>
  <p style="text-indent: 2em;text-align:left;">
    为深入贯彻党的十八大和十八届三中、四中全会精神，进一步提高全区干部依法行政能力，加快推进法治李沧建设进程，根据《李沧区2015年干部培训计划》和全区“六五”普法工作要求，区委组织部、区人力资源和社会保障局、区司法局联合开发了《李沧区干部法律法规学习测试系统》学习软件。该学习软件题库共有2000题，主要包括党的十八大、十八届三中、四中全会议精神和党内法规、干部廉洁自律的有关规定以及公务员依法履职应当掌握的法律法规等内容，旨在通过干部学法用法，带动全民学法守法，努力营造办事依法、遇事找法、解决问题用法、化解矛盾靠法的良好法治氛围。
  </p>


  <a class="my-button" href="CommonCtrl.goTo.do?path=index_user.jsp" style="margin-top:8%;">进入系统</a>
</div>
<%@include file="../../include/include_footer.jsp" %>
