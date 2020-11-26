<%--
  Created by IntelliJ IDEA.
  User: HZC
  Date: 2015/5/28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--
页面头部是否居中？ 默认为居左并且显示导航菜单
页面内容区域的背景，默认为白色
--%>
<%--<%@include file="../include/include_header.jsp"%>--%>
<jsp:include page="../include/include_header.jsp">
  <jsp:param name="headAlign" value="center"></jsp:param>
  <jsp:param name="contentBackground" value="#d0f6e3"></jsp:param>
</jsp:include>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
  select {
    width: 60%;
    border: 1px solid #1687d5;
    padding: 0 5px;
  }

  input[readonly] {
    background: none repeat scroll 0 0 #ffffff !important;
  }

  #imghead {
    filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=image);
    width: 100px;
    height: 140px;
  }

  .my-confirm-form {
    display: none;
    text-align: left;
    font-size: 18px;
  }

  .my-confirm-form label {
    font-size: 18px !important;
  }
</style>
<div class="main-container" id="main-container" style="">
  <!--表单信息-->
  <script type="text/javascript">
    try {
      ace.settings.check('main-container', 'fixed')
    } catch (e) {
    }
  </script>
  <div class="main-container-inner">
    <div id="main-content-id" class="main-content" style="margin-left:0px;margin-top: 10px;">
      <div class="page-content"
           style="background:none!important;min-height:348px;text-align: center;">
        <div id="modify-info" style="font-size: 20px;padding:30px;">
          <div style="display: none;">如果您已经报名，修改报名信息请点击
            <a href="CommonCtrl.goTo.do?path=/WEB-INF/pages/enrollment/modify_pre.jsp"><strong>本链接</strong></a>
          </div>
          <div id="my-info" style="color: #d68273;height: 40px;"></div>
        </div>
        <div class="row">
          <div class="col-sm-2"></div>
          <!--左边-->
          <div class="col-sm-8">
            <div class="row">
              <form class="form-horizontal" action="UserCtrl.enrollExam.do" method="post"
                    id="my-form"
                    enctype="multipart/form-data">
                <div class="col-sm-6">
                  <div class="form-group my-div-height"><label
                      class="col-sm-5 control-label no-padding-right">
                    <span style="font-size: 16px;">姓名</span><span
                      style='color:red;margin-left: 5px;'>*</span>：</label>

                    <div class="col-sm-7">
                      <input name="userName" id="userName" type="text"
                             class="col-xs-10 col-sm-10"
                             value="刘金云"
                             style="border:1px solid #1687d5;">
                    </div>
                  </div>
                  <div class="form-group my-div-height">
                    <label class="col-sm-5 control-label no-padding-right">
                      <span style="font-size: 16px;">出生日期</span><span
                        style='color:red;margin-left: 5px;'>*</span>：</label>

                    <div class="col-sm-7">
                      <input name="birthday" id="birthday" type="text"
                             style="border:1px solid #1687d5;"
                             class="col-xs-10 col-sm-10"
                             value="2015-05-10"
                             onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})">
                    </div>
                  </div>

                  <div class="form-group my-div-height">
                    <label class="col-sm-5 control-label no-padding-right">
                      <span style="font-size: 16px;">职级</span><span
                        style='color:red;margin-left: 5px;'>*</span>：</label>

                    <div class="col-sm-7">
                      <select name="jobGrade" id="jobGrade" class="col-xs-10 col-sm-10"
                              style="font-size: 16px;">
                        <option value="区级">区级</option>
                        <option value="处级">处级</option>
                        <option value="副处">副处</option>
                        <option value="正科">正科</option>
                        <option value="副科及其他">副科及其他</option>
                      </select>
                    </div>
                  </div>

                  <div class="form-group my-div-height">
                    <label class="col-sm-5 control-label no-padding-right">
                      <span style="font-size: 16px;">上传照片</span><span
                        style='color:red;margin-left: 5px;'>*</span>：</label>

                    <div class="col-sm-7">
                      <input name="photoFile" id="photo" type="file"
                             onchange="previewImage(this)" class="col-xs-10 col-sm-10">
                    </div>
                  </div>
                  <div class="form-group my-div-height">
                    <label class="col-sm-5 control-label no-padding-right">
                    </label>

                    <div class="col-sm-7" style="text-align: left;">
                      <span style="font-size: 14px;margin-right: 20px;">请上传1寸照片，大小不超过100K</span>

                      <div id="preview"
                           style="display: none;width: 100px;height: 150px;overflow: hidden;">
                        <img id="imghead" style="width: 100px;height: 150px;" border=0
                             src=''>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-sm-6">
                  <div class="form-group my-div-height">
                    <label class="col-sm-5 control-label no-padding-right">
                      <span style="font-size: 16px;">性别</span><span
                        style="color:red;margin-left: 5px;font-size: 18px;">*</span>：</label>

                    <div class="col-sm-7" style="text-align: left !important;">
                      <label>
                        <input type="radio" class="ace" name="sex" value="1" checked>
                        <span class="lbl" style="font-size: 16px;">男</span>
                      </label>
                      <label style="margin-left: 10px;">
                        <input type="radio" class="ace" name="sex" value="2">
                        <span class="lbl" style="font-size: 16px;">女</span>
                      </label>
                    </div>
                  </div>
                  <div class="form-group my-div-height">
                    <label class="col-sm-5 control-label no-padding-right">
                      <span style="font-size: 16px;">身份证号</span><span
                        style='color:red;margin-left: 5px;'>*</span>：</label>

                    <div class="col-sm-7">
                      <input type="text" name="idCard" id="idCard"
                             class="col-xs-10 col-sm-10"
                             value="123456789123456789"
                             style="border:1px solid #1687d5;">
                    </div>
                  </div>

                  <div class="form-group my-div-height">
                    <label class="col-sm-5 control-label no-padding-right">
                      <span style="font-size: 16px;">联系电话</span><span
                        style='color:red;margin-left: 5px;'>*</span>：</label>

                    <div class="col-sm-7">
                      <input type="text" name="phone" id="phone"
                             class="col-xs-10 col-sm-10"
                             value="12345679812"
                             style="border:1px solid #1687d5;">
                    </div>
                  </div>

                  <div class="form-group my-div-height">
                    <label class="col-sm-5 control-label no-padding-right">
                      <span style="font-size: 16px;">工作单位</span><span
                        style='color:red;margin-left: 5px;'>*</span>：</label>

                    <div class="col-sm-7">
                      <%@include file="/fragment/select_company.jsp" %>
                    </div>

                  </div>
                </div>
                <div style="text-align: center;height: 50px;width: 100%;display: inline-block;">
                  <button class="my-button blue" type="button" onclick="nextStep();"
                          style="color:white!important;text-align: center;margin-bottom: 20px;">
                    <strong>报&nbsp;&nbsp;名</strong>
                  </button>
                </div>
              </form>
            </div>
            <div id="my-div" class="my-confirm-form" style="margin-top: 35px;">
              <div style="text-align: center;">
                <span style="color: red;">请确认报名信息，报名之后，报名姓名、性别、出生日期、身份证号不可再修改。</span>
              </div>
              <div class="form-horizontal row">
                <div class="col-sm-6">
                  <div class="form-group">
                    <label class="col-sm-5 control-label no-padding-right">姓名：</label>

                    <div class="col-sm-7">
                      <span id="userName2" class="col-xs-10 col-sm-10"></span>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-5 control-label no-padding-right">出生日期：</label>

                    <div class="col-sm-7">
                      <span id="birthday2" class="col-xs-10 col-sm-10"></span>
                    </div>
                  </div>

                  <div class="form-group">
                    <label class="col-sm-5 control-label no-padding-right">职级：</label>

                    <div class="col-sm-7">
                      <span id="jobGrade2" class="col-xs-10 col-sm-10"></span>
                    </div>
                  </div>

                  <div class="form-group">
                    <label class="col-sm-5 control-label no-padding-right">上传照片：</label>

                    <div class="col-sm-7">
                      <div id="preview2"
                           style="width: 100px;height: 150px;overflow: hidden;margin-left: 10%;">
                        <img id="imghead2" style="width: 100px;height: 150px;" border=0
                             src=''>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-sm-6">
                  <div class="form-group">
                    <label class="col-sm-5 control-label no-padding-right">性别：</label>

                    <div class="col-sm-7" style="text-align: left !important;">
                      <span id="sex2" class="col-xs-10 col-sm-10"></span>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-5 control-label no-padding-right">身份证号：</label>

                    <div class="col-sm-7">
                      <span id="idCard2" class="col-xs-10 col-sm-10"></span>
                    </div>
                  </div>

                  <div class="form-group">
                    <label class="col-sm-5 control-label no-padding-right">联系电话：</label>

                    <div class="col-sm-7">
                      <span id="phone2" class="col-xs-10 col-sm-10"></span>
                    </div>
                  </div>

                  <div class="form-group">
                    <label class="col-sm-5 control-label no-padding-right">
                      工作单位：</label>

                    <div class="col-sm-7">
                      <span id="company2" class="col-xs-10 col-sm-10"></span>
                    </div>
                  </div>
                </div>
              </div>
              <div>
                <button class="my-button blue" type="button" onclick="prevStep();"
                        style="color:white!important;text-align: center;margin-left: 30%;">
                  <strong>上一步</strong>
                </button>
                <button class="my-button blue" type="button" onclick="submitForm();"
                        style="color:white!important;text-align: center;margin-left: 10px;">
                  <strong>确定报名</strong>
                </button>
              </div>
            </div>
          </div>
          <div class="col-sm-2"></div>
        </div>
      </div>
    </div>
  </div>
