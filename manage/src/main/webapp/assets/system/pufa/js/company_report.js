/**
 * Created by HZC on 2015/7/16.
 */
var COMPANY_REPORT = {
    /**
     * 跳转到单位内人报表
     * @param obj
     */
    listPeople: function (obj) {
        var companyId = $(obj).attr('data-company-id');
        var companyName = $(obj).attr('data-company-name');
        var href = 'ManagementCtrl.listReportPeople.do?companyId=' + companyId + '&companyName=' + companyName;
        menu_click(href);
    }
}

$(function () {
    var t = $('#company-list').on('page.dt', function () {
    }).dataTable({
        "sPaginationType": "full_numbers",//分页类型--simple(只有上一页，下一页),simple_numbers（上一页，下一页和数字显示）,full（首页，尾页，上一页和下一页）,full_numbers（首页，尾页，上一页，下一页和数字显示）
        "bServerSide": true,//是否从服务器获取数据
        "processing": true,//是否显示获取数据时的进度信息，譬如获取数据中...
        "bStateSave": false,//是否保存插件信息
        "bLengthChange": false,//是否可以改变每页显示数量
        "iDisplayLength": 30,//初始化显示数量--每页显示数据数目
        "bDeferRender": true,//延期渲染
        "aLengthMenu": [15, 30, 50, 100],
        "sServerMethod": "post",
        "sAjaxDataProp": "dataList",//默认为"aaData",后台返回数据字段
        "bAutoWidth": false,//是否宽度自适应
        "bFilter": false,//是否启动搜索过滤
        "bSort": false,//是否启动各个字段排序
        "sAjaxSource": Routers.pufa.report.companyReportList,//服务器URL
        // "fnServerData":callBack,
        "aaSorting": [
            [4, "desc"]
        ],//默认排序列
        "fnServerParams": function (aoData) {//额外添加的查询参数
            aoData.push({
                "name": 'pid',
                "value": $('#groupId').val()
            });
        },
        "aoColumns": [//列定义
            {
                "sTitle": "单位",
                "mData": 'name',
                bSortable: false,
                "render": function (data, type, row) {
                    return '<span style="color:blue;cursor: pointer;" onclick="COMPANY_REPORT.listPeople(this)" data-company-name="' + row.name + '" data-company-id="' + row.id + '">' + row.name + '</span>';
                }
            },
            {
                "sTitle": "闭卷参考率",
                "mData": 'cankaolvB',
                bSortable: true,
                "render": function (data, type, row) {
                    return row.cankaolvB;
                }
            },
            {
                "sTitle": "闭卷及格率",
                "mData": 'jigelvB',
                bSortable: true,
                "render": function (data, type, row) {
                    return row.jigelvB;
                }
            },
            {
                "sTitle": "闭卷学时率",
                "mData": 'xueshilvB',
                bSortable: true,
                "render": function (data, type, row) {
                    return row.xueshilvB;
                }
            },
            {
                "sTitle": "闭卷平均分",
                "mData": 'pingjunfenB',
                bSortable: true,
                "render": function (data, type, row) {
                    return row.pingjunfenB;
                }
            },
            {
                "sTitle": "开卷参考率",
                "mData": 'cankaolvK',
                bSortable: true,
                "render": function (data, type, row) {
                    return row.cankaolvK;
                }
            },
            {
                "sTitle": "开卷及格率",
                "mData": 'jigelvK',
                bSortable: true,
                "render": function (data, type, row) {
                    return row.jigelvK;
                }
                //bSortable: false,
                //"sWidth":"9%"
            },
            {
                "sTitle": "开卷学时率",
                "mData": 'xueshilv',
                bSortable: true,
                "render": function (data, type, row) {
                    return row.xueshilvK;
                }
            },
            {
                "sTitle": "开卷平均分",
                "mData": 'pingjunfenK',
                bSortable: true,
                "render": function (data, type, row) {
                    return row.pingjunfenK;
                }
            },
            {
                "sTitle": "闭卷参考人",
                "mData": 'cankaorenB',
                bSortable: true,
                "render": function (data, type, row) {
                    return row.cankaorenB;
                }
            },
            {
                "sTitle": "开卷参考人",
                "mData": 'cankaorenK',
                bSortable: true,
                "render": function (data, type, row) {
                    return row.cankaorenK;
                }
            }
        ],
        "language": {//页面显示自定义信息
            "lengthMenu": "每页显示 _MENU_ 条数据",
            "zeroRecords": "没有数据",
            "info": "显示 _START_ 到 _END_ 条数据，总共 _TOTAL_ 条数据",
            "infoEmpty": "没有数据",
            "infoFiltered": "(从 _MAX_ 条数据中检索)",
            "oPaginate": {
                "sFirst": "首页",
                "sPrevious": "前一页",
                "sNext": "后一页",
                "sLast": "尾页"
            },
            "sSearch": "搜索",
            "sProcessing": "数据加载中..."
        },
        "searching": false,//是否显示右上角的搜索框
        "ordering": true//是否可以排序
    });
    //$('#example ,#example_wrapper').css({
    //    "font-size": "13px"
    //});
});

