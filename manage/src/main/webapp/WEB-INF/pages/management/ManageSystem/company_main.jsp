<%--
  Created by IntelliJ IDEA.
  User: HZC
  Date: 2015/7/26
  Time: 15:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="container">
  <br/>

  <form method="post" id="search-form-id">
  </form>
  <br/>

  <div class="row" style="margin-bottom: 20px;">
    <div class="col-xs-6">
      <div style="color: #285e8e;font-size: 1.4em;font-weight: 600">
        单位管理
      </div>
    </div>
    <div class="col-xs-6">
      <button type="button" class="btn btn-info btn-sm"
              onclick="COMPANY_MAIN.addGroup();">
        添加
      </button>
    </div>
  </div>
  <table id="example" style="text-align: left;width: 100%"></table>
</div>
<script type="text/javascript">
  $(function () {
    // 列定义
    var columns = [
      {
        "sTitle": "组名称",
        "mData": 'name',
        bSortable: false,
        "render": function (data, type, row) {
          return '<span style="color:blue;cursor: pointer;" onclick="COMPANY_JUNIOR.listCompany(this)" data-company-name="' + row.name + '" data-company-id="' + row.id + '">' + row.name + '</span>';
        }
      },
      {
        "sTitle": "密码",
        "mData": 'password'
      },

      {
        "sTitle": "更新时间",
        "mData": 'updateTime'
      },


      {
        "sTitle": "操作",
        "render": function (data, type, row) {
          return '<a onclick="COMPANY_MAIN.updateCompanyGroup(this);" style="cursor: pointer;" data-id="' + row.id + '">修改</a>&nbsp;&nbsp;'
        }
      }
    ];

    // 核心在这里，会自动拥有，表单回车查询特性。
    // datatable的js和样式不再需要引入，此方法会自动判断和引入。
    // 仅仅需要指定url、列的显示样式、表格id，form id即可。
    new DefaultDataTable(Routers.pufa.user.companyGroupList, columns, '#example', '#search-form-id');

  });
  var COMPANY_MAIN = {
    addGroup: function () {
      var temphtml = $('#temp-group-id').html();
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
              var data = $('#group-form').serialize();
              $.ajax({
                url: Routers.pufa.user.addCompanyGroups,
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
    updateCompanyGroup: function (obj) {
      var id = $(obj).attr('data-id');
      $.ajax({
        url: Routers.pufa.user.getCompanyGroup,
        type: 'post',
        data: {id: id},
        success: function (data) {
          var temphtml = $('#temp-group-id').html();
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
                  var data = $('#group-form').serialize();
                  $.ajax({
                    url: Routers.pufa.user.updateCompanyGroup,
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
<script type="text/html" id="temp-group-id">
  <form id="group-form" class="form-horizontal">
    <div class="form-group">
      组信息设置
    </div>
    <div class="form-group">

      <label class="col-sm-3 control-label no-padding-right">部门名称</label>

      <div class="col-sm-9">
        <input type="hidden" name="id" value="{id}">
        <input type="text" class="col-xs-10 col-sm-5" value="{name}"
               name="name">
      </div>
    </div>

    <div class="form-group">
      <label class="col-sm-3 control-label no-padding-right">部门密码</label>

      <div class="col-sm-9">


        <input type="password" name="password" value="{password}" class="col-xs-10 col-sm-5"/>
      </div>

    </div>
  </form>
</script>
<script type="text/javascript">
  var COMPANY_JUNIOR = {
    /**
     * 跳转到单位内人报表
     * @param obj
     */
    listCompany: function (obj) {
      var companyGroupId = $(obj).attr('data-company-id');
      var companyGroupName = $(obj).attr('data-company-name');
      window.__company_junior_href = 'SysCompanyCtrl.listCompanyJunior.do?companyGroupId=' + companyGroupId + '&companyGroupName=' + companyGroupName;
      menu_click(window.__company_junior_href);
    }
  }
</script>
