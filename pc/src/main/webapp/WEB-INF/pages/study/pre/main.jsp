<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../include/include_header.jsp" %>


<style>
    .my-btn-menu {
        width: 200px !important;
        margin-bottom: 40px !important;
        height: 73px;
        width: 260px !important;
        padding-top: 18px;
        font-size: 23px;
        font-family: 微软雅黑;
        border-radius: 15px;
        background-color: #1687d5 !important;
        border: 0px;
    }

    .my-min {
        font-size: 25px !important;
    }
    .my-btn-menu{
        font-weight:normal!important;
    }
</style>
<%--<div style="background-image:url(${basePath}assets/system/pufa/img/bgImg.png)!important;background-repeat:no-repeat!important;background-position: center!important;background: #ebf6f5;padding-left: 0px;padding-right: 0px;border-left: 1px solid #cccccc;border-right:1px solid #cccccc;">--%>
<div style="background:#d0f6e3;padding-left: 0px;padding-right: 0px;border-left: 1px solid #cccccc;border-right:1px solid #cccccc;">
    <div class="page-content" style="background:none!important;min-height:560px;text-align: center;">
        <div class="row" style="padding-top: 10%;">
            <a
                    href="${basePath}CommonCtrl.goTo.do?path=/WEB-INF/pages/study/ti_all.jsp"
                    class="btn btn-info my-btn-menu" style="margin-right: 70px !important;">总题库（<span
                    class="my-min">2000题</span>）
            </a>
            <a
                    href="${basePath}CommonCtrl.goTo.do?path=/WEB-INF/pages/study/ti_panduan.jsp"
                    class="btn btn-info my-btn-menu">判断题（<span class="my-min">500题</span>）
            </a>
        </div>
        <div class="row" style="margin-top: 50px;">
            <a
                    href="${basePath}CommonCtrl.goTo.do?path=/WEB-INF/pages/study/ti_danxuan.jsp"
                    class="btn btn-info my-btn-menu"
                    style="margin-right: 70px !important;">单选题（<span class="my-min">800题</span>）
            </a>
            <a
                    href="${basePath}CommonCtrl.goTo.do?path=/WEB-INF/pages/study/ti_duoxuan.jsp"
                    class="btn btn-info my-btn-menu">多选题（<span class="my-min">700题</span>）
            </a>
        </div>
    </div>
</div>
<%@include file="../../include/include_footer.jsp" %>
