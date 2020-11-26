var rolePower = {
    ALL: 900,
    UNIT: 500,
    DEPARTMENT: 400,
    EMPLOYEE: 110,
    WEB: 100
};
/**
 * Created by YinBin on 14-7-1.
 */
//全局ajax  若超时  则退出系统
//全局ajax  若超时  则退出系统
//$.ajaxSetup({
//    type: 'POST',
//    complete: function (xhr, status) {
//        var sessionStatus = xhr.getResponseHeader('status');
//        if (sessionStatus == 'timeout') { //session超时处理
//            top.location.href = 'login.jsp?headerlog=0&lostSession=true';
//            return;
//        }
//        try {//异常处理
//            if (status != 'success') {
//                Common.error('系统发生异常，请联系管理员！');
//                if (typeof console != 'undefined' && console != null) {
//                    console.error(xhr.responseText);
//                }
//                return;
//            }
//        } catch (e) {
//        }
//    }
//});
function CommonClass() {

}
CommonClass.prototype.confirm = function (content, fn) {
    bootbox.confirm(content, fn);
};


/**
 * 更新用户看题次数+1
 * @param questionId
 */
CommonClass.prototype.updateStyTimes = function (questionId) {
    //return;
    this.setTimeLimit();
    if (questionId)
        $.ajax({
            type: 'POST',
            url: Routers.pufa.study.updateStyTimes,
            data: {
                questionId: questionId
            },
            success: function (data) {
            },
            error: function () {
            }
        });
}

/**
 * 更新用户有效答题次数+1
 * @param questionId
 */
CommonClass.prototype.updateEffectStyTimes = function (questionId) {
    //return;
    this.setTimeLimit();
    if (questionId)
        $.ajax({
            type: 'POST',
            url: Routers.pufa.study.updateEffectStyTimes,
            data: {
                questionId: questionId
            },
            success: function (data) {
            },
            error: function () {
            }
        });
}

/**
 * 返回true，可以查看下一题
 * 返回false，时间限制，不能查看下一题
 * @returns {boolean}
 */
CommonClass.prototype.timeLimit = function () {
    if (window.____timeLimit____) {
        return true;
    } else {
        return false;
    }
}

/**
 * 设置查看下一题时间限制
 */
CommonClass.prototype.setTimeLimit = function () {
    window.____timeLimit____ = true;
    setTimeout(function () {
        window.____timeLimit____ = true;
    }, 5000);
}
/**
 * 显示异常消息的方法
 * @param html
 *
 *
 */
CommonClass.prototype.error = function (html, where, bool) {
    $.toaster({priority: 'danger', title: '', message: html});
    return;
    this._showMsg(where, html, "red", bool);

};
CommonClass.prototype.warn = function (html, where, bool) {
    $.toaster({priority: 'danger', title: '', message: html});
    //$.toaster({priority: 'warning', title: '<span class="glyphicon glyphicon-remove"></span>', message: html});
    return;
    this._showMsg(where, html, 'yellow', bool);
};
CommonClass.prototype.info = function (html, where, bool) {
    $.toaster({priority: 'info', title: '', message: html});
    //$.toaster({priority: 'info', title: '', message: html});
    return;
    this._showMsg(where, html, "green", bool);
};
CommonClass.prototype.success = function (html, where, bool) {
    $.toaster({priority: 'info', title: '', message: html});
    //$.toaster({priority: 'success', title: '<span class="glyphicon glyphicon-ok"></span>', message: html});
    return;
    this._showMsg(where, html, "blue", bool);
};
CommonClass.prototype._showMsg = function (where, html, color, bool) {
    var unique_id = $.gritter.add({
        title: '提示信息',
        text: html,
        sticky: true,
        time: ''
    });
    return;
    var self = this, c = color || "red";
    if (self.interval) clearInterval(self.interval);
    if (self.interTimeout) clearTimeout(self.interTimeout);
    if (self.timeout) clearTimeout(self.timeout);
    if (!$("#error_msg_span_id").size()) {
        this.div_se = $("<span id='error_msg_span_id' style='margin-left: 100px;'></span>");
        if (!where || !where.size())where = $("#lblTitle");
        where.after(this.div_se);
    }
//    if (!this.oldHtml_se)
//        this.oldHtml_se = this.div_se.html();
    this.span_se = $("<span style='font-size:small;font-weight:bold;letter-spacing:1px;font-family: \@宋体;color:#2a3744;'></span>");
    this.x_se = this.div_se.empty().append(/*$("<center style='display: inline-block'></center>").append*/(this.span_se.append(html)));
    this.interval = setInterval(function () {
        self.flag ? (self.span_se.css("color", "#2a3744") && (self.flag = false)) : (self.span_se.css("color", c) && (self.flag = true))
    }, 150);
    this.interTimeout = setTimeout(function () {
        clearInterval(self.interval);
        self.span_se.css("color", c);
    }, 1500);
    if (!bool)
        this.timeout = setTimeout(function () {
            self.x_se.children().fadeOut(5000, function () {
                $(this).end().empty();
                self.div_se.remove();
            }) | clearInterval(self.interval) | clearTimeout(self.interTimeout) | clearTimeout(self.timeout);// | self.div_se.html(self.oldHtml_se);
        }, 3000);
};

