<%--
  Created by IntelliJ IDEA.
  User: yinbin
  Date: 2015/3/28
  Time: 8:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="page-header">
  <h1>
    控制台
    <small>
      <i class="icon-double-angle-right"></i>
      查看
    </small>
  </h1>
</div>
<div class="row">
  <div class="col-xs-12">
    <!-- PAGE CONTENT BEGINS -->
    <div class="row">
      <div class="col-sm-10 infobox-container">
        <div class="infobox infobox-green  ">
          <div class="infobox-icon">
            <i class="icon-comments"></i>
          </div>
          <div class="infobox-data">
            <span class="infobox-data-number">32</span>

            <div class="infobox-content">企业注册数</div>
          </div>
        </div>

        <div class="infobox infobox-blue  ">
          <div class="infobox-icon">
            <i class="icon-twitter"></i>
          </div>

          <div class="infobox-data">
            <span class="infobox-data-number">8820</span>

            <div class="infobox-content">系统注册人数</div>
          </div>
        </div>

        <div class="infobox infobox-pink  ">
          <div class="infobox-icon">
            <i class="icon-shopping-cart"></i>
          </div>

          <div class="infobox-data">
            <span class="infobox-data-number">50</span>

            <div class="infobox-content">系统课程数</div>
          </div>
        </div>

        <div class="infobox infobox-red  ">
          <div class="infobox-icon">
            <i class="icon-beaker"></i>
          </div>

          <div class="infobox-data">
            <span class="infobox-data-number">2</span>

            <div class="infobox-content">已选课程</div>
          </div>
        </div>

        <div class="infobox infobox-blue2  ">
          <div class="infobox-icon">
            <i class="icon-angle-left"></i>
          </div>
          <div class="infobox-data">
            <span class="infobox-data-number">954</span>

            <div class="infobox-content">今日登录人数</div>
          </div>
        </div>

        <div class="infobox infobox-red  ">
          <div class="infobox-icon">
            <i class="icon-beaker"></i>
          </div>

          <div class="infobox-data">
            <span class="infobox-data-number">7</span>

            <div class="infobox-content">调查</div>
          </div>
        </div>

        <div class="infobox infobox-orange2  ">
          <div class="infobox-dark">
            <span class="sparkline" data-values="196,128,202,177,154,94,100,170,224"></span>
          </div>

          <div class="infobox-data">
            <span class="infobox-data-number">6,251</span>

            <div class="infobox-content">页面查看次数</div>
          </div>
        </div>

        <div class="infobox infobox-green  ">
          <div class="infobox-icon">
            <i class="icon-comments"></i>
          </div>

          <div class="infobox-data">
            <span class="infobox-data-number">58</span>

            <div class="infobox-content">我的评论</div>
          </div>
        </div>
      </div>
    </div>
    <!-- /row -->
    <div class="hr hr12 hr-dotted"></div>

    <div class="row">
      <div class="col-sm-6">
        <div class="widget-box transparent" id="recent-box">
          <div class="widget-header">
            <h4 class="lighter smaller">
              <i class="icon-rss orange"></i>
              系统统计
            </h4>

            <div class="widget-toolbar no-border">
              <ul class="nav nav-tabs" id="recent-tab">
                <li class="active">
                  <a data-toggle="tab" href="#task-tab">登录日志</a>
                </li>

                <li>
                  <a data-toggle="tab" href="#member-tab">考试排行榜</a>
                </li>

                <li>
                  <a data-toggle="tab" href="#comment-tab">选课排行榜</a>
                </li>
              </ul>
            </div>
          </div>

          <div class="widget-body">
            <div class="widget-main padding-4">
              <div class="tab-content padding-8 overflow-visible">
                <div id="task-tab" class="tab-pane active">
                  <h4 class="smaller lighter green">
                    <i class="icon-list"></i>
                    可拖拽排序列表
                  </h4>

                  <ul id="tasks" class="item-list">
                    <li class="item-orange clearfix">
                      <label class="inline">
                        <input type="checkbox" class="ace"/>
                        <span class="lbl"> 问答</span>
                      </label>

                      <div class="pull-right easy-pie-chart percentage"
                           data-size="30" data-color="#ECCB71" data-percent="42">
                        <span class="percent">42</span>%
                      </div>
                    </li>

                    <li class="item-red clearfix">
                      <label class="inline">
                        <input type="checkbox" class="ace"/>
                        <span class="lbl"> BUG修复</span>
                      </label>

                      <div class="pull-right action-buttons">
                        <a href="#" class="blue">
                          <i class="icon-pencil bigger-130"></i>
                        </a>

                        <span class="vbar"></span>

                        <a href="#" class="red">
                          <i class="icon-trash bigger-130"></i>
                        </a>

                        <span class="vbar"></span>

                        <a href="#" class="green">
                          <i class="icon-flag bigger-130"></i>
                        </a>
                      </div>
                    </li>

                    <li class="item-default clearfix">
                      <label class="inline">
                        <input type="checkbox" class="ace"/>
                        <span class="lbl">添加新的特征</span>
                      </label>

                      <div class="inline pull-right position-relative dropdown-hover">
                        <button class="btn btn-minier bigger btn-primary">
                          <i class="icon-cog icon-only bigger-120"></i>
                        </button>

                        <ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-caret dropdown-close pull-right">
                          <li>
                            <a href="#" class="tooltip-success"
                               data-rel="tooltip"
                               title="Mark&nbsp;as&nbsp;done">
																					<span class="green">
																						<i class="icon-ok bigger-110"></i>
																					</span>
                            </a>
                          </li>

                          <li>
                            <a href="#" class="tooltip-error"
                               data-rel="tooltip" title="Delete">
																					<span class="red">
																						<i class="icon-trash bigger-110"></i>
																					</span>
                            </a>
                          </li>
                        </ul>
                      </div>
                    </li>

                    <li class="item-blue clearfix">
                      <label class="inline">
                        <input type="checkbox" class="ace"/>
                        <span class="lbl"> 更新模版脚本</span>
                      </label>
                    </li>

                    <li class="item-grey clearfix">
                      <label class="inline">
                        <input type="checkbox" class="ace"/>
                        <span class="lbl"> 添加新皮肤</span>
                      </label>
                    </li>

                    <li class="item-green clearfix">
                      <label class="inline">
                        <input type="checkbox" class="ace"/>
                        <span class="lbl"> 升级服务端</span>
                      </label>
                    </li>

                    <li class="item-pink clearfix">
                      <label class="inline">
                        <input type="checkbox" class="ace"/>
                        <span class="lbl"> 清理垃圾</span>
                      </label>
                    </li>
                  </ul>
                </div>

                <div id="member-tab" class="tab-pane">
                  <div class="clearfix">
                    <div class="itemdiv memberdiv">
                      <div class="user">
                        <img alt="Bob Doe's avatar"
                             src="${basePath}assets/avatars/user.jpg"/>
                      </div>

                      <div class="body">
                        <div class="name">
                          <a href="#">Bob Doe</a>
                        </div>

                        <div class="time">
                          <i class="icon-time"></i>
                          <span class="green">20 min</span>
                        </div>

                        <div>
                          <span class="label label-warning label-sm">pending</span>

                          <div class="inline position-relative">
                            <button class="btn btn-minier bigger btn-yellow btn-no-border dropdown-toggle"
                                    data-toggle="dropdown">
                              <i class="icon-angle-down icon-only bigger-120"></i>
                            </button>

                            <ul class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
                              <li>
                                <a href="#" class="tooltip-success"
                                   data-rel="tooltip" title="Approve">
																							<span class="green">
																								<i class="icon-ok bigger-110"></i>
																							</span>
                                </a>
                              </li>

                              <li>
                                <a href="#" class="tooltip-warning"
                                   data-rel="tooltip" title="Reject">
																							<span class="orange">
																								<i class="icon-remove bigger-110"></i>
																							</span>
                                </a>
                              </li>

                              <li>
                                <a href="#" class="tooltip-error"
                                   data-rel="tooltip" title="Delete">
																							<span class="red">
																								<i class="icon-trash bigger-110"></i>
																							</span>
                                </a>
                              </li>
                            </ul>
                          </div>
                        </div>
                      </div>
                    </div>

                    <div class="itemdiv memberdiv">
                      <div class="user">
                        <img alt="Joe Doe's avatar"
                             src="${basePath}assets/avatars/avatar2.png"/>
                      </div>

                      <div class="body">
                        <div class="name">
                          <a href="#">Joe Doe</a>
                        </div>

                        <div class="time">
                          <i class="icon-time"></i>
                          <span class="green">1 hour</span>
                        </div>

                        <div>
                          <span class="label label-warning label-sm">pending</span>

                          <div class="inline position-relative">
                            <button class="btn btn-minier bigger btn-yellow btn-no-border dropdown-toggle"
                                    data-toggle="dropdown">
                              <i class="icon-angle-down icon-only bigger-120"></i>
                            </button>

                            <ul class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
                              <li>
                                <a href="#" class="tooltip-success"
                                   data-rel="tooltip" title="Approve">
																							<span class="green">
																								<i class="icon-ok bigger-110"></i>
																							</span>
                                </a>
                              </li>

                              <li>
                                <a href="#" class="tooltip-warning"
                                   data-rel="tooltip" title="Reject">
																							<span class="orange">
																								<i class="icon-remove bigger-110"></i>
																							</span>
                                </a>
                              </li>

                              <li>
                                <a href="#" class="tooltip-error"
                                   data-rel="tooltip" title="Delete">
																							<span class="red">
																								<i class="icon-trash bigger-110"></i>
																							</span>
                                </a>
                              </li>
                            </ul>
                          </div>
                        </div>
                      </div>
                    </div>

                    <div class="itemdiv memberdiv">
                      <div class="user">
                        <img alt="Jim Doe's avatar"
                             src="${basePath}assets/avatars/avatar.png"/>
                      </div>

                      <div class="body">
                        <div class="name">
                          <a href="#">Jim Doe</a>
                        </div>

                        <div class="time">
                          <i class="icon-time"></i>
                          <span class="green">2 hour</span>
                        </div>

                        <div>
                          <span class="label label-warning label-sm">pending</span>

                          <div class="inline position-relative">
                            <button class="btn btn-minier bigger btn-yellow btn-no-border dropdown-toggle"
                                    data-toggle="dropdown">
                              <i class="icon-angle-down icon-only bigger-120"></i>
                            </button>

                            <ul class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
                              <li>
                                <a href="#" class="tooltip-success"
                                   data-rel="tooltip" title="Approve">
																							<span class="green">
																								<i class="icon-ok bigger-110"></i>
																							</span>
                                </a>
                              </li>

                              <li>
                                <a href="#" class="tooltip-warning"
                                   data-rel="tooltip" title="Reject">
																							<span class="orange">
																								<i class="icon-remove bigger-110"></i>
																							</span>
                                </a>
                              </li>

                              <li>
                                <a href="#" class="tooltip-error"
                                   data-rel="tooltip" title="Delete">
																							<span class="red">
																								<i class="icon-trash bigger-110"></i>
																							</span>
                                </a>
                              </li>
                            </ul>
                          </div>
                        </div>
                      </div>
                    </div>

                    <div class="itemdiv memberdiv">
                      <div class="user">
                        <img alt="Alex Doe's avatar"
                             src="${basePath}assets/avatars/avatar5.png"/>
                      </div>

                      <div class="body">
                        <div class="name">
                          <a href="#">Alex Doe</a>
                        </div>

                        <div class="time">
                          <i class="icon-time"></i>
                          <span class="green">3 hour</span>
                        </div>

                        <div>
                          <span class="label label-danger label-sm">blocked</span>
                        </div>
                      </div>
                    </div>

                    <div class="itemdiv memberdiv">
                      <div class="user">
                        <img alt="Bob Doe's avatar"
                             src="${basePath}assets/avatars/avatar2.png"/>
                      </div>

                      <div class="body">
                        <div class="name">
                          <a href="#">Bob Doe</a>
                        </div>

                        <div class="time">
                          <i class="icon-time"></i>
                          <span class="green">6 hour</span>
                        </div>

                        <div>
                          <span class="label label-success label-sm arrowed-in">approved</span>
                        </div>
                      </div>
                    </div>

                    <div class="itemdiv memberdiv">
                      <div class="user">
                        <img alt="Susan's avatar"
                             src="${basePath}assets/avatars/avatar3.png"/>
                      </div>

                      <div class="body">
                        <div class="name">
                          <a href="#">Susan</a>
                        </div>

                        <div class="time">
                          <i class="icon-time"></i>
                          <span class="green">yesterday</span>
                        </div>

                        <div>
                          <span class="label label-success label-sm arrowed-in">approved</span>
                        </div>
                      </div>
                    </div>

                    <div class="itemdiv memberdiv">
                      <div class="user">
                        <img alt="Phil Doe's avatar"
                             src="${basePath}assets/avatars/avatar4.png"/>
                      </div>

                      <div class="body">
                        <div class="name">
                          <a href="#">Phil Doe</a>
                        </div>

                        <div class="time">
                          <i class="icon-time"></i>
                          <span class="green">2 days ago</span>
                        </div>

                        <div>
                          <span class="label label-info label-sm arrowed-in arrowed-in-right">online</span>
                        </div>
                      </div>
                    </div>

                    <div class="itemdiv memberdiv">
                      <div class="user">
                        <img alt="Alexa Doe's avatar"
                             src="${basePath}assets/avatars/avatar1.png"/>
                      </div>

                      <div class="body">
                        <div class="name">
                          <a href="#">Alexa Doe</a>
                        </div>

                        <div class="time">
                          <i class="icon-time"></i>
                          <span class="green">3天以前</span>
                        </div>

                        <div>
                          <span class="label label-success label-sm arrowed-in">approved</span>
                        </div>
                      </div>
                    </div>
                  </div>

                  <div class="center">
                    <i class="icon-group icon-2x green"></i>

                    &nbsp;
                    <a href="#">
                      查看所有会员 &nbsp;
                      <i class="icon-arrow-right"></i>
                    </a>
                  </div>

                  <div class="hr hr-double hr8"></div>
                </div>
                <!-- member-tab -->

                <div id="comment-tab" class="tab-pane">
                  <div class="comments">
                    <div class="itemdiv commentdiv">
                      <div class="user">
                        <img alt="Bob Doe's Avatar"
                             src="${basePath}assets/avatars/avatar.png"/>
                      </div>

                      <div class="body">
                        <div class="name">
                          <a href="#">Bob Doe</a>
                        </div>

                        <div class="time">
                          <i class="icon-time"></i>
                          <span class="green">6 min</span>
                        </div>

                        <div class="text">
                          <i class="icon-quote-left"></i>
                          Lorem ipsum dolor sit amet, consectetur adipiscing
                          elit. Quisque commodo massa sed ipsum porttitor
                          facilisis &hellip;
                        </div>
                      </div>

                      <div class="tools">
                        <div class="inline position-relative">
                          <button class="btn btn-minier bigger btn-yellow dropdown-toggle"
                                  data-toggle="dropdown">
                            <i class="icon-angle-down icon-only bigger-120"></i>
                          </button>

                          <ul class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
                            <li>
                              <a href="#" class="tooltip-success"
                                 data-rel="tooltip" title="Approve">
																						<span class="green">
																							<i class="icon-ok bigger-110"></i>
																						</span>
                              </a>
                            </li>

                            <li>
                              <a href="#" class="tooltip-warning"
                                 data-rel="tooltip" title="Reject">
																						<span class="orange">
																							<i class="icon-remove bigger-110"></i>
																						</span>
                              </a>
                            </li>

                            <li>
                              <a href="#" class="tooltip-error"
                                 data-rel="tooltip" title="Delete">
																						<span class="red">
																							<i class="icon-trash bigger-110"></i>
																						</span>
                              </a>
                            </li>
                          </ul>
                        </div>
                      </div>
                    </div>

                    <div class="itemdiv commentdiv">
                      <div class="user">
                        <img alt="Jennifer's Avatar"
                             src="${basePath}assets/avatars/avatar1.png"/>
                      </div>

                      <div class="body">
                        <div class="name">
                          <a href="#">Jennifer</a>
                        </div>

                        <div class="time">
                          <i class="icon-time"></i>
                          <span class="blue">15 min</span>
                        </div>

                        <div class="text">
                          <i class="icon-quote-left"></i>
                          Lorem ipsum dolor sit amet, consectetur adipiscing
                          elit. Quisque commodo massa sed ipsum porttitor
                          facilisis &hellip;
                        </div>
                      </div>

                      <div class="tools">
                        <div class="action-buttons bigger-125">
                          <a href="#">
                            <i class="icon-pencil blue"></i>
                          </a>

                          <a href="#">
                            <i class="icon-trash red"></i>
                          </a>
                        </div>
                      </div>
                    </div>

                    <div class="itemdiv commentdiv">
                      <div class="user">
                        <img alt="Joe's Avatar"
                             src="${basePath}assets/avatars/avatar2.png"/>
                      </div>

                      <div class="body">
                        <div class="name">
                          <a href="#">Joe</a>
                        </div>

                        <div class="time">
                          <i class="icon-time"></i>
                          <span class="orange">22 min</span>
                        </div>

                        <div class="text">
                          <i class="icon-quote-left"></i>
                          Lorem ipsum dolor sit amet, consectetur adipiscing
                          elit. Quisque commodo massa sed ipsum porttitor
                          facilisis &hellip;
                        </div>
                      </div>

                      <div class="tools">
                        <div class="action-buttons bigger-125">
                          <a href="#">
                            <i class="icon-pencil blue"></i>
                          </a>

                          <a href="#">
                            <i class="icon-trash red"></i>
                          </a>
                        </div>
                      </div>
                    </div>

                    <div class="itemdiv commentdiv">
                      <div class="user">
                        <img alt="Rita's Avatar"
                             src="${basePath}assets/avatars/avatar3.png"/>
                      </div>

                      <div class="body">
                        <div class="name">
                          <a href="#">Rita</a>
                        </div>

                        <div class="time">
                          <i class="icon-time"></i>
                          <span class="red">50 min</span>
                        </div>

                        <div class="text">
                          <i class="icon-quote-left"></i>
                          Lorem ipsum dolor sit amet, consectetur adipiscing
                          elit. Quisque commodo massa sed ipsum porttitor
                          facilisis &hellip;
                        </div>
                      </div>

                      <div class="tools">
                        <div class="action-buttons bigger-125">
                          <a href="#">
                            <i class="icon-pencil blue"></i>
                          </a>

                          <a href="#">
                            <i class="icon-trash red"></i>
                          </a>
                        </div>
                      </div>
                    </div>
                  </div>

                  <div class="hr hr8"></div>

                  <div class="center">
                    <i class="icon-comments-alt icon-2x green"></i>

                    &nbsp;
                    <a href="#">
                      See all comments &nbsp;
                      <i class="icon-arrow-right"></i>
                    </a>
                  </div>

                  <div class="hr hr-double hr8"></div>
                </div>
              </div>
            </div>
            <!-- /widget-main -->
          </div>
          <!-- /widget-body -->
        </div>
        <!-- /widget-box -->
      </div>
      <!-- /span -->
    </div>
    <!-- /row -->

    <div class="hr hr12 hr-dotted"></div>
    <div class="row">
      <div class="col-sm-6">
        <div class="widget-box transparent" id="recent-box">
          <div class="widget-header">
            <h4 class="lighter smaller">
              <i class="icon-rss orange"></i>
              推荐课程
            </h4>

            <div class="widget-toolbar no-border">
              <ul class="nav nav-tabs" id="recent-tab">
                <li class="active">
                  <a data-toggle="tab" href="#task-tab">登录日志</a>
                </li>

                <li>
                  <a data-toggle="tab" href="#member-tab">考试排行榜</a>
                </li>

                <li>
                  <a data-toggle="tab" href="#comment-tab">选课排行榜</a>
                </li>
              </ul>
            </div>
          </div>

          <div class="widget-body">
            <div class="widget-main padding-4">
              <div class="tab-content padding-8 overflow-visible">
                <div id="task-tab" class="tab-pane active">
                  <h4 class="smaller lighter green">
                    <i class="icon-list"></i>
                    可拖拽排序列表
                  </h4>

                  <ul id="tasks" class="item-list">
                    <li class="item-orange clearfix">
                      <label class="inline">
                        <input type="checkbox" class="ace"/>
                        <span class="lbl"> 问答</span>
                      </label>

                      <div class="pull-right easy-pie-chart percentage"
                           data-size="30" data-color="#ECCB71" data-percent="42">
                        <span class="percent">42</span>%
                      </div>
                    </li>

                    <li class="item-red clearfix">
                      <label class="inline">
                        <input type="checkbox" class="ace"/>
                        <span class="lbl"> BUG修复</span>
                      </label>

                      <div class="pull-right action-buttons">
                        <a href="#" class="blue">
                          <i class="icon-pencil bigger-130"></i>
                        </a>

                        <span class="vbar"></span>

                        <a href="#" class="red">
                          <i class="icon-trash bigger-130"></i>
                        </a>

                        <span class="vbar"></span>

                        <a href="#" class="green">
                          <i class="icon-flag bigger-130"></i>
                        </a>
                      </div>
                    </li>

                    <li class="item-default clearfix">
                      <label class="inline">
                        <input type="checkbox" class="ace"/>
                        <span class="lbl">添加新的特征</span>
                      </label>

                      <div class="inline pull-right position-relative dropdown-hover">
                        <button class="btn btn-minier bigger btn-primary">
                          <i class="icon-cog icon-only bigger-120"></i>
                        </button>

                        <ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-caret dropdown-close pull-right">
                          <li>
                            <a href="#" class="tooltip-success"
                               data-rel="tooltip"
                               title="Mark&nbsp;as&nbsp;done">
																					<span class="green">
																						<i class="icon-ok bigger-110"></i>
																					</span>
                            </a>
                          </li>

                          <li>
                            <a href="#" class="tooltip-error"
                               data-rel="tooltip" title="Delete">
																					<span class="red">
																						<i class="icon-trash bigger-110"></i>
																					</span>
                            </a>
                          </li>
                        </ul>
                      </div>
                    </li>

                    <li class="item-blue clearfix">
                      <label class="inline">
                        <input type="checkbox" class="ace"/>
                        <span class="lbl"> 更新模版脚本</span>
                      </label>
                    </li>

                    <li class="item-grey clearfix">
                      <label class="inline">
                        <input type="checkbox" class="ace"/>
                        <span class="lbl"> 添加新皮肤</span>
                      </label>
                    </li>

                    <li class="item-green clearfix">
                      <label class="inline">
                        <input type="checkbox" class="ace"/>
                        <span class="lbl"> 升级服务端</span>
                      </label>
                    </li>

                    <li class="item-pink clearfix">
                      <label class="inline">
                        <input type="checkbox" class="ace"/>
                        <span class="lbl"> 清理垃圾</span>
                      </label>
                    </li>
                  </ul>
                </div>

                <div id="member-tab" class="tab-pane">
                  <div class="clearfix">
                    <div class="itemdiv memberdiv">
                      <div class="user">
                        <img alt="Bob Doe's avatar"
                             src="${basePath}assets/avatars/user.jpg"/>
                      </div>

                      <div class="body">
                        <div class="name">
                          <a href="#">Bob Doe</a>
                        </div>

                        <div class="time">
                          <i class="icon-time"></i>
                          <span class="green">20 min</span>
                        </div>

                        <div>
                          <span class="label label-warning label-sm">pending</span>

                          <div class="inline position-relative">
                            <button class="btn btn-minier bigger btn-yellow btn-no-border dropdown-toggle"
                                    data-toggle="dropdown">
                              <i class="icon-angle-down icon-only bigger-120"></i>
                            </button>

                            <ul class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
                              <li>
                                <a href="#" class="tooltip-success"
                                   data-rel="tooltip" title="Approve">
																							<span class="green">
																								<i class="icon-ok bigger-110"></i>
																							</span>
                                </a>
                              </li>

                              <li>
                                <a href="#" class="tooltip-warning"
                                   data-rel="tooltip" title="Reject">
																							<span class="orange">
																								<i class="icon-remove bigger-110"></i>
																							</span>
                                </a>
                              </li>

                              <li>
                                <a href="#" class="tooltip-error"
                                   data-rel="tooltip" title="Delete">
																							<span class="red">
																								<i class="icon-trash bigger-110"></i>
																							</span>
                                </a>
                              </li>
                            </ul>
                          </div>
                        </div>
                      </div>
                    </div>

                    <div class="itemdiv memberdiv">
                      <div class="user">
                        <img alt="Joe Doe's avatar"
                             src="${basePath}assets/avatars/avatar2.png"/>
                      </div>

                      <div class="body">
                        <div class="name">
                          <a href="#">Joe Doe</a>
                        </div>

                        <div class="time">
                          <i class="icon-time"></i>
                          <span class="green">1 hour</span>
                        </div>

                        <div>
                          <span class="label label-warning label-sm">pending</span>

                          <div class="inline position-relative">
                            <button class="btn btn-minier bigger btn-yellow btn-no-border dropdown-toggle"
                                    data-toggle="dropdown">
                              <i class="icon-angle-down icon-only bigger-120"></i>
                            </button>

                            <ul class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
                              <li>
                                <a href="#" class="tooltip-success"
                                   data-rel="tooltip" title="Approve">
																							<span class="green">
																								<i class="icon-ok bigger-110"></i>
																							</span>
                                </a>
                              </li>

                              <li>
                                <a href="#" class="tooltip-warning"
                                   data-rel="tooltip" title="Reject">
																							<span class="orange">
																								<i class="icon-remove bigger-110"></i>
																							</span>
                                </a>
                              </li>

                              <li>
                                <a href="#" class="tooltip-error"
                                   data-rel="tooltip" title="Delete">
																							<span class="red">
																								<i class="icon-trash bigger-110"></i>
																							</span>
                                </a>
                              </li>
                            </ul>
                          </div>
                        </div>
                      </div>
                    </div>

                    <div class="itemdiv memberdiv">
                      <div class="user">
                        <img alt="Jim Doe's avatar"
                             src="${basePath}assets/avatars/avatar.png"/>
                      </div>

                      <div class="body">
                        <div class="name">
                          <a href="#">Jim Doe</a>
                        </div>

                        <div class="time">
                          <i class="icon-time"></i>
                          <span class="green">2 hour</span>
                        </div>

                        <div>
                          <span class="label label-warning label-sm">pending</span>

                          <div class="inline position-relative">
                            <button class="btn btn-minier bigger btn-yellow btn-no-border dropdown-toggle"
                                    data-toggle="dropdown">
                              <i class="icon-angle-down icon-only bigger-120"></i>
                            </button>

                            <ul class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
                              <li>
                                <a href="#" class="tooltip-success"
                                   data-rel="tooltip" title="Approve">
																							<span class="green">
																								<i class="icon-ok bigger-110"></i>
																							</span>
                                </a>
                              </li>

                              <li>
                                <a href="#" class="tooltip-warning"
                                   data-rel="tooltip" title="Reject">
																							<span class="orange">
																								<i class="icon-remove bigger-110"></i>
																							</span>
                                </a>
                              </li>

                              <li>
                                <a href="#" class="tooltip-error"
                                   data-rel="tooltip" title="Delete">
																							<span class="red">
																								<i class="icon-trash bigger-110"></i>
																							</span>
                                </a>
                              </li>
                            </ul>
                          </div>
                        </div>
                      </div>
                    </div>

                    <div class="itemdiv memberdiv">
                      <div class="user">
                        <img alt="Alex Doe's avatar"
                             src="${basePath}assets/avatars/avatar5.png"/>
                      </div>

                      <div class="body">
                        <div class="name">
                          <a href="#">Alex Doe</a>
                        </div>

                        <div class="time">
                          <i class="icon-time"></i>
                          <span class="green">3 hour</span>
                        </div>

                        <div>
                          <span class="label label-danger label-sm">blocked</span>
                        </div>
                      </div>
                    </div>

                    <div class="itemdiv memberdiv">
                      <div class="user">
                        <img alt="Bob Doe's avatar"
                             src="${basePath}assets/avatars/avatar2.png"/>
                      </div>

                      <div class="body">
                        <div class="name">
                          <a href="#">Bob Doe</a>
                        </div>

                        <div class="time">
                          <i class="icon-time"></i>
                          <span class="green">6 hour</span>
                        </div>

                        <div>
                          <span class="label label-success label-sm arrowed-in">approved</span>
                        </div>
                      </div>
                    </div>

                    <div class="itemdiv memberdiv">
                      <div class="user">
                        <img alt="Susan's avatar"
                             src="${basePath}assets/avatars/avatar3.png"/>
                      </div>

                      <div class="body">
                        <div class="name">
                          <a href="#">Susan</a>
                        </div>

                        <div class="time">
                          <i class="icon-time"></i>
                          <span class="green">yesterday</span>
                        </div>

                        <div>
                          <span class="label label-success label-sm arrowed-in">approved</span>
                        </div>
                      </div>
                    </div>

                    <div class="itemdiv memberdiv">
                      <div class="user">
                        <img alt="Phil Doe's avatar"
                             src="${basePath}assets/avatars/avatar4.png"/>
                      </div>

                      <div class="body">
                        <div class="name">
                          <a href="#">Phil Doe</a>
                        </div>

                        <div class="time">
                          <i class="icon-time"></i>
                          <span class="green">2 days ago</span>
                        </div>

                        <div>
                          <span class="label label-info label-sm arrowed-in arrowed-in-right">online</span>
                        </div>
                      </div>
                    </div>

                    <div class="itemdiv memberdiv">
                      <div class="user">
                        <img alt="Alexa Doe's avatar"
                             src="${basePath}assets/avatars/avatar1.png"/>
                      </div>

                      <div class="body">
                        <div class="name">
                          <a href="#">Alexa Doe</a>
                        </div>

                        <div class="time">
                          <i class="icon-time"></i>
                          <span class="green">3天以前</span>
                        </div>

                        <div>
                          <span class="label label-success label-sm arrowed-in">approved</span>
                        </div>
                      </div>
                    </div>
                  </div>

                  <div class="center">
                    <i class="icon-group icon-2x green"></i>

                    &nbsp;
                    <a href="#">
                      查看所有会员 &nbsp;
                      <i class="icon-arrow-right"></i>
                    </a>
                  </div>

                  <div class="hr hr-double hr8"></div>
                </div>
                <!-- member-tab -->

                <div id="comment-tab" class="tab-pane">
                  <div class="comments">
                    <div class="itemdiv commentdiv">
                      <div class="user">
                        <img alt="Bob Doe's Avatar"
                             src="${basePath}assets/avatars/avatar.png"/>
                      </div>

                      <div class="body">
                        <div class="name">
                          <a href="#">Bob Doe</a>
                        </div>

                        <div class="time">
                          <i class="icon-time"></i>
                          <span class="green">6 min</span>
                        </div>

                        <div class="text">
                          <i class="icon-quote-left"></i>
                          Lorem ipsum dolor sit amet, consectetur adipiscing
                          elit. Quisque commodo massa sed ipsum porttitor
                          facilisis &hellip;
                        </div>
                      </div>

                      <div class="tools">
                        <div class="inline position-relative">
                          <button class="btn btn-minier bigger btn-yellow dropdown-toggle"
                                  data-toggle="dropdown">
                            <i class="icon-angle-down icon-only bigger-120"></i>
                          </button>

                          <ul class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
                            <li>
                              <a href="#" class="tooltip-success"
                                 data-rel="tooltip" title="Approve">
																						<span class="green">
																							<i class="icon-ok bigger-110"></i>
																						</span>
                              </a>
                            </li>

                            <li>
                              <a href="#" class="tooltip-warning"
                                 data-rel="tooltip" title="Reject">
																						<span class="orange">
																							<i class="icon-remove bigger-110"></i>
																						</span>
                              </a>
                            </li>

                            <li>
                              <a href="#" class="tooltip-error"
                                 data-rel="tooltip" title="Delete">
																						<span class="red">
																							<i class="icon-trash bigger-110"></i>
																						</span>
                              </a>
                            </li>
                          </ul>
                        </div>
                      </div>
                    </div>

                    <div class="itemdiv commentdiv">
                      <div class="user">
                        <img alt="Jennifer's Avatar"
                             src="${basePath}assets/avatars/avatar1.png"/>
                      </div>

                      <div class="body">
                        <div class="name">
                          <a href="#">Jennifer</a>
                        </div>

                        <div class="time">
                          <i class="icon-time"></i>
                          <span class="blue">15 min</span>
                        </div>

                        <div class="text">
                          <i class="icon-quote-left"></i>
                          Lorem ipsum dolor sit amet, consectetur adipiscing
                          elit. Quisque commodo massa sed ipsum porttitor
                          facilisis &hellip;
                        </div>
                      </div>

                      <div class="tools">
                        <div class="action-buttons bigger-125">
                          <a href="#">
                            <i class="icon-pencil blue"></i>
                          </a>

                          <a href="#">
                            <i class="icon-trash red"></i>
                          </a>
                        </div>
                      </div>
                    </div>

                    <div class="itemdiv commentdiv">
                      <div class="user">
                        <img alt="Joe's Avatar"
                             src="${basePath}assets/avatars/avatar2.png"/>
                      </div>

                      <div class="body">
                        <div class="name">
                          <a href="#">Joe</a>
                        </div>

                        <div class="time">
                          <i class="icon-time"></i>
                          <span class="orange">22 min</span>
                        </div>

                        <div class="text">
                          <i class="icon-quote-left"></i>
                          Lorem ipsum dolor sit amet, consectetur adipiscing
                          elit. Quisque commodo massa sed ipsum porttitor
                          facilisis &hellip;
                        </div>
                      </div>

                      <div class="tools">
                        <div class="action-buttons bigger-125">
                          <a href="#">
                            <i class="icon-pencil blue"></i>
                          </a>

                          <a href="#">
                            <i class="icon-trash red"></i>
                          </a>
                        </div>
                      </div>
                    </div>

                    <div class="itemdiv commentdiv">
                      <div class="user">
                        <img alt="Rita's Avatar"
                             src="${basePath}assets/avatars/avatar3.png"/>
                      </div>

                      <div class="body">
                        <div class="name">
                          <a href="#">Rita</a>
                        </div>

                        <div class="time">
                          <i class="icon-time"></i>
                          <span class="red">50 min</span>
                        </div>

                        <div class="text">
                          <i class="icon-quote-left"></i>
                          Lorem ipsum dolor sit amet, consectetur adipiscing
                          elit. Quisque commodo massa sed ipsum porttitor
                          facilisis &hellip;
                        </div>
                      </div>

                      <div class="tools">
                        <div class="action-buttons bigger-125">
                          <a href="#">
                            <i class="icon-pencil blue"></i>
                          </a>

                          <a href="#">
                            <i class="icon-trash red"></i>
                          </a>
                        </div>
                      </div>
                    </div>
                  </div>

                  <div class="hr hr8"></div>

                  <div class="center">
                    <i class="icon-comments-alt icon-2x green"></i>

                    &nbsp;
                    <a href="#">
                      See all comments &nbsp;
                      <i class="icon-arrow-right"></i>
                    </a>
                  </div>

                  <div class="hr hr-double hr8"></div>
                </div>
              </div>
            </div>
            <!-- /widget-main -->
          </div>
          <!-- /widget-body -->
        </div>
        <!-- /widget-box -->
      </div>
      <!-- /span -->
    </div>
    <!-- /row -->
    <!-- PAGE CONTENT ENDS -->
  </div>
  <!-- /.col -->
</div>
<!-- /.row -->
