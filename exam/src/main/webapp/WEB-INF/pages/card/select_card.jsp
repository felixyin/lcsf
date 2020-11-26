<%--
  Created by IntelliJ IDEA.
  User: HZC
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
  .my-card {
    width: 40px;
    height: 40px;
  }
</style>

<div class="container">
  <br/>

  <form method="post" id="search-orm-id">
    <div style="text-align: center;">
      <span>请选择要闭卷考试的人</span>
    </div>
    <table class="searchTable">
      <tr>
        <td>身份证号：
        </td>
        <td>
          <input type="text" name="idCard" size="20"/>
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
        <td></td>
      </tr>
      <tr>
        <td>
          姓名：
        </td>
        <td>
          <input type="text" name="userName" size="20">
        </td>
        <td></td>
        <td style="padding-top: 0px;">
          <input type="hidden" name="action" value="list"/>
          <button type='submit' class="btn btn-sm btn-purple" tabIndex="15">
            <i class="icon-search icon-on-left "></i>&nbsp;查询
          </button>
          &nbsp;&nbsp;&nbsp;&nbsp;
          <button class=" btn btn-sm btn-light" type="reset" tabIndex="15">
            <i class="icon-on-left icon-refresh"></i>&nbsp;重置
          </button>
        </td>
        <td></td>
      </tr>
    </table>
  </form>
  <br/>

  <div id="user-enrollment-div-id">
    <table id="user-enrollment-table-id" style="text-align: left;width: 100%"></table>
    <div style="text-align: center;margin-top: 20px;">
      <button class="my-button blue" onclick="nextStep();"><strong style="color: white;">下一步</strong></button>
    </div>
  </div>
  <form id="list" action="CardCtrl.createCard.do" style="display: none;">
    <div style="text-align: center;">
      <span>下列为将要生成准考证的人员</span>
    </div>
    <table id="user-table-confirm-id"
           class="table table-striped table-bordered table-hover dataTable no-footer my-non-first-td">
      <thead>
      <tr role="row">
        <th class="sorting_disabled" rowspan="1" colspan="1" style="width: 97.4667px;">照片</th>
        <th class="sorting_disabled" rowspan="1" colspan="1" style="width: 206.467px;">身份证号</th>
        <th class="sorting_disabled" rowspan="1" colspan="1" style="width: 49.4667px;">职级</th>
        <th class="sorting_disabled" rowspan="1" colspan="1" style="width: 130.467px;">手机号</th>
        <th class="sorting_disabled" rowspan="1" colspan="1" style="width: 67.4667px;">姓名</th>
        <th class="sorting_disabled" rowspan="1" colspan="1" style="width: 43.4667px;">性别</th>
        <th class="sorting_disabled" rowspan="1" colspan="1" style="width: 114.467px;">出生日期</th>
        <th class="sorting_disabled" rowspan="1" colspan="1" style="width: 114.467px;">报名时间</th>
      </tr>
      </thead>
      <tbody id="user-table-confirm-tbody"></tbody>
    </table>
    <div style="text-align: center;margin-top: 20px;">
      <button type="button" class="my-button blue" onclick="prevStep();"><strong
          style="color: white;">上一步</strong></button>
      <button type="button" class="my-button blue" onclick="saveCard();"><strong style="color: white;">确定</strong>
      </button>
    </div>
  </form>

</div>
<style>
  .my-non-first-td tr td:first-child {
    display: none;
  }

  .my-non-first-td tr td:last-child {
    display: none;
  }

  /* 复写dataTable样式 */
  .dataTables_info, .dataTables_paginate {
    display: none;
  }

</style>
<script type="text/javascript">
  $(function () {
    var res = '${requestScope.result}';
    if (res == 'false') {
      alert('生成准考证错误');
    }
  });
  /**
   * 下一步
   */
  function nextStep() {
    var cardStartTime = '${requestScope.config.cardStartTimeL}';
    var cardEndTime = '${requestScope.config.cardEndTimeL}';
    var date = new Date();
    var nowTime = date.getTime();
    if (cardStartTime <= nowTime && cardEndTime >= nowTime) {
      var s = $("#user-enrollment-table-id input:checked");
      if (s.length < 1) {
        alert('没有选择必考人员');
        return;
      }
      $('#user-table-confirm-tbody').html('');
      $.each(s, function (i, n) {
        var _my = $(n).parent().parent().clone();
        var ss = $(_my).children().first().children().first().attr('data-status');
        if (ss == 4) {
          _my.children().first().children().first().remove();
        }
        _my.appendTo('#user-table-confirm-tbody');
      });
      $('#user-enrollment-div-id').hide();
      $('#search-orm-id').hide();
      $('#list').show();
    } else {
      alert('现在不在打印准考证时间');
    }
  }

  /**
   * 上一步
   */
  function prevStep() {
    $('#user-enrollment-div-id').show();
    $('#search-orm-id').show();
    $('#list').hide();
  }

  /**
   * 保存
   */
  function saveCard() {
    bootbox.confirm({
      buttons: {
        confirm: {
          label: '确定',
          style: 'background-color: #002a80;color: red;width:100px;'
        },
        cancel: {
          label: '取消',
          className: 'btn-default'
        }
      },
      message: '<h3>请确认需要生成的准考证没有错误，一旦生成准考证，将不再被允许修改。</h3>',
      callback: function (result) {
        if (result) {
          $('#list').submit();
        } else {
        }
      },
      title: "提示"
    });
  }
  /**
   * 加载列表
   */
  $(function () {
    // 列定义
    var columns = [
      {
        "sTitle": "",
        "render": function (data, type, row) {
          var status = row.status;
          if (status == 4) {
            return '<input class="my-card" name="my-card" type="checkbox" data-status="' + status + '" value="' + row.id + '" checked="checked" style="display:none;" data-user-id="' + row.id + '">'
          } else {
            return '<input class="my-card" name="my-card" type="checkbox" value="' + row.id + '" data-user-id="' + row.id + '">'
          }
        }
      },

      {
        "sTitle": "照片" +
        "",
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
    new DefaultDataTable(Routers.pufa.card.enrollmentList, columns, '#user-enrollment-table-id', '#search-orm-id', false);

  });
</script>

<%@include file="../include/include_footer.jsp" %>