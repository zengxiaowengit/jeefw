<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>


<div class="page-header">
	<h1>
		楼宇信息 <small> <i class="ace-icon fa fa-angle-double-right"></i>
			选择楼层
		</small>
	</h1>
</div>
<!-- /.page-header -->
<a id="alink" href='#' style="visibility: hidden;"><span id='aspan'>redirect</span></a>

<div class="row">
	<div class="col-xs-12">
	<form>
	
	<c:forEach  var='n' begin='1' end='${floorSum }'>
		
			<c:if test="${n<10 }">
				
				<div class='col-xs-1'>
				<button id='floor' type='button' class="btn btn-lg btn-primary" value='${n}'>&nbsp;&nbsp;${n }</button>
				
				</div>
			</c:if>
			<c:if test="${ n >9}">
				<div class='col-xs-1'>
				<button id='floor' type="button" class="btn btn-lg btn-primary" value='${n}'>${n }</button>
				</div>
			</c:if>
			<c:if test="${n%12 ==0}">
				<div  class="col-xs-12" style='height:40px'></div>
			</c:if>
	</c:forEach>
		</form>
	</div>	
</div>




<script type="text/javascript">
	var scripts = [null ];
	$('.page-content-area').ace_ajax('loadScripts', scripts, function() {
		// inline scripts related to this page
		jQuery(function($) {
			$(".btn.btn-lg.btn-primary").bind("click", function() {
				floor=$(this).val();
				str = window.location.hash;
				arr = str.split("/");
				urlString="${contextPath}/sys/sysuser/home#page/roomquery/"+arr[arr.length-1]+"/"+floor;
				$("#alink").attr("href",urlString);
				$("#aspan").click();
			});
		});
	});
</script>