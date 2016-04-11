<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>

<link rel="stylesheet" href="${contextPath}/static/assets/js/validate/css/validate.css" />
<script type="text/javascript" src="${contextPath}/static/assets/js/validate/talent-validate-all.js"></script>


<div class="page-header">
	<h1>
		添加房间 <small> <i class="ace-icon fa fa-angle-double-right"></i>
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
				
			</div>
			
		</form>
	</div>
</div>


<script type="text/javascript">
	var scripts = [ null ];
	$('.page-content-area').ace_ajax('loadScripts', scripts, function() {
		// inline scripts related to this page
		jQuery(function($) {
		
		});
	});
</script>