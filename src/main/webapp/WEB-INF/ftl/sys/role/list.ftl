<!DOCTYPE html>
<#assign ctx="${request.contextPath}" />
<html>
<head>
	<meta charset="utf-8">
  	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>角色管理</title>
	<@style.common ctx=ctx/>
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="consumer-header">
		<h1>
			角色列表
		</h1>
	    <ol class="breadcrumb">
	      <li><i class="fa fa-dashboard"></i> 系统设置</li>
	      <li>角色管理</li>
	      <li class="active">角色列表</li>
	    </ol>
	</div>
	
	<section class="content">
		<div class="row">
			<div class="col-xs-12">
				<div class="box">
		            <div class="box-header with-border">
		            	<form id="searchForm" class="form-inline" method="post">
		            		<table width="100%">
								<tr>
									<td>
										<div class="form-group">
			                                <input type="text" name="name" class="form-control" value="${sysRole.name}" placeholder="角色名称">
			                            </div>
			                            <div class="form-group padding-bottom">
			                            	<button id="searchButton" type="button" class="btn btn-primary"><i class="fa fa-search-plus"></i>&nbsp;搜索</button>
			                            </div>
									</td>
									<td align="right">
										<div class="form-group padding-bottom">
											<@shiro.hasPermission name="role:save">
											<a class="btn btn-primary" href="${ctx}/sys/role/save/go"><i class="fa fa-user-plus"></i>&nbsp;添加角色</a>
											</@shiro.hasPermission>
										</div>
									</td>
								</tr>
							</table>
		            	</form>
		            </div>
		            
		            <!-- table start -->
		            <div class="box-body">
		            	<table id="contentTable" class="table table-bordered table-hover">
                			<thead>
                				<tr>
				                  	<th style="width: 10%">序号</th>
				                  	<th style="width: 20%">ID</th>
				                  	<th style="width: 40%">角色名称</th>
				                  	<th style="width: 30%">操作</th>
				                </tr>
                			</thead>
		                	<tbody>
		                	</tbody>
              			</table>
		            </div>
		            <!-- table end -->
				</div>
			</div>
		</div>
	</section>
	
	<script>
	$(function(){
		var _table = $('#contentTable').initAjaxDataTable({
			url: '${ctx}/sys/role/get/page',
			form: $('#searchForm'),
			columns: [
				{
					data: null,
					render: function(data, type, row, meta) {
						return meta.row + 1 + meta.settings._iDisplayStart;;
	                }
				},
				{data: 'id'},
				{data: 'name'},
				{
					data: 'id',
					render: function(data, type, row, meta) {
						return '<@shiro.hasPermission name="role:save"><a href="${ctx}/sys/role/save/go?id=' + data +'" style="padding-right:10px"><i class="fa fa-edit fa-fw fa-lg"></i></a></@shiro.hasPermission>' +
	              		'<@shiro.hasPermission name="role:delete"><a href="javascript:remove(' + data +')" style="padding-right:10px"><i class="fa fa-trash-o fa-fw fa-lg"></i></a></@shiro.hasPermission>' +
	              		'<@shiro.hasPermission name="role:permission"><a href="${ctx}/sys/role/permission/go/' + data +'" style="padding-right:10px" data-toggle="tooltip" data-placement="right" title="授权"><i class="fa fa-gear fa-fw fa-lg"></i></a></@shiro.hasPermission>';
	                }
				}
			],
			createdRow: function(row, data, dataIndex){
				$(row).find('[data-toggle=tooltip]').tooltip();
			}
		});
		
		$("#searchButton").click(function(){
			console.log($('[name=username]').val());
			console.log($('[name=status]').val());
	        _table.draw();
	    });
	});
	
	function remove(id){
		ajaxDelete('${ctx}/sys/role/delete/'+id, '确认删除ID为 '+id+' 的角色吗？');
	}
	</script>
</body>
</html>