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



<div class="row">
    <div class="col-xs-12">
        <div>
            <table id="tax-authority-table"
                   class="table table-striped table-bordered table-hover">
                <thead>
                <tr>
                    <th>序号</th>
                    <th>税务所名称</th>
                    <th></th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${taxAuthorityInfoList }" var="n">
                    <tr>
                        <td width="100px">${n.id}</td>
                        <td width="200px">${n.taxAuthorityName}</td>
                        <td width="100px">
                            <div class='hidden-sm hidden-xs action-buttons'>
                                <a class='blue' href='#'>
                                    <i class='ace-icon fa fa-search-plus bigger-130'></i>
                                </a>
                                <a class='green' href='#modal-form-add' data-toggle='modal'>
                                    <i class='ace-icon fa fa-pencil bigger-130'></i>
                                </a>
                                <a class='red' href='#'>
                                    <i class='ace-icon fa fa-trash-o bigger-130'></i>
                                </a>
                            </div>
                        </td>
                        <td></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<div id="modal-form-add" class="modal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 id='modal-title' class="blue bigger">添加/修改税务所信息</h4>
            </div>

            <div class="modal-body">
                <div class="row">
                    <div class="col-xs-12">
                        <form class="form-horizontal" role="form">
                            <div class="hr hr-18 dotted hr-double"></div>
                            <input type="hidden" id="id" name="id"/>
                            <input type="hidden" id="flag" name="flag" value="new">

                            <div class="form-group">
                                <label class="col-xs-2 control-label no-padding-right"
                                       for="tax-authority-name">税务所名称<font color="red">*</font>
                                </label>

                                <div class="col-xs-4">
                                    <input type="text" id="tax-authority-name" placeholder="税务所名称"
                                           name="tax-authority-name" class="input-large">
                                </div>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <div class="col-md-9">
                    <button id="save" class="btn btn-info" type="button">
                        <i class="ace-icon fa fa-check"></i> Submit
                    </button>

                    &nbsp; &nbsp; &nbsp;
                    <button id="cancel" class="btn btn-sm" data-dismiss="modal">
                        <i class="ace-icon fa fa-times"></i> Cancel
                    </button>

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
        var dt = $('#tax-authority-table').dataTable({
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
            },
            //定义datables布局
            "dom": "<'row'<'col-xs-3'l><'#mytool.col-xs-3'><'col-xs-6'f>r>" +
            "t" +
            "<'row'<'col-xs-6'i><'col-xs-6'p>>",
            //初始化结束后的回调函数
            initComplete: function () {
                $("#mytool").append('<input type="button" id="add" class="btn btn-info btn-sm" data-toggle="modal" href="#modal-form-add" value="添加记录">');

            }
        });
        $("#cancel").on("click",function(){
            $("#flag").val('new');
        })
        //修改的数据绑定
        $(document).on('click', 'td div .green i', function () {
            $("#flag").val("edit");
            var ttr = $(this).closest('tr');
            //console.log(arr);
            $('#modal-form-add #id').val($(ttr).children('td').html());
            $('#modal-form-add #tax-authority-name').val($(ttr).find('td')[1].textContent);
        });

        //添加或者修改：验证表单，提交。
        tt.vf.req.add("tax-authority-name");
        $("#save").bind("click", function() {
            var x =  tt.validate();
            if(x== true){
                var urlString="${contextPath}/sys/taxauthorityinfo/save";
                //console.log(urlString);
                $.ajax({
                    dataType : "json",
                    url : urlString,
                    type : "post",
                    data : {
                        id:$('#modal-form-add form #id').val(),
                        taxAuthorityName:$("form #tax-authority-name").val(),
                        cmd:$("#flag").val()
                    },
                    complete : function(xmlRequest) {
                        var returninfo = eval("(" + xmlRequest.responseText + ")");
                        if (returninfo.result == 1) {
                            $('#modal-form-add #cancel').click();
                            location.reload();
                            //location.replace(location.href);
                        } else {
                            alert("添加失败！");
                        }
                    }
                });
            }
        });

        //删除
        $(document).on('click', 'td div .red i', function () {
            var ttr = $(this).closest('tr');
            var urlString = "${contextPath}/sys/taxauthorityinfo/delete/" +
            $(ttr).children('td').html();
            $.ajax({
                dataType: "json",
                url: urlString,
                type: "post",
                complete: function (msg) {
                    var returninfo = eval("(" + msg.responseText + ")");
                    if (returninfo.result == 1) {
                        //console.log("删除room成功.");
                        ttr.empty();
                        //location.reload();
                        //location.replace(location.href);
                    } else {
                        console.log(returninfo.result);
                    }
                },
                error: function () {
                    alert("删除失败！");
                }
            });
        });

    })
  })
</script>