<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>

<link rel="stylesheet" href="${contextPath}/static/assets/js/validate/css/validate.css" />

<script type="text/javascript" src="${contextPath}/static/assets/js/validate/talent-validate-all.js"></script>

<script type="text/javascript"
	src="${contextPath}/static/assets/js/jquery.dataTables.js"></script>
<script type="text/javascript"
	src="${contextPath}/static/assets/js/jquery.dataTables.bootstrap.js"></script>

<!-- /.page-header -->


<div class="page-header">
	<h1>
		楼宇信息 <small> <i class="ace-icon fa fa-angle-double-right"></i>房产使用信息</small>
		<button id='button-add' class="btn btn-info">添加房产使用信息</button>
	</h1>
</div>
<input id='savetype' type='hidden' value='new'>

<div id='page-info'>
<c:forEach items="${roomUseInfo }" var="info">
	<div class="widget-box widget-color-green2">
		<div class="widget-header">
		  <h5 class="widget-title bigger lighter">
			<i class="ace-icon fa fa-table"></i>房产使用信息
		  </h5>
		  <div class='widget-toolbar'>
		  	<button name="edit" class='btn btn-default btn-xs '>
				<i class="ace-icon fa fa-pencil-square-o "></i>	Edit
		  	</button>
		  	<button name='delete' class="btn btn-danger btn-xs">
				<i class="ace-icon fa fa-trash-o"></i>Delete
			</button>
		  	
		  </div>
		  
		
		  
		</div>
		<div class="widget-body">
			<div class="widget-main no-padding">
				<form class="form-horizontal" role="form">
					<div class="hr hr-18 dotted hr-double"></div>
					<div class="form-group">
						<label class="col-xs-1 control-label no-padding-right"
							for="username">使用名称<font color="red">*</font>
						</label>
						<div class="col-xs-2">
							<input type="text" id="username" name="username" value="${info.userName }"  class="input-large">
							<input type='hidden' name='roomuseinfoid' value='${info.id }'/>
						</div>
						
						<label class="col-xs-2 control-label no-padding-right"
							for="usercertificatetypename">使用者证件类型<font color="red">*</font>
						</label>
						<div class="col-xs-2">
							<select id='usercertificatetypename' name="usercertificatetypename"  class="input-large">
								<c:forEach items="${certificateTypeInfoList }" var="n">
									<c:choose>
							           <c:when test="${info.userCertificateTypeName == n.certificateTypeName}">
							                <option value="${n.certificateTypeName}"  selected>${n.certificateTypeName }</option>
							           </c:when>
							           <c:otherwise>
							                <option value="${n.certificateTypeName}">${n.certificateTypeName }</option>
							           </c:otherwise>
							        </c:choose> 
								</c:forEach>
							</select>
						</div>
						<label class="col-xs-2 control-label no-padding-right"
							for="buildingname">使用者证件号码<font color="red">*</font>
						</label>
						<div class="col-xs-2">
							<input type="text" id="usercertificatenumber" value="${info.userCertificateNumber }" name='usercertificatenumber' placeholder="使用者证件号码"  class="input-large">
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-xs-1 control-label no-padding-right"
							for="usetype">使用类型<font color="red">*</font>
						</label>
						<div class="col-xs-2">
							<select id='usetype' name='usetype' class="usetype input-large">
								<option value='出租'  <c:if  test="${info.useType  eq  '出租' }"> selected="selected"</c:if>>出租</option>
								<option value='正常自用' <c:if  test="${info.useType  eq  '正常自用' }"> selected="selected"</c:if>>正常自用</option>
								<option value='无租使用' <c:if  test="${info.useType  eq  '无租使用' }"> selected="selected"</c:if>>无租使用</option>
								<option value='承典' <c:if  test="${info.useType  eq  '承典' }"> selected="selected"</c:if>>承典</option>
								<option value='融资租赁' <c:if  test="${info.useType  eq  '融资租赁' }"> selected="selected"</c:if>>融资租赁</option>
								<option value='闲置' <c:if  test="${info.useType  eq  '闲置' }"> selected="selected"</c:if>>闲置</option>
							</select>
						</div>
						
						<label class="col-xs-2 control-label no-padding-right"
							for="usesize">使用面积<font color="red">*</font>
						</label>
						<div class="col-xs-2">
							<input type="text" id="usesize" value='${info.useSize }' name='usesize' placeholder="使用面积(:平方米)"  class="input-large"/>
						</div>
						<label class="col-xs-2 control-label no-padding-right"
							for="userhousetaxed">使用者征收房产税<font color="red">*</font>
						</label>
						<div class="col-xs-2">
							<select id='userhousetaxed' name='userhousetaxed' class="input-large">
								<option <c:if test="${info.userHouseTaxed eq '是'}">selected="selected"</c:if>>是</option>
								<option <c:if test="${info.userHouseTaxed eq '否'}">selected="selected"</c:if>>否</option>
							</select>
						</div>
					</div>
					
					<div class='chuzu' <c:if test="${info.useType ne '出租'}">hidden</c:if>>
					<div class="hr hr-18 dotted hr-double"></div>
					<div class="form-group">
						<label class="col-xs-1 control-label no-padding-right"
							for="usetype">出租名称<font color="red">*</font>
						</label>
						<div class="col-xs-2">
							<input type="text" id="lessorname" value='${info.lessorName }' name='lessorname' placeholder="出租人姓名"  class="input-large"/>
						</div>
						
						<label class="col-xs-2 control-label no-padding-right"
							for="usesize">出租者证件类型<font color="red">*</font>
						</label>
						<div class="col-xs-2">
							<select id='lessorcertificatetypename'  name="lessorcertificatetypename"  class="input-large">
								<c:forEach items="${certificateTypeInfoList }" var="n">
									<c:choose>
							           <c:when test="${info.lessorCertificateTypeName == n.certificateTypeName}">
							                <option value="${n.certificateTypeName}"  selected>${n.certificateTypeName }</option>
							           </c:when>
							           <c:otherwise>
							                <option value="${n.certificateTypeName}">${n.certificateTypeName }</option>
							           </c:otherwise>
							        </c:choose> 
								</c:forEach>
							</select>
						</div>
						
						<label class="col-xs-2 control-label no-padding-right"
							for="lessorcertificatetypename">出租者证件号码<font color="red">*</font>
						</label>
						<div class="col-xs-2">
							<input type="text" id="lessorcertificatenumber" value='${info.lessorCertificateNumber }' name='lessorcertificatenumber' placeholder="出租者证件号码"  class="input-large">
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-xs-1 control-label no-padding-right"
							for="taxtype">征收品目<font color="red">*</font>
						</label>
						<div class="col-xs-2">
							<select id='taxtype' name='taxtype' class="input-large">
								<option value='个人出租住房' <c:if test="${info.taxType eq '个人出租住房'}">selected="selected"</c:if>>个人出租住房</option>
								<option value='其它房屋出租' <c:if test="${info.taxType eq '其它房屋出租'}">selected="selected"</c:if>>其它房屋出租</option>
							</select>
						</div>
						
						<label class="col-xs-2 control-label no-padding-right"
							for="yearlyrental">年租金收入<font color="red">*</font>
						</label>
						<div class="col-xs-2">
							<input type="text" id="yearlyrental" value='${info.yearlyRental }' name='yearlyrental' placeholder="年租金收入(:元)"  class="input-large"/>
						</div>
						
						<label class="col-xs-2 control-label no-padding-right"
							for="lessorhousetaxed">出租者征收房产税<font color="red">*</font>
						</label>
						<div class="col-xs-2">
							<select id='lessorhousetaxed' name='lessorhousetaxed' class="input-large">
								<option value='是' <c:if test="${info.lessorHouseTaxed eq '是'}">selected="selected"</c:if>>是</option>
								<option value='否' <c:if test="${info.lessorHouseTaxed eq '否'}">selected="selected"</c:if>>否</option>
							</select>
						</div>
					</div>
					</div>
					
					<div class='ziyong' <c:if test="${info.useType=='出租'}">hidden</c:if>>
					<div class="hr hr-18 dotted hr-double"></div>
					<div class="form-group">
						<label class="col-xs-1 control-label no-padding-right"
							for="originalvalue">房产原值<font color="red">*</font>
						</label>
						<div class="col-xs-2">
							<input type="text" id="originalvalue" value='${info.orignalValue }' name='originalvalue' placeholder="房产原值"  class="input-large"/>
						</div>
						
						<label class="col-xs-2 control-label no-padding-right"
							for="taxfreevalue">免税原值<font color="red">*</font>
						</label>
						<div class="col-xs-2">
							<input type="text" id="taxfreevalue" value="${info.taxFreeValue }" name='taxfreevalue' placeholder="免税原值"  class="input-large"/>
						</div>
						
						<label class="col-xs-2 control-label no-padding-right"
							for="taxtype">征收品目<font color="red">*</font>
						</label>
						<div class="col-xs-2">
							<select id='taxtype' name='taxtype' class="input-large">
								<option value='生产用房' <c:if test="${info.taxType eq '生产用房'}">selected="selected"</c:if>>生产用房</option>
								<option value='营业用房' <c:if test="${info.taxType eq '营业用房'}">selected="selected"</c:if>>营业用房</option>
								<option value='办公用房' <c:if test="${info.taxType eq '办公用房'}">selected="selected"</c:if>>办公用房</option>
								<option value='职工用房' <c:if test="${info.taxType eq '职工用房'}">selected="selected"</c:if>>职工用房</option>
							</select>
						</div>
					</div>
					</div>
					<div class="hr hr-18 dotted hr-double"></div>
					<div class="form-group">
						<label class="col-xs-1 control-label no-padding-right"
							for="datebegin">有效期起<font color="red">*</font>
						</label>
						<div class="col-xs-2">
							<input type="text" id="datebegin" value="${info.dateBegin }" name='datebegin' placeholder="有效期起"  class="input-large" readonly/>
						</div>
						
						<label class="col-xs-2 control-label no-padding-right"
							for="dateend">有效期止<font color="red">*</font>
						</label>
						<div class="col-xs-2">
							<input type="text" id="dateend" value="${info.dateEnd }" name='dateend' placeholder="有效期止"  class="input-large" readonly/>
						</div>
						
						<label class="col-xs-2 control-label no-padding-right"
							for="taxtype">备注
						</label>
						<div class="col-xs-2">
							<input type="text" id="comment" value="${info.comment }" name='comment' placeholder="备注"  class="input-large" />
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-xs-1 control-label no-padding-right"
							for="taxdeadline">纳税期限<font color="red">*</font>
						</label>
						<div class="col-xs-2">
							<input type="text" id="taxdeadline" value='${info.taxDeadline }' name='taxdeadline' placeholder="纳税期限"  class="input-large" readonly/>
						</div>
						<label class="col-xs-2 control-label no-padding-right"
							for="taxyear">年纳税额<font color="red">*</font>
						</label>
						<div class="col-xs-2">
							<input type="text" id="taxyear" value='${info.taxYear }' name='taxyear' placeholder="年纳税额"  class="input-large"/>
						</div>
					</div>
					
					<div class="clearfix form-actions" >
						<div class="col-md-offset-3 col-md-9" hidden>
									<button name="add" class="btn btn-info" type="button">
										<i class="ace-icon fa fa-check"></i> 提交
									</button>
										&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<button type="button" name="disab" class="btn btn-default">
										<i class="ace-icon fa fa-times"></i> 取消
									</button>
		
								</div>
						</div>
				</form>
			</div>
		</div>
	</div>
