<%--
  Created by IntelliJ IDEA.
  User: HZC
  Date: 2015/7/29
  Time: 8:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="page-content"
     style="background:#d0f6e3;padding-left: 0px;padding-right: 0px;border-left: 1px solid #cccccc;border-right:1px solid #cccccc;">
  <div class="container" style="padding-top: 20px">
  </div>
  <input type="hidden" id="userId" value="${requestScope.userId}">
  <input type="hidden" id="companyId" value="${requestScope.companyId}">
  <input type="hidden" id="companyName" value="${requestScope.companyName}">

  <div id="all-question-limit-id">
    <span style="font-size: 14px;">
      <center>
        姓名：&nbsp;${requestScope.userName}&nbsp;&nbsp;
        开始时间：&nbsp;${requestScope.start_time}&nbsp;&nbsp; 结束时间：&nbsp;${requestScope.end_time}
        &nbsp;&nbsp;${requestScope.close_exam}
        <div style="float:right;padding-right: 40px;">
          <button onclick="PEOPLE_PAPER.getBack();" class="btn btn-info btn-sm">返回</button>
        </div>
      </center>
     </span>
  </div>
</div>
<script id="template-all-question-detail-up-id" type="text/html">
  <hr style="border: 1px solid #ffffff;"/>
  <div id="all-{questionId}" data-collection-type="{collectionType}" data-question-id="{questionId}"
       class="widget-main" style="padding: 20px;padding-top: 0px!important;padding-left: 50px;">
    <div style="margin-top: 20px;">

      <p style="font-size: 18px;line-height: 40px;">
           <span>
            <span style="font-size: 18px;font-weight: 600;font-family: '楷体'">
                {seq}、</span><span style="font-family: '楷体';font-size: 18px;font-weight: 400;">（{type}）</span>{name}
            </span>
      </p>
    </div>
    <div class="control-group">

</script>

<script id="template-all-question-detail-down-id" type="text/html">
  </div>
  <span class="lbl" style="font-weight: 700;font-size:14px">
         考生答案为:&nbsp;&nbsp;{answer}
    </span>
  <span class="lbl" style="font-weight: 700;margin-left:300px;font-size: 14px">
         正确答案为:&nbsp;&nbsp;{key}
    </span>
  </div>
</script>
<script id="template-all-option-id" type="text/html">
  <label class="radio my-radio-disable" data-key="{key}" data-label="{label}">
        <span class="lbl">
            <span style="font-weight: 700;">
                {label}、
            </span>
                {name}
        </span>
  </label>
</script>
<script src="${basePath}assets/system/pufa/js/people_paper.js"></script>
