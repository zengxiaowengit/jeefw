<%@ page language="java" contentType="text/html; charset=utf-8"
		 pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>

<link rel="stylesheet" href="${contextPath}/static/assets/js/validate/css/validate.css" />
<link rel="stylesheet" href="${contextPath}/static/assets/css/jquery-ui.custom.css" />
<link rel="stylesheet" href="${contextPath}/static/assets/css/jquery.gritter.css" />
<script type="text/javascript" src="${contextPath}/static/assets/js/validate/talent-validate-all.js"></script>

<div class="page-header">
	<h1>
		添加企业 <small> <i class="ace-icon fa fa-angle-double-right"></i>
		基础信息
	</small>
	</h1>
</div>
<!-- /.page-header -->



<div class="row">
	<div class="col-xs-12">
		<form class="form-horizontal" role="form">
			<div class="form-group">
				<label class="col-xs-1 control-label no-padding-right"
					   for="taxpayername">纳税人名称<font color="red">*</font>
				</label>
				<div class="col-xs-2">
					<input type="text" id="taxpayername" placeholder="纳税人名称" name="taxpayername"
						   class="input-large">
				</div>
				<label class="col-xs-2 control-label no-padding-right"
					   for="taxpayeridentifynumber">纳税人识别号<font color="red">*</font></label>
				<div class="col-xs-2">
					<input type="text" id="taxpayeridentifynumber" placeholder="纳税人识别号" name="taxpayeridentifynumber"
						   class="input-large">
				</div>
				<label class="col-xs-2 control-label no-padding-right"
					   for="taxpayerstatus">纳税人状态<font color="red">*</font></label>
				<div class="col-xs-2">
					<select  id="taxpayerstatus"  name="taxpayerstatus" class="input-large">
						<option>正常</option>
						<option>冻结</option>
					</select>
				</div>
			</div>

			<div class="form-group">
				<label class="col-xs-1 control-label no-padding-right"
					   for="taxsubjectregistertype">课征主体登记类型</label>
				<div class="col-xs-2">
					<select  id="taxsubjectregistertype"  name="taxsubjectregistertype" class="input-large">
						<option>单位纳税人税务登记</option>
						<option>其它</option>
					</select>
				</div>
				<label class="col-xs-2 control-label no-padding-right"
					   for="registertype">登记注册类型</label>
				<div class="col-xs-2">
					<select  id="registertype"  name="registertype" class="input-large">
						<option>其他有限责任公司</option>
						<option>国有企业</option>
						<option>私营有限责任公司</option>
					</select>
				</div>
				<label class="col-xs-2 control-label no-padding-right"
					   for="localcountrytype">国地管户类型</label>
				<div class="col-xs-2">
					<select  id="localcountrytype"  name="localcountrytype" class="input-large">
						<option>国地共管</option>
						<option>地税管理</option>
						<option>国税管理</option>
					</select>
				</div>
			</div>

			<div class="form-group">
				<label class="col-xs-1 control-label no-padding-right"
					   for="subordinaterelation">单位隶属关系
				</label>
				<div class="col-xs-2">
					<select  id="subordinaterelation"  name="subordinaterelation" class="input-large">
						<option>区</option>
						<option>县市</option>
					</select>
				</div>
				<label class="col-xs-2 control-label no-padding-right"
					   for="industry">行业</label>
				<div class="col-xs-2">
					<select  id="industry"  name="industry" class="input-large">
						<option>粮油零售</option>
						<option>五金产品批发</option>
						<option>饲料批发</option>
						<option>水源及供水设施工程建筑</option>
						<option>建筑装饰业</option>
						<option>其他未列明专业技术服务业</option>
						<option>其他住宿业</option>
						<option>其他食品批发</option>
						<option>其他未列明零售业</option>
						<option>其他专业咨询</option>
						<option>其他房地产业</option>
					</select>
				</div>
				<label class="col-xs-2 control-label no-padding-right"
					   for="registeradress">注册地址</label>
				<div class="col-xs-2">
					<input type="text" id="registeradress" placeholder="注册地址" name="registeradress"
						   class="input-large">
				</div>
			</div>

			<div class="form-group">
				<label class="col-xs-1 control-label no-padding-right"
					   for="registeradresspone">注册地联系电话
				</label>
				<div class="col-xs-2">
					<input type="text" id="registeradresspone" placeholder="注册地联系电话" name="registeradresspone"
						   class="input-large">
				</div>
				<label class="col-xs-2 control-label no-padding-right"
					   for="businessadress">生产经营地址</label>
				<div class="col-xs-2">
					<input type="text" id="businessadress" placeholder="生产经营地址" name="businessadress"
						   class="input-large">
				</div>
				<label class="col-xs-2 control-label no-padding-right"
					   for="businessadressphone">生产经营地联系电话</label>
				<div class="col-xs-2">
					<input type="text" id="businessadressphone" placeholder="生产经营地联系电话" name="businessadressphone"
						   class="input-large">
				</div>
			</div>

			<div class="form-group">
				<label class="col-xs-1 control-label no-padding-right"
					   for="legalpersonname">法人姓名<font color="red">*</font></label>
				<div class="col-xs-2">
					<input type="text" id="legalpersonname" placeholder="法人姓名" name="legalpersonname"
						   class="input-large">
				</div>
				<label class="col-xs-2 control-label no-padding-right"
					   for="legalpersoncertificatetypename">法人证件类型<font color="red">*</font></label>
				<div class="col-xs-2">
					<select id='legalpersoncertificatetypename' name="legalpersoncertificatetypename"  class="input-large">
						<c:forEach items="${certificateTypeInfoList }" var="n">
							<c:choose>
								<c:when test="${'居民身份证' == n.certificateTypeName}">
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
					   for="legalpersoncertificatenumber">法人证件号码<font color="red">*</font></label>
				<div class="col-xs-2">
					<input type="text" id="legalpersoncertificatenumber" placeholder="法人证件号码" name="legalpersoncertificatenumber"
						   class="input-large">
				</div>
			</div>

			<div class="form-group">
				<label class="col-xs-1 control-label no-padding-right"
					   for="registerdate">登记日期</label>
				<div class="col-xs-2">
					<input type="text" id="registerdate" placeholder="登记日期" name="registerdate"
						   class="input-large" readonly>
				</div>
				<label class="col-xs-2 control-label no-padding-right"
					   for="taxauthorityname">主管税务机关</label>
				<div class="col-xs-2">
					<select id='taxauthorityname'  name="taxauthorityname"  class="input-large">
						<c:forEach items="${taxAuthorityList }" var="n">
							<option value='${n.id }'>${n.taxAuthorityName }</option>
						</c:forEach>
					</select>
				</div>
				<label class="col-xs-2 control-label no-padding-right"
					   for="taxsubauthority">主管税务所</label>
				<div class="col-xs-2">
					<input type="text" id="taxsubauthority" placeholder="主管税务所" name="taxsubauthority"
						   class="input-large">
				</div>
			</div>

			<div class="form-group">
				<label class="col-xs-1 control-label no-padding-right"
					   for="taxadmin">税收管理人员</label>
				<div class="col-xs-2">
					<input type="text" id="taxadmin" placeholder="税收管理人员" name="taxadmin"
						   class="input-large">
				</div>
				<label class="col-xs-2 control-label no-padding-right"
					   for="streettown">街道乡镇</label>
				<div class="col-xs-2">
					<input type="text" id="streettown" placeholder="街道乡镇" name="streettown"
						   class="input-large">
				</div>
				<label class="col-xs-2 control-label no-padding-right"
					   for="bttovattype">营改增纳税人类型</label>
				<div class="col-xs-2">
					<input type="text" id="bttovattype" placeholder="营改增纳税人类型" name="bttovattype"
						   class="input-large">
				</div>
			</div>

			<div class="form-group">
				<label class="col-xs-1 control-label no-padding-right"
					   for="businessscope">经营范围</label>
				<div class="col-xs-2">
					<input type="text" id="businessscope" placeholder="经营范围" name="businessscope"
						   class="input-large">
				</div>
				<label class="col-xs-2 control-label no-padding-right"
					   for="acountingsystem">会计制度</label>
				<div class="col-xs-2">
					<input type="text" id="acountingsystem" placeholder="会计制度" name="acountingsystem"
						   class="input-large">
				</div>
				<label class="col-xs-2 control-label no-padding-right"
					   for="permitmethod">办证方式</label>
				<div class="col-xs-2">
					<select id="permitmethod"  name="permitmethod" class="input-large">
						<option>地税独立办证</option>
					</select>
				</div>
			</div>

			<div class="form-group">
				<label class="col-xs-1 control-label no-padding-right"
					   for="calculatemethod">核算方式</label>
				<div class="col-xs-2">
					<select id="calculatemethod"  name="calculatemethod" class="input-large">
						<option>独立核算自负盈亏</option>
					</select>
				</div>
				<label class="col-xs-2 control-label no-padding-right"
					   for="stateownedcontroltype">国有控股类型</label>
				<div class="col-xs-2">
					<input type="text" id="stateownedcontroltype" placeholder="国有控股类型" name="stateownedcontroltype"
						   class="input-large">
				</div>
				<label class="col-xs-2 control-label no-padding-right"
					   for="stateownedinverstrate">国有投资比例</label>
				<div class="col-xs-2">
					<input type="text" id="stateownedinverstrate" placeholder="国有投资比例(小数)" name="stateownedinverstrate"
						   class="input-large">
				</div>
			</div>

			<div class="form-group">
				<label class="col-xs-1 control-label no-padding-right"
					   for="naturalpersoninverstrate">自然人投资比例</label>
				<div class="col-xs-2">
					<input type="text" id="naturalpersoninverstrate" placeholder="自然人投资比例" name="naturalpersoninverstrate"
						   class="input-large">
				</div>
				<label class="col-xs-2 control-label no-padding-right"
					   for="foreigninverstrate">外资投资比例</label>
				<div class="col-xs-2">
					<input type="text" id="foreigninverstrate" placeholder="外资投资比例" name="foreigninverstrate"
						   class="input-large">
				</div>
				<label class="col-xs-2 control-label no-padding-right"
					   for="registercapital">注册资本</label>
				<div class="col-xs-2">
					<input type="text" id="registercapital" placeholder="注册资本(单位：元)" name="registercapital"
						   class="input-large">
				</div>
			</div>

			<div class="form-group">
				<label class="col-xs-1 control-label no-padding-right"
					   for="totalinverst">投资总额</label>
				<div class="col-xs-2">
					<input type="text" id="totalinverst" placeholder="投资总额(单位：元)" name="totalinverst"
						   class="input-large">
				</div>
				<label class="col-xs-2 control-label no-padding-right"
					   for="partnernumber">合伙人数</label>
				<div class="col-xs-2">
					<input type="text" id="partnernumber" placeholder="合伙人数" name="partnernumber"
						   class="input-large">
				</div>
				<label class="col-xs-2 control-label no-padding-right"
					   for="totalsuborgtype">总分机构类型</label>
				<div class="col-xs-2">
					<select  id="totalsuborgtype" name="totalsuborgtype" class="input-large">
						<option>非总分机构</option>
						<option>总分机构</option>

					</select>
				</div>
			</div>

			<div class="form-group">
				<label class="col-xs-1 control-label no-padding-right"
					   for="licensenumber">证照编号</label>
				<div class="col-xs-2">
					<input type="text" id="licensenumber" placeholder="证照编号" name="licensenumber"
						   class="input-large">
				</div>
				<label class="col-xs-2 control-label no-padding-right"
					   for="crosszonetaxregmark">跨区财产税主体登记标志</label>
				<div class="col-xs-2">
					<select id="crosszonetaxregmark"  name="crosszonetaxregmark" class="input-large">
						<option>否</option>
						<option>是</option>
					</select>
				</div>
				<label class="col-xs-2 control-label no-padding-right"
					   for="permitestablishauthority">批准设立机关</label>
				<div class="col-xs-2">
					<input type="text" id="permitestablishauthority" placeholder="批准设立机关" name="permitestablishauthority"
						   class="input-large">
				</div>
			</div>

			<div class="form-group">
				<label class="col-xs-1 control-label no-padding-right"
					   for="openbusinessdate">开业设立日期</label>
				<div class="col-xs-2">
					<input type="text" id="openbusinessdate" placeholder="开业设立日期" name="openbusinessdate"
						   class="input-large" readonly>
				</div>
				<label class="col-xs-2 control-label no-padding-right"
					   for="businessbegindate">生产经营期限起</label>
				<div class="col-xs-2">
					<input type="text" id="businessbegindate" placeholder="生产经营期限起" name="businessbegindate"
						   class="input-large" readonly>
				</div>
				<label class="col-xs-2 control-label no-padding-right"
					   for="businessenddate">生产经营期限止</label>
				<div class="col-xs-2">
					<input type="text" id="businessenddate" placeholder="生产经营期限止" name="businessenddate"
						   class="input-large" readonly>
				</div>
			</div>

			<div class="form-group">
				<label class="col-xs-1 control-label no-padding-right"
					   for="openbusinessdate">有效标志</label>
				<div class="col-xs-2">
					<select  id="validmark"  name="validmark"	class="input-large" >
						<option>是</option>
						<option>否</option>
					</select>
				</div>
			</div>

			<div class="clearfix form-actions">
				<div class="col-md-offset-4 col-md-9">
					<button id="save" class="btn btn-info" type="button" >
						<i class="ace-icon fa fa-check bigger-110"></i> Submit
					</button>

					&nbsp; &nbsp; &nbsp;
					<button id="reset" class="btn" type="reset">
						<i class="ace-icon fa fa-undo bigger-110"></i> Reset&nbsp;&nbsp;
					</button>
				</div>
			</div>
		</form>
	</div>
