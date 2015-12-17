<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mellisuga.bean.*" %>
<%@ page import="com.mellisuga.utils.*" %>
<%@ page import="com.github.pagehelper.PageInfo" %>
<%@ page import="com.mellisuga.function.*" %>
<%@include file="sitename.jsp"%>
<%   
String path = request.getContextPath();   
String basePath = request.getScheme() + "://" + request.getServerName() + ":" 
	+ request.getServerPort() + path + "/" ;   
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<base href="<%=basePath %>">
	<title>Ellery - <%=sitename %></title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />

	<!-- js css plugin include -->
	<%@include file="include.jsp"%>
	
	<% 
		Member m = (Member) request.getSession().getAttribute("member"); 
		HomeBean homeBean = (HomeBean) request.getAttribute("homeBean");
	%>
</head>
<body>
	<div class="navbar navbar-default navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<a href="../" class="navbar-brand"><%=sitename %></a>
				<button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#navbar-main">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
			</div>
			<div class="navbar-collapse collapse" id="navbar-main">

				<!-- search -->
				<form class="navbar-form navbar-left" role="search">
					<div class="input-group">
						<input type="text" class="form-control" placeholder="Search for...">
						<span class="input-group-btn">
							<button class="btn btn-primary" type="button" data-toggle="modal"
								data-target="#searchModal" data-backdrop="false">
								<i class="fa fa-search"></i>
							</button>
						</span>
					</div>
				</form>
				
				<!-- search modal -->
				<%@include file="modal.jsp"%>

				<!-- navbar -->
				<%@include file="navbar.jsp" %>
			</div>
		</div>
	</div>

    <div class="container">

      	<!-- main content -->
		<div class="question-main-content col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<div class="row">
				<div class="left-main col-lg-7 col-md-7 col-sm-12 col-xs-12 col-lg-offset-1 col-md-offset-1">

					<!--left main title row-->
					<div class="row">
						<div class="panel panel-default">
							<div class="panel-body">
								<div class="profile-header">
									<strong><%=homeBean.getMember().getFullname() %></strong>
								</div>
								<div class="row user-infos">
									<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
										<img src="<%=homeBean.getMember().getAvatar_path() %>" class="img-responsive img-rounded">
									</div>
									<div class="col-lg-10 col-md-10 col-sm-10 col-xs-10">
										
										<div class="user-info">
											<i class="fa fa-map-marker"></i> 
											<span class="location"><%=homeBean.getMember().getLocation() %></span>
											<span class="business"><%=homeBean.getMember().getBusiness() %></span>
											<span class="gender"><%=homeBean.getMember().getGender() %></span>
											<a href="#" class="item-edit">
												<i class="fa fa-edit"></i> 
												修改
											</a>
										</div>

										<div class="user-info">
											<i class="fa fa-suitcase"></i> 
											<span class="company"><%=homeBean.getMember().getEmployment() %></span>
											<span class="work"><%=homeBean.getMember().getPosition() %></span>
											<a href="#" class="item-edit">
												<i class="fa fa-edit"></i> 
												修改
											</a>
										</div>

										<div class="user-info-end">
											<i class="fa fa-graduation-cap"></i> 
											<span class="education"><%=homeBean.getMember().getEducation() %></span>
											<span class="specialty"><%=homeBean.getMember().getMajor() %></span>
											<a href="#" class="item-edit">
												<i class="fa fa-edit"></i> 
												修改
											</a>
											<span class="user-info-detail">
												<i class="fa fa-arrow-right"></i> 查看详细资料
											</span>
										</div>
										<hr style="margin-top:12px;margin-bottom:12px;"/>
										
										<p><%=homeBean.getMember().getDescription() %></p>
									</div>
								</div>


								<div class="achievement">
									<span class="achieve">获得</span>
									<span class="achieve">
										<i class="fa fa-thumbs-o-up"></i> 
										<strong><%=homeBean.getMember().getApprove_num() %></strong>赞同
									</span>
									<span class="achieve">
										<i class="fa fa-heart-o"></i> 
										<strong><%=homeBean.getMember().getThank_num() %></strong>感谢
									</span>
									<a href="#" class="achieve-right info-edit"><i class="fa fa-edit"></i> 编辑我的资料</a>
								</div>

							</div>
							<div class="panel-footer user-info-foot">
								<a href="" class="info-item"><i class="fa fa-home"></i> </a>
								<a href="" class="info-item"><strong>提问</strong><span> <%=homeBean.getMember().getQuestion_num() %></span></a>
								<a href="" class="info-item"><strong>回答</strong><span> <%=homeBean.getMember().getAnswer_num() %></span></a>
								<a href="" class="info-item"><strong>专栏文章</strong><span> 0</span></a>
								<a href="" class="info-item"><strong>收藏</strong><span> <%=homeBean.getMember().getCollect_num() %></span></a>
								<a href="" class="info-item"><strong>公共编辑</strong><span> 0</span></a>
							</div>
						</div>
					</div><!-- end left main title row -->

					<!-- ask list -->
					<div class="row">
						<div class="panel panel-default">
							<div class="panel-heading">
								<strong>提问</strong>
								<a href="./AllQuestionServlet?pageNum=1" class="more"><i class="fa fa-chevron-right"></i> </a>
							</div>
							<div class="panel-body">
								<%
									// 所提问题列表
									String split = "";
									for(Question q : homeBean.getQuestionList()) {
								%>
								<%=split %>
								<div class="ask-list">
									<div class="ask-list-content">
										<a href="" class="question-list"><%=q.getQuestion_title() %></a>
										<div class="feed-meta">
											<a href="#" class="answer-date">发布于 <%=TimeUtils.getPostTime(q.getLast_updated()) %> </a> 
											<span class="bull">•</span> <a href="#" class="meta-item">4847赞</a>
											<span class="bull">•</span> <a href="#" class="meta-item"><%=q.getScan_num() %>浏览</a>
											<span class="bull">•</span> <a href="#" class="meta-item"><%=q.getAnswers_num() %>回答</a>
											<span class="bull">•</span> <a href="#" class="meta-item"><%=q.getFollowers_num() %>关注</a>
										</div>
									</div>
								</div>
								<%
										split = "<hr style='margin-top:6px;margin-bottom:12px;'/>";
									}
								%>
							</div>
						</div>
					</div><!-- end ask list -->

					<!-- answer list -->
					<div class="row">
						<div class="panel panel-default">
							<div class="panel-heading">
								<strong>回答</strong>
								<a href="./AllAnswerServlet?pageNum=1" class="more"><i class="fa fa-chevron-right"></i> </a>
							</div>
							<div class="panel-body">
								<%
									// 答案列表
									String split2 = "";
									for(AnswerBean answerBean : homeBean.getAnswerBeanList()) {								
								%>
								<%=split2 %>
								<div class="answer-list">
									<a href="" class="answer-question"><%=answerBean.getQuestion().getQuestion_title() %></a>
									<div class="user-answer">
										<% 
											if(answerBean.getAnswer().getAnswers().length() <= 120) {
												out.print(answerBean.getAnswer().getAnswers());
											} else {
												out.print(answerBean.getAnswer().getAnswers().substring(0, 120) + " ...");
											}
										%>
									</div>
								</div>
								<%
										split2 = "<hr style='margin-top:0px;margin-bottom:8px;'/>";
									}
								%>
							</div>
						</div>
					</div><!-- end answer list -->

					<!-- recent news -->
					<div class="row">
						<div class="panel panel-default">
							<div class="panel-heading">
								<strong>最新动态</strong>
								<a href="#" class="more"><i class="fa fa-chevron-right"></i> </a>
							</div>
							<div class="panel-body">
								<%
									if(homeBean.getTrendsBeanList() != null && !homeBean.getTrendsBeanList().isEmpty()) {
										for (TrendsBean trendsBean : homeBean.getTrendsBeanList()) {
											if("AgreeWithThisAnswer".equals(trendsBean.getTrends().getTrends_type())) {
								%>
								<!-- content-details -->
								<div class="content-details"  onmouseenter="showItem('hidden-item-<%=trendsBean.getTrends().getId() %>')" 
									onmouseleave="hiddenItem('hidden-item-<%=trendsBean.getTrends().getId() %>')">

									<div class="content-source">
										<span class="user-agree">赞同该回答</span>
										<span class="source-time"><%=TimeUtils.getTimeDifference(trendsBean.getTrends().getTrends_time()) %></span>
									</div>
								
									<div class="question-link">
										<h5><a href="#"><%=trendsBean.getQuestion().getQuestion_title() %></a></h5>
									</div>
								
									<div class="author-info">
										<a href="#"><strong><%=trendsBean.getMember().getFullname() %></strong></a>,
										<span><%=trendsBean.getMember().getAutograph() %></span>
									</div>
								
									<div class="question-content" onclick="getHomeDigestSource(<%=trendsBean.getTrends().getId() %>);">
										<div id="editable-content-<%=trendsBean.getTrends().getId() %>" style="display: none;">
											<%=trendsBean.getAnswer().getAnswers() %>
											<span class="answer-date" style="display: block;">
												<a target="_blank" href="#">发布于 <%=TimeUtils.getPostTime(trendsBean.getAnswer().getAnswer_date()) %></a>
											</span>
										</div>
										<div id="summary-content-<%=trendsBean.getTrends().getId() %>" style="display: block;cursor: pointer;">
											<%=DigestFunc.getDigest(trendsBean.getAnswer().getAnswers(), 200, " ...") %>
										</div>
									</div>
								
									<div class="meta-panel">
										<%	// 判断是否已关注问题
											if(!trendsBean.isFollowing()) {
												
										%>
										<a class="meta-item" title="follow" id="followQuestion-<%=trendsBean.getTrends().getId() %>" 
											onclick="followQuestionOnTrends(<%=trendsBean.getQuestion().getId() %>, <%=trendsBean.getTrends().getId() %>)" >
											<i class="fa fa-plus"></i> 关注问题
										</a>
										<%
											} else {
										%>
										<a class="meta-item" title="following" id="followQuestion-<%=trendsBean.getTrends().getId() %>" 
											onclick="followQuestionOnTrends(<%=trendsBean.getQuestion().getId() %>, <%=trendsBean.getTrends().getId() %>)" >
											取消关注
										</a>
										<%
											}
										%>
										
										<%
											if(trendsBean.getAnswer().getReply_num() > 0) {
										%>
										<a href="#comment-<%=trendsBean.getTrends().getId() %>-agreeWithThisAnswer" onclick="queryACommentList(<%=trendsBean.getAnswer().getId() %>,<%=trendsBean.getTrends().getId() %>);" 
												data-toggle="collapse" class="meta-item" aria-expanded="false" aria-controls="comment">
											<i class="fa fa-commenting-o"></i> <%=trendsBean.getAnswer().getReply_num() %>条评论
										</a>
										<%
											}else {
										%>
										<a href="#comment-<%=trendsBean.getTrends().getId() %>-agreeWithThisAnswer" onclick="queryACommentList(<%=trendsBean.getAnswer().getId() %>,<%=trendsBean.getTrends().getId() %>);" 
												data-toggle="collapse" class="meta-item" aria-expanded="false" aria-controls="comment">
											<i class="fa fa-comment-o"></i> 添加评论
										</a>
										<%
											}
										%>
										<div id="hidden-item-<%=trendsBean.getTrends().getId() %>" style="display:none">
										<%
											if(!trendsBean.isThanked()) {
										%>
											<a title="thankAuthor" onclick="thankAuthor(<%=trendsBean.getAnswer().getId() %>, <%=trendsBean.getTrends().getId()%>);"
												id="thankAuthor-<%=trendsBean.getTrends().getId() %>"  class="meta-item" data-thanked="false">
												<i class="fa fa-heart-o"></i> 感谢
											</a>
										<%
											} else {
										%>
											<a title="thankedAuthor" onclick="thankAuthor(<%=trendsBean.getAnswer().getId() %>, <%=trendsBean.getTrends().getId()%>);"
												id="thankAuthor-<%=trendsBean.getTrends().getId() %>"  class="meta-item" data-thanked="false">
												<i class="fa fa-heart-o"></i> 取消感谢
											</a>
										<%
											}
										%>
											<a href="#" class="meta-item" >
												<i class="fa fa-share"></i> 分享
											</a>
											<a onclick="getCollectionList(<%=trendsBean.getAnswer().getId() %>);" data-toggle="modal" data-target="#collectionModal" data-backdrop="false" class="meta-item">
												<i class="fa fa-bookmark-o"></i> 收藏
											</a>
											<span class="bull">•</span>
											
											<%
												// 判断是否没有帮助
												if(!trendsBean.isNoHelp()) {
											%>
											<a title="nohelp" onclick="nohelp(<%=trendsBean.getAnswer().getId() %>, <%=trendsBean.getTrends().getId()%>);"
												id="nohelp-<%=trendsBean.getTrends().getId() %>" class="meta-item">没有帮助</a>
											<%
												} else {
											%>
											<a title="unnohelp" onclick="nohelp(<%=trendsBean.getAnswer().getId() %>, <%=trendsBean.getTrends().getId()%>);"
												id="nohelp-<%=trendsBean.getTrends().getId() %>" class="meta-item">撤消没有帮助</a>
											<%
												}	
											%>
											<span class="bull">•</span>
											<div class="btn-group">
												<a onclick="reportList(1, this, 1, <%=trendsBean.getAnswer().getId() %>);" class="meta-item dropdown-toggle" data-toggle="dropdown">
													<i class="fa fa-flag-o"></i>  
													举报
												</a>
												<ul class="dropdown-menu">
												</ul>
											</div>
											<span class="bull">•</span>
											<a href="#" class="meta-item goog-inline-block" style="-webkit-user-select: none;">
												作者保留权利
											</a>
										</div>
										<a id="retract-<%=trendsBean.getTrends().getId() %>" href="javascript: retractHome(<%=trendsBean.getTrends().getId() %>);" class="answer-collapse meta-item" style="display:none">
											<i class="fa fa-angle-double-up"></i> 收起
										</a>
									</div>
									
									<!-- comment -->
									<div id="comment-<%=trendsBean.getTrends().getId() %>-agreeWithThisAnswer" class="row comment collapse">
										<div class="panel panel-default">
											<div id="newAnswerComments-<%=trendsBean.getTrends().getId() %>">
											
											</div>
											<div class="panel-body">
												<div class="form-group">
													<textarea class="form-control" id="acomment-<%=trendsBean.getAnswer().getId() %>" 
														name="acomment-<%=trendsBean.getAnswer().getId() %>" rows="1" id="textArea" placeholder="请写下你的评论..."></textarea>
												</div>
												<div class="form-group module-right">
													<button class="btn btn-default btn-sm">取消</button>
													<button type="button" onclick="newAnswerComment('<%=trendsBean.getAnswer().getId() %>');" class="btn btn-primary btn-sm">评论</button>
												</div>
											</div>
											
										</div>
									</div><!--end comment -->
									
								</div><!-- end content-details -->

								<hr style="margin-top:12px;margin-bottom:12px;"/>
								
								<%
											} else if ("FollowingQuestion".equals(trendsBean.getTrends().getTrends_type())) {
								%>

								<!-- content-details -->
								<div class="content-details">

									<div class="content-source">
										<span class="user-agree">关注了问题</span>
										<span class="source-time"><%=TimeUtils.getTimeDifference(trendsBean.getTrends().getTrends_time()) %></span>
									</div>
								
									<div class="question-link">
										<h5><a href="#"><%=trendsBean.getQuestion().getQuestion_title() %></a></h5>
									</div>
								
								</div><!-- end content-details -->
									
								<hr style="margin-top:12px;margin-bottom:12px;"/>

								<%
											} else if ("AnswerThisQuestion".equals(trendsBean.getTrends().getTrends_type())) {
								%>
								
								<!-- content-details -->
								<div class="content-details" onmouseenter="showItem('hidden-item-<%=trendsBean.getTrends().getId() %>')" 
									onmouseleave="hiddenItem('hidden-item-<%=trendsBean.getTrends().getId() %>')">

									<div class="content-source">
										<span class="user-agree">回答了问题</span>
										<span class="source-time"><%=TimeUtils.getTimeDifference(trendsBean.getTrends().getTrends_time()) %></span>
									</div>
								
									<div class="question-link">
										<h5><a href="#"><%=trendsBean.getQuestion().getQuestion_title() %></a></h5>
									</div>
								
									<div class="author-info">
										<a href="#"><strong><%=trendsBean.getMember().getFullname() %></strong></a>,
										<span><%=trendsBean.getMember().getAutograph() %></span>
									</div>
								
									<div class="question-content" onclick="getHomeDigestSource(<%=trendsBean.getTrends().getId() %>);">
										<div id="editable-content-<%=trendsBean.getTrends().getId() %>" style="display: none;">
											<%=trendsBean.getAnswer().getAnswers() %>
											<span class="answer-date" style="display: block;">
												<a target="_blank" href="#">发布于 <%=TimeUtils.getPostTime(trendsBean.getAnswer().getAnswer_date()) %></a>
											</span>
										</div>
										<div id="summary-content-<%=trendsBean.getTrends().getId() %>" style="display: block;cursor: pointer;">
											<%=DigestFunc.getDigest(trendsBean.getAnswer().getAnswers(), 200, " ...") %>
										</div>
									</div>
									
									<div class="meta-panel">
										
										<%	// 判断是否已关注问题
											if(!trendsBean.isFollowing()) {
												
										%>
										<a class="meta-item" title="follow" id="followQuestion-<%=trendsBean.getTrends().getId() %>" 
											onclick="followQuestionOnTrends(<%=trendsBean.getQuestion().getId() %>, <%=trendsBean.getTrends().getId() %>)" >
											<i class="fa fa-plus"></i> 关注问题
										</a>
										<%
											} else {
										%>
										<a class="meta-item" title="following" id="followQuestion-<%=trendsBean.getTrends().getId() %>" 
											onclick="followQuestionOnTrends(<%=trendsBean.getQuestion().getId() %>, <%=trendsBean.getTrends().getId() %>)" >
											取消关注
										</a>
										<%
											}
										%>
										
										<%
											if(trendsBean.getAnswer().getReply_num() > 0) {
										%>
										<a href="#comment-<%=trendsBean.getTrends().getId() %>-answerThisQuestion" onclick="queryACommentList(<%=trendsBean.getAnswer().getId() %>,<%=trendsBean.getTrends().getId() %>);" 
												data-toggle="collapse" class="meta-item" aria-expanded="false" aria-controls="comment">
											<i class="fa fa-commenting-o"></i> <%=trendsBean.getAnswer().getReply_num() %>条评论
										</a>
										<%
											}else {
										%>
										<a href="#comment-<%=trendsBean.getTrends().getId() %>-answerThisQuestion" onclick="queryACommentList(<%=trendsBean.getAnswer().getId() %>,<%=trendsBean.getTrends().getId() %>);" 
												data-toggle="collapse" class="meta-item" aria-expanded="false" aria-controls="comment">
											<i class="fa fa-comment-o"></i> 添加评论
										</a>
										<%
											}
										%>
										<div id="hidden-item-<%=trendsBean.getTrends().getId() %>" style="display:none">
										<%
											if(!trendsBean.isThanked()) {
										%>
											<a title="thankAuthor" onclick="thankAuthor(<%=trendsBean.getAnswer().getId() %>, <%=trendsBean.getTrends().getId()%>);"
												id="thankAuthor-<%=trendsBean.getTrends().getId() %>"  class="meta-item" data-thanked="false">
												<i class="fa fa-heart-o"></i> 感谢
											</a>
										<%
											} else {
										%>
											<a title="thankedAuthor" onclick="thankAuthor(<%=trendsBean.getAnswer().getId() %>, <%=trendsBean.getTrends().getId()%>);"
												id="thankAuthor-<%=trendsBean.getTrends().getId() %>"  class="meta-item" data-thanked="false">
												<i class="fa fa-heart-o"></i> 取消感谢
											</a>
										<%
											}
										%>
											<a href="#" class="meta-item" >
												<i class="fa fa-share"></i> 分享
											</a>
											<a onclick="getCollectionList(<%=trendsBean.getAnswer().getId() %>);" data-toggle="modal" data-target="#collectionModal" data-backdrop="false" class="meta-item">
												<i class="fa fa-bookmark-o"></i> 收藏
											</a>
											<span class="bull">•</span>
											<%
												// 判断是否没有帮助
												if(!trendsBean.isNoHelp()) {
											%>
											<a title="nohelp" onclick="nohelp(<%=trendsBean.getAnswer().getId() %>, <%=trendsBean.getTrends().getId()%>);"
												id="nohelp-<%=trendsBean.getTrends().getId() %>" class="meta-item">没有帮助</a>
											<%
												} else {
											%>
											<a title="unnohelp" onclick="nohelp(<%=trendsBean.getAnswer().getId() %>, <%=trendsBean.getTrends().getId()%>);"
												id="nohelp-<%=trendsBean.getTrends().getId() %>" class="meta-item">撤消没有帮助</a>
											<%
												}	
											%>
											<span class="bull">•</span>
											<div class="btn-group">
												<a onclick="reportList(1, this, 1, <%=trendsBean.getAnswer().getId() %>);" class="meta-item dropdown-toggle" data-toggle="dropdown">
													<i class="fa fa-flag-o"></i>  
													举报
												</a>
												<ul class="dropdown-menu">
												</ul>
											</div>
											<span class="bull">•</span>
											<a href="#" class="meta-item goog-inline-block" style="-webkit-user-select: none;">
												作者保留权利
											</a>
										</div>
										<a id="retract-<%=trendsBean.getTrends().getId() %>" href="javascript: retractHome(<%=trendsBean.getTrends().getId() %>);" class="answer-collapse meta-item" style="display:none">
											<i class="fa fa-angle-double-up"></i> 收起
										</a>
									</div>
									
									<!-- comment -->
									<div id="comment-<%=trendsBean.getTrends().getId() %>-answerThisQuestion" class="row comment collapse">
										<div class="panel panel-default">
											<div id="newAnswerComments-<%=trendsBean.getTrends().getId() %>">
											
											</div>
											<div class="panel-body">
												<div class="form-group">
													<textarea class="form-control" id="acomment-<%=trendsBean.getAnswer().getId() %>" 
														name="acomment-<%=trendsBean.getAnswer().getId() %>" rows="1" id="textArea" placeholder="请写下你的评论..."></textarea>
												</div>
												<div class="form-group module-right">
													<button class="btn btn-default btn-sm">取消</button>
													<button type="button" onclick="newAnswerComment('<%=trendsBean.getAnswer().getId() %>');" class="btn btn-primary btn-sm">评论</button>
												</div>
											</div>
											
										</div>
									</div><!--end comment -->
										
								</div><!-- end content-details -->

								<hr style="margin-top:12px;margin-bottom:12px;"/>

								<%
											} else if("AskAQuestion".equals(trendsBean.getTrends().getTrends_type())) {
								%>


								<!-- content-details -->
								<div class="content-details">

									<div class="content-source">
										<span class="user-agree">提出了问题</span>
										<span class="source-time"><%=TimeUtils.getTimeDifference(trendsBean.getTrends().getTrends_time()) %></span>
									</div>
								
									<div class="question-link">
										<h5><a href="#"><%=trendsBean.getQuestion().getQuestion_title() %></a></h5>
									</div>
								
								</div><!-- end content-details -->
								
								<hr style="margin-top:12px;margin-bottom:12px;"/>
								
								<!-- content-details -->
								<!-- 关注话题
								<div class="content-details">

									<div class="content-source">
										<span class="user-agree">关注了话题</span>
										<span class="source-time">3小时前</span>
									</div>
								
									<div class="question-link">
										<h5><a href="#">BAT</a></h5>
									</div>
								
								</div> 
								<hr style="margin-top:12px;margin-bottom:12px;"/>
								-->
 								<!-- end content-details -->
								<%
											}
										}
								%>
								<!-- loding more btn row  -->
								<div class="row">
									<ul class="pagination" style="margin-left: 25px;">
										<%
											@SuppressWarnings("rawtypes")
											PageInfo pageInfo = homeBean.getTrendsBeanList().get(0).getPageInfo();
											// 判断当前是否是第一页
											if(pageInfo.isIsFirstPage()) {
										%>
											<li class="disabled"><a href="#">&laquo;</a></li>
										<%
											} else {
										%>
											<li><a href="./HomeServlet?id=<%=homeBean.getMember().getId() %>&pageNum=<%=pageInfo.getFirstPage() %>">&laquo;</a></li>
										<%
											}
											
											// 判断总页数是否大于10
											if(pageInfo.getPages() <= 10) {
												for(int i = pageInfo.getFirstPage(); i<=pageInfo.getLastPage(); i++) {
													// 判断是否是当前页
													if(i == pageInfo.getPageNum()) {
										%>
											<li class="active"><a href="./HomeServlet?id=<%=homeBean.getMember().getId() %>&pageNum=<%=i %>"><%=i %></a></li>
										<%
													} else {
										%>
											<li><a href="./HomeServlet?id=<%=homeBean.getMember().getId() %>&pageNum=<%=i %>"><%=i %></a></li>
										<%
													}
												}
											} else {
										%>
											<li class="active"><a href="#">共 <%=pageInfo.getPages() %> 页</a></li>
										<%	
											}
											
											// 判断是否是最后一页
											if(pageInfo.isIsLastPage()) {
										%>
											<li class="disabled"><a href="#">&raquo;</a></li>
										<%		
											} else {
										%>
											<li><a href="./HomeServlet?id=<%=homeBean.getMember().getId() %>&pageNum=<%=pageInfo.getLastPage() %>">&raquo;</a></li>
										<%
											}
										%>
									</ul>
								</div><!-- end loding more btn row  -->
								<%
									}
								%>

							</div><!-- end panel body-->
						</div><!-- end panel -->
					</div><!-- end recent news -->


				</div><!-- end left main-->

				<div class="right-sidebar col-lg-3 col-md-3 col-sm-12 col-xs-12 col-md-offset-1">
					
					<div class="home-sidebar">
						<strong>
							<span>关注了<a href="#">155</a> 人</span> ,
							<span>关注者<a href="#">13</a> 人</span>
						</strong>
					</div>
					<hr style="margin-top:12px;margin-bottom:12px;"/>
					<div class="sidebar-group">
						<span class="sidebar-group-title">
							<strong>关注了<a href="#">36</a> 个话题</strong>
						</span><br>

						<img src="./images/topic/zh.jpg" class="topic-img">
						<img src="./images/topic/zh.jpg" class="topic-img">
						<img src="./images/topic/zh.jpg" class="topic-img">
						<img src="./images/topic/zh.jpg" class="topic-img">
						<img src="./images/topic/zh.jpg" class="topic-img">
					</div>
					<hr style="margin-top:12px;margin-bottom:12px;"/>
					<div class="sidebar-group">
						<span class="sidebar-group-title">
							<strong>关注了<a href="#">36</a> 个专栏</strong>
						</span><br>

						<img src="./images/topic/zh.jpg" class="topic-img">
						<img src="./images/topic/zh.jpg" class="topic-img">
						<img src="./images/topic/zh.jpg" class="topic-img">
						<img src="./images/topic/zh.jpg" class="topic-img">
						<img src="./images/topic/zh.jpg" class="topic-img">
					</div>
					<hr style="margin-top:12px;margin-bottom:12px;"/>
					<div class="sidebar-group">
						<span class="sidebar-group-title"><strong>主页状态</strong></span>
						<div class="similar-question">
							个人主页被333人浏览
						</div>
					</div>

	
				</div><!-- end right sidebar -->

			</div><!-- end main content row -->
		</div><!-- main content -->

	</div><!-- end container -->
	</body>
</html>