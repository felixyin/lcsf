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
<div class="container">
  <br/>

  <form method="post" id="search-form-id">
  </form>
  <br/>

  <div class="row" style="margin-bottom: 20px;">
    <div class="col-xs-6">
      <div style="color: #285e8e;font-size: 1.4em;font-weight: 600">
        考场管理
      </div>
    </div>
  </div>
  <table id="example" style="text-align: left;width: 100%"></table>
</div>

<script type="text/javascript">
  $(function () {
    // 列定义
    var columns = [
      {
        "sTitle": "考试",
        "mData": 'id'
      },
      {
        "sTitle": "考试开始时间",
        "mData": 'examStartTimeStr'
      },
      {
        "sTitle": "考试结束时间",
        "mData": 'examEndTimeStr'
      },
      {
        "sTitle": "报名开始时间",
        "mData": 'enrollmentStartTimeStr'
      },
      {
        "sTitle": "报名结束时间",
        "mData": 'enrollmentEndTimeStr'
      },
      {
        "sTitle": "打印准考证开始时间",
        "mData": 'cardStartTimeStr'
      },
      {
        "sTitle": "打印准考证结束时间",
        "mData": 'cardEndTimeStr'
      },
      {
        "sTitle": "操作",
        "render": function (data, type, row) {
          return '<a onclick="CONFIG_MAIN.updateConfig(this);" style="cursor: pointer;" data-id="' + row.id + '">修改</a>';
        }
      }
    ];

    // 核心在这里，会自动拥有，表单回车查询特性。
    // datatable的js和样式不再需要引入，此方法会自动判断和引入。
    // 仅仅需要指定url、列的显示样式、表格id，form id即可。
    new DefaultDataTable(Routers.pufa.management.configList, columns, '#example', '#search-form-id');

  });
  var CONFIG_MAIN = {
    /**
     * 修改考场信息
     * @param obj
     */
    updateConfig: function (obj) {
      var id = $(obj).attr('data-id');
      $.ajax({
        url: Routers.pufa.management.getConfig,
        type: 'post',
        data: {id: id},
        success: function (data) {
          var temphtml = $('#temp-config-id').html();
          var html = Common.render(temphtml, data);
          bootbox.dialog({
            message: html,
            buttons: {
              "click": {
                "label": "取消",
                "className": "btn-sm ",
                "callback": function () {
                }
              },
              "button": {
                "label": "确认",
                "className": "btn-sm btn-primary",
                "callback": function () {
                  var data = $('#config-form').serialize();
                  $.ajax({
                    url: Routers.pufa.management.updateConfig,
                    type: 'post',
                    data: data,
                    success: function (data) {
                      $('#example').dataTable().fnDraw(false);
                      Common.info("更新成功");
                    },
                    error: function () {
                      Common.info('系统繁忙，稍候再试');
                    }
                  })
                }
              }
            }
          });
        },
        error: function () {
          Common.info('系统繁忙，稍候再试');
        }
      });
    }
  }
</script>
<script type="text/html" id="temp-config-id">
  <form id="config-form" class="form-horizontal">
    <div class="form-group">
      修改考试设置
    </div>
    <div class="form-group">
      <label class="col-sm-3 control-label no-padding-right">考试开始时间</label>

      <div class="col-sm-9">
        <input type="hidden" name="id" value="{id}">
        <input type="text" class="col-xs-10 col-sm-5" value="{examStartTimeStr}"
               onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" name="examStartTime">
      </div>
    </div>
    <div class="form-group">
      <label class="col-sm-3 control-label no-padding-right">考试结束时间</label>

      <div class="col-sm-9">
        <input type="text" class="col-xs-10 col-sm-5" value="{examEndTimeStr}"
               onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" name="examEndTime">
      </div>
    </div>
    <div class="form-group">
      <label class="col-sm-3 control-label no-padding-right">报名开始时间</label>

      <div class="col-sm-9">
        <input type="text" class="col-xs-10 col-sm-5" value="{enrollmentStartTimeStr}"
               onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" name="enrollmentStartTime">
      </div>
    </div>
    <div class="form-group">
      <label class="col-sm-3 control-label no-padding-right">报名结束时间</label>

      <div class="col-sm-9">
        <input type="text" class="col-xs-10 col-sm-5" value="{enrollmentEndTimeStr}"
               onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" name="enrollmentEndTime">
      </div>
    </div>
    <div class="form-group">
      <label class="col-sm-3 control-label no-padding-right">打印准考证开始时间</label>

      <div class="col-sm-9">
        <input type="text" class="col-xs-10 col-sm-5" value="{cardStartTimeStr}"
               onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" name="cardStartTime">
      </div>
    </div>
    <div class="form-group">
      <label class="col-sm-3 control-label no-padding-right">打印准考证结束时间</label>

      <div class="col-sm-9">
        <input type="text" class="col-xs-10 col-sm-5" value="{cardEndTimeStr}"
               onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" name="cardEndTime">
      </div>
    </div>
  </form>
</script>