/**
 * 显示异常消息的方法
 * @param html
 *
 *
 */
CommonClass.prototype.error2 = function (html, where, bool) {
    this._showMsg2(where, html, "red", bool);
};
CommonClass.prototype.info2 = function (html, where, bool) {
    this._showMsg2(where, html, "green", bool);
};

CommonClass.prototype._showMsg2 = function (where, html, color, bool) {
    var self = this, c = color || "red";
    if (self.interval) clearInterval(self.interval);
    if (self.interTimeout) clearTimeout(self.interTimeout);
    if (self.timeout) clearTimeout(self.timeout);
    if (!$("#error_msg_span_id").size()) {
        this.div_se = $("<span id='error_msg_span_id' style='margin-left: 100px;'></span>");
        if (!where || !where.size())where = $("#lblTitle");
        where.after(this.div_se);
    }
//    if (!this.oldHtml_se)
//        this.oldHtml_se = this.div_se.html();
    this.span_se = $("<span style='font-size:small;font-weight:bold;letter-spacing:1px;font-family: \@宋体;color:#2a3744;'></span>");
    this.x_se = this.div_se.empty().append(/*$("<center style='display: inline-block'></center>").append*/(this.span_se.append(html)));
    this.interval = setInterval(function () {
        self.flag ? (self.span_se.css("color", "#2a3744") && (self.flag = false)) : (self.span_se.css("color", c) && (self.flag = true))
    }, 150);
    this.interTimeout = setTimeout(function () {
        clearInterval(self.interval);
        self.span_se.css("color", c);
    }, 1500);
    if (!bool)
        this.timeout = setTimeout(function () {
            self.x_se.children().fadeOut(5000, function () {
                $(this).end().empty();
                self.div_se.remove();
            }) | clearInterval(self.interval) | clearTimeout(self.interTimeout) | clearTimeout(self.timeout);// | self.div_se.html(self.oldHtml_se);
        }, 3000);
};

CommonClass.prototype.uploadValidate = function () {

};

CommonClass.prototype.template = function (templateStr, data) {
    return templateStr.replace(/\{([\w\.]*)\}/g, function (str, key) {
        var keys = key.split("."), v = data[keys.shift()];
        for (var i = 0, l = keys.length; i < l; i++)
            v = v[keys[i]];
        return (typeof v !== "undefined" && v !== null) ? v : "";
    });
};

/**
 * 在当前window窗口中打开页面
 */
CommonClass.prototype.openAtFrame = function (openUrl, backUrl) {
//    alert(backUrl || window.location.href);
//    $(document.body).append('<form action="' + openUrl + '" method="get" target="_self">' +
//        '<input type="hidden" name="backUrl" value="' + (backUrl || window.location.href ) + '"' +
//        '</form>');
//    $('form:last').submit();
//    window.open(openUrl + (openUrl.indexOf('?') != -1 ? "" : "?" ) + "&backUrl=" + decodeURI(backUrl));
    backUrl = backUrl || window.location.href;
    window.location.href = openUrl + (openUrl.indexOf('?') != -1 ? "" : "?" ) + "&backUrl=" + decodeURI(backUrl);
};

