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
<style>
    .photo {
        width: 150px;
        height: 215px;
        overflow: hidden;
        padding: 7px;
        border: 2px solid #ffffff;
    }

    .information {
        font-size: 20px;
        font-family: 微软雅黑;
        float: left;
    }

    .information li {
        list-style: none;
    }
</style>
<div class="main-container-inner">
    <div id="main-content-id" class="main-content" style="margin-left:0px;margin-top: 10px;">
        <div class="page-content"
             style="background:none!important;min-height:348px;text-align: center;">
                      <div class="row">
                        <!--左侧空白-->
                        <div class="col-sm-2"></div>
                        <!--内容左边部分照片-->
                        <div class="col-sm-2" style="margin-top: 50px;">
                            <div class="photo"><img src="${basePath}assets/system/pufa/img/photo.jpg"
                                                    style="width: 100%;height:auto;"/></div>
                        </div>
                        <!--内容右边部分信息-->
                        <div class="col-sm-6" style="margin-top: 50px;">
                            <div class="information">
                                <ul>
                                    <li>
                                        姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：
                                    </li>
                                    <li>
                                        性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：
                                    </li>
                                    <li>
                                        出生日期：
                                    </li>
                                    <li>
                                        工作单位：
                                    </li>
                                    <li>
                                        职&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;级：
                                    </li>
                                    <li>
                                        身份证号：
                                    </li>
                                    <li>
                                        手机号码：
                                    </li>
                                </ul>
                            </div>
                        </div>
                      </div>
            <table style="float:right;margin-right:200px;margin-top:50px;">
                <tr>
                    <td>
                        <button class="my-button blue" type=button
                                style="color:white!important;margin-right:20px;"><strong>确定打印</strong>
                        </button>
                    </td>
                    <td>
                        <button class="my-button blue" type=button
                                style="width:120px;color:white!important;"><strong>返&nbsp;&nbsp;&nbsp;&nbsp;回</strong>
                        </button>
                    </td>
                </tr>
            </table>
               </div>

<%@include file="../include/include_footer.jsp"%>