</c:forEach>
</div>


<div  id="clone" hidden>
	<div class="widget-box widget-color-pink">
		<div class="widget-header">
		  <h5 class="widget-title bigger lighter">
			<i class="ace-icon fa fa-table"></i>房产使用信息
		  </h5>
		</div>
		<div class="widget-body">
			<div class="widget-main no-padding">
				<form class="form-horizontal" role="form">
					<div class="hr hr-18 dotted hr-double"></div>
					<div class="form-group">
						<label class="col-xs-1 control-label no-padding-right"
							for="username">使用名称<font color="red">*</font>
						</label>
						<div class="col-xs-2">
							<input type="text" id="username" name="username" placeholder="使用者姓名"  class="input-large">
						</div>
						
						<label class="col-xs-2 control-label no-padding-right"
							for="usercertificatetypename">使用者证件类型<font color="red">*</font>
						</label>
						<div class="col-xs-2">
							<select id='usercertificatetypename'  name="usercertificatetypename"  class="input-large">
								<c:forEach items="${certificateTypeInfoList }" var="n">
									<option value='${n.certificateTypeName }'>${n.certificateTypeName }</option>
								</c:forEach>
							</select>
						</div>
						<label class="col-xs-2 control-label no-padding-right"
							for="buildingname">使用者证件号码<font color="red">*</font>
						</label>
						<div class="col-xs-2">
							<input type="text" id="usercertificatenumber" name='usercertificatenumber' placeholder="使用者证件号码"  class="input-large">
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-xs-1 control-label no-padding-right"
							for="usetype">使用类型<font color="red">*</font>
						</label>
						<div class="col-xs-2">
							<select id='usetype' name='usetype' class="usetype input-large">
								<option value='出租' <c:if test="${info.usetype eq '出租'}"> selected="selected"</c:if>>出租</option>
								<option value='正常自用' <c:if test="${info.usetype eq '正常自用'}"> selected="selected"</c:if>>正常自用</option>
								<option value='无租使用'>无租使用</option>
								<option value='承典'>承典</option>
								<option value='融资租赁'>融资租赁</option>
								<option value='闲置'>闲置</option>
							</select>
						</div>
						
						<label class="col-xs-2 control-label no-padding-right"
							for="usesize">使用面积<font color="red">*</font>
						</label>
						<div class="col-xs-2">
							<input type="text" id="usesize" name='usesize' placeholder="使用面积(:平方米)"  class="input-large"/>
						</div>
						<label class="col-xs-2 control-label no-padding-right"
							for="userhousetaxed">使用者征收房产税<font color="red">*</font>
						</label>
						<div class="col-xs-2">
							<select id='userhousetaxed' name='userhousetaxed' class="input-large">
								<option>是</option>
								<option>否</option>
							</select>
						</div>
					</div>
					
					<div class='chuzu'>
					<div class="hr hr-18 dotted hr-double"></div>
					<div class="form-group">
						<label class="col-xs-1 control-label no-padding-right"
							for="usetype">出租名称<font color="red">*</font>
						</label>
						<div class="col-xs-2">
							<input type="text" id="lessorname" name='lessorname' placeholder="出租人姓名"  class="input-large"/>
						</div>
						
						<label class="col-xs-2 control-label no-padding-right"
							for="usesize">出租者证件类型<font color="red">*</font>
						</label>
						<div class="col-xs-2">
							<select id='lessorcertificatetypename'  name="lessorcertificatetypename"  class="input-large">
								<c:forEach items="${certificateTypeInfoList }" var="n">
									<option value='${n.certificateTypeName }'>${n.certificateTypeName }</option>
								</c:forEach>
							</select>
						</div>
						
						<label class="col-xs-2 control-label no-padding-right"
							for="lessorcertificatetypename">出租者证件号码<font color="red">*</font>
						</label>
						<div class="col-xs-2">
							<input type="text" id="lessorcertificatenumber" name='lessorcertificatenumber' placeholder="出租者证件号码"  class="input-large">
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-xs-1 control-label no-padding-right"
							for="taxtype">征收品目<font color="red">*</font>
						</label>
						<div class="col-xs-2">
							<select id='taxtype' name='taxtype' class="input-large">
								<option value='个人出租住房'>个人出租住房</option>
								<option value='其它房屋出租'>其它房屋出租</option>
							</select>
						</div>
						
						<label class="col-xs-2 control-label no-padding-right"
							for="yearlyrental">年租金收入<font color="red">*</font>
						</label>
						<div class="col-xs-2">
							<input type="text" id="yearlyrental" name='yearlyrental' placeholder="年租金收入(:元)"  class="input-large"/>
						</div>
						
						<label class="col-xs-2 control-label no-padding-right"
							for="lessorhousetaxed">出租者征收房产税<font color="red">*</font>
						</label>
						<div class="col-xs-2">
							<select id='lessorhousetaxed' name='lessorhousetaxed' class="input-large">
								<option value='是'>是</option>
								<option value='否'>否</option>
							</select>
						</div>
					</div>
					</div>
					
					<div class='ziyong'>
					<div class="hr hr-18 dotted hr-double"></div>
					<div class="form-group">
						<label class="col-xs-1 control-label no-padding-right"
							for="originalvalue">房产原值<font color="red">*</font>
						</label>
						<div class="col-xs-2">
							<input type="text" id="originalvalue" name='originalvalue' placeholder="房产原值"  class="input-large"/>
						</div>
						
						<label class="col-xs-2 control-label no-padding-right"
							for="taxfreevalue">免税原值<font color="red">*</font>
						</label>
						<div class="col-xs-2">
							<input type="text" id="taxfreevalue" name='taxfreevalue' placeholder="免税原值"  class="input-large"/>
						</div>
						
						<label class="col-xs-2 control-label no-padding-right"
							for="taxtype">征收品目<font color="red">*</font>
						</label>
						<div class="col-xs-2">
							<select id='taxtype' name='taxtype' class="input-large">
								<option value='生产用房'>生产用房</option>
								<option value='营业用房'>营业用房</option>
								<option value='办公用房'>办公用房</option>
								<option value='职工用房'>职工用房</option>
							</select>
						</div>
					</div>
					</div>
					<div class="hr hr-18 dotted hr-double"></div>
					<div class="form-group">
						<label class="col-xs-1 control-label no-padding-right"
							for="datebegin">有效期起<font color="red">*</font>
						</label>
						<div class="col-xs-2">
							<input type="text" id="datebegin" name='datebegin' placeholder="有效期起"  class="input-large" readonly/>
						</div>
						
						<label class="col-xs-2 control-label no-padding-right"
							for="dateend">有效期止<font color="red">*</font>
						</label>
						<div class="col-xs-2">
							<input type="text" id="dateend" name='dateend' placeholder="有效期止"  class="input-large" readonly/>
						</div>
						
						<label class="col-xs-2 control-label no-padding-right"
							for="taxtype">备注
						</label>
						<div class="col-xs-2">
							<input type="text" id="comment" name='comment' placeholder="备注"  class="input-large" />
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-xs-1 control-label no-padding-right"
							for="taxdeadline">纳税期限<font color="red">*</font>
						</label>
						<div class="col-xs-2">
							<input type="text" id="taxdeadline" name='taxdeadline' placeholder="纳税期限"  class="input-large" readonly/>
						</div>
					</div>
					
					<div class="clearfix form-actions">
						<div class="col-md-offset-3 col-md-9">
									<button name="add" class="btn btn-info" type="button">
										<i class="ace-icon fa fa-check"></i> 提交
									</button>
										&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<button type="button" name="cancel" class="btn btn-default">
										<i class="ace-icon fa fa-times"></i> 取消
									</button>
		
								</div>
						</div>
						
				</form>
			</div>
		</div>
	</div>
    