</div>


<script type="text/javascript">
	jQuery(function($){
		tt.vf.req.add("taxpayername","taxpayeridentifynumber","taxpayerstatus","legalpersonname","legalpersoncertificatenumber");
		$("#save").bind("click", function() {
			var x =  tt.validate();
			if(x== true)
			{

				var stateownedinverstrate = $('#stateownedinverstrate').val()==""?0:$('#stateownedinverstrate').val();
				var naturalpersoninverstrate = $('#naturalpersoninverstrate').val()==""?0:$('#naturalpersoninverstrate').val();
				var foreigninverstrate = $('#foreigninverstrate').val()==""?0:$('#foreigninverstrate').val();
				var registercapital = $('#registercapital').val()==""?0:$('#registercapital').val();
				var totalinverst = $('#totalinverst').val()==""?0:$('#totalinverst').val();
				$.ajax({
					dataType : "json",
					url : "${contextPath}/sys/companyinfo/savecompanyinfo",
					type : "post",
					data :{
						taxpayerIndentifyNumber:$('#taxpayername').val(),
						taxpayerName:$('#taxpayeridentifynumber').val(),
						taxpayerStatus:$('#taxpayerstatus option:selected').text(),
						taxSubjectRegisterType:$('#taxsubjectregistertype option:selected').text(),
						registerType:$('#registertype option:selected').text(),
						localCountryType:$('#localcountrytype option:selected').text(),
						subordinateRelation:$('#subordinaterelation option:selected').text(),
						industry:$('#industry option:selected').text(),
						registerAdress:$('#registeradress').val(),
						registerAdressPhone:$('#registeradresspone').val(),
						businessAdress:$('#businessadress').val(),
						businessAdressPhone:$('#businessadressphone').val(),
						legalPersonName:$('#legalpersonname').val(),
						legalPersonCertificateTypeName:$('#legalpersoncertificatetypename option:selected').text(),
						legalPersonCertificateNumber:$('#legalpersoncertificatenumber').val(),
						registerDate:$('#registerdate').val(),
						taxAuthority:$('#taxauthorityname option:selected').text(),
						taxSubAuthority:$('#taxsubauthority').val(),
						taxAdmin:$('#taxadmin').val(),
						streetTown:$('#streettown').val(),
						btToVatType:$('#bttovattype').val(),
						businessScope:$('#businessscope').val(),
						accountingSystem:$('#acountingsystem').val(),
						permitMethod:$('#permitmethod option:selected').text(),
						calculateMethod:$('#calculatemethod option:selected').text(),

						stateOwnedControlType:$('#stateownedcontroltype').val(),
						stateOwnedInverstRate:stateownedinverstrate,
						naturalPersonInverstRate:naturalpersoninverstrate,
						foreignInverstRate:foreigninverstrate,
						registerCapital:registercapital,
						totalInverst:totalinverst,
						partnerNumber:$('#partnernumber').val(),
						totalSubOrgType:$('#totalsuborgtype').val(),
						crossZoneTaxRegMark:$('#crosszonetaxregmark').val(),
						permitEstablishAuthority:$('#permitestablishauthority').val(),
						licenseNumber:$('#licensenumber').val(),
						openBusinessDate:$('#openbusinessdate').val(),
						businessBeginDate:$('#businessbegindate').val(),
						businessEndDate:$('#businessenddate').val(),
						validMark:$('#validmark option:selected').text()
					},
					complete : function(xmlRequest) {
						var returninfo = eval("(" + xmlRequest.responseText + ")");
						if (returninfo.result == 1) {

							location.reload();
						} else {
							$.gritter.add({
								title: '系统信息',
								text: '添加纳税登记信息失败！code:0',
								class_name: 'gritter-success gritter-center'
							});
						}
					},
					error : function(){
						$.gritter.add({
							title: '系统信息',
							text: '添加纳税登记信息失败！code:1',
							class_name: 'gritter-success gritter-center'
						});
					}
				});
			}
		})
	})
