/**
 * Created by RYQ on 2015/7/28.
 */

$(function () {
    var t = $('#question-list').on('page.dt', function () {
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
        "sAjaxSource": Routers.pufa.study.getJuniorQuestionList,//服务器URL
        // "fnServerData":callBack,
        "aaSorting": [
            [0, "desc"]
        ],//默认排序列
        "fnServerParams": function (aoData,aiData) {//额外添加的查询参数
            aoData.push({
                "name": 'questionGroupId',
                "value": $('#questionGroupId').val()
            });
        },
        "aoColumns": [//列定义
            {
                "sTitle": "选项内容",
                "mData": 'name'
            },
            {
                "sTitle":"是否正确",
                "render":function(data,type,row){
                    var a=row.key;
                    if(a=='1'){
                        return "正确";
                    }else{
                        return "错误";
                    }
                }
            },
            {
                "sTitle": "操作",
                "render": function (data, type, row) {
                    return '<a onclick="QUESTION_MAIN.updateCompany(this);" style="cursor: pointer;" data-id="' + row.id + '">修改</a>&nbsp;&nbsp;' +
                        '<a onclick="QUESTION_MAIN.deleteCompany(this);" style="cursor: pointer;" data-id="' + row.id + '">删除</a>'
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
    //$('#company-list ,#company-list_wrapper').css({
    //    "font-size": "13px"
    //});
});
var QUESTION_MAIN = {
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
                            url: Routers.pufa.study.addOption,
                            type: 'post',
                            data:data ,
                            success: function (data) {
                                $('#company-list').dataTable().fnDraw(false);
                                location.reload(true);
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
     * 删除选项信息
     */
    deleteCompany: function (obj) {
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
                            url: Routers.pufa.study.deleteOption,
                            type: 'post',
                            data: {id: id},
                            success: function (data) {
                                $('#company-list').dataTable().fnDraw(false);
                                location.reload(true);
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
     * 修改选项信息
     * @param obj
     */
    updateCompany: function (obj) {
        var id = $(obj).attr('data-id');
        $.ajax({
            url: Routers.pufa.study.getOptionGroup,
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
                                    url: Routers.pufa.study.updateOption,
                                    type: 'post',
                                    data: data,
                                    success: function (data) {
                                        $('#company-list').dataTable().fnDraw(false);
                                        location.reload(true);
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

