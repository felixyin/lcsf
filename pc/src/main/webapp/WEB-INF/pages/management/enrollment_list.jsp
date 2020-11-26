<%--
  Created by IntelliJ IDEA.
  User: amy
  Date: 2015/5/22
  Time: 15:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--
页面头部是否居中？ 默认为居左并且显示导航菜单
页面内容区域的背景，默认为白色
--%>
<jsp:include page="../include/include_header.jsp">
  <jsp:param name="headAlign" value="center"></jsp:param>
  <jsp:param name="contentBackground" value="#d0f6e3"></jsp:param>
</jsp:include>

<style>
</style>

<div class="container">
  <br/>

  <form method="post" id="search-orm-id">
    <table class="searchTable">
      <tr>
        <td>身份证号：
        </td>
        <td>
          <input type="text" name="idCard" size="20"/>
        </td>
        <td>
          状态：
        </td>
        <td>
          <select name="status">
            <option value="">请选择</option>
            <option value="1">激活</option>
            <option value="2">锁定</option>
            <option value="3">已报名</option>
            <option value="4">闭卷考试</option>
          </select>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          姓名：
        </td>
        <td>
          <input type="text" name="userName" size="20">
        </td>
        <td>
          职级：
        </td>
        <td>
          <select name="jobGrade">
            <option value="">请选择</option>
            <option value="区级">区级</option>
            <option value="正处">正处</option>
            <option value="副处">副处</option>
            <option value="正科">正科</option>
            <option value="副科及以下">副科及以下</option>
          </select>
        </td>
        <td style="padding-top: 0px;" class="pull-left">
          <input type="hidden" name="action" value="list"/>
          <button type='submit' class="btn btn-sm btn-purple" tabIndex="15">
            <i class="icon-search icon-on-left "></i>&nbsp;查询
          </button>
          &nbsp;&nbsp;&nbsp;&nbsp;
          <button class=" btn btn-sm btn-light" type="reset" tabIndex="15">
            <i class="icon-on-left icon-refresh"></i>&nbsp;重置
          </button>
        </td>
      </tr>
    </table>
  </form>
  <br/>
  <table id="user-enrollment-table-id" style="text-align: left;width: 100%"></table>

</div>

<script type="text/javascript">
  /**
   *
   */
  $(function () {
    // 列定义
    var columns = [

      {
        "sTitle": "头像",
        "render": function (data, type, row) {
          return '<img src="ManageCtrl.writeUserPhoto.do?id=' + row.id + '" style="height:60px;"/>'
        }
      },
      {
        "sTitle": "身份证号",
        "mData": 'idCard'
      },
      {
        "sTitle": "职级",
        "mData": 'jobGrade'
      },
      {
        "sTitle": "手机号",
        "mData": 'phone'
      },
      {
        "sTitle": "姓名",
        "mData": 'userName'
      },
      {
        "sTitle": "性别",
        "render": function (data, type, row) {
          var text = '';
          switch (row.sex) {
            case 1:
              text = '男';
              break;
            case 2:
              text = '女';
              break;
            default :
              text = '';
              break
          }
          return text;
        }
      },
      {
        "sTitle": "出生日期",
        "mData": 'birthday'
      },
      {
        "sTitle": "报名时间",
        "render": function (data, type, row) {
          return row.enrollmentTime;
        }
      },
      {
        "sTitle": "账号状态",
        "render": function (data, type, row) {
          var text = '';
          switch (row.status) {
            case 1:
              text = '激活';
              break;
            case 2:
              text = '锁定';
              break;
            case 3:
              text = '已报名';
              break;
            case 4:
              text = '闭卷考试';
              break;
            default :
              text = '';
              break;
          }
          return text;
        }
      }
    ];

    // 核心在这里，会自动拥有，表单回车查询特性。
    // datatable的js和样式不再需要引入，此方法会自动判断和引入。
    // 仅仅需要指定url、列的显示样式、表格id，form id即可。
    new DefaultDataTable(Routers.pufa.report.enrollmentList, columns, '#user-enrollment-table-id', '#search-orm-id');

  });
</script>
<%@include file="../include/include_footer.jsp" %>
