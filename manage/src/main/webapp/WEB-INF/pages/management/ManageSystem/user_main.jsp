<%--
  Created by IntelliJ IDEA.
  User: RYQ
  Date: 2015/5/22
  Time: 15:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.hzc.util.alias.S" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="companys" value="<%=S.sysCompanyService().listStandardCompanies()%>"/>
<c:out value="<%=S.sysCompanyService().listStandardCompanies()%>"/>
<div class="container">
  <div class="row" style="margin-bottom: 20px;">
    <div class="col-xs-12">
      <div style="color: #285e8e;font-size: 1.4em;font-weight: 600">
        用户管理
      </div>
      <form method="post" id="search-user-id" style="display: none;">
        <table class="searchTable">
          <tr>
            <td>
              真实姓名：
            </td>
            <td>
              <input type="text" name="userName" size="20"/>
            </td>
            <td>
              身份证号：
            </td>
            <td>
              <input type="text" name="idCard" size="20"/>
            </td>
            <td></td>
          </tr>
          <tr>
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
            <td>
              工作单位：
            </td>
            <td>
              <select name="companyId">
                <option value="0">请选择</option>
                <c:forEach items="${companys}" var="company" varStatus="status">
                  <option value="${company.id}"
                          data-val="${company.name}">${company.name}</option>
                </c:forEach>
              </select>
            </td>
            <td style="padding-top: 0px;" class="pull-left">
              <input type="hidden" name="action" value="list"/>
              <button type='submit' class="btn btn-sm btn-purple" tabIndex="15">
                <i class="icon-search icon-on-left "></i>&nbsp;查询
              </button>
              <button type="button" class="btn btn-sm btn-info" tabIndex="15"
                      onclick="USER_MAIN.addResource();">
                <i class="glyphicon glyphicon-plus"></i>&nbsp;添加
              </button>
            </td>
          </tr>
        </table>
      </form>
      <br/>
    </div>
  </div>
  <table id="example" style="text-align: left;width: 100%"></table>