</script>

<script type="text/javascript">
	var scripts = [null,"${contextPath}/static/assets/js/jquery-ui.custom.js","${contextPath}/static/assets/js/jquery.ui.touch-punch.js","${contextPath}/static/assets/js/jquery.gritter.js","${contextPath}/static/assets/js/date-time/bootstrap-datepicker.js","${contextPath}/static/assets/js/date-time/locales/bootstrap-datepicker.zh-CN.js","${contextPath}/static/assets/js/select2.js","${contextPath}/static/assets/js/x-editable/bootstrap-editable.js","${contextPath}/static/assets/js/x-editable/ace-editable.js", null]
	$('.page-content-area').ace_ajax('loadScripts', scripts, function() {
		// inline scripts related to this page
		jQuery(function($) {
			$('#registerdate').datepicker({
				format: 'yyyy-mm-dd',
				language: 'zh-CN'
			});
			$('#businessbegindate').datepicker({
				format: 'yyyy-mm-dd',
				language: 'zh-CN'
			});
			$('#businessenddate').datepicker({
				format: 'yyyy-mm-dd',
				language: 'zh-CN'
			});
			$('#openbusinessdate').datepicker({
				format: 'yyyy-mm-dd',
				language: 'zh-CN'
			});

		});
	});
</script>
