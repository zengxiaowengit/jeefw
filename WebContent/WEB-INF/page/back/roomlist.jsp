<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>

<link rel="stylesheet" href="${contextPath}/static/assets/js/validate/css/validate.css" />
<script type="text/javascript" src="${contextPath}/static/assets/js/validate/talent-validate-all.js"></script>

<script type="text/javascript"
	src="${contextPath}/static/assets/js/jquery.dataTables.js"></script>
<script type="text/javascript"
	src="${contextPath}/static/assets/js/jquery.dataTables.bootstrap.js"></script>

<div class="page-header">
	<h1>
		楼宇信息 <small> <i class="ace-icon fa fa-angle-double-right"></i>第</small>
		${floor }
		<small>层房间信息
		</small>
	</h1>
</div>
<!-- /.page-header -->
<a id="refresh" href='#' style="visibility: hidden;"><span id='refresh1'>refresh</span></a>

<div class="row">
	<div class="col-xs-12">
		<div>
			<table id="queryRoomTable"
				class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th class="center"><label class="position-relative">
							<input type="checkbox" class="ace" /> <span class="lbl"></span></label>
								</th>
						<th>房间号</th>
						<th>房产总原值(元)</th>
						<th>房屋面积(平方米)</th>
						<th>所属税务机关</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${roomInfoList }" var="n">
					<tr>
					  <td class='center'>
					    <label class='position-relative'>
					      <input id='roomid' type='checkbox' class='ace' value='${ n.id}' />
					      <span class='lbl'></span>
					    </label>
					  </td>
					  <td>
						  <a href='#' id='roomnumber'>${ n.roomNumber}</a>
					  </td>
					  <td class='hidden-480' id='originalvalue'>${ n.originalValue}</td>
					  <td class='hidden-480' id=roomsize>${ n.roomSize}</td>
					  <td class='hidden-320' id='taxauthorityname'>${ n.taxAuthorityName}</td>
					  <td>
					    <div class='hidden-sm hidden-xs action-buttons'>
					      <a class='blue' href='#'>
					        <i class='ace-icon fa fa-search-plus bigger-130'></i>
					      </a>
					      <a class='green' href='#modal-form-add'  data-toggle='modal'>
					        <i class='ace-icon fa fa-pencil bigger-130'></i>
					      </a>
					      <a class='red' href='#'>
					        <i id='roomdelete' class='ace-icon fa fa-trash-o bigger-130'></i>
					      </a>
					    </div>
					</tr>

            </c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-xs-12">
		<button id='modal-add' class="btn btn-info">添加房间</button>
		<a id="alink" href='#modal-form-add' data-toggle='modal' style="visibility: hidden;"></a>
		<input id='addflag' type='hidden' value='edit'/>
	</div>
</div>