CommonClass.prototype.getSession = function (key) {
    var result = {};
    $.ajax({
        type: 'POST',
        url: 'SessionCtrl.get.do',
        data: 'key=' + key,
        async: false,
        success: function (msg) {
            result = msg;
        }
    });
    return result;
};

CommonClass.prototype.setSession = function (key, value) {
    var result = {};
    $.ajax({
        type: 'POST',
        url: 'SessionCtrl.set.do',
        data: 'key=' + key + "&value=" + value,
        async: false,
        success: function (msg) {
            result = msg;
        }
    });
    return result;
};

CommonClass.prototype.checkSessionAndToLoginJsp = function () {
    try {
        var result = Common.getSession('LoginEmployeeID');
        if (result) {
            if (!result.success) {
                top.window.location.href = basePath + 'login.jsp?headerlog=0&lostSession=true'
            }
        }
    } catch (e) {
    }
};


var Common = new CommonClass();


function CourseClass() {

}
/**
 * 用iframe方式打开课件。
 * @param basePath
 * @param courseUrl
 * @param backUrl
 */
CourseClass.prototype.openInFrame = function (basePath, courseUrl, courseId, contentId, userId, loginAPPID) {
//    $(document.body).append('<form action=\'' + basePath + 'inner/hudong.jsp\' method=\'post\' target=\'_self\'><input type=\'hidden\' name=\'courseUrl\' value=\'' + courseUrl +
//        '\'><input type=\'hidden\' name=\'backUrl\' value=\'' + (top.window.location.href) + '\'>' +
//        '<input type=\'hidden\' name=\'courseId\' value=\'' + courseId + '\'>' +
//        '<input type=\'hidden\' name=\'contentId\' value=\'' + contentId + '\'>' +
//        '<input type=\'hidden\' name=\'userId\' value=\'' + userId + '\'>' +
//        '<input type=\'hidden\' name=\'loginAPPID\' value=\'' + loginAPPID + '\'>' +
//        '</form>');
//    $('form:last').submit();
//    window.open(courseUrl, '课件', 'top=0,left=0,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no', true);

    var Main = {
        init: function () {
            var self = this;
            return function () {
                self.msgDiv = $('#lblTitle');
                self.iframe = $('#iframeId');
                self.back = $('#backId');
                self.eventBack();
                self.verify();
            }
        },
        getApi: function () {
            if (this.api)return this.api;
            var win = window, findAttempts = 0, findAttemptLimit = 500;
            while ((!win.FmvmApi) && (win.parent) && (win.parent != win) && (findAttempts <= findAttemptLimit)) {
                findAttempts++;
                win = win.parent;
            }
            this.api = win.FmvmApi;
            return this.api;
        },
        verify: function () {
            var self = this;
            var api = self.getApi();
            api.basePath = '';

            if (!api) {
                alert('程序bug：没有配置FmvmApi.js');
                return;
            }
            api.putData('dialog', this);
            api.putData('courseId', courseId);

            function success() {
//                    self.setMsg('指纹验证成功');
                self.showCourse();
            }

            function failed() {
                self.setMsg('验证失败，请再次录入指纹');
                self.verify();
            }

            function error(code, msg, e) {
                alert(msg);
            }

            api.putData('Msg', function () {
                self.setMsg('请录入指纹（录入指纹前，请确保安装了控件、插入指纹验证鼠标、并点击一下此课件窗口）');
            });
            api.verify(success, failed, error, false);
        },
        setMsg: function (msg) {
            alert(msg);
        },
        showCourse: function () {
//            document.getElementById("iframeId").src = courseUrl;
            var bu = window.location.href;
            Common.LocalStorage.setItem('backUrl', bu)
            if (courseUrl.indexOf("?") > -1) {
                courseUrl = courseUrl + "&backUrl=" + bu;
            } else {
                courseUrl = courseUrl + "?backUrl=" + bu;
            }
            window.location.href = courseUrl;
//        document.getElementById("iframeId").src = '14022407371202967367/kb_index.html';
        }
    };

    Main.verify();
//    window.location.href = courseUrl;
};

var Course = new CourseClass();


