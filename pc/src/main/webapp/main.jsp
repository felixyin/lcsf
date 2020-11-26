<%--
  Created by IntelliJ IDEA.
  User: yinbin
  Date: 2015/6/29
  Time: 10:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<%
  String path = request.getContextPath();
  String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<head>
  <meta charset="utf-8"/>
  <title>李沧区干部法律法规学习测试系统</title>
  <meta name="keywords" content="李沧区干部法律系统,李沧区法律法规学习系统,干部法律法规系统,青岛李沧区干部法律法规学习系统,法律法规学习系统"/>
  <meta name="description"
        content="该学习软件题库共有2000题，主要包括党的十八大、十八届三中、 四中全会议精神和党内法规、干部廉洁自律的有关规定以及公务员依法履职应当掌握的法律法规等内容，旨在通过干部学法用法，带动全民学法守法，努力营造办事依法、遇事找法、解决问题用法、化解矛盾靠法的 良好法治氛围。"/>
  <meta name="application-name" content="李沧区干部法律法规学习测试系统"/>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <link rel="bookmark" type="image/x-icon" href="${basePath}assets/system/pufa/img/logo.ico"/>
  <link rel="shortcut icon" href="${basePath}assets/system/pufa/img/logo.ico"/>
  <link rel="icon" href="${basePath}assets/system/pufa/img/logo.ico"/>

  <!--
    判断IE浏览器版本小于IE8，则直接提示更新。
  -->
  <!--[if lte IE 7]>
  <script>window.location.href = 'http://cdn.dmeng.net/upgrade-your-browser.html?referrer=' + location.href;</script>
  <![endif]-->
</head>
<body style="margin: 0;padding: 0; height: 830px;overflow-y: hidden;">
<iframe src="index.jsp" frameborder="0" scrolling="auto" width="100%" height="100%"
        style="visibility: visible;z-index: 1;"></iframe>
<script type="text/javascript">
  function getViewSizeWithScrollbar() {//包含滚动条

    function getScrollWith() {

      var wrap = setAttributes(document.createElement('div'), {
        style: {
          width: '200px',
          height: '200px',
          overflow: 'auto',
          position: 'absolute',
          visibility: 'hidden'
        }
      });

      var inner = setAttributes(document.createElement('div'), {
        style: {
          width: '100px',
          height: '2000px'
        }
      });

      document.body.appendChild(wrap);
      wrap.appendChild(inner);
      var w = wrap.offsetWidth - wrap.clientWidth;
      document.body.removeChild(wrap);
      wrap = null;
      inner = null;

      return w;
    }

    function setAttributes(elem, opts) {
      for (var key in opts) {
        if (typeof opts[key] == 'string') {
          elem[key] = opts[key];
        } else {
          if (!elem[key]) {
            elem[key] = {};
          }
          setAttributes(elem[key], opts[key]);
        }
      }
      return elem;
    }

    if (window.innerWidth) {
      return {
        width: window.innerWidth,
        height: window.innerHeight
      }
    } else if (document.documentElement.offsetWidth == document.documentElement.clientWidth) {
      return {
        width: document.documentElement.offsetWidth,
        height: document.documentElement.offsetHeight
      }
    } else {
      return {
        width: document.documentElement.clientWidth + getScrollWith(),
        height: document.documentElement.clientHeight + getScrollWith()
      }
    }

  }

  /**
   * 计算页面高度，设置为可视区域高度
   */
  function initSize() {
    var clientWin = getViewSizeWithScrollbar();

    try {
      document.body.style.setProperty('height', clientWin.height + 'px');
    } catch (e) {
      window.location.href = 'index.jsp'; //ie8 还是显示地址栏
    }
  }

  initSize();

  window.onresize = function () {
    initSize();
  };

</script>
</body>
</html>
