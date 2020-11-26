<%--
  Created by IntelliJ IDEA.
  User: yinbin
  Date: 2015/3/28
  Time: 10:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="sidebar" id="sidebar">
  <script type="text/javascript">
    try {
      ace.settings.check('sidebar', 'fixed')
    } catch (e) {
    }
  </script>

  <div class="sidebar-shortcuts" id="sidebar-shortcuts" style="display: none;">
    <div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
      <button class="btn btn-success">
        <i class="icon-signal"></i>
      </button>

      <button class="btn btn-info">
        <i class="icon-pencil"></i>
      </button>

      <button class="btn btn-warning">
        <i class="icon-group"></i>
      </button>

      <button class="btn btn-danger">
        <i class="icon-cogs"></i>
      </button>
    </div>

    <div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini" style="display: none;">
      <span class="btn btn-success"></span>

      <span class="btn btn-info"></span>

      <span class="btn btn-warning"></span>

      <span class="btn btn-danger"></span>
    </div>
  </div>
  <!-- #sidebar-shortcuts -->

  <ul class="nav nav-list">
    <%--   ####################################################################################################  --%>
    <li class="active">
      <a href="javascript:void(0);"
         data-href="${basePath}CommonCtrl.goTo.do?path=/WEB-INF/pages/about.jsp">
        <i class="icon-dashboard"></i>
        <span class="menu-text">首页</span>
      </a>
    </li>

    <li style="display: none;">
      <a href="javascript:void(0);" data-href="#" class="dropdown-toggle">
        <i class="icon-desktop"></i>
        <span class="menu-text">青岛司法局干部普法APP</span>

        <b class="arrow icon-angle-down"></b>
      </a>

      <ul class="submenu">
        <li>
          <a href="javascript:void(0);"
             data-href="${basePath}manage/CommonCtrl.goTo.do?path=/WEB-INF/pages/pufa/user_list.jsp">
            <i class="icon-double-angle-right"></i>
            用户管理列表
          </a>
        </li>
      </ul>
    </li>
    <li>
      <a href="javascript:void(0);" data-href="#" class="dropdown-toggle">
        <i class="icon-desktop"></i>
        <span class="menu-text">司法局干部普法</span>

        <b class="arrow icon-angle-down"></b>
      </a>

      <ul class="submenu">
        <li>
          <a href="javascript:void(0);"
             data-href="${basePath}CommonCtrl.goTo.do?path=/WEB-INF/pages/management/menu_report.jsp">
            <i class="icon-double-angle-right"></i>
            报表管理列表
          </a>
        </li>
        <li>
          <a href="javascript:void(0);"
             data-href="${basePath}CommonCtrl.goTo.do?path=/WEB-INF/pages/management/ManageSystem/company_main.jsp">
            <i class="icon-double-angle-right"></i>
            部门管理列表
          </a>
        </li>
        <li>
          <a href="javascript:void(0);"
             data-href="${basePath}CommonCtrl.goTo.do?path=/WEB-INF/pages/management/ManageSystem/user_main.jsp">
            <i class="icon-double-angle-right"></i>
            用户管理列表
          </a>
        </li>
        <li>
          <a href="javascript:void(0);"
             data-href="${basePath}CommonCtrl.goTo.do?path=/WEB-INF/pages/management/ManageSystem/questions_main.jsp">
            <i class="icon-double-angle-right"></i>
            题目管理列表
          </a>
        </li>
        <li>
          <a href="javascript:void(0);"
             data-href="${basePath}CommonCtrl.goTo.do?path=/WEB-INF/pages/management/ManageSystem/resource_main.jsp">
            <i class="icon-double-angle-right"></i>
            考场管理列表
          </a>
        </li>
        <li>
          <a href="javascript:void(0);"
             data-href="${basePath}CommonCtrl.goTo.do?path=/WEB-INF/pages/management/ManageSystem/config_main.jsp">
            <i class="icon-double-angle-right"></i>
            考试管理列表
          </a>
        </li>
      </ul>
    </li>
    <li style="display: none;">
      <a href="javascript:void(0);" data-href="#" class="dropdown-toggle">
        <i class="icon-desktop"></i>
        <span class="menu-text"> 托普统考英语管理 </span>

        <b class="arrow icon-angle-down"></b>
      </a>

      <ul class="submenu">
        <li>
          <a href="javascript:void(0);"
             data-href="${basePath}CommonCtrl.goTo.do?path=/WEB-INF/pages/english/empower.jsp">
            <i class="icon-double-angle-right"></i>
            使用授权管理
          </a>
        </li>
      </ul>
    </li>

    <li style="display: none;">
      <a href="javascript:void(0);" data-href="#" class="dropdown-toggle">
        <i class="icon-desktop"></i>
        <span class="menu-text"> 托普掌上课堂管理 </span>

        <b class="arrow icon-angle-down"></b>
      </a>

      <ul class="submenu">
        <li>
          <a href="javascript:void(0);"
             data-href="${basePath}CommonCtrl.goTo.do?path=/WEB-INF/pages/accounting/enroll_manage.jsp">
            <i class="icon-double-angle-right"></i>
            会计考试报名管理
          </a>
        </li>
      </ul>
    </li>

    <li style="display: none;">
      <a href="javascript:void(0);" data-href="#" class="dropdown-toggle">
        <i class="icon-list"></i>
        <span class="menu-text"> 托普助学报名系统</span>

        <b class="arrow icon-angle-down"></b>
      </a>

      <ul class="submenu">
        <li>
          <a href="javascript:void(0);"
             data-href="${basePath}CommonCtrl.goTo.do?path=/WEB-INF/pages/baoming/user_manage.jsp">
            <i class="icon-double-angle-right"></i>
            报名人员管理
          </a>
        </li>
        <li>
          <a href="javascript:void(0);"
             data-href="${basePath}CommonCtrl.goTo.do?path=/WEB-INF/pages/baoming/integral_manage.jsp">
            <i class="icon-double-angle-right"></i>
            积分分配管理
          </a>
        </li>
      </ul>
    </li>
  </ul>
  <!-- /.nav-list -->

  <div class="sidebar-collapse" id="sidebar-collapse">
    <i class="icon-double-angle-left" data-icon1="icon-double-angle-left"
       data-icon2="icon-double-angle-right"></i>
  </div>

  <script type="text/javascript">
    try {
      ace.settings.check('sidebar', 'collapsed')
    } catch (e) {
    }
  </script>

  <script type="text/javascript">


    $.ajaxSetup({
      cache: false //关闭AJAX相应的缓存
    });

    $(function () {
      /**
       * 子菜单项点击事件
       */
      function eventMenuItemClick() {
        $('.nav-list').delegate('li a', 'click', function (evt) {
//                    点击后的动作
          var dataHref = $(this).attr('data-href');
          if (dataHref == '#')return;
          $('#main-content-id').empty().unbind('load').load(dataHref, function (response, status, xhr) {
            if (status == "error") {
              var msg = "Sorry but there was an error: ";
              $("#error").html(msg + xhr.status + " " + xhr.statusText);
            }
          });
//                    $('#main-content-id').unload(function () {
//                        $(this).empty();
//                    });

//                    点击后的效果
          $('.nav-list').find('li').removeClass('active');
          $(this).parents().filter('.open').addClass('active');
          $(this).parent().addClass('active');

//                    点击后修改导航
          var parentMenuName = $(this).parents('.open').find('.menu-text').text();
          var itemMenuName = $(this).text();
          $('#navigation-id').find('.active').remove().end().append(
                  '<li class="active">' + parentMenuName + '</li>' +
                  '<li class="active">' + itemMenuName + '</li>');
        });
      }

      eventMenuItemClick();

    });

    function menu_click(dataHref) {
      $('#main-content-id').empty().unbind('load').load(dataHref, function (response, status, xhr) {
        if (status == "error") {
          var msg = "Sorry but there was an error: ";
          $("#error").html(msg + xhr.status + " " + xhr.statusText);
        }
      });
    }
  </script>
</div>