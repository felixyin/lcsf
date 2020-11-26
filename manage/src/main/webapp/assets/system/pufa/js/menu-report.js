/**
 * Created by HZC on 2015/7/15.
 */
var MENU_REPORT = {
    /**
     * 初始化DOM
     */
    initDom: function () {
        $.ajax({
            url: 'ManagementCtrl.ajaxGetReportGroup.do',
            type: "post",
            success: function (data) {
                if (data.length > 0) {
                    var groupTemp = $('#group-temp').html();
                    var htmlStr = '';
                    for (var i = 0; i < data.length; i++) {
                        htmlStr += Common.render(groupTemp, data[i]);
                    }
                    $('#group-list').html(htmlStr);
                    MENU_REPORT.changeEffect();
                }
            },
            error: function () {
            }
        });
    },
    /**
     * 单位统计分析报表
     * @param obj
     */
    listCompany: function (obj) {
        var groupId = $(obj).attr('data-group-id');
        var groupName = $(obj).attr('data-group-name');
        window.__company_href__ = 'ManagementCtrl.listReportCompany.do?groupId=' + groupId+'&groupName='+groupName;
        menu_click(window.__company_href__);
    },
    /**
     * 添加动态效果
     */
    changeEffect: function () {
        $('.my-group-list').hover(function () {
            $(this).addClass('alert-info');
            $(this).removeClass('alert-warning');
        }, function () {
            $(this).addClass('alert-warning');
            $(this).removeClass('alert-info');
        });
    }
}
$(function () {
    MENU_REPORT.initDom();
})