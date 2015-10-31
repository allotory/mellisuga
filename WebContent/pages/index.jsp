<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mellisuga.model.*" %>
<%@ page import="com.mellisuga.bean.*" %>
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
	<title>首页 - <%=sitename %></title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />

	<!-- js css plugin include -->
	<%@include file="include.jsp"%>

<%
	Member m = (Member) request.getSession().getAttribute("member"); 
	@SuppressWarnings("unchecked")
	List<TrendsBean> trendsBeanList = (List<TrendsBean>) request.getAttribute("trendsBeanList");
	/* if(!(trendsBeanList == null || trendsBeanList.isEmpty())) {
		for (TrendsBean trendsBean : trendsBeanList) {
			if("AskAQuestion".equals(trendsBean.getTrends().getTrends_type())) {
				System.out.println(trendsBean.getTrends().getTrends_type());
				System.out.println(trendsBean.getQuestion().getQuestion_title());
			}
		}
	} */
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
						<div class="left-main-title">
							<i class="fa fa-list-ul"></i> 最新动态
							<span class="news-setting">
								<a href="#">
									<i class="fa fa-cog"></i> 设置
								</a>
							</span>
						</div><!-- end left main title -->
					</div><!-- end left main title row -->
					
					<div class="row">
						<hr style="margin-top:12px;margin-bottom:12px;"/>
					</div>

					<!-- loding btn row  -->
					<!--<div class="row">
						<div class="loding-btn-top">
							<a href="#" class="btn btn-default btn-block">15条新动态</a>
						</div>
					</div>--><!-- end loding btn row  -->
					
					<%
						if(trendsBeanList == null || trendsBeanList.isEmpty()) {
					%>
					<!-- loding btn row  -->
					<div class="row">
						<div class="loding-btn">
							<span>当前没有任何动态！</span>
						</div>
					</div><!-- end loding btn row  -->
					<%
						} else {
							for (TrendsBean trendsBean : trendsBeanList) {
								if("AskAQuestion".equals(trendsBean.getTrends().getTrends_type())) {
					%>
					<!-- left main content wrap  -->
					<div class="row left-main-content-wrap">
						<div class="left-main-content">

							<!-- avatar and upvote col -->
							<div class="avatar-vote col-lg-1 col-md-1 col-sm-1 col-xs-1">
								<div class="row">
									<a href="#">
										<img src="<%=trendsBean.getMember().getAvatar_path() %>" class="img-responsive img-rounded" alt="Responsive image">
									</a>
								</div>
							</div><!-- end avatar and upvote col -->

							<!-- content-details -->
							<div class="content-details col-lg-11 col-md-11 col-sm-10 col-xs-10">

								<div class="row">
									<div class="content-source">
										<a href="#"><%=trendsBean.getMember().getFullname() %></a> 提了一个问题
										<span class="source-time">3小时前</span>
									</div>
								</div>

								<div class="row">
									<div class="question-link">
										<h5>
											<a href="./QuestionDetails?id=<%=trendsBean.getQuestion().getId() %>">
												<%=trendsBean.getQuestion().getQuestion_title() %>
											</a>
										</h5>
									</div>
								</div>

								<div class="row">
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
											if(trendsBean.getQuestion().getReply_num() > 0) {
										%>
										<a href="#comment-<%=trendsBean.getTrends().getId() %>-askNewQuestion" onclick="queryQCommentList(<%=trendsBean.getQuestion().getId() %>, <%=trendsBean.getTrends().getId() %>);" 
												data-toggle="collapse" class="meta-item" aria-expanded="false" aria-controls="comment">
											<i class="fa fa-commenting-o"></i> <%=trendsBean.getQuestion().getReply_num() %>条评论
										</a>
										<%
											}else {
										%>
										<a href="#comment-<%=trendsBean.getTrends().getId() %>-askNewQuestion" onclick="queryQCommentList(<%=trendsBean.getQuestion().getId() %>, <%=trendsBean.getTrends().getId() %>);" 
												data-toggle="collapse" class="meta-item" aria-expanded="false" aria-controls="comment">
											<i class="fa fa-comment-o"></i> 添加评论
										</a>
										<%
											}
										%>
									</div>
								</div>
								
								<!-- comment -->
								<div id="comment-<%=trendsBean.getTrends().getId() %>-askNewQuestion" class="row comment collapse">
									<div class="panel panel-default">
									
										<div id="newQuestionComments-<%=trendsBean.getTrends().getId() %>">
										
										</div>
										<div class="panel-body">
											<div class="form-group">
												<textarea class="form-control" id="qcomment-<%=trendsBean.getQuestion().getId() %>" 
												name="qcomment-<%=trendsBean.getQuestion().getId() %>" rows="1" id="textArea" placeholder="请写下你的评论..."></textarea>
											</div>
											<div class="form-group module-right">
												<button class="btn btn-default btn-sm">取消</button>
												<button type="button" onclick="newQuestionComment('<%=trendsBean.getQuestion().getId() %>');" class="btn btn-primary btn-sm">评论</button>
											</div>
										</div>
										
									</div>
								</div><!--end comment -->

							</div><!-- end content-details -->
														
						</div><!-- end left main content -->
					</div><!--end left main content wrap  -->
					
					<div class="row">
						<hr style="margin-top:12px;margin-bottom:12px;"/>
					</div>
					<%
								} else if("AnswerThisQuestion".equals(trendsBean.getTrends().getTrends_type())) {
					%>
					<!-- left main content wrap  -->
					<div class="row left-main-content-wrap" onmouseenter="showItem('hidden-item-<%=trendsBean.getTrends().getId() %>')" 
							onmouseleave="hiddenItem('hidden-item-<%=trendsBean.getTrends().getId() %>')">
						<div class="left-main-content">

							<!-- avatar and upvote col -->
							<div class="avatar-vote col-lg-1 col-md-1 col-sm-1 col-xs-1">
								<div class="row">
									<a href="#">
										<img src="<%=trendsBean.getMember().getAvatar_path() %>" class="img-responsive img-rounded" alt="Responsive image">
									</a>
								</div>
								
								<%
									// 判断当前用户是否投票过
									if(trendsBean.getVote() != null) {
										if("up".equals(trendsBean.getVote().getVote_type())) {
								%>
								<div class="row">
									<div id="vote-up-<%=trendsBean.getAnswer().getId() %>" class="vote-number-pressed" 
											onclick="vote('<%=trendsBean.getAnswer().getId() %>', 'up');">
										<a>
											<i class="fa fa-caret-up"></i>
											<span id="vote_count-<%=trendsBean.getAnswer().getId() %>" style="display:block;">
												<%=trendsBean.getVoterBean().getUpCount() %>
											</span>
										</a>
									</div>
									
									<div id="vote-down-<%=trendsBean.getAnswer().getId() %>" class="vote-number"
											onclick="vote('<%=trendsBean.getAnswer().getId() %>', 'down');">
										<a>
											<i class="fa fa-caret-down"></i>
										</a>
									</div>
								</div>
								<%
										} else if("down".equals(trendsBean.getVote().getVote_type())) {
								%>
								<div class="row">
									<div id="vote-up-<%=trendsBean.getAnswer().getId() %>" class="vote-number" 
											onclick="vote('<%=trendsBean.getAnswer().getId() %>', 'up');">
										<a>
											<i class="fa fa-caret-up"></i>
											<span id="vote_count-<%=trendsBean.getAnswer().getId() %>" style="display:block;">
												<%=trendsBean.getVoterBean().getUpCount() %>
											</span>
										</a>
									</div>
									
									<div id="vote-down-<%=trendsBean.getAnswer().getId() %>" class="vote-number-pressed"
											onclick="vote('<%=trendsBean.getAnswer().getId() %>', 'down');">
										<a>
											<i class="fa fa-caret-down"></i>
										</a>
									</div>
								</div>	
								<%
										}
									} else {
										// 当前用户没投过票
								%>
								<div class="row">
									<div id="vote-up-<%=trendsBean.getAnswer().getId() %>" class="vote-number" 
											onclick="vote('<%=trendsBean.getAnswer().getId() %>', 'up');">
										<a>
											<i class="fa fa-caret-up"></i>
											<span id="vote_count-<%=trendsBean.getAnswer().getId() %>" style="display:block;">
												<%=trendsBean.getVoterBean().getUpCount() %>
											</span>
										</a>
									</div>
									
									<div id="vote-down-<%=trendsBean.getAnswer().getId() %>" class="vote-number"
											onclick="vote('<%=trendsBean.getAnswer().getId() %>', 'down');">
										<a>
											<i class="fa fa-caret-down"></i>
										</a>
									</div>
								</div>	
								<%
									}
								%>
								
							</div><!-- end avatar and upvote col -->

							<!-- content-details -->
							<div class="content-details col-lg-11 col-md-11 col-sm-10 col-xs-10">

								<div class="row">
									<div class="content-source">
										<a href="#"><%=trendsBean.getMember().getFullname() %></a> 回答了该问题
										<span class="source-time">3小时前</span>
									</div>
								</div>
								
								<div class="row">
									<div class="question-link">
										<h5>
											<a href="./QuestionDetails?id=<%=trendsBean.getQuestion().getId() %>">
												<%=trendsBean.getQuestion().getQuestion_title() %>
											</a>
										</h5>
									</div>
								</div>
								
								<%
									if(trendsBean.getVoterBean().getUpCount() > 0) {
								%>
								<div class="row">
									<div class="content-source">
									<%
										String split = "";	
										for(Member member : trendsBean.getVoterBean().getVoterList()) {
									%>
										<%=split %>
										<a href="#"><%=member.getFullname() %></a>
									<%
											split = "、";
										}
									%>
										等赞同该回答
									</div>
								</div>
								<%
									}
								%>

								<div class="row">
									<div class="question-content">
										<div class="editable-content" style="display: block;">
											<%=trendsBean.getAnswer().getAnswers() %>
											<span class="answer-date" style="display: block;">
												<a target="_blank" href="#">发布于 <%=trendsBean.getAnswer().getAnswer_date() %></a>
											</span>
										</div>
										<div class="summary-content clearfix" style="display: none;">
											<%=trendsBean.getAnswer().getAnswers() %>
										</div>
									</div>
								</div>

								<div class="row">
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
										<a href="#" class="answer-collapse meta-item" style="display:none">
											<i class="fa fa-angle-double-up"></i> 收起
										</a>
									</div>
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
														
						</div><!-- end left main content -->
					</div><!--end left main content wrap  -->
					
					<div class="row">
						<hr style="margin-top:12px;margin-bottom:12px;"/>
					</div>
					
					<%
						}else if("AgreeWithThisAnswer".equals(trendsBean.getTrends().getTrends_type())) {
					%>
					<!-- left main content wrap  -->
					<div class="row left-main-content-wrap" onmouseenter="showItem('hidden-item-<%=trendsBean.getTrends().getId() %>')" 
							onmouseleave="hiddenItem('hidden-item-<%=trendsBean.getTrends().getId() %>')">
						<div class="left-main-content">

							<!-- avatar and upvote col -->
							<div class="avatar-vote col-lg-1 col-md-1 col-sm-1 col-xs-1">
								<div class="row">
									<a href="#">
										<img src="<%=trendsBean.getMember().getAvatar_path() %>" class="img-responsive img-rounded" alt="Responsive image">
									</a>
								</div>
								
								<%
									// 判断当前用户是否投票过
									if(trendsBean.getVote() != null) {
										if("up".equals(trendsBean.getVote().getVote_type())) {
								%>
								<div class="row">
									<div id="vote-up-<%=trendsBean.getAnswer().getId() %>" class="vote-number-pressed" 
											onclick="vote('<%=trendsBean.getAnswer().getId() %>', 'up');">
										<a>
											<i class="fa fa-caret-up"></i>
											<span id="vote_count-<%=trendsBean.getAnswer().getId() %>" style="display:block;">
												<%=trendsBean.getVoterBean().getUpCount() %>
											</span>
										</a>
									</div>
									
									<div id="vote-down-<%=trendsBean.getAnswer().getId() %>" class="vote-number"
											onclick="vote('<%=trendsBean.getAnswer().getId() %>', 'down');">
										<a>
											<i class="fa fa-caret-down"></i>
										</a>
									</div>
								</div>
								<%
										} else if("down".equals(trendsBean.getVote().getVote_type())) {
								%>
								<div class="row">
									<div id="vote-up-<%=trendsBean.getAnswer().getId() %>" class="vote-number" 
											onclick="vote('<%=trendsBean.getAnswer().getId() %>', 'up');">
										<a>
											<i class="fa fa-caret-up"></i>
											<span id="vote_count-<%=trendsBean.getAnswer().getId() %>" style="display:block;">
												<%=trendsBean.getVoterBean().getUpCount() %>
											</span>
										</a>
									</div>
									
									<div id="vote-down-<%=trendsBean.getAnswer().getId() %>" class="vote-number-pressed"
											onclick="vote('<%=trendsBean.getAnswer().getId() %>', 'down');">
										<a>
											<i class="fa fa-caret-down"></i>
										</a>
									</div>
								</div>	
								<%
										}
									} else {
										// 当前用户没投过票
								%>
								<div class="row">
									<div id="vote-up-<%=trendsBean.getAnswer().getId() %>" class="vote-number" 
											onclick="vote('<%=trendsBean.getAnswer().getId() %>', 'up');">
										<a>
											<i class="fa fa-caret-up"></i>
											<span id="vote_count-<%=trendsBean.getAnswer().getId() %>" style="display:block;">
												<%=trendsBean.getVoterBean().getUpCount() %>
											</span>
										</a>
									</div>
									
									<div id="vote-down-<%=trendsBean.getAnswer().getId() %>" class="vote-number"
											onclick="vote('<%=trendsBean.getAnswer().getId() %>', 'down');">
										<a>
											<i class="fa fa-caret-down"></i>
										</a>
									</div>
								</div>	
								<%
									}
								%>
								
							</div><!-- end avatar and upvote col -->

							<!-- content-details -->
							<div class="content-details col-lg-11 col-md-11 col-sm-10 col-xs-10">

								<div class="row">
									<div class="content-source">
										<a href="#"><%=trendsBean.getTrendsMember().getFullname() %></a> 赞同了该答案
										<span class="source-time">3小时前</span>
									</div>
								</div>
								
								<div class="row">
									<div class="question-link">
										<h5>
											<a href="./QuestionDetails?id=<%=trendsBean.getQuestion().getId() %>">
												<%=trendsBean.getQuestion().getQuestion_title() %>
											</a>
										</h5>
									</div>
								</div>
								
								<div class="row">
									<div class="author-info">
										<a href="#"><strong><%=trendsBean.getMember().getFullname() %></strong></a>,
										<span><%=trendsBean.getMember().getAutograph() %></span>
									</div>
								</div>
								
								<%
									if(trendsBean.getVoterBean().getUpCount() > 0) {
								%>
								<div class="row">
									<div class="content-source">
									<%
										String split = "";	
										for(Member member : trendsBean.getVoterBean().getVoterList()) {
									%>
										<%=split %>
										<a href="#"><%=member.getFullname() %></a>
									<%
											split = "、";
										}
									%>
										等赞同该回答
									</div>
								</div>
								<%
									}
								%>

								<div class="row">
									<div class="question-content">
										<div class="editable-content" style="display: block;">
											<%=trendsBean.getAnswer().getAnswers() %>
											<span class="answer-date" style="display: block;">
												<a target="_blank" href="#">发布于 <%=trendsBean.getAnswer().getAnswer_date() %></a>
											</span>
										</div>
										<div class="summary-content clearfix" style="display: none;">
											<%=trendsBean.getAnswer().getAnswers() %>
										</div>
									</div>
								</div>

								<div class="row">
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
										<a href="#" class="answer-collapse meta-item" style="display:none">
											<i class="fa fa-angle-double-up"></i> 收起
										</a>
									</div>
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
														
						</div><!-- end left main content -->
					</div><!--end left main content wrap  -->
					
					<div class="row">
						<hr style="margin-top:12px;margin-bottom:12px;"/>
					</div>
					
					<%
							}else if("FollowingQuestion".equals(trendsBean.getTrends().getTrends_type())) {
					%>
					<!-- left main content wrap  -->
					<div class="row left-main-content-wrap">
						<div class="left-main-content">

							<!-- avatar and upvote col -->
							<div class="avatar-vote col-lg-1 col-md-1 col-sm-1 col-xs-1">
								<div class="row">
									<a href="#">
										<img src="<%=trendsBean.getMember().getAvatar_path() %>" class="img-responsive img-rounded" alt="Responsive image">
									</a>
								</div>
							</div><!-- end avatar and upvote col -->

							<!-- content-details -->
							<div class="content-details col-lg-11 col-md-11 col-sm-10 col-xs-10">

								<div class="row">
									<div class="content-source">
										<a href="#"><%=trendsBean.getMember().getFullname() %></a> 关注该问题
										<span class="source-time">3小时前</span>
									</div>
								</div>

								<div class="row">
									<div class="question-link">
										<h5>
											<a href="./QuestionDetails?id=<%=trendsBean.getQuestion().getId() %>">
												<%=trendsBean.getQuestion().getQuestion_title() %>
											</a>
										</h5>
									</div>
								</div>

								<div class="row">
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
											if(trendsBean.getQuestion().getReply_num() > 0) {
										%>
										<a href="#comment-<%=trendsBean.getTrends().getId() %>-followingQuestion" onclick="queryQCommentList(<%=trendsBean.getQuestion().getId() %>,<%=trendsBean.getTrends().getId() %>);" 
												data-toggle="collapse" class="meta-item" aria-expanded="false" aria-controls="comment">
											<i class="fa fa-commenting-o"></i> <%=trendsBean.getQuestion().getReply_num() %>条评论
										</a>
										<%
											}else {
										%>
										<a href="#comment-<%=trendsBean.getTrends().getId() %>-followingQuestion" onclick="queryQCommentList(<%=trendsBean.getQuestion().getId() %>,<%=trendsBean.getTrends().getId() %>);" 
												data-toggle="collapse" class="meta-item" aria-expanded="false" aria-controls="comment">
											<i class="fa fa-comment-o"></i> 添加评论
										</a>
										<%
											}
										%>
									</div>
								</div>
								
								<!-- comment -->
								<div id="comment-<%=trendsBean.getTrends().getId() %>-followingQuestion" class="row comment collapse">
									<div class="panel panel-default">
									
										<div id="newQuestionComments-<%=trendsBean.getTrends().getId() %>">
										
										</div>
										<div class="panel-body">
											<div class="form-group">
												<textarea class="form-control" id="qcomment-<%=trendsBean.getQuestion().getId() %>" 
												name="qcomment-<%=trendsBean.getQuestion().getId() %>" rows="1" id="textArea" placeholder="请写下你的评论..."></textarea>
											</div>
											<div class="form-group module-right">
												<button class="btn btn-default btn-sm">取消</button>
												<button type="button" onclick="newQuestionComment('<%=trendsBean.getQuestion().getId() %>');" class="btn btn-primary btn-sm">评论</button>
											</div>
										</div>
										
									</div>
								</div><!--end comment -->

							</div><!-- end content-details -->
														
						</div><!-- end left main content -->
					</div><!--end left main content wrap  -->
					
					<div class="row">
						<hr style="margin-top:12px;margin-bottom:12px;"/>
					</div>
					<%				
								}
							}
						}
					%>

					<!-- left main content wrap  -->
					<div class="row left-main-content-wrap">
						<div class="left-main-content">

							<!-- avatar and upvote col -->
							<div class="avatar-vote col-lg-1 col-md-1 col-sm-1 col-xs-1">
								<div class="row">
									<a href="#">
										<img src="./images/avatar/310d85e8d.jpg" class="img-responsive img-rounded" alt="Responsive image">
									</a>
								</div>
								<div class="row">
									<div class="vote-text-center vote-number">
										<a href="#">
											<i class="fa fa-caret-up"></i>
											<span style="display:block;">122</span>
										</a>
									</div>
									
									<div class="vote-text-center vote-number">
										<a href="#">
											<i class="fa fa-caret-down"></i>
										</a>
									</div>
								</div>
							</div><!-- end avatar and upvote col -->

							<!-- content-details -->
							<div class="content-details col-lg-11 col-md-11 col-sm-10 col-xs-10">

								<div class="row">
									<div class="content-source">
										<a href="#">空明流转</a> 赞同该回答
										<span class="source-time">3小时前</span>
									</div>
								</div>

								<div class="row">
									<div class="question-link">
										<h5><a href="#">除去计算机软件领域，哪些行业软件离不开Windows?</a></h5>
									</div>
								</div>

								<div class="row">
									<div class="author-info">
										<a href="#"><strong>空明</strong></a>,
										<span>RednaxelaFX</span>
									</div>
								</div>

								<div class="row">
									<div class="question-content">
										<div class="editable-content" style="display: block;">
											这个廉价的东西不能退、不能改签应该是常识啊
											这个廉价的东西不能退、不能改签应该是常识啊
											这个廉价的东西不能退、不能改签应该是常识啊
											这个廉价的东西不能退、不能改签应该是常识啊
											这个廉价的东西不能退、不能改签应该是常识啊
											<span class="answer-date" style="display: block;">
												<a target="_blank" href="#">发布于 14:36</a>
											</span>
										</div>
										<div class="summary-content clearfix" style="display: none;">
											这个廉价的东西不能退、不能改签应该是常识啊
											这个廉价的东西不能退、不能改签应该是常识啊
										</div>
									</div>
								</div>
								
								<div class="row">
									<div class="meta-panel">
										<a class="meta-item" href="javascript:;">
											<i class="fa fa-plus"></i> 关注问题
										</a>
										<a href="#" class="meta-item">
											<i class="fa fa-comment-o"></i> 添加评论
										</a>
										<a href="#" class="meta-item" data-thanked="false">
											<i class="fa fa-heart-o"></i> 感谢
										</a>
										<a href="#" class="meta-item">
											<i class="fa fa-share"></i> 分享
										</a>
										<a href="#" class="meta-item">
											<i class="fa fa-bookmark-o"></i> 收藏
										</a>
										<span class="bull">•</span>
										<a href="#" class="meta-item">没有帮助</a>
										<span class="bull">•</span>
										<a href="#" class="meta-item goog-inline-block" style="-webkit-user-select: none;">
											举报
										</a>
										<span class="copyright"></span>
										<a href="#" class="answer-collapse meta-item">
											<i class="fa fa-angle-double-up"></i> 收起
										</a>
									</div>
								</div>

							</div><!-- end content-details -->
														
						</div><!-- end left main content -->
					</div><!--end left main content wrap  -->

					<!-- loding more btn row  -->
					<div class="row">
						<div class="loding-btn">
							<a href="#" class="btn btn-default btn-block">加载更多</a>
						</div>
					</div><!-- end loding more btn row  -->

				</div><!-- end left main-->

				<div class="right-sidebar col-lg-3 col-md-3 col-sm-12 col-xs-12 col-md-offset-1">
					
					<div class="list-group">
						<a href="#" class="list-group-item">
							<i class="fa fa-file-o margin-icon"></i> 我的草稿<span class="badge">14</span>
						</a> 
						<a href="" class="list-group-item">
							<i class="fa fa-bookmark-o margin-icon"></i> 我的收藏<span class="badge">8</span>
						</a> 
						<a href="./FollowingServlet" class="list-group-item">
							<i class="fa fa-check-square-o margin-icon"></i> 我关注的问题<span class="badge">164</span>
						</a> 
						<a href="#" class="list-group-item">
							<i class="fa fa-clone margin-icon"></i> 邀请我回答的问题<span class="badge">85</span>
						</a>
					</div>

					<div class="list-group">
						<a href="#" class="list-group-item"><i class="fa fa-book margin-icon"></i> 所有问题</a> 
						<a href="#" class="list-group-item"><i class="fa fa-th-large margin-icon"></i> 话题广场</a>
						<a href="#" class="list-group-item"><i class="fa fa-list margin-icon"></i> 公共编辑动态</a> 
						<a href="#" class="list-group-item"><i class="fa fa-home margin-icon"></i> 社区服务中心</a>
					</div>
	
				</div><!-- end right sidebar -->

			</div><!-- end main content row -->
		</div><!-- main content -->

	</div><!-- end container -->

	</body>
</html>