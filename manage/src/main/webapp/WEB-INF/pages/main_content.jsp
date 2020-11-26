<%--
  Created by IntelliJ IDEA.
  User: yinbin
  Date: 2015/3/28
  Time: 10:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="main-content">
  <div class="breadcrumbs" id="breadcrumbs">
    <script type="text/javascript">
      try {
        ace.settings.check('breadcrumbs', 'fixed')
      } catch (e) {
      }
    </script>

    <ul class="breadcrumb" id="navigation-id">
      <li>
        <i class="icon-home home-icon"></i>
        <a href="javascript:(function(){$('.nav-list').children('li').first().children('a').click();})()">首页</a>
      </li>
      <li class="active"></li>
    </ul>
    <!-- .breadcrumb -->

    <div class="nav-search" id="nav-search">
      <form class="form-search" style="display: none;">
								<span class="input-icon">
									<input type="text" placeholder="Search ..." class="nav-search-input"
                         id="nav-search-input" autocomplete="off"/>
									<i class="icon-search nav-search-icon"></i>
								</span>
      </form>
    </div>
    <!-- #nav-search -->
  </div>

  <div class="page-content" style="padding: 15px 15px;">
    <div class="row">
      <div class="col-xs-12" id="main-content-id">
        <!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
        <jsp:include page="about.jsp"></jsp:include>
      </div>
    </div>
  </div>
  <!-- /.page-content -->
</div>
<!-- /.main-content -->