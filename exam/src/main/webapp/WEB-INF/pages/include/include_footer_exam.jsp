<%--
  Created by IntelliJ IDEA.
  User: yinbin
  Date: 2015/5/2
  Time: 10:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
</div>
<!-- /.main-content -->

</div>
<!-- /.main-container-inner -->
</div>
<!-- /.main-container -->


<style type="text/css">
  .gradient {
    background: -moz-linear-gradient(top, #438eb9 0%, #ffffff 100%);
    background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #438eb9), color-stop(100%, #ffffff));
    background: -webkit-linear-gradient(top, #438eb9 0%, #ffffff 100%);
    background: -o-linear-gradient(top, #438eb9 0%, #ffffff 100%);
    background: -ms-linear-gradient(top, #438eb9 0%, #ffffff 100%);
    background: linear-gradient(to bottom, #438eb9 0%, #ffffff 100%);
  }

  .footer {
    float: left;
    width: 100%;
    height: 90px;
    background-color: #1687D5;
    color: #fff;
    min-height: 40px;
    text-align: center;
    padding: 20px;
    font-size: 14px;
    line-height: 30px;
  }
</style>
<%--<footer class="gradient" style="height: 250px;">预留页脚区域</footer>--%>
<div class="footer" style="background-color: #1687D5!important;color: #ffffff;font-weight: bold;">
  李沧区委组织部&nbsp;&nbsp;&nbsp;&nbsp;李沧区人力资源和社会保障局&nbsp;&nbsp;&nbsp;&nbsp;李沧区司法局<br>
  技术支持：宇威科技发展（青岛）有限公司&nbsp;&nbsp;&nbsp;&nbsp;(Copyright@2014—2015 All rights reserved.)
</div>
</div>

</div>

<script type="text/html" id="template-test-pre-msg-id">
  <pre style="font-size:18px;width: 100%;">
1、考试时间为50分钟，如果到时间未交卷，系统会自动收卷。

2、系统随机抽题，共80题。满分100分，及格线为80分。

3、题型及分值：
   判断30题，每题1分，共30分。
   单选30题，每题1分，共30分。
   多选20题，每题2分，共40分。</pre>
</script>
<input id="gritter-light" checked="" type="checkbox" class="ace ace-switch ace-switch-1 my-ace-switch-1"
       style="display: none;"/>
<script type="text/javascript">
  $(function () {
    initTime();
    eventMenuChange()
    lightMenuItem();
  });

  /**
   * 独立负责 高亮菜单
   */
  function lightMenuItem() {
//        return;
    var flag = window.location.search.substring(window.location.search.lastIndexOf('/') + 1, window.location.search.lastIndexOf('.'));
    $('#yd-menu-id').children().children().removeClass('my-menu-item-active'); // 去掉其他所有菜单的高亮
    $('#my-' + flag + '-menu').addClass('my-menu-item-active'); // 高亮菜单
    if ('pre-test' == flag) { // 如果是测试页面之前的页面
      $('#my-test-menu').addClass('my-menu-item-active');
    }
    if ('panduanti' == flag || 'danxuanti' == flag || 'duoxuanti' == flag || 'all' == flag || 'study-main' == flag) {
      $('#my-all-study-menu').addClass('my-menu-item-active');
    }
    if ('test' != flag) { // 非测试，允许直接点击菜单跳转到其他页面，否则，不被允许的标志
      window.localStorage.setItem('__canJumpOtherCard', 'true');
    } else {
      window.localStorage.setItem('__canJumpOtherCard', 'false');
    }

    // 下拉菜单鼠标放上去后自动显示
    var allMenuGroup = $('#my-all-study-menu').children();
    allMenuGroup.eq(1).hover(function () {
      allMenuGroup.eq(2).show();
    });
    $(document.body).click(function () {
      allMenuGroup.eq(2).hide();
    });
  }

  /**
   * 点击菜单的处理函数
   */
  function eventMenuChange() {
    var contentDoms = $('#main-content-id').children();

    $('.my-menu > ul').on('click', 'li', function () {
      var ___label = $(this).attr('data-is-modal');
      if (___label == 'logout') { // 点击退出 的处理
        var logoutHref = $(this).attr('data-href');
        bootbox.confirm({
          buttons: {
            confirm: {
              label: '退出',
              style: 'background-color: #002a80;color: red;width:100px;'
            },
            cancel: {
              label: '取消',
              className: 'btn-default'
            }
          },
          message: '<h3>您确定要退出本系统吗？</h3>',
          callback: function (result) {
            if (result) {
              window.location.href = logoutHref;
            } else {
            }
          },
          title: "提示"
        });
        return;
      } else if (___label == "study-bank") {
        return;
      }

      window.localStorage.setItem('__zongtiku', 'false');
      var self = this;
      if ($(this).hasClass('my-menu-item-active'))return; //点击的是当前标签，则不做任何反应

      var __canJumpOtherCard = window.localStorage.getItem('__canJumpOtherCard');
//            if (__canJumpOtherCard == 'false') {// 如果没有退出测试则不能跳出
//                $.gritter.add({
//                    title: '',
//                    text: '<h2 style="text-align: center;">考试过程中不能退出，请先交卷。</h2>',
//                    class_name: 'gritter-info gritter-center' + (!$('#gritter-light').get(0).checked ? ' gritter-light' : '')
//                });
//
//                setTimeout(function () {
//                    $.gritter.removeAll();
//                }, 3000);
//                return;
//            }

      var menuItem = $(this);
      var isTestModel = menuItem.attr('data-is-modal');
      if ('ztk' == isTestModel) {
        window.localStorage.setItem('__zongtiku', 'true');
      }

      var dataHref = $(self).children('a').attr('data-href');
      window.location = '${basePath}' + dataHref;
    });
  }

  /**
   * 初始化时间
   */
  function initTime() {
    $(".knob").knob();
  }

  /**
   * 自动更新时间
   */
  function updateTestTime() {
    var ipt = $('#sheng-yu-time-ipt-id');
    window._myTestIter = setInterval(function () {
      if (!window._fen_zhong) {
        window._fen_zhong = 50;
      }
      window._fen_zhong = window._fen_zhong - 1;
      if (window._fen_zhong == 10) {
        ipt.css('color', 'yellow');
      }
      if (window._fen_zhong == 5) {
        ipt.css('color', 'red');
      }
      ipt.val(window._fen_zhong).trigger('change');
      if (window._fen_zhong == 0) { //自动提交试卷
        clearInterval(window._myTestIter);
        $('#submit-exam-btn-id').trigger('click');
      }
    }, 1000 * 50);
  }

</script>

<!-- 下面代码是新手引导的代码 -->
<ol id="joyRideTipContent">
  <li data-button="下一步" data-options="tipLocation:center;tipAnimation:fade">
    <p>这您第一次登陆本系统，接下来将会引导您学会使用本系统</p>
  </li>
  <%--<li data-id="yd-menu-id" data-button="下一步" data-options="tipLocation:bottom;tipAnimation:fade">--%>
  <%--<p>这里是菜单栏</p>--%>
  <%--</li>--%>
  <li data-class="my-nav-tabs" data-button="下一步" data-options="tipLocation:bottom;tipAnimation:fade">
    <p>这里可以切换题的类型</p>
  </li>
  <li data-id="xuexi-card-1" data-button="下一步" data-options="tipLocation:bottom;tipAnimation:fade">

    <p>点击这里可以快速在答题卡区显示本题内容</p>
  </li>
  <li data-class="my-btn-xuexi-fenye-next" data-button="下一步" data-options="tipLocation:bottom;tipAnimation:fade">

    <p>点击这里可以查看更多的题号</p>
  </li>
  <li data-class="my-question" data-button="下一步" data-options="tipLocation:bottom;tipAnimation:fade">

    <p>点击这里可以自动高亮“答题卡”区相应的题号</p>
  </li>
  <li data-class="control-group" data-button="下一步" data-options="tipLocation:bottom;tipAnimation:fade">

    <p>做题时，请点击您想要选择的选项</p>
  </li>
  <li data-class="my-btn-xuexi-daan" data-button="下一步" data-options="tipLocation:top;tipAnimation:fade">

    <p>然后，点击“答案”按钮，才会判断您做的对错</p>
  </li>
  <li data-class="my-btn-xuexi-question-next" data-button="下一步" data-options="tipLocation:right;tipAnimation:fade">

    <p>可以直接点击这里，快速跳转到下一题</p>
  </li>
  <li data-id="xuexi-question-time-1" data-button="下一步" data-options="tipLocation:right;tipAnimation:fade">

    <p>这里显示的是您已做过得次数和做错的次数</p>
  </li>
  <li data-id="yd-sc-id" data-button="下一步" data-options="tipLocation:right;tipAnimation:fade">

    <p>这里可以收藏题目</p>
  </li>
  <li data-id="yd-guanji-id" data-button="结束" data-options="tipLocation:top;tipAnimation:fade">

    <p>退出系统，点击这里</p>
  </li>
</ol>
<script>
  $(window).load(function () {
    var _isAlreadyShow = window.localStorage.getItem('_isAlreadyShow');
    if (_isAlreadyShow == 'true') return;
    window.localStorage.setItem('_isAlreadyShow', 'true');
    return;
    $('#joyRideTipContent').joyride({
      autoStart: true,
      modal: true,
      expose: true
    });
  });
</script>
<script>
  // 设置jQuery Ajax全局的参数
  $.ajaxSetup({
    type: "POST",
    error: function (jqXHR, textStatus, errorThrown) {
      switch (jqXHR.status) {
        case(500):
//                    alert("服务器系统内部错误，点击确定后重新加载本页面");
          bootbox.confirm({
            buttons: {
              confirm: {
                label: '确认',
                style: 'background-color: #002a80;color: red;width:100px;'
              },
              cancel: {
                label: '取消',
                className: 'btn-default'
              }
            },
            message: '服务器系统内部错误，点击确定后重新加载本页面',
            callback: function (result) {
              if (result) {
                window.location.reload();
              } else {
              }
            },
            title: "提示"
          });
          break;
        case(401):
//                    alert("您长时间未操作了，点击确定后重新登录");
          bootbox.confirm({
            buttons: {
              confirm: {
                label: '确认',
                style: 'background-color: #002a80;color: red;width:100px;'
              },
              cancel: {
                label: '取消',
                className: 'btn-default'
              }
            },
            message: '您长时间未操作了，点击确定后重新登录',
            callback: function (result) {
              if (result) {
                window.location.href = '${basePath}UserCtrl.logoutForLp.do';
              } else {
              }
            },
            title: "提示"
          });
          break;
        default:
          alert("未知错误");
      }
    },
    success: function (data) {
//            alert("操作成功");
    }
  });
</script>

<script language="javascript">
  //禁止用F5键
  document.onkeydown = function () {
    if (event.keyCode == 116) {
      event.keyCode = 0;
      event.cancelBubble = true;
      return false;
    }
  }
  //禁止右键弹出菜单
  document.oncontextmenu = function () {
    return false;
  }

</script>
<script language="Javascript">
  //屏蔽鼠标右键、Ctrl+N、Shift+F10、F11、F5刷新、退格键
  document.oncontextmenu = function () {
    event.returnValue = false;
  }//屏蔽鼠标右键
  window.onhelp = function () {
    return false
  } //屏蔽F1帮助
  document.onkeydown = function () {
    if ((window.event.altKey) &&
        ((window.event.keyCode == 37) || //屏蔽 Alt+ 方向键 ←
        (window.event.keyCode == 39))) //屏蔽 Alt+ 方向键 →
    {
      alert("不准你使用ALT+方向键前进或后退网页！");
      event.returnValue = false;
    }
    /* 注：这还不是真正地屏蔽 Alt+ 方向键，
     因为 Alt+ 方向键弹出警告框时，按住 Alt 键不放，
     用鼠标点掉警告框，这种屏蔽方法就失效了。以后若
     有哪位高手有真正屏蔽 Alt 键的方法，请告知。*/
    if ((event.keyCode == 8) || //屏蔽退格删除键
        (event.keyCode == 116) || //屏蔽 F5 刷新键
        (event.ctrlKey && event.keyCode == 82)) { //Ctrl + R
      event.keyCode = 0;
      event.returnValue = false;
    }
    if (event.keyCode == 122) {
      event.keyCode = 0;
      event.returnValue = false;
    } //屏蔽F11
    if (event.ctrlKey && event.keyCode == 78) event.returnValue = false; //屏蔽 Ctrl+n
    if (event.shiftKey && event.keyCode == 121)event.returnValue = false; //屏蔽 shift+F10
    if (window.event.srcElement.tagName == "A" && window.event.shiftKey)
      window.event.returnValue = false; //屏蔽 shift 加鼠标左键新开一网页
    if ((window.event.altKey) && (window.event.keyCode == 115)) //屏蔽Alt+F4
    {
      window.showModelessDialog("about:blank", "", "dialogWidth:1px;dialogheight:1px");
      return false;
    }
  };


  $(function () {
    /**
     * 禁用文本选中
     */
    $(window).bind('selectstart', function (evt) {
      evt.stopPropagation();
      evt.preventDefault();
      return false;
    });

    /**
     *
     */
    function reSizeFullPage() {
      var height = $(window).innerHeight();
      var footerHeight = 90;
      if (height < 660) { //小屏幕隐藏页脚
        $('.widget-body').css('min-height', (height - 320));
        $('.footer').hide();
      } else { // 大屏幕显示页脚
        $('.widget-body').css('min-height', (height - 160 - footerHeight));
        $('.footer').show();
      }
    }

    reSizeFullPage();
    $(window).resize(function (evt) {
      reSizeFullPage();
    });

  });


</script>
</body>
</html>

