/**
 * Created by HZC on 2015/7/16.
 */
var PEOPLE_REPORT = {
    /**
     * 跳转到个人考试信息
     * @param obj
     */
    listPaper: function (obj) {
        var userId = $(obj).attr('data-user-id');
        var userName = $(obj).attr('data-user-name');
        var companyId = $('#companyId').val();
        var companyName = $('#companyName').val();
        var href = 'LpExamCtrl.PeoplePaperList.do?userId=' + userId + '&userName=' + userName + '&companyId=' + companyId + '&companyName=' + companyName;
        menu_click(href);
    }
}

$(function () {
    var t = $('#people-list').on('page.dt', function () {
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
        "sAjaxSource": Routers.pufa.report.peopleReportList,//服务器URL
        // "fnServerData":callBack,
        "aaSorting": [
            [0, "desc"]
        ],//默认排序列
        "fnServerParams": function (aoData) {//额外添加的查询参数
            aoData.push({
                "name": 'companyId',
                "value": $('#companyId').val()
            });
        },
        "aoColumns": [//列定义
            {
                "sTitle": "姓名",
                "mData": 'userName',
                bSortable: false,
                "render": function (data, type, row) {
                    return '<span onclick="PEOPLE_REPORT.listPaper(this)" style="color:blue;cursor: pointer;"' +
                        ' data-user-name="' + row.userName + '" data-user-id="' + row.id + '">' + row.userName + '</span>';
                }
            },
            {
                "sTitle": "身份证号",
                "mData": 'idCard',
                bSortable: true,
                "render": function (data, type, row) {
                    return row.idCard;
                }
            },
            {
                "sTitle": "成绩",
                "mData": 'score',
                bSortable: true,
                "render": function (data, type, row) {
                    return row.score;
                }
            },
            {
                "sTitle": "类别",
                "mData": 'type',
                bSortable: true,
                "render": function (data, type, row) {
                    return row.type;
                }
            },
            {
                "sTitle": "学时",
                "mData": 'xueshi',
                bSortable: true,
                "render": function (data, type, row) {
                    return row.xueshi;
                }
            },
            {
                "sTitle": "考试开始时间",
                "mData": 'answerStartTime',
                bSortable: true,
                "render": function (data, type, row) {
                    return row.answerStartTimeStr;
                }
            },
            {
                "sTitle": "考试结束时间",
                "mData": 'answerEndTime',
                bSortable: true,
                "render": function (data, type, row) {
                    return row.answerEndTimeStr;
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

