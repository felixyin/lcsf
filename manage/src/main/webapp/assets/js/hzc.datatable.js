/**
 * Created by HZC on 2015/3/20.
 * datatable ajax 表单加分页 插件 的 构造函数
 * @constructor
 */
function DefaultDataTable(url, columns, tableId, searchFormId, displayLength) {
    this.tableId = tableId;
    $(tableId).addClass("table table-striped table-bordered table-hover");
    this.url = url;
    this.columns = columns;
    this.searchFormId = searchFormId;
    this.displayLength = displayLength;
    this._table = this._dataTable(this.tableId, this.url, this.columns, this.displayLength);
    var self = this;
    if (searchFormId) {// 最简单的方式
        var form = $(searchFormId);
        form.children("table").addClass("searchTable");//自动应用查询表单的样式
        var formEle = form.get(0);
        var oldSubmit = formEle.onsubmit;
        form.submit(function (evt) {
            evt.preventDefault();
            evt.stopPropagation();
            self.search(searchFormId);
            if (typeof oldSubmit == 'function') {
                oldSubmit();
            }
            return false;
        });
    }
}

/**
 * 获取jquery的datatable对象后，可以自定义一些东东了，请参照datatable文档
 * @returns {*}
 */
DefaultDataTable.prototype.getDataTable = function () {
    return this._table;
};

/**
 * 应用指定的查询表单数据到此datatable上
 * @param _formId
 * @returns {boolean}
 */
DefaultDataTable.prototype.search = function (_formId) {
    var serialize = $(_formId || this.searchFormId).serialize();
    $(this.tableId).dataTable().fnReloadAjax(this.url + '?' + serialize);//重新加载
    return false;
};

/**
 * 私有方法，不要调用
 * @param tableId 生成表格id
 * @param url 请求服务器地址
 * @param columns 查询列
 * @param displayLength false：不分页，查询全部，true：分页，默认10条
 * @param serverParams 请求服务器是传递查询参数
 * @private
 */
DefaultDataTable.prototype._dataTable = function (tableId, url, columns, displayLength) {
    var table = $(tableId);
    table.dataTable({
        "sPaginationType": "full_numbers",//分页类型--simple(只有上一页，下一页),simple_numbers（上一页，下一页和数字显示）,full（首页，尾页，上一页和下一页）,full_numbers（首页，尾页，上一页，下一页和数字显示）
        "bServerSide": true,//是否从服务器获取数据
        "processing": true,//是否显示获取数据时的进度信息，譬如获取数据中...
        "bStateSave": false,//是否保存插件信息
        "bLengthChange": false,//是否可以改变每页显示数量
        "iDisplayLength": displayLength ? Number.MAX_VALUE : 10,//初始化显示数量--每页显示数据数目
        "bDeferRender": true,//延期渲染
        "aLengthMenu": [15, 30, 50, 100],
        "sAjaxDataProp": "dataList",//默认为"aaData",o后台返回数据字段
        "bAutoWidth": true,//是否宽度自适应
        "bFilter": false,//是否启动搜索过滤
        "bSort": false,//是否启动各个字段排序
        "sAjaxSource": url,//服务器URL
        "aoColumns": columns,
        "language": {//页面显示自定义信息
            "lengthMenu": "每页显示 _MENU_ 条数据",
            "zeroRecords": "没有数据",
            "info": "显示 _START_ 到 _END_ 条数据，总共 _TOTAL_ 条数据",
            "infoEmpty": "",
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
        "ordering": false//是否可以排序
    });
};