</div>


<!-- 用于添加roomUseInfo -->
<div id='page-body' class="page-body">
</div>

<script type='text/javascript'>
	$("#page-info input").attr("disabled",true);
	$("#page-info select").attr("disabled",true);
	$("button[name='edit']").click(function(){
		var obj = $(this).closest(".widget-box");
		//console.log($(obj).find("input"));
		$(obj).find("input").attr("disabled",false);
		$(obj).find("select").attr("disabled",false);
		$(obj).find(".col-md-offset-3").attr("hidden",false);
		$("#savetype").val("edit");
		$(obj).find("input[name='datebegin']").datepicker({
		    	    format: 'yyyy-mm-dd',
		    	    language: 'zh-CN'
		});
		$(obj).find("input[name='dateend']").datepicker({
		    	    format: 'yyyy-mm-dd',
		    	    language: 'zh-CN'
		    	});
		$(obj).find("input[name='taxdeadline']").datepicker({
		    	    format: 'yyyy-mm-dd',
		    	    language: 'zh-CN'
		});
	});
	$("button[name='delete']").click(function(){
		var obj = $(this).closest(".widget-box");
		urlString = "${contextPath}/sys/roomuseinfo/delete/" + $(obj).find("input[name='roomuseinfoid']").val();
		console.log(urlString);
		$.ajax({
					dataType : "json",
					url : urlString,
					type : "post",
					complete : function(xmlRequest) {
						var returninfo = eval('(' + xmlRequest.responseText + ')');
						console.log(returninfo.result);
						if (returninfo.result == 1) {
							location.reload();
						} else {
						alert("删除信息失败！");
						
						}
					}
				});
	})
