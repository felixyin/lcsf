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
    <div class="col-xs-6">
      <button type="button" class="btn btn-sm btn-info"
              onclick="RESOURCE_MAIN.addResource();">
        添加
      </button>
    </div>
  </div>
  <table id="example" style="text-align: left;width: 100%"></table>
</div>

<script type="text/javascript">
  /**
   *
   */
  $(function () {
    // 列定义
    var columns = [
      {
        "sTitle": "考场号",
        "mData": 'roomNo'
      },
      {
        "sTitle": "考试开始时间",
        "mData": 'startTimeStr'
      },
      {
        "sTitle": "考试结束时间",
        "mData": 'endTimeStr'
      },
      {
        "sTitle": "考场地址",
        "mData": 'roomAddress'
      },

      {
        "sTitle": "座位数",
        "render": function (data, type, row) {
          return row.seatCount
        }
      },
      {
        "sTitle": "操作",
        "render": function (data, type, row) {
          return '<a onclick="RESOURCE_MAIN.updateResource(this);" style="cursor: pointer;" data-id="' + row.id + '">修改</a>&nbsp;&nbsp;' +
                  '<a onclick="RESOURCE_MAIN.deleteResource(this);" style="cursor: pointer;" data-id="' + row.id + '">删除</a>'
        }
      }
    ];

    // 核心在这里，会自动拥有，表单回车查询特性。
    // datatable的js和样式不再需要引入，此方法会自动判断和引入。
    // 仅仅需要指定url、列的显示样式、表格id，form id即可。
    new DefaultDataTable(Routers.pufa.management.resourceList, columns, '#example', '#search-form-id');

  });
  var RESOURCE_MAIN = {
    addResource: function () {
      var temphtml = $('#temp-resource-id').html();
      var html = Common.render(temphtml, "");
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
              var data = $('#resource-form').serialize();
              $.ajax({
                url: Routers.pufa.management.addResource,
                type: 'post',
                data: data,
                success: function (data) {
                  $('#example').dataTable().fnDraw(false);
                  Common.info("添加成功");
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
    /**
     * 删除考场信息
     */
    deleteResource: function (obj) {
      bootbox.dialog({
        message: "确定要删除吗？",
        buttons: {
          "button": {
            "label": "取消",
            "className": "btn-sm"
          },
          "success": {
            "label": "确定",
            "className": "btn-sm btn-success",
            "callback": function () {
              var id = $(obj).attr('data-id');
              $.ajax({
                url: Routers.pufa.management.deleteResource,
                type: 'post',
                data: {id: id},
                success: function (data) {
                  $('#example').dataTable().fnDraw(false);
                  Common.info('删除成功');
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
    /**
     * 修改考场信息
     * @param obj
     */
    updateResource: function (obj) {
      var id = $(obj).attr('data-id');
      $.ajax({
        url: Routers.pufa.management.getResource,
        type: 'post',
        data: {id: id},
        success: function (data) {
          var temphtml = $('#temp-resource-id').html();
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
                  var data = $('#resource-form').serialize();
                  $.ajax({
                    url: Routers.pufa.management.updateResource,
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
<script type="text/html" id="temp-resource-id">
  <form id="resource-form" class="form-horizontal">
    <div class="form-group">
      修改考场设置
    </div>
    <div class="form-group">
      <label class="col-sm-3 control-label no-padding-right">考试开始时间</label>

      <div class="col-sm-9">
        <input type="hidden" name="id" value="{id}">
        <input type="text" class="col-xs-10 col-sm-5" value="{startTimeStr}"
               onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" name="startTime">
      </div>
    </div>
    <div class="form-group">
      <label class="col-sm-3 control-label no-padding-right">考试结束时间</label>

      <div class="col-sm-9">
        <input type="text" class="col-xs-10 col-sm-5" value="{endTimeStr}"
               onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" name="endTime">
      </div>
    </div>
    <div class="form-group">
      <label class="col-sm-3 control-label no-padding-right">考场地址</label>

      <div class="col-sm-9">
        <input type="text" class="col-xs-10 col-sm-5" value="{roomAddress}" name="roomAddress">
      </div>
    </div>
    <div class="form-group">
      <label class="col-sm-3 control-label no-padding-right">考场号</label>

      <div class="col-sm-9">
        <input type="text" class="col-xs-10 col-sm-5" value="{roomNo}" name="roomNo">
      </div>
    </div>
    <div class="form-group">
      <label class="col-sm-3 control-label no-padding-right">座位数</label>

      <div class="col-sm-9">
        <input type="number" class="col-xs-10 col-sm-5" value="{seatCount}" name="seatCount">
      </div>
    </div>
  </form>
</script>
