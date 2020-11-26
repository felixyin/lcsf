<%--
  Created by IntelliJ IDEA.
  User: RYQ
  Date: 2015/7/27
  Time: 16:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="container">
  <div class="row" style="margin-bottom: 20px;">
    <div class="col-xs-6">
      <div style="color: #285e8e;font-size: 1.4em;font-weight: 600">
        试题管理
      </div>
    </div>
  </div>
  <form method="post" id="search-question-id">
    <table class="searchTable">
      <tr>
        <td>
          题号：
        </td>
        <td>
          <input type="Number" name="seq" size="20"/>
        </td>
        <td>
          类型：
        </td>
        <td>
          <select name="type">
            <option value="">请选择</option>
            <option value="判断题">判断题</option>
            <option value="单选题">单选题</option>
            <option value="多选题">多选题</option>
          </select>
        </td>
        <td style="padding-top: 0px;" class="pull-left">
          <input type="hidden" name="action" value="list"/>
          <button type='submit' class="btn btn-sm btn-purple" tabIndex="15">
            <i class="icon-search icon-on-left "></i>&nbsp;查询
          </button>
        </td>
        <td>
          <button class=" btn btn-sm btn-light" type="reset" tabIndex="15">
            <i class="icon-on-left icon-refresh"></i>&nbsp;重置
          </button>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          题目：
        </td>
        <td>
          <input type="text" name="name" size="20"/>
        </td>
        <td></td>
        <td></td>
        <td>
          <button type="button" class="btn btn-sm btn-purple" tabIndex="15"
                  onclick="Questions_MAIN.addResource();">
            <i class="icon-on-left icon-refresh"></i>&nbsp;添加
          </button>
        </td>
        <td></td>
        <td></td>
      </tr>
    </table>
  </form>
  <br/>
  <table id="example" style="text-align: left;width: 100%"></table>
</div>
<script src="/assets/wdatepicker/WdatePicker.js"></script>
<script type="text/javascript">
  /**
   *遍历列表
   */
  $(function () {
    // 列定义
    var columns = [
      {
        "sTitle": "题号",
        "width": "3%",
        "mData": 'seq'
      },
      {
        "sTitle": "类型",
        "width": "5%",
        "mData": 'type'
      },
      {
        "sTitle": "题目",
        "width": "70%",
        "mData": 'name'
      },
      {
        "sTitle": "做题次数",
        "width": "5%",
        "mData": 'answerTimes'
      },
      {
        "sTitle": "收藏次数",
        "width": "5%",
        "mData": 'collectTimes'
      },
      {
        "sTitle": "查看选项",
        "width": "5%",
        "mData": 'opione',
        bSortable: false,
        "render": function (data, type, row) {
          return '<span style="color:blue;cursor: pointer;" onclick="Questions_MAIN.listQuestion(this)" data-question-id="' + row.id + '">' + row.opione + '</span>';
        }
      },
      {
        "sTitle": "操作",
        "width": "7%",
        "render": function (data, type, row) {
          return '<a onclick="Questions_MAIN.updateResource(this);" style="cursor: pointer;" data-id="' + row.id + '">修改</a>&nbsp;&nbsp;' +
                  '<a onclick="Questions_MAIN.deleteResource(this);" style="cursor: pointer;" data-id="' + row.id + '">删除</a>'
        }
      }
    ];

    // 核心在这里，会自动拥有，表单回车查询特性。
    // datatable的js和样式不再需要引入，此方法会自动判断和引入。
    // 仅仅需要指定url、列的显示样式、表格id，form id即可。
    new DefaultDataTable(Routers.pufa.study.questionList, columns, '#example', '#search-question-id');

  });
  var Questions_MAIN = {
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
              var type = $('#enrolltype').val();
              var name = $('#enrollname').val();
              if (name == "") {
                alert('请输入试题内容');
                $('#enrollname').focus();
                return;
              }
              if (type == "") {
                alert('请选择试题类型');
                return;
              }
              $.ajax({
                url: Routers.pufa.study.addResource,
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
     * 删除试题信息
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
                url: Routers.pufa.study.deleteResource,
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
     * 修改试题信息
     * @param obj
     */
    updateResource: function (obj) {
      var id = $(obj).attr('data-id');
      $.ajax({
        url: Routers.pufa.study.getResource,
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
                    url: Routers.pufa.study.updateResource,
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
    },
    /**
     * 跳转到单位内人报表
     * @param obj
     */
    listQuestion: function (obj) {
      var questionGroupId = $(obj).attr('data-question-id');
      window.open('LpQuestionCtrl.listQuestionJunior.do?questionGroupId=' + questionGroupId);
    }
  }
</script>
<script type="text/html" id="temp-resource-id">
  <form id="resource-form" class="form-horizontal">
    <div class="form-group">
      <label class="col-sm-3 control-label no-padding-right">试题类型：</label>

      <div class="col-sm-9">
        <input type="hidden" name="id" value="{id}">
        <select name="type" value="{type}" class="col-xs-10 col-sm-10" id="enrolltype">
          <option value="">请选择</option>
          <option value="判断题">判断题</option>
          <option value="单选题">单选题</option>
          <option value="多选题">多选题</option>
        </select>
      </div>
    </div>
    <div class="form-group">
      <label class="col-sm-3 control-label no-padding-right">试题内容：</label>

      <div class="col-sm-9">
        <textarea type="text" style="height: 150px;width: 83.33333333%;" name="name"
                  id="enrollname" placeholder="请输入试题内容">{name}</textarea>
      </div>
    </div>
  </form>
</script>
