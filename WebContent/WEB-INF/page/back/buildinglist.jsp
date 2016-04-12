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

<div class="row">
	<div class="col-xs-12">
		<div>
			<table id="queryBuildingTable"
				class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th class="center"><label class="position-relative">
								<input type="checkbox" class="ace" /> <span class="lbl"></span>
						</label></th>
						<th>楼宇名称</th>
						<th>楼宇总套数</th>
						<th>楼宇坐落地址</th>
						<th>行政区划</th>
						<th>房屋所处街乡</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${buildingInfoList }" var="n">
					<tr>
					  <td class='center'>
					    <label class='position-relative'>
					      <input id='b0' type='checkbox' class='ace' value='${ n.id}' />
					      <span class='lbl'></span>
					    </label>
					  </td>
					  <td>
					    <a href='#' id='b1'>${ n.buildingName}</a>
					  </td>
					  <td class='hidden-480' id='b2'>${ n.roomSum}</td>
					  <td class='hidden-480' id='b3'>${ n.buildingAdress}</td>
					  <td class='hidden-320' id='b4'>${ n.areaDivide}</td>
					  <td class='hidden-480' id='b5'>${ n.streetTown}</td>
					  <td>
					    <div class='hidden-sm hidden-xs action-buttons'>
					      <a class='blue' href='#'>
					        <i class='ace-icon fa fa-search-plus bigger-130'></i>
					      </a>
					      <a class='green' href='#modal-form'  data-toggle='modal'>
					        <i class='ace-icon fa fa-pencil bigger-130'></i>
					      </a>
					      <a class='red' href='#'>
					        <i class='ace-icon fa fa-trash-o bigger-130'></i>
					      </a>
					    </div>
					</tr>

            </c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>

<div id="modal-form" class="modal" tabindex="-1">
	<div class="modal-dialog">
		<div class="modal-content">

			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="blue bigger">修改楼宇信息</h4>
			</div>

			<div class="modal-body">
				<div class="row">
					<div class="col-xs-12">
						<form class="form-horizontal" role="form">
							<div class="hr hr-18 dotted hr-double"></div>
							<input type="hidden" id="id" name="id"/>
							<div class="form-group">
								<label class="col-xs-2 control-label no-padding-right"
									for="buildingname">楼宇名称<font color="red">*</font>
								</label>
								<div class="col-xs-4">
									<input type="text" id="buildingname" placeholder="楼宇名称"
										name="buildingname" class="input-large">
								</div>
								<label class="col-xs-2 control-label no-padding-right"
									for="buildingsum">楼宇总套数<font color="red">*</font></label>
								<div class="col-xs-4">
									<input type="text" id="buildingsum" placeholder="楼宇总套数"
										name="buildingsum" class="input-large">
								</div>
							</div>
							<div class="form-group">

								<label class="col-xs-2 control-label no-padding-right"
									for="buildingadress">楼宇坐落地址<font color="red">*</font></label>
								<div class="col-xs-4">
									<input type="text" id="buildingadress" placeholder="楼宇坐落地址"
										name="buildingadress" class="input-large">
								</div>
								<label class="col-xs-2 control-label no-padding-right"
									for="buildingarea">行政区划<font color="red">*</font></label>
								<div class="col-xs-4">
									<input type="text" id="buildingarea" placeholder="行政区划"
										name="buildingarea" class="input-large">
								</div>

							</div>

							<div class="form-group">
								<label class="col-xs-2 control-label no-padding-right"
									for="buildingstreet">房屋所处街乡<font color="red">*</font></label>
								<div class="col-xs-6">
									<input type="text" id="buildingstreet" placeholder="房屋所处街乡"
										name="buildingstreet" class="input-xxlarge">
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
	var scripts = [null];
$('.page-content-area').ace_ajax('loadScripts', scripts,
function() {
    //inline scripts related to this page
    jQuery(function($) {

        var dt = $('#queryBuildingTable')
        //.wrap("<div class='dataTables_borderWrap' />")   //if you are applying horizontal scrolling (sScrollX)
        .dataTable({
            bAutoWidth: false,
            "aoColumns": [{
                "bSortable": false
            },
            null, null, null, null, null, {
                "bSortable": false
            }],
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

        //全选。
        $(document).on('click', 'th input:checkbox',
        function() {
            var that = this;
            $(this).closest('table').find('tr > td:first-child input:checkbox').each(function() {
                this.checked = that.checked;
                $(this).closest('tr').toggleClass('selected');
            });
        });
        //删除一行
        $(document).on('click', 'td div .red i',
        function() {
            var ttr = $(this).closest('tr');
            console.log($(ttr).children().children().children("input[id='b0']").val());
            //console.log($(ttr).children("td[id='b2']").html());
            $.ajax({
                dataType: "json",
                url: "${contextPath}/sys/buildinginfo/deletebuildinginfo",
                type: "post",
                data: {
                    id: $(ttr).children().children().children("input[id='b0']").val(),
                    buildingName: $(ttr).children().children("a[id='b1']").html(),
                    roomSum: $(ttr).children("td[id='b2']").html(),
                    buildingAdress: $(ttr).children("td[id='b3']").html(),
                    areaDivide: $(ttr).children("td[id='b4']").html(),
                    streetTown: $(ttr).children("td[id='b5']").html()
                },
                complete: function(msg) {
                    ttr.empty();
                },
                error: function() {
                    alert("删除数据失败！");
                }
            });

        });
    });
    $(document).on('click', 'td div .green i',
    function() {
        ttr = $(this).closest('tr');
        $('#modal-form #id').val($(ttr).children().children().children("input[id='b0']").val());
        console.log($(ttr).children().children().children("input[id='b0']").val());
        $('#modal-form #buildingname').val($(ttr).children().children("a[id='b1']").html());
        $('#modal-form #buildingsum').val($(ttr).children("td[id='b2']").html());
        $('#modal-form #buildingadress').val($(ttr).children("td[id='b3']").html());
        $('#modal-form #buildingarea').val($(ttr).children("td[id='b4']").html());
        $('#modal-form #buildingstreet').val($(ttr).children("td[id='b5']").html());
    });
});
</script>

<script type="text/javascript">
	tt.vf.req.add("buildingname","buildingsum","buildingadress","buildingarea","buildingstreet");
	//验证表单
	$("#save").bind("click", function() {
		var x =  tt.validate();
		if(x== true)
		{
		$.ajax({
			dataType : "json",
			url : "${contextPath}/sys/buildinginfo/savebuildinginfo",
			type : "post",
			data : {
				id:$('#modal-form form #id').val(),
				buildingName : $('#modal-form #buildingname').val(),
				roomSum : $('#modal-form #buildingsum').val(),
				buildingAdress : $('#modal-form #buildingadress').val(),
				areaDivide : $('#modal-form #buildingarea').val(),
				streetTown : $('#modal-form #buildingstreet').val(),
				cmd:"EDIT"

			},
			complete : function(xmlRequest) {
				var returninfo = eval("(" + xmlRequest.responseText + ")");
				if (returninfo.result == 1) {
					$('#modal-form #cancel').click();
					location.reload();
				} else {
				alert("修改信息失败！");
				
				}
			}
		});
		}
	});
</script>