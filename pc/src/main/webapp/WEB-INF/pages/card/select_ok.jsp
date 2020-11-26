<%--
  Created by IntelliJ IDEA.
  User: felix yin
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
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
</style>

<div class="container">
    <br/>

    <form method="post" id="search-card-id" style="display: none;">
        <table class="searchTable">
            <tr>
                <td>准考证号：
                </td>
                <td>
                    <input type="text" name="cardNo" size="20"/>
                </td>
                <td>
                    单位：
                </td>
                <td>
                    <select name="company">
                        <c:forEach items="${companys}" var="company" varStatus="status">
                            <c:if test="${requestScope.companyId == company.id}">
                                <option value="${company.name}"
                                        data-val="${company.name}">${company.name}</option>
                            </c:if>
                        </c:forEach>
                    </select>
                </td>
                <td>
                    房间号：
                </td>
                <td>
                    <input type="number" name="roomNo"/>
                </td>
                <td></td>
            </tr>
            <tr>
                <td>
                    姓名：
                </td>
                <td>
                    <input type="text" name="name" size="20">
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
                <td>
                    座位号:
                </td>
                <td>
                    <input type="number" name="seatNo"/>
                </td>
                <td style="padding-top: 0px;" class="pull-left">
                    <input type="hidden" name="action" value="list"/>
                    <button type='submit' class="btn btn-sm btn-purple" tabIndex="15">
                        <i class="icon-search icon-on-left "></i>&nbsp;查询
                    </button>
                    &nbsp;&nbsp;
                    <button class=" btn btn-sm btn-light" type="reset" tabIndex="15">
                        <i class="icon-on-left icon-refresh"></i>&nbsp;重置
                    </button>
                </td>
            </tr>
        </table>
    </form>
    <br/>
    <table id="user-card-table-id" style="text-align: left;width: 100%"></table>

</div>

<style>
    /* 复写dataTable样式 */
    .dataTables_info, .dataTables_paginate {
        display: none;
    }
</style>
<script type="text/javascript">
    /**
     * 打印一个准考证
     */
    function printCard(id) {
        window.open("CardCtrl.printCard.do?id=" + id);
    }
    /**
     * 初始化列表
     */
    $(function () {
        // 列定义
        var columns = [
            {
                "sTitle": "学员照片",
                "render": function (data, type, row) {
                    return '<img src="ManageCtrl.writeUserPhoto.do?id=' + row.userId + '" style="height:60px;"/>'
                }
            },
            {
                "sTitle": "准考证",
                "mData": 'cardNo'
            },
            {
                "sTitle": "姓名",
                "mData": 'name'
            },
            {
                "sTitle": "单位",
                "mData": 'company'
            },
            {
                "sTitle": "职级",
                "mData": 'jobGrade'
            },
            {
                "sTitle": "考试房间号",
                "mData": 'roomNo'
            },
            {
                "sTitle": "考试座位号",
                "mData": 'seatNo'
            },
            {
                "sTitle": "考场地址",
                "mData": 'address'
            },
            {
                "sTitle": "性别",
                "mData": 'sex'
            },
            {
                "sTitle": "出生日期",
                "mData": 'birthday'
            },
            {
                "sTitle": "报名时间",
                "mData": 'examStartTime'
            },
            {
                "sTitle": "考试结束时间",
                "mData": 'examEndTime'
            },
            {
                "sTitle": "",
                "render": function (data, type, row) {
                    return '<button type="button" onclick="printCard(' + row.id + ')" class="btn btn-sm btn-primary">打印准考证</button>'
                }
            }
        ];

        // 核心在这里，会自动拥有，表单回车查询特性。
        // datatable的js和样式不再需要引入，此方法会自动判断和引入。
        // 仅仅需要指定url、列的显示样式、表格id，form id即可。
        new DefaultDataTable(Routers.pufa.report.cardList + "?company=${requestScope.company}", columns, '#user-card-table-id', '#search-card-id', false);

    });
</script>
<%@include file="../include/include_footer.jsp" %>
