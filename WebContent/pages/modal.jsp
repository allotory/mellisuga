<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Search Modal -->
<div class="modal fade" id="searchModal" tabindex="-1" role="dialog"
	aria-labelledby="提问">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">提问</h4>
			</div>
			<div class="modal-body">
				<form>
					<div class="form-group">
						<label for="recipient-name" class="control-label">问题：</label> 
						<input type="text" class="form-control" id="recipient-name" placeholder="写下你的问题">
					</div>
					<div class="form-group">
						<label for="message-text" class="control-label">问题说明（可选）：</label>

						<div class="editor">
							<textarea class="form-control" id="myModalEditor"></textarea>
						</div>

						<!-- <script>
						$(function() {
							var myModalEditor = new Editor();
							myModalEditor.render('#myModalEditor');
						});
						</script> -->
					</div>
					<div class="form-group">
						<label for="message-text" class="control-label">选择话题：</label> 
						<input type="text" class="form-control" id="recipient-name" data-role="tagsinput" placeholder="搜索话题">
						<span class="help-block">话题越精准，越容易让相关领域专业人士看到你的问题</span>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<label style="float: left;"> 
					<input type="checkbox"> 匿名
				</label>
				<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
				<button type="button" class="btn btn-primary">发布</button>
			</div>
		</div>
	</div>
</div>
<!-- end Modal -->

<!-- Collection Modal -->
<div class="modal fade" id="collectionModal" tabindex="-1" role="dialog" aria-labelledby="收藏夹">
	<div class="modal-dialog" role="document">
		
		<!-- 收藏夹列表 -->
		<div id="collectionListModal" class="modal-content" style="display:block;">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">
					<b>添加到收藏夹</b>
				</h4>
			</div>
			<div id="collectionFolderList" class="modal-body">
				<!-- panel -->
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" onclick="newCollectionRedirect();">创建收藏夹</button>
			</div>
		</div>
	
		<!-- 创建收藏夹 -->
		<div id="newCollectionModal" class="modal-content" style="display:none;">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">
					<b>创建新收藏夹</b>
				</h4>
			</div>
			<div class="modal-body">
				<form id="newCollectionForm">
					<div class="form-group">
						<label for="recipient-name" class="control-label">标题：</label> 
						<input type="text" class="form-control" id="foldername" name="foldername" placeholder="最多输入20个字">
					</div>
					<div class="form-group">
						<label for="message-text" class="control-label">描述（可选）：</label>
						<textarea id="description" name="description" class="form-control" rows="4" placeholder="最多输入256个字" ></textarea>
					</div>
					<div class="form-group">
						<div class="radio">
							<label>
								<input type="radio" id="is_public_y" name="is_public" value="1" checked="checked">
								公开 <span style="font-size: 11px; color: #999;">公开后不能设为秘密</span>
							</label>
						</div>
						<div class="radio">
							<label>
								<input type="radio" id="is_public_n" name="is_public" value="0">
								秘密 <span style="font-size: 11px; color: #999;">只有你可以查看这个收藏夹</span>
							</label>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
				<button type="button" class="btn btn-primary" onclick="newCollection();">确认创建</button>
			</div>
		</div>
	</div>
</div>