<%--
  Created by IntelliJ IDEA.
  User: yinbin
  Date: 2015/3/27
  Time: 15:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../common_jstl.jsp" %>
<form id="my-search">
  <table class="searchTable">
    <tr>
      <td><span>手机号：</span></td>
      <td><input name="phone" type="text"/></td>
      <td><span>身份证号：</span></td>
      <td>
        <input name="idCard" type="text">
      </td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td><span>姓名：</span></td>
      <td><input name="serName" type="text"/></td>
      <td><span>单位：</span></td>
      <td><input name="companyName" type="text"/></td>
      <td style="min-width:250px">
        <%--<td>--%>
        <button type="submit" class="btn btn-purple btn-sm" id="searchs"
                name="searchs"><i class="icon-search icon-on-left bigger-110"></i>&nbsp;查询
        </button>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <button type="reset" class="btn btn-sm btn-light" id="cleanSearch"
                name="cleanSearch">
          <i class="icon-on-left  icon-refresh  bigger-110"></i>&nbsp;重置
        </button>
      </td>
      <td></td>
    </tr>
  </table>
</form>

<table id="my-table">
</table>

<script type="text/javascript">
  var searchUrl = Routers.pufa.user.getUserManageList;

  var dataTable = new DefaultDataTable(searchUrl, [
    {
      "sTitle": "编号",
      "mData": 'id',
      "bVisible": false
    },
    {
      "sTitle": "手机号",
      "mData": 'phone'
    },
    {
      "sTitle": "身份证号",
      "mData": 'idCard'
    },
    {
      "sTitle": "姓名",
      "mData": 'userName'
    },
    {
      "sTitle": "年龄",
      "render": function (data, type, row) {
        return !row.age ? '无' : row.age;
      }
    },
    {
      "sTitle": "单位",
      "mData": 'companyName'
    },
    {
      "sTitle": "职级",
      "mData": 'jobGrade'
    },
    {
      "sTitle": "状态",
      "render": function (data, type, row) {
        var status = row.status;
        var str = '激活';
        switch (status) {
          case 2:
            str = '锁定';
            break;
          case 3:
            str = '已报名';
            break;
          case 4:
            str = '闭卷考试';
            break;
        }
        return str;
      }
    }
  ], '#my-table', '#my-search');
</script>