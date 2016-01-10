<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mellisuga.model.*" %>
<%@ page import="com.mellisuga.bean.*" %>
<%@ page import="com.mellisuga.utils.*" %>
<%@ page import="com.mellisuga.function.*" %>
<%@ page import="com.github.pagehelper.PageInfo" %>
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
	CollectionsDetailBean collectionDetailBean = (CollectionsDetailBean) request.getAttribute("collectionDetailBean");
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
						<%
							if(collectionDetailBean.isMyCollection()) {
						%>
							<a href="./CollectionsServlet" style="color:#999;"><i class="fa fa-angle-double-left"></i> 去我的收藏</a>
						<%
							} else {
						%>
							<a href="#" style="color:#999;"><i class="fa fa-angle-double-left"></i> <%=collectionDetailBean.getFolderOwner().getFullname() %> 的收藏</a>
							<span class="news-setting">
								<a href="./CollectionsServlet">
									  去我的收藏 <i class="fa fa-angle-double-right"></i> 
								</a>
							</span>
						<%
							}
						%>
						</div><!-- end left main title -->
						<div class="" style="margin-top:5px;margin-bottom:5px; font-size:22px;">
							<a href=""><strong><%=collectionDetailBean.getCollectionFolder().getFoldername() %></strong></a>
						</div>
						<div class="row">
							<div class="meta-panel" style="margin-left:10px; font-size:12px;">
								<a href="#" class="meta-item">
									<i class="fa fa-comment-o"></i> 添加评论
								</a>
								<span class="bull">•</span>
								<a href="#comment--agreeWithThisAnswer" onclick="queryACommentList();" 
										data-toggle="collapse" class="meta-item" aria-expanded="false" aria-controls="comment">
									修改记录
								</a>
								<span class="bull">•</span>
								<a href="#comment--agreeWithThisAnswer" onclick="queryACommentList();" 
										data-toggle="collapse" class="meta-item" aria-expanded="false" aria-controls="comment">
									编辑
								</a>
								<span class="bull">•</span>
								<a href="#comment--agreeWithThisAnswer" onclick="queryACommentList();" 
										data-toggle="collapse" class="meta-item" aria-expanded="false" aria-controls="comment">
									删除
								</a>
							</div>
						</div>
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
						if(collectionDetailBean.getCollectionBeanList() == null 
							|| collectionDetailBean.getCollectionBeanList().isEmpty()) {
					%>
						对不起，当前收藏夹为空！
					<% 
						} else {
							for(CollectionBean cb : collectionDetailBean.getCollectionBeanList()) {
					%>
					<!-- left main content wrap  -->
					<div class="row left-main-content-wrap" onmouseenter="showItem('hidden-item-<%=cb.getAnswer().getId() %>')" 
							onmouseleave="hiddenItem('hidden-item-<%=cb.getAnswer().getId() %>')">
						<div class="left-main-content">

							<!-- avatar and upvote col -->
							<div id="vote-detail-<%=cb.getAnswer().getId() %>" style="display: none;"  class="avatar-vote col-lg-1 col-md-1 col-sm-1 col-xs-1">
								<div class="row">
									<a href="./HomeServlet?id=<%=cb.getMember().getId() %>">
										<img src="<%=cb.getMember().getAvatar_path() %>" class="img-responsive img-rounded" alt="Responsive image">
									</a>
								</div>
								<%
									// 判断当前用户是否投票过
									if(cb.getVote() != null) {
										if("up".equals(cb.getVote().getVote_type())) {
								%>
								<div class="row">
									<div id="vote-up-<%=cb.getAnswer().getId() %>" class="vote-number-pressed" 
											onclick="vote('<%=cb.getAnswer().getId() %>', 'up');">
										<a>
											<i class="fa fa-caret-up"></i>
											<span id="vote_count-<%=cb.getAnswer().getId() %>" style="display:block;">
												<%=cb.getVoterBean().getUpCount() %>
											</span>
										</a>
									</div>
									
									<div id="vote-down-<%=cb.getAnswer().getId() %>" class="vote-number"
											onclick="vote('<%=cb.getAnswer().getId() %>', 'down');">
										<a>
											<i class="fa fa-caret-down"></i>
										</a>
									</div>
								</div>
								<%
										} else if("down".equals(cb.getVote().getVote_type())) {
								%>
								<div class="row">
									<div id="vote-up-<%=cb.getAnswer().getId() %>" class="vote-number" 
											onclick="vote('<%=cb.getAnswer().getId() %>', 'up');">
										<a>
											<i class="fa fa-caret-up"></i>
											<span id="vote_count-<%=cb.getAnswer().getId() %>" style="display:block;">
												<%=cb.getVoterBean().getUpCount() %>
											</span>
										</a>
									</div>
									
									<div id="vote-down-<%=cb.getAnswer().getId() %>" class="vote-number-pressed"
											onclick="vote('<%=cb.getAnswer().getId() %>', 'down');">
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
									<div id="vote-up-<%=cb.getAnswer().getId() %>" class="vote-number" 
											onclick="vote('<%=cb.getAnswer().getId() %>', 'up');">
										<a>
											<i class="fa fa-caret-up"></i>
											<span id="vote_count-<%=cb.getAnswer().getId() %>" style="display:block;">
												<%=cb.getVoterBean().getUpCount() %>
											</span>
										</a>
									</div>
									
									<div id="vote-down-<%=cb.getAnswer().getId() %>" class="vote-number"
											onclick="vote('<%=cb.getAnswer().getId() %>', 'down');">
										<a>
											<i class="fa fa-caret-down"></i>
										</a>
									</div>
								</div>	
								<%
									}
								%>
								
							</div><!-- end avatar and upvote col -->
							
							<!-- avatar and upvote col -->
							<div id="vote-digest-<%=cb.getAnswer().getId() %>" style="display: block;" class="avatar-vote col-lg-1 col-md-1 col-sm-1 col-xs-1">
								<div class="row">
									<div class="vote-number">
										<a>
											<span style="display:block;">
												<%=cb.getVoterBean().getUpCount() %>
											</span>
										</a>
									</div>
								</div>
							</div><!-- end avatar and upvote col -->

							<!-- content-details -->
							<div class="content-details col-lg-11 col-md-11 col-sm-10 col-xs-10">

								<div class="row">
									<div class="question-link">
										<h5>
											<a href="./QuestionDetails?id=<%=cb.getQuestion().getId() %>">
												<%=cb.getQuestion().getQuestion_title() %>
											</a>
										</h5>
									</div>
								</div>
								
								<div class="row">
									<div class="author-info">
										<a href="./HomeServlet?id="><strong><%=cb.getMember().getFullname() %></strong></a>,
										<span><%=cb.getMember().getAutograph() %></span>
									</div>
								</div>
								
								<%
									if(cb.getVoterBean().getUpCount() > 0) {
								%>
								<div class="row">
									<div class="content-source">
									<%
										String split = "";	
										for(Member member : cb.getVoterBean().getVoterList()) {
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

								<div class="row" onclick="getDigestSource(<%=cb.getAnswer().getId() %>);">
									<div class="question-content">
										<div id="editable-content-<%=cb.getAnswer().getId() %>" style="display: none;">
											<%=cb.getAnswer().getAnswers() %>
											<span class="answer-date" style="display: block;">
												<a target="_blank" href="#">发布于 <%=TimeUtils.getPostTime(cb.getAnswer().getAnswer_date()) %></a>
											</span>
										</div>
										<div id="summary-content-<%=cb.getAnswer().getId() %>" style="display: block;cursor: pointer;">
											<%=DigestFunc.getDigest(cb.getAnswer().getAnswers(), 200, " ...") %>
										</div>
									</div>
								</div>

								<div class="row">
									<div class="meta-panel">
										
										<%	// 判断是否已关注问题
											if(!cb.isFollowing()) {
												
										%>
										<a class="meta-item" title="follow" id="followQuestion-<%=cb.getAnswer().getId() %>" 
											onclick="followQuestionOnTrends(<%=cb.getQuestion().getId() %>, <%=cb.getAnswer().getId() %>)" >
											<i class="fa fa-plus"></i> 关注问题
										</a>
										<%
											} else {
										%>
										<a class="meta-item" title="following" id="followQuestion-<%=cb.getAnswer().getId() %>" 
											onclick="followQuestionOnTrends(<%=cb.getQuestion().getId() %>, <%=cb.getAnswer().getId() %>)" >
											取消关注
										</a>
										<%
											}
										%>
										
										<%
											// 判断是否有评论	
											if(cb.getAnswer().getReply_num() == 0) {
										%>
										<a href="#comment-<%=cb.getAnswer().getId() %>" 
											onclick="queryACommentList(<%=cb.getAnswer().getId() %>);"  
											data-toggle="collapse" class="meta-item">
											 <i class="fa fa-comment-o"></i> 添加评论
										</a>
										<%
											} else {
										%>
										<a href="#comment-<%=cb.getAnswer().getId() %>" 
											onclick="queryACommentList(<%=cb.getAnswer().getId() %>);" 
											data-toggle="collapse" class="meta-item">
											<i class="fa fa-commenting-o"></i> 
											<%=cb.getAnswer().getReply_num() %>条评论
										</a>
										<%
											}
										%>
										
										<div id="hidden-item-<%=cb.getAnswer().getId() %>" style="display:none;">
										
										<%
											if(!cb.isThanked()) {
										%>
											<a title="thankAuthor" onclick="thankAuthor(<%=cb.getAnswer().getId() %>);"
												id="thankAuthor-<%=cb.getAnswer().getId() %>"  class="meta-item" data-thanked="false">
												<i class="fa fa-heart-o"></i> 感谢
											</a>
										<%
											} else {
										%>
											<a title="thankedAuthor" onclick="thankAuthor(<%=cb.getAnswer().getId() %>);"
												id="thankAuthor-<%=cb.getAnswer().getId() %>"  class="meta-item" data-thanked="false">
												<i class="fa fa-heart-o"></i> 取消感谢
											</a>
										<%
											}
										%>
										
											<a href="#" class="meta-item" >
												<i class="fa fa-share"></i> 分享
											</a>
											<a onclick="getCollectionList(<%=cb.getAnswer().getId() %>);" data-toggle="modal" data-target="#collectionModal" data-backdrop="false" class="meta-item">
												<i class="fa fa-bookmark-o"></i> 收藏
											</a>
											<span class="bull">•</span>
											
											<%
												// 判断是否没有帮助
												if(!cb.isNoHelp()) {
											%>
											<a title="nohelp" onclick="nohelp(<%=cb.getAnswer().getId() %>);"
												id="nohelp-<%=cb.getAnswer().getId() %>" class="meta-item">没有帮助</a>
											<%
												} else {
											%>
											<a title="unnohelp" onclick="nohelp(<%=cb.getAnswer().getId() %>);"
												id="nohelp-<%=cb.getAnswer().getId() %>" class="meta-item">撤消没有帮助</a>
											<%
												}	
											%>
											
											<span class="bull">•</span>
											<div class="btn-group">
												<a onclick="reportList(1, this, 1, );" class="meta-item dropdown-toggle" data-toggle="dropdown">
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
										<a id="retract-<%=cb.getAnswer().getId() %>" href="javascript: retract(<%=cb.getAnswer().getId() %>);" class="answer-collapse meta-item" style="display:none">
											<i class="fa fa-angle-double-up"></i> 收起
										</a>
									</div>
								</div>
								
								<!-- comment -->
								<div id="comment-<%=cb.getAnswer().getId() %>" class="row comment collapse">
									<div class="panel panel-default">
										<div id="newAnswerComments-<%=cb.getAnswer().getId() %>">
										
										</div>
										<div class="panel-body">
											<div class="form-group">
												<textarea class="form-control" id="acomment-<%=cb.getAnswer().getId() %>" name="acomment-<%=cb.getAnswer().getId() %>" rows="1" placeholder="请写下你的评论..."></textarea>
											</div>
											<div class="form-group module-right">
												<button class="btn btn-default btn-sm">取消</button>
												<button type="button" onclick="newAnswerComment('<%=cb.getAnswer().getId() %>');" class="btn btn-primary btn-sm">评论</button>
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
					
				</div><!-- end left main-->

				<div class="right-sidebar col-lg-3 col-md-3 col-sm-12 col-xs-12 col-lg-offset-1 col-md-offset-1">
					
					<%
						// 不是当前用户时才显示关注按钮
						if(!collectionDetailBean.isMyCollection()) {
					%>					
					<div class="follow-btn">
						<%
							if(!collectionDetailBean.isFollowing()) {
						%>
						<button id="followCollectionFolder-<%=collectionDetailBean.getCollectionFolder().getId() %>" 
							onclick="followCollectionFolder(<%=collectionDetailBean.getCollectionFolder().getId() %>)" 
							class="btn btn-primary">关注收藏夹</button>
						<%
							} else {
						%>
						<button id="followCollectionFolder-<%=collectionDetailBean.getCollectionFolder().getId() %>" 
							onclick="followCollectionFolder(<%=collectionDetailBean.getCollectionFolder().getId() %>)" 
							class="btn btn-default">取消关注</button>
						<%	
							}
						%>
					</div>
					<hr>
					<%
						}
					%>

					<div class="sidebar-group" style="padding-bottom:45px;">
						<span><strong>关于创建者</strong></span>
						<%
							if(collectionDetailBean.isMyCollection()) {
						%>
						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
							<img src="<%=m.getAvatar_path() %>" width="60" height="60" class="img-responsive img-rounded" alt="Responsive image" title="<%=m.getFullname() %>">
						</div>
						<%
							} else {
						%>
						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
							<img src="<%=collectionDetailBean.getFolderOwner().getAvatar_path() %>" width="60" height="60" title="<%=collectionDetailBean.getFolderOwner().getFullname() %>" class="img-responsive img-rounded" alt="Responsive image">
						</div>
						<div  class="col-lg-6 col-md-6 col-sm-6 col-xs-6" style="margin-top:10px">
							<button id="followQuestion-" class="btn btn-success btn-xs">关注ta</button>
						</div>
						<%
							}
						%>
					</div>
					<hr>

					<div class="sidebar-group">
						<span class="sidebar-group-title"><strong>收藏夹状态</strong></span>
						<div class="similar-question">
							最近活动于 10:02 • <a href="./LogServlet">查看收藏夹日志</a><br>
							被浏览 6800 次，相关话题关注者 617946 人 9 个回答
						</div>
					</div>
					<hr>

					<div class="sidebar-group">
						<span><a href="#"><%=collectionDetailBean.getCollectionFolder().getFollowers_num() %></a> 人关注该收藏夹</span>
					</div>
					<hr>
					<div class="sidebar-group">
						<span class="sidebar-group-title"><strong>热门收藏夹</strong></span>
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

				</div><!-- end right sidebar -->

			</div><!-- end main content row -->
		</div><!-- main content -->

	</div><!-- end container -->

	</body>
</html>