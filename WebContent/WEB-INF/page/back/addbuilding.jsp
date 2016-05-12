<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>

<link rel="stylesheet" href="${contextPath}/static/assets/js/validate/css/validate.css" />
<script type="text/javascript" src="${contextPath}/static/assets/js/validate/talent-validate-all.js"></script>



<div class="page-header">
	<h1>
		添加楼宇 <small> <i class="ace-icon fa fa-angle-double-right"></i>
			基础信息
		</small>
	</h1>
</div>
<!-- /.page-header -->


<div class="row">
	<div class="col-xs-12">
		<form class="form-horizontal" role="form">
			<div class="form-group">
				<label class="col-xs-2 control-label no-padding-right"
					for="buildingname">楼宇名称<font color="red">*</font>
				</label>
				<div class="col-xs-4">
					<input type="text" id="buildingname" placeholder="楼宇名称" name="buildingname"
						class="input-large">
				</div>
				<label class="col-xs-2 control-label no-padding-right"
					for="buildingsum">楼宇总套数<font color="red">*</font></label>
				<div class="col-xs-4">
					<input type="text" id="buildingsum" placeholder="楼宇总套数" name="buildingsum"
						class="input-large">
				</div>
			</div>
			<div class="form-group">

				<label class="col-xs-2 control-label no-padding-right"
					for="buildingadress">楼宇坐落地址<font color="red">*</font></label>
				<div class="col-xs-4">
					<input type="text" id="buildingadress" placeholder="楼宇坐落地址" name="buildingadress"
						class="input-large">
				</div>
				<label class="col-xs-2 control-label no-padding-right"
					for="buildingarea">行政区划<font color="red">*</font></label>
				<div class="col-xs-4">
					<select id='buildingarea' name="buildingarea"   class="input-large">
						<c:forEach items="${areaDivideInfoList }" var="n">
							<option value='${n.divideName }'>${n.divideName }</option>
						</c:forEach>
					</select>
				</div>

			</div>

			<div class="form-group">
				<label class="col-xs-2 control-label no-padding-right"
					for="buildingstreet">房屋所处街乡<font color="red">*</font></label>
				<div class="col-xs-8">
					<input type="text" id="buildingstreet" placeholder="房屋所处街乡" name="buildingstreet"
						class="input-xxlarge">
				</div>
			</div>

			<div class="form-group">
				<label class="col-xs-2 control-label no-padding-right"
					for="floorsum">总楼层数<font color="red">*</font></label>
				<div class="col-xs-4">
					<input type="text"  id='floorsum' name="floorsum" placeholder="总楼层数" 
						class="input-large">
				</div>
			
				<label class="col-xs-2 control-label no-padding-right"
					for="buildingsourcenumber">房源编号<font color="red">*</font></label>
				<div class="col-xs-4">
					<input type="text" id='buildingsourcenumber' name="buildingsourcenumber" placeholder="房源编号"
						class="input-large">
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-xs-2 control-label no-padding-right"
					for="propertycertificatenumber">产权证书号<font color="red">*</font></label>
				<div class="col-xs-4">
					<input type="text" id='propertycertificatenumber' name="propertycertificatenumber" placeholder="产权证书号"
						class="input-large">
				</div>
			
				<label class="col-xs-2 control-label no-padding-right"
					for="groundsourcenumber">土地税源编号<font color="red">*</font></label>
				<div class="col-xs-4">
					<input type="text" id='groundsourcenumber' name="groundsourcenumber" placeholder="土地税源编号"
						class="input-large">
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-xs-2 control-label no-padding-right"
					for="housepropertynumber">房产证书持有人识别号<font color="red">*</font></label>
				<div class="col-xs-4">
					<input type="text" id='housepropertynumber'  name="housepropertynumber" placeholder="房产证书持有人识别号"
						class="input-large">
				</div>
			
				<label class="col-xs-2 control-label no-padding-right"
					for="housepropertyname">房产证书持有人名称<font color="red">*</font></label>
				<div class="col-xs-4">
					<input type="text" id='housepropertyname' name="housepropertyname" placeholder="房产证书持有人名称"
						class="input-large">
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-xs-2 control-label no-padding-right"
					for="housecertificatetypename">房产证书持有人证件类型<font color="red">*</font></label>
				<div class="col-xs-4">
					<select id='housecertificatetypename'  name="housecertificatetypename"  class="input-large">
						<c:forEach items="${certificateTypeInfoList }" var="n">
							<option value='${n.certificateTypeCode }'>${n.certificateTypeName }</option>
						</c:forEach>
					</select>
				</div>
			
				<label class="col-xs-2 control-label no-padding-right"
					for="housecertificatetypenumber">房产证书持有人证件号码<font color="red">*</font></label>
				<div class="col-xs-4">
					<input type="text" id='housecertificatetypenumber' name="housecertificatetypenumber" placeholder="房产证书持有人证件号码"
						class="input-large">
				</div>
			</div>
			<div class="form-group">
				<label class="col-xs-2 control-label no-padding-right"
					for="datebegin">权属有效期起<font color="red">*</font></label>
				<div class="col-xs-4">
					<input type="text" id="datebegin" name="datebegin" placeholder="权属有效期起"
						class="input-large" readonly>
				</div>
			
				<label class="col-xs-2 control-label no-padding-right"
					for="dateend">权属有效期止<font color="red">*</font></label>
				<div class="col-xs-4">
					<input type="text" id='dateend' name="dateend" placeholder="权属有效期止"
						class="input-large" readonly>
				</div>
			</div>
			<div class="clearfix form-actions">
				<div class="col-md-offset-4 col-md-9">
					<button id="save" class="btn btn-info" type="button" >
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
tt.vf.req.add("buildingname","buildingsum","buildingadress","buildingarea","buildingstreet",
	"floorsum","buildingsourcenumber","propertycertificatenumber","groundsourcenumber",
	"datebegin","dateend","housepropertynumber","housepropertyname",
	"housecertificatetypename","housecertificatetypenumber");
	//验证表单
	$("#save").bind("click", function() {
		var x =  tt.validate();
		if(x== true)
		{
		/*
		console.log($('#housecertificatetypenumber option:selected').text());
		console.log($('#housecertificatetypenumber option:selected').val());
		*/
		$.ajax({
			dataType : "json",
			url : "${contextPath}/sys/buildinginfo/savebuildinginfo",
			type : "post",
			data :{
				buildingName : $('#buildingname').val(),
				roomSum : $('#buildingsum').val(),
				buildingAdress : $('#buildingadress').val(),
				areaDivide : $('#buildingarea').val(),
				streetTown : $('#buildingstreet').val(),
				longitude : $('#lng').val(),
				latitude : $('#lat').val(),
				floorSum:$('#floorsum').val(),
				buildingSourceNumber:$('#buildingsourcenumber').val(),
				propertyCertificateNumber:$('#propertycertificatenumber').val(),
				groundSourceNumber:$('#groundsourcenumber').val(),
				dateBegin:$('#datebegin').val(),
				dateEnd:$('#dateend').val(),
				housePropertyNumber:$('#housepropertynumber').val(),
				housePropertyName:$('#housepropertyname').val(),
				//certificateTypeInfo:{
					//certificateTypeName:$('#housecertificatetypename option:selected').text(),
					houseCertificateTypeCode:$('#housecertificatetypename option:selected').val(),
				//},
				houseCertificateTypeNumber:$('#housecertificatetypenumber').val()
			},
			complete : function(xmlRequest) {
				var returninfo = eval("(" + xmlRequest.responseText + ")");
				if (returninfo.result == 1) {
					document.location.href = "${contextPath}/sys/sysuser/home#page/homepage";
				} else {
				alert("添加写字楼失败！");
				}
			}
		});
		}
	});

</script>


<script type="text/javascript">
	var scripts = [ null,"${contextPath}/static/assets/js/date-time/bootstrap-datepicker.js",
	"${contextPath}/static/assets/js/date-time/locales/bootstrap-datepicker.zh-CN.js",null ];
	$('.page-content-area').ace_ajax('loadScripts', scripts, function() {
		// inline scripts related to this page
		jQuery(function($) {
		$('#datebegin').datepicker({
	    	    format: 'yyyy-mm-dd',
	    	    language: 'zh-CN'
	    	});
	    $('#dateend').datepicker({
	    	    format: 'yyyy-mm-dd',
	    	    language: 'zh-CN'
	    	});
	     $("#housecertificatetypename  option[value='201'] ").attr("selected",true);
	    
		});
	});
</script>
