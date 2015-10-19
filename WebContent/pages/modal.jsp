<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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

<!-- Search Modal -->
<div class="modal fade" id="searchModal" tabindex="-1" role="dialog" aria-labelledby="提问">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
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
							<textarea id="myModalEditor"></textarea>
						</div>

						<script>
						$(function() {
							var myModalEditor = new Editor();
							myModalEditor.render('#myModalEditor');
						});
						</script>
					</div>
					<div class="form-group">
						<label for="message-text" class="control-label">选择话题：</label>
						<input type="text" class="form-control" id="recipient-name" data-role="tagsinput"  placeholder="搜索话题">
						<span class="help-block">话题越精准，越容易让相关领域专业人士看到你的问题</span>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<label style="float:left;">
					<input type="checkbox"> 匿名
				</label>
				<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
				<button type="button" class="btn btn-primary">发布</button>
			</div>
		</div>
	</div>
</div><!-- end Modal -->


<!-- Collection Modal -->
<div class="modal fade" id="collectionModal" tabindex="-1" role="dialog" aria-labelledby="收藏夹">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>