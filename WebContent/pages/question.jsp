<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mellisuga.model.*" %>
<%@ page import="com.mellisuga.bean.*" %>
<%@ page import="java.util.List" %>
<%@include file="sitename.jsp"%>
<%
String path = request.getContextPath();   
String basePath = request.getScheme() + "://" + request.getServerName() + ":" 
	+ request.getServerPort() + path + "/" ;

Member m = (Member) request.getSession().getAttribute("member");
QuestionBean questionBean = (QuestionBean) request.getAttribute("questionBean");

boolean is_answered = false;
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<base href="<%=basePath %>">
	<title><%=questionBean.getQuestion().getQuestion_title() %> - <%=sitename %></title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />

	<!-- js css plugin include -->
	<%@include file="include.jsp"%>
	
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
						<div class="question-detail">
							<div class="question-tag">
							<%
								if(questionBean.getTagList() != null && !questionBean.getTagList().isEmpty()) {
									for(Tag t : questionBean.getTagList()) {
							%>
								<span class="label label-primary"><%=t.getTagname() %></span>
							<%
									}
								}
							%>
								<a href="#" class="item-edit">
									<i class="fa fa-edit"></i>  
									修改
								</a>
							</div>
							<div class="question-title">
								<strong><%=questionBean.getQuestion().getQuestion_title() %></strong>
								<a href="#" class="item-edit">
									<i class="fa fa-edit"></i> 
									修改
								</a>
							</div>
							<div class="question-contents">
								<%=questionBean.getQuestion().getQuestion_content() %>
								<a href="#" class="item-edit">
									<i class="fa fa-edit"></i> 
									修改
								</a>
							</div>
							<div class="q-meta-panel">
								<%
									if(questionBean.getQuestion().getReply_num() > 0) {
										
								%>
								<a href="#comment-<%=questionBean.getQuestion().getId() %>-qpage" onclick="queryQCommentList(<%=questionBean.getQuestion().getId() %>);" 
									data-toggle="collapse" class="q-meta-item">
									<i class="fa fa-commenting-o"></i> 
									<%=questionBean.getQuestion().getReply_num() %>条评论
								</a>
								<%
									}else {
								%>
								<a href="#comment-<%=questionBean.getQuestion().getId() %>-qpage" onclick="queryQCommentList(<%=questionBean.getQuestion().getId() %>);" 
									 data-toggle="collapse" class="q-meta-item">
									<i class="fa fa-comment-o"></i> 
									添加评论
								</a>
								<%
									}
								%>
								<a href="#" class="q-meta-item">
									<i class="fa fa-share"></i> 
									分享
								</a> 
								<span class="zg-bull">•</span> 
								<a href="#" class="q-meta-item">邀请回答</a>
								<div class="btn-group q-meta-item-right">
									<a onclick="reportList(0, this);" class="meta-item dropdown-toggle" data-toggle="dropdown">
										<i class="fa fa-flag-o"></i>  
										举报
									</a>
									<ul class="dropdown-menu">
									</ul>
								</div>
							</div>
							
							<!-- comment -->
							<div id="comment-<%=questionBean.getQuestion().getId() %>-qpage" class="row comment collapse" style="margin-left: 10px;margin-right:10px;">
								<div class="panel panel-default">
									<div id="newQuestionComments-<%=questionBean.getQuestion().getId() %>">
									
									</div>
									<div class="panel-body">
										<div class="form-group">
											<textarea class="form-control" id="qcomment-<%=questionBean.getQuestion().getId() %>" 
												name="qcomment-<%=questionBean.getQuestion().getId() %>" rows="1" placeholder="请写下你的评论..."></textarea>
										</div>
										<div class="form-group module-right">
											<button class="btn btn-default btn-sm">取消</button>
											<button type="button" onclick="newQuestionComment('<%=questionBean.getQuestion().getId() %>');" class="btn btn-primary btn-sm">评论</button>
										</div>
									</div>
									
								</div>
							</div><!--end comment -->
							
						</div><!-- end question detail -->

						<%
							if(questionBean.getAnswerBeanList() != null && !questionBean.getAnswerBeanList().isEmpty()) {
						%>
						<div class="answer-info">
							<span><%=questionBean.getAnswerBeanList().size() %>个回答</span>
							<div class="btn-group answer-sort">
								<a href="#" class="btn btn-default btn-xs">按票数排序</a> 
								<a href="#" class="btn btn-default dropdown-toggle btn-xs" data-toggle="dropdown">
									<span class="caret"></span>
								</a>
								<ul class="dropdown-menu">
									<li><a href="#">按时间排序</a></li>
								</ul>
							</div>
						</div><!-- end answer info -->
						<%
							}
						%>
					</div><!-- end question title row -->

					
					<%
						// 有答案时显示全部答案
						if(questionBean.getAnswerBeanList() != null 
							&& !questionBean.getAnswerBeanList().isEmpty()) {
							for(AnswerBean ab : questionBean.getAnswerBeanList()) {
								// 判断是否已回答
								if(ab.getAnswer().getAuthor_id() == m.getId()) {
									is_answered = true;
								}
					%>
					<!-- left main content wrap  -->
					<div class="row left-main-content-wrap" onmouseenter="showItem('hidden-item-<%=ab.getAnswer().getId() %>')" 
							onmouseleave="hiddenItem('hidden-item-<%=ab.getAnswer().getId() %>')">
						<div class="left-main-content">

							<!-- avatar and upvote col -->
							<div class="avatar-vote col-lg-1 col-md-1 col-sm-1 col-xs-1">
								<div class="row">
									<a href="#">
										<img src="<%=ab.getMember().getAvatar_path() %>" class="img-responsive img-rounded" alt="Responsive image">
									</a>
								</div>
								<%
									// 判断当前用户是否投票过
									if(ab.getVote() != null) {
										if("up".equals(ab.getVote().getVote_type())) {
								%>
								<div class="row">
									<div id="vote-up-<%=ab.getAnswer().getId() %>" class="vote-number-pressed" 
											onclick="vote('<%=ab.getAnswer().getId() %>', 'up');">
										<a>
											<i class="fa fa-caret-up"></i>
											<span id="vote_count-<%=ab.getAnswer().getId() %>" style="display:block;">
												<%=ab.getVoterBean().getUpCount() %>
											</span>
										</a>
									</div>
									
									<div id="vote-down-<%=ab.getAnswer().getId() %>" class="vote-number"
											onclick="vote('<%=ab.getAnswer().getId() %>', 'down');">
										<a>
											<i class="fa fa-caret-down"></i>
										</a>
									</div>
								</div>
								<%
										} else if("down".equals(ab.getVote().getVote_type())) {
								%>
								<div class="row">
									<div id="vote-up-<%=ab.getAnswer().getId() %>" class="vote-number" 
											onclick="vote('<%=ab.getAnswer().getId() %>', 'up');">
										<a>
											<i class="fa fa-caret-up"></i>
											<span id="vote_count-<%=ab.getAnswer().getId() %>" style="display:block;">
												<%=ab.getVoterBean().getUpCount() %>
											</span>
										</a>
									</div>
									
									<div id="vote-down-<%=ab.getAnswer().getId() %>" class="vote-number-pressed"
											onclick="vote('<%=ab.getAnswer().getId() %>', 'down');">
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
									<div id="vote-up-<%=ab.getAnswer().getId() %>" class="vote-number" 
											onclick="vote('<%=ab.getAnswer().getId() %>', 'up');">
										<a>
											<i class="fa fa-caret-up"></i>
											<span id="vote_count-<%=ab.getAnswer().getId() %>" style="display:block;">
												<%=ab.getVoterBean().getUpCount() %>
											</span>
										</a>
									</div>
									
									<div id="vote-down-<%=ab.getAnswer().getId() %>" class="vote-number"
											onclick="vote('<%=ab.getAnswer().getId() %>', 'down');">
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
									<div class="author-info">
										<a href="#"><strong><%=ab.getMember().getFullname() %></strong></a>,
										<span><%=ab.getMember().getAutograph() %></span>
									</div>
								</div>

								<%
									if(ab.getVoterBean().getUpCount() > 0) {
								%>
								<div class="row">
									<div class="content-source">
									<%
										String split = "";	
										for(Member member : ab.getVoterBean().getVoterList()) {
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
											<div style="margin-top:12px; margin-bottom:12px;">
												<%=ab.getAnswer().getAnswers() %>
											</div>
											<span class="answer-date" style="display: block;">
												<a target="_blank" href="#">发布于 <%=ab.getAnswer().getAnswer_date() %></a>
												<%
													if(is_answered) {
												%>
												<a href="#" class="module-right" style="padding-right: 5px;">
													<i class="fa fa-edit"></i> 编辑
												</a>
												<%
													}
												%>
											</span>
										</div>
										<div class="summary-content clearfix" style="display: none;">
											<%=ab.getAnswer().getAnswers() %>
										</div>
									</div>
								</div>

								<div class="row">
									<div class="meta-panel">
										<a class="meta-item" href="javascript:;">
											<i class="fa fa-plus"></i> 关注问题
										</a>
										<%
											// 判断是否有评论	
											if(ab.getAnswer().getReply_num() == 0) {
										%>
										<a href="#comment-<%=ab.getAnswer().getId() %>" 
											onclick="queryACommentList(<%=ab.getAnswer().getId() %>);"  
											data-toggle="collapse" class="meta-item">
											 <i class="fa fa-comment-o"></i> 添加评论
										</a>
										<%
											} else {
										%>
										<a href="#comment-<%=ab.getAnswer().getId() %>" 
											onclick="queryACommentList(<%=ab.getAnswer().getId() %>);" 
											data-toggle="collapse" class="meta-item">
											<i class="fa fa-commenting-o"></i> 
											<%=ab.getAnswer().getReply_num() %>条评论
										</a>
										<%
											}
										%>
											
										<%
											// 判断是否已感谢作者回答
											if(!ab.isThanked()) {
										%>
										<a title="thankAuthor" onclick="thankAuthor(<%=ab.getAnswer().getId() %>);"
											id="thankAuthor-<%=ab.getAnswer().getId() %>" class="meta-item" data-thanked="false">
											<i class="fa fa-heart-o"></i> 感谢
										</a>
										<%
											}else {
										%>
										<a title="thankedAuthor" onclick="thankAuthor(<%=ab.getAnswer().getId() %>);"
											id="thankAuthor-<%=ab.getAnswer().getId() %>" class="meta-item" data-thanked="false">
											<i class="fa fa-heart-o"></i> 取消感谢
										</a>
										<%
											}
										%>
										
										<a href="#" class="meta-item">
											<i class="fa fa-share"></i> 分享
										</a>
										<a onclick="getCollectionList(<%=ab.getAnswer().getId() %>);" data-toggle="modal" data-target="#collectionModal" data-backdrop="false" class="meta-item">
											<i class="fa fa-bookmark-o"></i> 收藏
										</a>
										<span class="bull">•</span>
										
										<%
											// 判断是否没有帮助
											if(!ab.isNoHelp()) {
										%>
										<a title="nohelp" onclick="nohelp(<%=ab.getAnswer().getId() %>);"
											id="nohelp-<%=ab.getAnswer().getId() %>" class="meta-item">没有帮助</a>
										<%
											} else {
										%>
										<a title="unnohelp" onclick="nohelp(<%=ab.getAnswer().getId() %>);"
											id="nohelp-<%=ab.getAnswer().getId() %>" class="meta-item">撤消没有帮助</a>
										<%
											}	
										%>
										<span class="bull">•</span>
										<div class="btn-group">
											<a onclick="reportList(1, this);" class="meta-item dropdown-toggle" data-toggle="dropdown">
												<i class="fa fa-flag-o"></i>  
												举报
											</a>
											<ul class="dropdown-menu">
											</ul>
										</div>
										<span class="bull">•</span>
										<a href="#" class="meta-item">作者保留权利</a>
										<span class="copyright"></span>
										<a href="#" class="answer-collapse meta-item">
											<i class="fa fa-angle-double-up"></i> 收起
										</a>
									</div>
								</div>
								
								<!-- comment -->
								<div id="comment-<%=ab.getAnswer().getId() %>" class="row comment collapse">
									<div class="panel panel-default">
										<div id="newAnswerComments-<%=ab.getAnswer().getId() %>">
										
										</div>
										<div class="panel-body">
											<div class="form-group">
												<textarea class="form-control" id="acomment-<%=ab.getAnswer().getId() %>" name="acomment-<%=ab.getAnswer().getId() %>" rows="1" placeholder="请写下你的评论..."></textarea>
											</div>
											<div class="form-group module-right">
												<button class="btn btn-default btn-sm">取消</button>
												<button type="button" onclick="newAnswerComment('<%=ab.getAnswer().getId() %>');" class="btn btn-primary btn-sm">评论</button>
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
					%>
		
					<!-- new answer div -->
					<div id="newAnswers">
					</div>

					<!-- loding more btn row 
					<div class="row">
						<div class="loding-btn">
							<a href="#" class="btn btn-default btn-block">加载更多</a>
						</div>
					</div>

					<div class="row">
						<hr style="margin-top:12px;margin-bottom:12px;"/>
					</div> -->
					
					<% 
						// 判断是否已回答
						if (!is_answered) {
					%>
					<!-- post editor -->
					<div class="row">
						<div class="post-main">
							<div class="post-source">
								<a href="#"><%=m.getFullname() %></a>
							</div>
							<div class="content">
								<div id="answer-editor" class="">
									<textarea class="form-control" id="answers" name="answers" rows="4" onfocus="renderAnswerEditor();"></textarea>
								</div>

								<div class="checkbox post-module">
									<label> 
										<input type="checkbox" id="is_anonymous" name="is_anonymous" value="1">匿名
									</label>
									<button class="btn btn-default" onclick="showContent()">取消</button>
									<button type="button" onclick="newAnswer('<%=questionBean.getQuestion().getId() %>')" class="btn btn-primary">提交</button>
								</div>
							</div>
						</div>
					</div><!-- end post editor -->
					<% 
						}
					%>

				</div><!-- end left main-->

				<div class="right-sidebar col-lg-3 col-md-3 col-sm-12 col-xs-12 col-lg-offset-1 col-md-offset-1">
										
					<div class="follow-btn">
						<%
							if(!questionBean.isFollowing()) {
						%>
						<button id="followQuestion-<%=questionBean.getQuestion().getId() %>" onclick="followQuestion(<%=questionBean.getQuestion().getId() %>)" 
								class="btn btn-primary">关注问题</button>
						<%
							} else {
						%>
						<button id="followQuestion-<%=questionBean.getQuestion().getId() %>" onclick="followQuestion(<%=questionBean.getQuestion().getId() %>)" 
								class="btn btn-default">取消关注</button>
						<%
							}
						%>
						<div class="btn-group">
							<a href="#" class="btn btn-default"><i class="fa fa-cog"></i></a> 
							<a href="#" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
								<span class="caret"></span>
							</a>
							<ul class="dropdown-menu">
								<li><a href="#">使用匿名身份</a></li>
								<li><a href="#">问题重定向</a></li>
							</ul>
						</div>
					</div>

					<div class="sidebar-group">
						<span><a href="#"><%=questionBean.getQuestion().getFollowers_num() %></a> 人关注该问题</span>
					</div>

					<div class="sidebar-group">
						<span class="sidebar-group-title"><strong>相关问题</strong></span>
						<div class="similar-question-group">
							<div class="similar-question">
								<a href="#">起草劳动合同容易犯的错误有哪些，能否举例说明？</a> 9 个回答
							</div>
							<div class="similar-question">
								<a href="#">起草劳动合同容易犯的错误有哪些，能否举例说明？</a> 9 个回答
							</div>
							<div class="similar-question">
								<a href="#">起草劳动合同容易犯的错误有哪些，能否举例说明？</a> 9 个回答
							</div>
						</div>
					</div>

					<hr>

					<div class="sidebar-group">
						<span class="sidebar-group-title"><strong>问题状态</strong></span>
						<div class="similar-question">
							最近活动于 10:02 • <a href="./LogServlet">查看问题日志</a><br>
							被浏览 6800 次，相关话题关注者 617946 人 9 个回答
						</div>
					</div>

				</div><!-- end right sidebar -->

			</div><!-- end main content row -->
		</div><!-- main content -->

	</div><!-- end container -->

	</body>
</html>