</div>
<script type="text/javascript">
  /**
   *遍历列表
   */
  $(function () {
    // 列定义
    var columns = [
      {
        "sTitle": "姓名",
        "mData": 'userName'
      },
      {
        "sTitle": "身份证号",
        "mData": 'idCard'
      },
      {
        "sTitle": "年龄",
        "mData": 'age'
      },
      {
        "sTitle": "性别",
        "render": function (data, type, row) {
          var a = row.sex;
          if (a == '1') {
            return "男";
          } else {
            return "女";
          }
        }
      },
      {
        "sTitle": "出生日期",
        "mData": 'birthday'
      },
      {
        "sTitle": "职级",
        "mData": 'jobGrade'
      },
      {
        "sTitle": "工作单位",
        "mData": 'companyName'
//      },
//      {
//        "sTitle": "操作",
//        "render": function (data, type, row) {
//          return '<a onclick="USER_MAIN.updateResource(this);" style="cursor: pointer;" data-id="' + row.id + '">修改</a>&nbsp;&nbsp;' +
//                  '<a onclick="USER_MAIN.deleteResource(this);" style="cursor: pointer;" data-id="' + row.id + '">删除</a>'
//        }
      }
    ];

    // 核心在这里，会自动拥有，表单回车查询特性。
    // datatable的js和样式不再需要引入，此方法会自动判断和引入。
    // 仅仅需要指定url、列的显示样式、表格id，form id即可。
    new DefaultDataTable(Routers.pufa.user.userList, columns, '#example', '#search-user-id');

  });
  var USER_MAIN = {
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
              var idCard = $('#enrollIdCard').val();
              var userName = $('#enrollPhone').val();
              var r = new RegExp('^[1-9]([0-9]{16}|[0-9]{13})[xX0-9]$');
              if (userName == "") {
                alert('请输入您的用户名');
                $('#enrollPhone').focus();
                return;
              }
              if (idCard.length != 18 || !r.test(idCard)) {
                alert('请输入合法的身份证号');
                $('#enrollIdCard').focus();
                return;
              }
              if ($('#otherCompanyInput').val() == "") {
                alert('请选择单位');
                return;
              }
              $.ajax({
                url: Routers.pufa.user.addResource,
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
     * 删除用户信息
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
                url: Routers.pufa.user.deleteResource,
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
     * 修改用户信息
     * @param obj
     */
    updateResource: function (obj) {
      var id = $(obj).attr('data-id');
      $.ajax({
        url: Routers.pufa.user.getResource,
        type: 'post',
        data: {id: id},
        success: function (data) {
          console.log(JSON.stringify(data))
          var oj = $('#company-edit').find('option[val=' + data.companyId + ']');
          debugger;
          var temphtml = $('#temp-edit-id').html();
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
                  var data = $('#edit-form').serialize();
                  $.ajax({
                    url: Routers.pufa.user.updateResource,
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
  /**
   * 检查注册时，身份证是否可用
   */
  function checkUser(obj) {
    var idCard = $(obj).val();
    $.post(Routers.pufa.enrollment.ajaxCheckIdCardDup, {idCard: idCard}, function (json) {
      if (json && !json.success) {
        alert(json.message);
        $(obj).focus();
      }
    }, 'JSON');
  }
  /**
   * 检查注册时，用户名是否可用
   */
  function checkPhone(obj) {
    var phone = $(obj).val();
    $.post(Routers.pufa.enrollment.ajaxCheckPhoneDup, {phone: phone}, function (json) {
      if (json && !json.success) {
        alert(json.message);
        $(obj).focus();
      }
    }, 'JSON');
  }
  /**
   * 删除其他类单位，同时设置companyid的值
   */
  function setCompany() {
    $('#otherCompanyDiv').hide();
    $('#otherCompanyInput').val($('#company').val());
  }
</script>
<script type="text/html" id="temp-resource-id">
  <form id="resource-form" class="form-horizontal">
    <div class="form-group">
      <label class="col-sm-3 control-label no-padding-right">用户名：</label>

      <div class="col-sm-9">
        <input type="hidden" name="id" value="{id}">
        <input type="text" class="col-xs-10 col-sm-10" value="{phone}" name="phone" id="enrollPhone"
               placeholder="请输入您的用户名" onblur="checkPhone(this);">
      </div>
    </div>
    <div class="form-group">
      <label class="col-sm-3 control-label no-padding-right"> 身份证号码：</label>

      <div class="col-sm-9">
        <input type="text" value="{idCard}" name="idCard" class="col-xs-10 col-sm-10" id="enrollIdCard"
               placeholder="请输入您的身份证号" onblur="checkUser(this);">
      </div>
    </div>
    <div class="form-group">
      <label class="col-sm-3 control-label no-padding-right">真实姓名：</label>

      <div class="col-sm-9">
        <input type="text" class="col-xs-10 col-sm-10" value="{userName}" name="userName"
               placeholder="请输入您的姓名">
      </div>
    </div>
    <div class="form-group">
      <label class="col-sm-3 control-label no-padding-right">年龄：</label>

      <div class="col-sm-9">
        <input type="number" class="col-xs-10 col-sm-10" value="{age}" name="age">
      </div>
    </div>
    <div class="form-group">
      <label class="col-sm-3 control-label no-padding-right">性别：</label>

      <div class="col-sm-9">
        <select name="sex" value="{sex}" class="col-xs-10 col-sm-10">
          <option value="1">男</option>
          <option value="2">女</option>
        </select>
      </div>
    </div>
    <div class="form-group">
      <label class="col-sm-3 control-label no-padding-right">出生日期</label>

      <div class="col-sm-9">
        <input type="text" class="col-xs-10 col-sm-10" value="{birthday}"
               onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" name="birthday">
      </div>
    </div>
    <div class="form-group">
      <label class="col-sm-3 control-label no-padding-right">职级：</label>

      <div class="col-sm-9">
        <select name="jobGrade" value="{jobGrade}" class="col-xs-10 col-sm-10">
          <option value="">请选择</option>
          <option value="区级">区级</option>
          <option value="正处">正处</option>
          <option value="副处">副处</option>
          <option value="正科">正科</option>
          <option value="副科及以下">副科及以下</option>
        </select>
      </div>
    </div>
    <div class="form-group">
      <label class="col-sm-3 control-label no-padding-right">工作单位：</label>

      <div class="col-sm-9">
        <c:set var="companys"
               value="<%=S.sysCompanyService().listStandardCompanies()%>"/>
        <select id="company" onchange="setCompany();" class="col-xs-10 col-sm-10" name="companyId">
          <option value="">请选择单位</option>
          <c:forEach items="${companys}" var="company" varStatus="status">
            <option value="${company.id}"
                    data-val="${company.name}">${company.name}</option>
          </c:forEach>
        </select>
        <input type="hidden" name="companyId" id="otherCompanyInput">
      </div>
    </div>
  </form>
</script>
<script type="text/html" id="temp-edit-id">
  <form id="edit-form" class="form-horizontal">
    <div class="form-group">
      <label class="col-sm-3 control-label no-padding-right">用户名：</label>

      <div class="col-sm-9">
        <input type="hidden" name="id" value="{id}">
        <input type="text" class="col-xs-10 col-sm-10" value="{phone}" name="phone" id="Phone" disabled="true">
      </div>
    </div>
    <div class="form-group">
      <label class="col-sm-3 control-label no-padding-right"> 身份证号码：</label>

      <div class="col-sm-9">
        <input type="text" value="{idCard}" name="idCard" class="col-xs-10 col-sm-10" id="IdCard" disabled="true">
      </div>
    </div>
    <div class="form-group">
      <label class="col-sm-3 control-label no-padding-right">真实姓名：</label>

      <div class="col-sm-9">
        <input type="text" class="col-xs-10 col-sm-10" value="{userName}" name="userName"
               placeholder="请输入您的姓名">
      </div>
    </div>
    <div class="form-group">
      <label class="col-sm-3 control-label no-padding-right">年龄：</label>

      <div class="col-sm-9">
        <input type="number" class="col-xs-10 col-sm-10" value="{age}" name="age">
      </div>
    </div>
    <div class="form-group">
      <label class="col-sm-3 control-label no-padding-right">性别：</label>

      <div class="col-sm-9">
        <select name="sex" class="col-xs-10 col-sm-10" value="{sex}">
          <option value="1">男</option>
          <option value="2">女</option>
        </select>
      </div>
    </div>
    <div class="form-group">
      <label class="col-sm-3 control-label no-padding-right">出生日期</label>

      <div class="col-sm-9">
        <input type="text" class="col-xs-10 col-sm-10" value="{birthday}" disabled="true"
               onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})">
      </div>
    </div>
    <div class="form-group">
      <label class="col-sm-3 control-label no-padding-right">职级：</label>

      <div class="col-sm-9">
        <select name="jobGrade" value="{jobGrade}" class="col-xs-10 col-sm-10">
          <option value="">请选择</option>
          <option value="区级">区级</option>
          <option value="正处">正处</option>
          <option value="副处">副处</option>
          <option value="正科">正科</option>
          <option value="副科及以下">副科及以下</option>
        </select>
      </div>
    </div>
    <div class="form-group">
      <label class="col-sm-3 control-label no-padding-right">工作单位：</label>

      <div class="col-sm-9">
        <select id="company-edit" onchange="setCompany();" class="col-xs-10 col-sm-10" name="companyId">
          <option value="">请选择单位</option>
          <c:forEach items="${companys}" var="company" varStatus="status">
            <option value="${company.id}" data-val="${company.name}">${company.name}</option>
          </c:forEach>
        </select>
      </div>
    </div>
  </form>
</script>