</div>
<script src="/assets/js/bootstrap.min.js"></script>
<script src="/assets/js/typeahead-bs2.min.js"></script>
<script src="/assets/js/jquery-ui-1.10.3.custom.min.js"></script>
<script src="/assets/js/jquery.ui.touch-punch.min.js"></script>
<script src="/assets/js/bootbox.min.js"></script>

<!-- ace scripts -->

<script src="/assets/js/ace-elements.min.js"></script>
<script src="/config.js"></script>
<script src="/assets/system/pufa/js/company.js"></script>
<script src="/assets/wdatepicker/WdatePicker.js"></script>
<script type="text/javascript">
  //图片上传预览    IE是用了滤镜。
  function previewImage(file) {
    var WIDTH = 100;
    var HEIGHT = 140;
    var TOP = 10;
    var div = document.getElementById('preview');
    var div2 = document.getElementById('preview2');
    div.style.display = "block";
    if (file.files && file.files[0]) {
      var size = file.files[0].size;
      if (size > (100 * 1024)) {
        alert("图片大小不能超过100Kb");
        return;
      }
      div.innerHTML = '<img id="imghead">';
      div2.innerHTML = '<img id="imghead2">';
      var img = document.getElementById('imghead');
      var img2 = document.getElementById('imghead2');
      img.onload = function () {
        img.style.width = WIDTH + 'px';
        img.style.height = HEIGHT + 'px';
        img.style.marginTop = TOP + 'px';
      }
      img2.onload = function () {
        img2.style.width = WIDTH + 'px';
        img2.style.height = HEIGHT + 'px';
        img2.style.marginTop = TOP + 'px';
      }

      var reader = new FileReader();
      reader.onload = function (evt) {
        img.src = evt.target.result;
        img2.src = evt.target.result;
      }
      reader.readAsDataURL(file.files[0]);
    } else { //兼容IE
      var sFilter = 'filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src="';
      file.select();
      var src = document.selection.createRange().text;
//            div.innerHTML = '<img id="imghead" >';
//            div2.innerHTML = '<img id="imghead2" >';
//            var img = document.getElementById('imghead');
//            var img2 = document.getElementById('imghead2');
//            img.filters.item('DXImageTransform.Microsoft.AlphaImageLoader').src = src;
//            img2.filters.item('DXImageTransform.Microsoft.AlphaImageLoader').src = src;
      div.innerHTML = "<div id='divhead' style='width:" + WIDTH + "px;height:" + HEIGHT + "px;margin-top:" + TOP + "px;" + sFilter + src + "\"'></div>";
      div2.innerHTML = "<div id='divhead2' style='width:" + WIDTH + "px;height:" + HEIGHT + "px;margin-top:" + TOP + "px;" + sFilter + src + "\"'></div>";
    }
  }

  /**
   * 错误提示信息
   * 提示在不为空的表单对象的下方
   * obj 对象
   * mess 提示信息
   * 返回false
   */

  function errorPrompt(obj, mess) {
    var span = obj.parent().next();
    var biaozhi = span.attr('biaozhi');
    if (!biaozhi) {
      obj.css('border-color', '#d68273');
      obj.parent().after('<span biaozhi="true" style="float: left;padding-left: 12px;color: #d68273;">' + mess + '</span>');
      setTimeout(function () {
        obj.css('border-color', '');
        obj.parent().next().remove();
      }, 3000);
    }
    return false;
  }
  /**
   * 报名表单验证，跳转到确认界面
   */
  function nextStep() {
    var yes = true;
    var $userName = $("#userName");
    var name = $userName.val();
    $("#userName2").html(name);
    if (name == '') {
      yes = errorPrompt($userName, '请填写姓名');
    }
    var $birthday = $("#birthday");
    var birthday = $birthday.val();
    $("#birthday2").html(birthday);
    if (birthday == '') {
      yes = errorPrompt($birthday, '请选择出生日期');
    }
    var $photo = $("#photo");
    var photo = $photo.val();
    if (photo == '') {
      yes = errorPrompt($photo, '请上传照片');
    }
    var $idCard = $("#idCard");
    var idCard = $idCard.val();
    $("#idCard2").html(idCard);
    if (idCard == '') {
      yes = errorPrompt($idCard, '请填写身份证号');
    } else {
      var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
      if (reg.test(idCard) === false) {
        yes = errorPrompt($idCard, '请填写正确的身份证号');
      }
    }
    var $phone = $("#phone");
    var phone = $phone.val();
    $("#phone2").html(phone);
    if (phone == '') {
      yes = errorPrompt($phone, '请填写联系电话');
    } else {
      var regPhone = /(^\d{11}$)/;
      if (regPhone.test(phone) === false) {
        yes = errorPrompt($phone, '请填写正确的联系电话');
      }
    }
    var sex = $('input[name=sex]:checked').val() == 1 ? '男' : '女';
    $('#sex2').html(sex);
    var jobGrade = $('#jobGrade').val();
    $('#jobGrade2').html(jobGrade);
    $('#company2').html($('#company').find("option:selected").text());
    if (yes) {
      $('#my-form').hide();
      $('#my-div').show();
      $('#modify-info').hide();
    }
  }

  /**
   * 上一步
   */
  function prevStep() {
    $('#modify-info').show();
    $('#my-form').show();
    $('#my-div').hide();
  }

  /**
   * 表单提交
   */
  function submitForm() {
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
      message: '<h3>报名信息中，姓名、性别、出生日期、身份证号，报名之后不可再修改，请确认无误。</h3>',
      callback: function (result) {
        if (result) {
          $('#my-form').submit();
        } else {
        }
      },
      title: "提示"
    });
  }
  $(function () {
    var message = '${requestScope.message}';
    if (message != '') {
      if (message == '报名成功') {
        bootbox.confirm({
          buttons: {
            confirm: {
              label: '确定',
              style: 'background-color: #002a80;color: red;width:100px;'
            },
            cancel: {
              label: '取消',
              className: 'my-display-none'
            }
          },
          message: '<h3>报名成功</h3>',
          callback: function (result) {
            if (result) {
              window.location.href = '/index_user.jsp';
            } else {
            }
          },
          title: "提示"
        });
      } else {
        $('#my-info').html(message);
        setTimeout(function () {
          $('#my-info').html('');
        }, 5000);
      }
    }
  });

  /**
   * @deprecated
   * 校验 身份证号是否重复
   */
  $(function () {
    return false;
    $("#idCard").blur(function () {
      var self = this;
      var value = $.trim($(self).val());
      if (!value)return;
      $.post(Routers.pufa.enrollment.ajaxCheckIdCardDup, {idCard: value}, function (json) {
        if (json && !json.success) {
          alert(json.message)
          $(self).focus();
        }
      }, 'JSON');
    });
  });

</script>

<%@include file="../include/include_footer.jsp" %>