</script>
<script type='text/javascript'>

	function valid(obj){
		obj = $(this).closest("form");
		if($(obj).find("input[name='username']").val()==""||$(obj).find("input[name='username']").val()==null)
			return false;
		if($(obj).find("input[name='usercertificatenumber']").val()==""||$(obj).find("input[name='usercertificatenumber']").val()==null)
			return false;
		if($(obj).find("input[name='datebegin']").val()==""||$(obj).find("input[name='datebegin']").val()==null)
			return false;
		if($(obj).find("input[name='dateend']").val()==""||$(obj).find("input[name='dateend']").val()==null)
			return false;
		if($(obj).find("input[name='taxdeadline']").val()==""||$(obj).find("input[name='taxdeadline']").val()==null)
			return false;
		return true;
	}

	//添加房产使用信息：校验，提交。
	tt.vf.req.add("username","usercertificatenumber","usesize","datebegin","dateend","taxdeadline");
	$("form button[name='cancel']").click(function(){
		$("#page-body").empty();
	})
	$("form button[name='disab']").click(function(){
		$(this).closest(".col-md-offset-3").attr("hidden",true);
		$("#page-info input").attr("disabled",true);
		$("#page-info select").attr("disabled",true);
	})
	
	$("form button[name='add']").click(function() {
		var x = tt.validate();
		x = valid(this);
		console.log(x);
		if(false == x){
			str = window.location.hash;
			arr = str.split("/");
			urlString="${contextPath}/sys/roomuseinfo/add/"+arr[arr.length-1];
			console.log(urlString);
			var obj = $(this).closest("form");
			var roomuseinfoid = null;
			var taxyear = null;
			if($("#savetype").val()=="edit"){
				roomuseinfoid = $(obj).find("input[name='roomuseinfoid']").val();
				taxyear = $(obj).find("input[name='taxyear']").val();
			}
			console.log($(obj).find("select[name='usercertificatetypename'] option:selected").val());
			console.log($(obj).find("select[name='lessorcertificatetypename'] option:selected").val());
			if($(obj).find("select[name='usetype'] option:selected").val()=="出租"){//出租
				$.ajax({
					dataType : "json",
					url : urlString,
					type : "post",
					data : {
						cmd:$("#savetype").val(),
						id:roomuseinfoid,
						userName:$(obj).find("input[name='username']").val(),
						userCertificateTypeName:$(obj).find("select[name='usercertificatetypename'] option:selected").val(),
						userCertificateNumber:$(obj).find("input[name='usercertificatenumber']").val(),
						useType:$(obj).find("select[name='usetype'] option:selected").val(),
						useSize:$(obj).find("input[name='usesize']").val(),
						userHouseTaxed:$(obj).find("select[name='userhousetaxed'] option:selected").val(),
						//出租
						lessorName:$(obj).find("input[name='lessorname']").val(),
						lessorCertificateTypeName:$(obj).find("select[name='lessorcertificatetypename'] option:selected").val(),
						lessorCertificateNumber:$(obj).find("input[name='lessorcertificatenumber']").val(),
						taxType:$(obj).find(".chuzu select[name='taxtype'] option:selected").val(),
						yearlyRental:$(obj).find("input[name='yearlyrental']").val(),
						lessorHouseTaxed:$(obj).find("select[name='lessorhousetaxed'] option:selected").val(),
						
						dateBegin:$(obj).find("input[name='datebegin']").val(),
						dateEnd:$(obj).find("input[name='dateend']").val(),
						comment:$(obj).find("input[name='comment']").val(),
						taxDeadline:$(obj).find("input[name='taxdeadline']").val(),
						taxYear:$(obj).find("input[name='taxyear']").val()
						
					},
					complete : function(xmlRequest) {
						var returninfo = eval("(" + xmlRequest.responseText + ")");
						if (returninfo.result == 1) {
							location.reload();
							//location.replace(location.href);
						} else {
						alert("添加房间失败！");
						
						}
					}
				});
			}else{
				$.ajax({
					dataType : "json",
					url : urlString,
					type : "post",
					data : {
						cmd:$("#savetype").val(),
						id:roomuseinfoid,
						userName:$(obj).find("input[name='username']").val(),
						userCertificateTypeName:$(obj).find("select[name='usercertificatetypename'] option:selected").val(),
						userCertificateNumber:$(obj).find("input[name='usercertificatenumber']").val(),
						useType:$(obj).find("select[name='usetype'] option:selected").val(),
						useSize:$(obj).find("input[name='usesize']").val(),
						userHouseTaxed:$(obj).find("select[name='userhousetaxed'] option:selected").val(),
						//非出租
						orignalValue:$(obj).find("input[name='originalvalue']").val(),
						taxFreeValue:$(obj).find("input[name='taxfreevalue']").val(),
						taxType:$(obj).find(".ziyong select[name='taxtype'] option:selected").val(),
						
						dateBegin:$(obj).find("input[name='datebegin']").val(),
						dateEnd:$(obj).find("input[name='dateend']").val(),
						comment:$(obj).find("input[name='comment']").val(),
						taxDeadline:$(obj).find("input[name='taxdeadline']").val(),
						taxYear:$(obj).find("input[name='taxyear']").val()
						
					},
					complete : function(xmlRequest) {
						var returninfo = eval("(" + xmlRequest.responseText + ")");
						if (returninfo.result == 1) {
							location.reload();
							//location.replace(location.href);
						} else {
						alert("添加房间失败！");
						
						}
					}
				});
			}
		}
	})