<div id="modal-form-add" class="modal" tabindex="-1">
	<div class="modal-dialog">
		<div class="modal-content">

			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 id='modal-title' class="blue bigger">修改房间信息</h4>
			</div>

			<div class="modal-body">
				<div class="row">
					<div class="col-xs-12">
						<form class="form-horizontal" role="form">
							<div class="hr hr-18 dotted hr-double"></div>
							<input type="hidden" id="id" name="id"/>
							<div class="form-group">
								<label class="col-xs-2 control-label no-padding-right"
									for="roomnumber">房间号<font color="red">*</font>
								</label>
								<div class="col-xs-4">
									<input type="text" id="roomnumber" placeholder="房间号"
										name="roomnumber" class="input-large">
								</div>
								<label class="col-xs-2 control-label no-padding-right"
									for="originalvalue">房产总原值<font color="red">*</font></label>
								<div class="col-xs-4">
									<input type="text" id="originalvalue" placeholder="房产总原值"
										name="originalvalue" class="input-large">
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-xs-2 control-label no-padding-right"
									for="roomsize">房屋面积<font color="red">*</font>
								</label>
								<div class="col-xs-4">
									<input type="text" id="roomsize" placeholder="房屋面积"
										name="roomsize" class="input-large">
								</div>
								<label class="col-xs-2 control-label no-padding-right"
									for="taxauthorityname">所属税务机关<font color="red">*</font></label>
								<div class="col-xs-4">
									<select id='taxauthorityname'  name="taxauthorityname"  class="input-large">
										<c:forEach items="${taxAuthorityList }" var="n">
											<option value='${n.id }'>${n.taxAuthorityName }</option>
										</c:forEach>
									</select>
								</div>
							</div>
							
							<div class="clearfix form-actions">
								<div class="col-md-offset-3 col-md-9">
									<button id="save" class="btn btn-info" type="button">
										<i class="ace-icon fa fa-check"></i> Submit
									</button>

									&nbsp; &nbsp; &nbsp;
									<button id="cancel" class="btn btn-sm" data-dismiss="modal">
										<i class="ace-icon fa fa-times"></i> Cancel
									</button>
		
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	var scripts = [null ];
	$('.page-content-area').ace_ajax('loadScripts', scripts, function() {
		// inline scripts related to this page
		jQuery(function($) {
			var dt = $('#queryRoomTable')
	        .dataTable({
	            bAutoWidth: true,
	            "aaSorting": [],
	            "oLanguage": {
	                "sLengthMenu": "每页显示 _MENU_ 条记录",
	                "sZeroRecords": "抱歉， 没有找到",
	                "sInfo": "从 _START_ 到 _END_ /共 _TOTAL_ 条数据",
	                "sInfoEmpty": "没有数据",
	                "sInfoFiltered": "(从 _MAX_ 条数据中检索)",
	                "oPaginate": {
	                    "sFirst": "首页",
	                    "sPrevious": "前一页",
	                    "sNext": "后一页",
	                    "sLast": "尾页"
	                },
	                "sZeroRecords": "没有检索到数据"
	            }
	        });
		
		});
		//全选
		$(document).on('click', 'th input:checkbox',
        function() {
            var that = this;
            $(this).closest('table').find('tr > td:first-child input:checkbox').each(function() {
                this.checked = that.checked;
                $(this).closest('tr').toggleClass('selected');
            });
            
        });
        
        //添加房间
        $("#modal-add").click(function(){
        	//console.log("clicked.");
        	$("#modal-form-add #modal-title").html("添加房间信息");
        	$("#alink").click();
        	$("#addflag").attr("value","new");
        	
        });
        //修改房间
        $(document).on('click', 'td div .green i',
	    function() {
	    	$("#addflag").attr("value","edit");
	    	$("#modal-form-add #modal-title").html("修改房间信息");
	   		ttr = $(this).closest('tr');
	   		console.log($(ttr).children().children().children("input[id='roomid']").val());
	   		$('#modal-form-add #id').val($(ttr).children().children().children("input[id='roomid']").val());
	   		$('#modal-form-add #roomnumber').val($(ttr).children().children("a[id='roomnumber']").html());
	   		$('#modal-form-add #originalvalue').val($(ttr).children("td[id='originalvalue']").html());
	   		$('#modal-form-add #roomsize').val($(ttr).children("td[id='roomsize']").html());
	   		$('#modal-form-add #taxauthorityname').attr("selected",$(ttr).children("td[id='taxauthorityname']").html());
	    });
       	//添加或者修改：验证表单，提交。
       	tt.vf.req.add("roomnumber","originalvalue","roomsize","taxauthorityname");
		$("#save").bind("click", function() {
			var x =  tt.validate();
			if(x== true){
				str = window.location.hash;
				arr = str.split("/");
				urlString="${contextPath}/sys/roominfo/saveroom/"+arr[arr.length-2]+"/"+arr[arr.length-1];
				$.ajax({
					dataType : "json",
					url : urlString,
					type : "post",
					data : {
						id:$('#modal-form-add form #id').val(),
						roomNumber:$('#modal-form-add form #roomnumber').val(),
						originalValue:$('#modal-form-add form #originalvalue').val(),
						roomSize:$('#modal-form-add form #roomsize').val(),
						taxAuthorityName:$('#modal-form-add form #taxauthorityname option:selected').text(),
						cmd:$("#addflag").val()
		
					},
					complete : function(xmlRequest) {
						var returninfo = eval("(" + xmlRequest.responseText + ")");
						if (returninfo.result == 1) {
							$('#modal-form-add #cancel').click();
							location.reload();
							//location.replace(location.href);
						} else {
						alert("添加房间失败！");
						
						}
					}
				});
			}
		});
		
		//删除房间
        $(document).on('click', 'td div .red i',function() {
	    	var ttr = $(this).closest('tr');
            //console.log($(ttr).children().children().children("input[id='roomid']").val());
            urlString = "${contextPath}/sys/roominfo/deleteroominfo/"+
            $(ttr).children().children().children("input[id='roomid']").val();
            $.ajax({
                dataType: "json",
                url: urlString,
                type: "post",
                data: {
                    id: $(ttr).children().children().children("input[id='b0']").val()
                },
                complete: function(msg) {
                	var returninfo = eval("(" + msg.responseText + ")");
					if (returninfo.result == 1) {
						ttr.empty();
						//location.replace(location.href);
					} else {
						console.log(returninfo.result);
					}
                },
                error: function() {
                    alert("删除房间失败！");
                }
            });
	    });
	});
</script>