/**
 * 禁用相关快捷键
 * jQuery插件
 * 本插件依赖jQuery
 * 例如：禁用f5，调用方法$.disableF5();
 *      启用f5，调用方法$.enableF5();
 * 说明：部分快捷键不能被禁用
 *
 * Created by HZC on 2015/6/24.
 */
(function ($) {
    "use strict";

    var _emptyFunc = function () {
    };

    $.disableF5 = _emptyFunc;
    $.enableF5 = _emptyFunc;
    $.disableF6 = _emptyFunc;
    $.enableF6 = _emptyFunc;
    $.disableF7 = _emptyFunc;
    $.enableF7 = _emptyFunc;
    $.disableCtrlAndF5 = _emptyFunc;
    $.enableCtrlAndF5 = _emptyFunc;
    $.disableAltAndF5 = _emptyFunc;
    $.enableAltAndF5 = _emptyFunc;

    /*
     * 配置对象
     * keyName:需要禁用的快捷键
     * keyCode:禁用快捷键的键值
     */
    var KEYS_CONFIG = [
        {keyName: 'f5', keyCode: 116},
        {keyName: 'f6', keyCode: 117},
        {keyName: 'f7', keyCode: 118},
        {keyName: 'ctrl+f5', keyCode: 116},
        {keyName: 'alt+f5', keyCode: 116}
    ];
    var flag = {};

    function _gen() {
        var obj = {};

        $.each(KEYS_CONFIG, function (i, n) {
            var keyName = n.keyName.charAt(0).toUpperCase() + n.keyName.substring(1),
                    keyCode = n.keyCode;

            var hotKeyName = '';
            if (keyName.indexOf("+") != -1) {
                hotKeyName = keyName.substring(0, keyName.indexOf('+')).toLowerCase();
                keyName = keyName.substring(0, keyName.indexOf('+')) + 'And' + keyName.substring(keyName.indexOf('+') + 1).toUpperCase();
            }

            obj['disable' + keyName] = function () {

                flag[keyName] = true;
                jQuery(window).keydown(function (evt) {

                    var isHot = (hotKeyName ? evt[hotKeyName + 'Key'] : true);
                    if (evt.keyCode == keyCode
                            && isHot
                            && flag[keyName]) {
                        evt.stopPropagation();
                        evt.preventDefault();
                        return false;
                    }

                });

            };

            obj['enable' + keyName] = function () {
                flag[keyName] = false;
            };

        });
        return obj;
    }

    var obj = _gen();

    obj.disableMouseRight = function () {
        flag['MourseRight'] = true;
        $(document).mousedown(function (evt) {
            if (evt.button == 2 && flag['MourseRight']) {
                evt.stopPropagation();
                evt.preventDefault();
                return false;
            }
        });
    };

    obj.enableMouseRight = function () {
        flag['MourseRight'] = false;
    };

    $.extend(obj);

})(jQuery);


//$.disableF5();
//$.disableCtrlAndF5();