</script>



<script type="text/javascript">
	var scripts = [null,"${contextPath}/static/assets/js/date-time/bootstrap-datepicker.js",
	"${contextPath}/static/assets/js/date-time/locales/bootstrap-datepicker.zh-CN.js",null  ];
	$('.page-content-area').ace_ajax('loadScripts', scripts, function() {
		// inline scripts related to this page
		jQuery(function($) {
			
			$("#page-body select option[value='居民身份证']").attr("selected",true);
			$("#button-add").click(function(){
				$("#savetype").val("new");
				$("#clone").clone(true).appendTo($("#page-body"));
				$("#page-body").children("#clone").attr("hidden",false);
				$("#page-body input[name='datebegin']").datepicker({
		    	    format: 'yyyy-mm-dd',
		    	    language: 'zh-CN'
		    	});
		    	$("#page-body input[name='dateend']").datepicker({
		    	    format: 'yyyy-mm-dd',
		    	    language: 'zh-CN'
		    	});
		    	$("#page-body input[name='taxdeadline']").datepicker({
		    	    format: 'yyyy-mm-dd',
		    	    language: 'zh-CN'
		    	});
		    	//默认使用类型出租。
		    	$("#page-body form").children("div.ziyong").attr("hidden",true);
				$("#page-body form").children("div.chuzu").attr("hidden",false);
			})
			//使用类型改变触发事件
			$(".usetype").change(function(){
				console.log("usetype changed.");
				if($(this).children("option:selected").val()=='出租'){
					$(this).closest("form").children("div.ziyong").attr("hidden",true);
					$(this).closest("form").children("div.chuzu").attr("hidden",false);
				}else{
					$(this).closest("form").children("div.chuzu").attr("hidden",true);
					$(this).closest("form").children("div.ziyong").attr("hidden",false);
				}
			})
			
			
			
		});
	});
</script>