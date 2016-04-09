<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>


<div class="page-header">
	<h1>
		添加写字楼 <small> <i class="ace-icon fa fa-angle-double-right"></i>
			基础信息
		</small>
	</h1>
</div>
<!-- /.page-header -->


<div class="row">
	<div class="col-xs-12">
		<form class="form-horizontal" role="form">
			<div class="hr hr-18 dotted hr-double"></div>
			<div class="form-group">
				<label class="col-xs-2 control-label no-padding-right"
					for="buildingname">楼宇名称<font color="red">*</font>
				</label>
				<div class="col-xs-4">
					<input type="text" id="buildingname" placeholder="楼宇名称"
						class="input-large">
				</div>
				<label class="col-xs-2 control-label no-padding-right"
					for="buildingsum">楼宇总套数<font color="red">*</font></label>
				<div class="col-xs-4">
					<input type="text" id="buildingsum" placeholder="楼宇总套数"
						class="input-large">
				</div>
			</div>
			<div class="form-group">

				<label class="col-xs-2 control-label no-padding-right"
					for="buildingadress">楼宇坐落地址<font color="red">*</font></label>
				<div class="col-xs-4">
					<input type="text" id="buildingadress" placeholder="楼宇坐落地址"
						class="input-large">
				</div>
				<label class="col-xs-2 control-label no-padding-right"
					for="buildingarea">行政区划<font color="red">*</font></label>
				<div class="col-xs-4">
					<input type="text" id="buildingarea" placeholder="行政区划"
						class="input-large">
				</div>

			</div>

			<div class="form-group">
				<label class="col-xs-2 control-label no-padding-right"
					for="buildingstreet">房屋所处街乡<font color="red">*</font></label>
				<div class="col-xs-6">
					<input type="text" id="buildingstreet" placeholder="房屋所处街乡"
						class="input-xxlarge">
				</div>
			</div>

			<div class="clearfix form-actions">
				<div class="col-md-offset-3 col-md-9">
					<button id="save" class="btn btn-info" type="button">
						<i class="ace-icon fa fa-check bigger-110"></i> Submit
					</button>

					&nbsp; &nbsp; &nbsp;
					<button id="reset" class="btn" type="reset">
						<i class="ace-icon fa fa-undo bigger-110"></i> Reset
					</button>
				</div>
			</div>


		</form>
	</div>
</div>

<script type="text/javascript">
	$("#save").bind("click", function() {
		//待添加验证信息。
		//提交楼宇信息
		$.ajax({
			dataType : "json",
			url : "${contextPath}/sys/buildinginfo/savebuildinginfo",
			type : "post",
			data : {
				buildingName : $('#buildingname').val(),
				roomSum : $('#buildingsum').val(),
				buildingAdress : $('#buildingadress').val(),
				areaDivide : $('#buildingarea').val(),
				streetTown : $('#buildingstreet').val(),
				longitude : $('#lng').val(),
				latitude : $('#lat').val()

			},
			complete : function(xmlRequest) {
				var returninfo = eval("(" + xmlRequest.responseText + ")");
				if (returninfo.result == 1) {
					document.location.href = "${contextPath}/sys/sysuser/home#page/homepage";
				} else {
				alert("添加写字楼失败！");
				/*
					$.gritter.add({
						title : '系统信息',
						text : '添加写字楼失败！',
						class_name : 'gritter-success gritter-center'
					});
					*/
				}
			}
		});
	});
</script>


<script type="text/javascript">
	var scripts = [ null ]
	$('.page-content-area').ace_ajax('loadScripts', scripts, function() {
		// inline scripts related to this page
		jQuery(function($) {

		})
	});
</script>