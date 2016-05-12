<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>

<link rel="stylesheet" href="${contextPath}/static/assets/js/validate/css/validate.css" />
<script type="text/javascript" src="${contextPath}/static/assets/js/validate/talent-validate-all.js"></script>
<script type="text/javascript" src="${contextPath}/static/assets/js/jquery.dataTables.js"></script>
<script type="text/javascript" src="${contextPath}/static/assets/js/jquery.dataTables.bootstrap.js"></script>


<script type="text/javascript">
	var scripts = [null ];
	$('.page-content-area').ace_ajax('loadScripts', scripts, function() {
		
	})
</script>