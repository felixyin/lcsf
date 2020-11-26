<%--
  Created by IntelliJ IDEA.
  User: yinbin
  Date: 2015/3/27
  Time: 15:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../common_jstl.jsp" %>
<style type="text/css">
</style>

<div class="alert alert-info">
  <i class="icon-hand-right"></i>
  说明：&nbsp;&nbsp;这里仅仅有每个登录账号的使用时长统计，其他身份证等信息，需要业务方给予用户数据。
  <%--<br>--%>
  <%--模糊查询和其他管理模块，我会一个一个的做。。--%>
  <button class="close" data-dismiss="alert">
    <i class="icon-remove"></i>
  </button>
</div>

<form id="my-search">
  <table class="searchTable">
    <tr>
      <td><span>手机号：</span></td>
      <td><input name="phone" type="text"/></td>
      <td><span>是否在线：</span></td>
      <td>
        <select name="online">
          <option value="">请选择</option>
          <option value="1">在线</option>
          <option value="2">离线</option>
        </select>
      </td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td><span>可用时长（起）：</span></td>
      <td><input name="availabletimeStart" type="number"/></td>
      <td><span>可用时长（止）：</span></td>
      <td><input name="availabletimeEnd" type="number"/></td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td><span>已用时长（起）：</span></td>
      <td><input name="remainTimeStart" type="number"/></td>
      <td><span>已用时长（止）：</span></td>
      <td><input name="remainTimeEnd" type="number"/></td>
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

<div id="dialog-message" class="hide">
  <p>
    请设置用户app的可用时长,单位为分钟。
  </p>

  <div class="hr hr-12 hr-double"></div>
  <p>
    <input type="number" name="learntime" maxlength="1000000000" min="0">
  </p>
</div>
<!-- #dialog-message -->


<script type="text/javascript">
  var searchUrl = Routers.pufa.user.searchList;

  var dataTable = new DefaultDataTable(searchUrl, [
    {
      "sTitle": "编号",
      "mData": 'id',
      "bVisible": false
    },
    {
      "sTitle": "用户名",
      "mData": 'phone'
    },
    {
      "sTitle": "可用时长(分钟)",
      "mData": 'availableTime'
    },
    {
      "sTitle": "已使用时长(分钟)",
      "mData": 'remainTime'
    },
    {
      "sTitle": "注册时间",
      "mData": 'createTime'
    },
    {
      "sTitle": "是否在线",
      "mData": 'online',
      "render": function (data, type, row) {
        var online = row.online;
        return online != 1 ? "离线" : "在线";
      }
    },
    {
      "sTitle": "是否激活",
      "mData": "status",
      "render": function (data, type, row) {
        var online = row.status;
        return online == 1 ? "激活" : "锁定";
      }
    },
    {
      "sTitle": "数据加密KEY",
      "mData": "key",
      "bVisible": false
    },
    {
      "sTitle": "可以查看收费内容?",
      "render": function (data, type, row) {
        if (row.availableTime - row.remainTime > 0) {
          return "可以";
        } else {
          return "不可";
        }
      },
      "bVisible": false
    },
    {
      "sTitle": "设置可用时长",
      "render": function (data, type, row) {
        var id = row.id;
        var availableTime = row.availableTime;
        return '<button class="btn btn-primary my-caozuo" onclick="setTimeHandler(' + id + ',' + availableTime + ');">设置可用时长</button>';
      }
    }
  ], '#my-table', '#my-search');

  //override dialog's title function to allow for HTML titles
  //    $.widget("ui.dialog", $.extend({}, $.ui.dialog.prototype, {
  //        _title: function (title) {
  //            var $title = this.options.title || '&nbsp;'
  //            if (("title_html" in this.options) && this.options.title_html == true)
  //                title.html($title);
  //            else title.text($title);
  //        }
  //    }));

  function ajaxUpdateUserTime(id, oldAvailableTime) {
    var newAvailableTime = $('#dialog-message').find('input[name=learntime]').val();
    if (oldAvailableTime != newAvailableTime) {
      $.post(Routers.topEnglish.empower.updateAvailableTime, {time: newAvailableTime, id: id}, function (data) {
        if (data && data.success) {
          $('#my-table').dataTable().fnReloadAjax(searchUrl);
          alert('更新成功');
        } else {
          alert('更新失败')
        }
      });
    }
  }

  function setTimeHandler(id, availableTime) {
    $('#dialog-message').find('input[name=learntime]').val(availableTime);
//        $(e).preventDefault();
    var dialog = $("#dialog-message").removeClass('hide').dialog({
      modal: true,
//            title: "<div class='widget-header widget-header-small'><h4 class='smaller'><i class='icon-ok'></i>设置使用时长</h4></div>",
      title_html: true,
      buttons: [
        {
          text: "取消",
          "class": "btn btn-xs",
          click: function () {
            $(this).dialog("close");
          }
        },
        {
          text: "确定",
          "class": "btn btn-primary btn-xs",
          click: function () {
            ajaxUpdateUserTime(id, availableTime);
            $(this).dialog("close");
          }
        }
      ]
    });

    /**
     dialog.data( "uiDialog" )._title = function(title) {
						title.html( this.options.title );
					};
     **/
  }
  //    $("#my-table").delegate('.my-caozuo', 'click', function (e) {
  //
  //    });


  /*
   ajax提交form返回结果
   var __ret = ajaxFormStep($, form1Serialize, ajaxUrl);
   var succ = __ret.succ;成功、失败（true/false）
   var mess = __ret.mess;成功、失败信息
   */
  function ajaxFormStep($, formData, ajaxUrl) {
    var succ = false;
    var mess = '';
    $.ajax({
      url: ajaxUrl,
      method: "post",
      async: false,
      data: formData,
      success: function (data) {
        succ = data.success;
        mess = data.message;
      },
      error: function () {
        mess = '程序错误';
      }
    });
    return {succ: succ, mess: mess};
  }

</script>