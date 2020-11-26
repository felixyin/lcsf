/**
 * Created by HZC on 2015/6/12.
 */

function CommonCompany() {
    window.______Company___obj = $('.hzc-company').attr('id');
    this.__getCompany();
    $('#' + window.______Company___obj).click(this.__alertCompany);
}
CommonCompany.prototype.__getCompany = function () {
    $.ajax({
        type: 'POST',
        url: Routers.pufa.user.getCompany,
        success: function (data) {
            $('#' + window.______Company___obj).html(data[0].name);
            var inputStr = '<input id="input' + window.______Company___obj + '" name="' + window.______Company___obj + '" type="hidden" value="">'
            $('#' + window.______Company___obj).after(inputStr);
            $('#input' + window.______Company___obj).val(data[0].id);
            var html = '<div style="height: 30px;font-weight: 700;border-bottom: 1px solid;margin-bottom: 5px;">请选择单位</div>';
            for (var i = 0; i < data.length; i++) {
                var com = data[i];
                html += '<div style="margin-right:15px;cursor:pointer;text-decoration:none;display:inline-table;height:25px;border:1px solid;margin-top:5px;padding:3px 2px 0px 2px;" onclick="____commonCompany____selectCompany(this)" data-id="' + com.id + '" data-name="' + com.name + '">' + com.name + '</div>'
            }
            window.____commonCompany____companyHtml = html;
        }
    });
};
CommonCompany.prototype.__alertCompany = function () {
    bootbox.dialog({
        message: window.____commonCompany____companyHtml
    });
};
function ____commonCompany____selectCompany(obj) {
    var companyId = $(obj).attr('data-id');
    var companyName = $(obj).attr('data-name');
    $('.bootbox-close-button').get(0).click();
    $('#' + window.______Company___obj).html(companyName);
    $('#input' + window.______Company___obj).val(companyId);
}

$(function(){
    new CommonCompany();
})
