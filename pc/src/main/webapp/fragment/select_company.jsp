<%@ page import="com.hzc.util.alias.S" %>
<%--
  Created by IntelliJ IDEA.
  User: yinbin
  Date: 2015/6/18
  Time: 14:08
  输出 部门的下拉框 html <br/>
  <%@include file="/fragment/select_company.jsp" %>
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="companys" value="<%=S.sysCompanyService().listStandardCompanies()%>"/>
<select name="companyId" id="company" class="col-xs-10 col-sm-10">
  <option value="">请选择单位</option>
  <c:forEach items="${companys}" var="company" varStatus="status">
    <option value="${company.id}"
            data-val="${company.name}">${company.name}</option>
  </c:forEach>
</select>
<%--<span id="company" style="line-height: 30px;cursor: pointer;color: darkblue;"--%>
<%--class="col-xs-10 col-sm-10 hzc-company"></span>--%>
