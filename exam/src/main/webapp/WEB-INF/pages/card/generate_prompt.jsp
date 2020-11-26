<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../include/include_header_second.jsp"%>
<style type="text/css">
  /*loading加载遮罩层css*/
  #black_overlay
  {
    position:absolute;
    z-index:-1;
    width: 100%;
    height: 100%;
    top: 0;
    left: 0;
    filter: alpha(opacity=60);
    opacity: 0.6;
    overflow: hidden;
    position:fixed;
    background-color: #000;
  }
  .my-tishikuang{
    width: 500px;
    height:265px;
    border:10px solid #1687d5;
    border-radius: 1em;
    margin: 0 auto;
    margin-top:15%;
    background: #ffffff;
    z-index:1!important;
    opacity: 1!important;
    -webkit-box-shadow: 4px 4px 10px rgba(255,255,255,0.3);
    -moz-box-shadow: 4px 4px 10px rgba(255,255,255,0.3);
  }
  p{
    font-size:23px;
    color:#1687d5;
    font-family: Arial, Helvetica, sans-serif;
    padding:20px 30px;
    font-weight:600;
  }
 </style>
<body>
<div id="black_overlay"></div>
<div class="my-tishikuang">
  <p>提示信息</p>
  <i class=" icon-exclamation-sign bigger-280" style="color:red;margin-left:50px;"></i>
  <span style="font-size: 20px;margin-left:20px;line-height: 40px;">准考证信息生成以后将不能修改，<br/></span>
  <span style="font-size: 20px;margin-left:105px;line-height: 0px;">您是否确定提交！</span>
  <a class="my-button blue" style="color:white!important;text-align: center;width:120px;margin-top:30px;margin-left:290px;"
     href="CommonCtrl.goTo.do?path=/WEB-INF/pages/card/zhunkaozheng.jsp">确&nbsp;&nbsp;定</a>
</div></body>
</html>