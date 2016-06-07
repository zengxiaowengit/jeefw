<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>

<link rel="stylesheet" href="${contextPath}/static/assets/js/validate/css/validate.css"/>
<script type="text/javascript" src="${contextPath}/static/assets/js/validate/talent-validate-all.js"></script>

<script type="text/javascript"
        src="${contextPath}/static/assets/js/jquery.dataTables.js"></script>
<script type="text/javascript"
        src="${contextPath}/static/assets/js/jquery.dataTables.bootstrap.js"></script>

<div class="row">
    <div class="col-xs-12">
        <div>
            <table id="queryRoomTable"
                   class="table table-striped table-bordered table-hover">
                <thead>
                <tr>
                    <th class="center"><label class="position-relative">
                        <input type="checkbox" class="ace"/> <span class="lbl"></span></label>
                    </th>
                    <th>房间号</th>
                    <th>楼宇名称</th>
                    <th>楼宇坐落地址</th>
                    <th>使用者</th>
                    <th>使用者证件类型</th>
                    <th>使用者证件号码</th>
                    <th>出租者</th>
                    <th>出租者证件类型</th>
                    <th>出租者证件号码</th>

                </tr>
                </thead>
                <tbody>


                </tbody>
            </table>
        </div>
    </div>
</div>

<div id="mymodal" class="modal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="blue bigger">条件查询</h4>
            </div>

            <div class="modal-body">
                <div class="row">
                    <div class="col-xs-12">
                        <form class="form-horizontal" role="form">
                            <div class="form-group">
                                <select id="andor">
                                    <option value="精确查询">精确查询</option>
                                    <option value="模糊查询">模糊查询</option>
                                </select>
                                <input type="button" id="addrule" value="+" title="添加查询条件" class="btn-xs btn-info">
                            </div>

                            <div id="rules" class="col-xs-12">

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
    var scripts = [null, "${contextPath}/static/assets/js/date-time/bootstrap-datepicker.js",
        "${contextPath}/static/assets/js/date-time/locales/bootstrap-datepicker.zh-CN.js", null];
    $('.page-content-area').ace_ajax('loadScripts', scripts,
            function () {
                //inline scripts related to this page
                jQuery(function ($) {
                    var dt = $('#queryRoomTable');
                    //.wrap("<div class='dataTables_borderWrap' />")   //if you are applying horizontal scrolling (sScrollX)
                    dt.dataTable({
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
                        "processing": true,
                        "bScrollCollapse": true,
                        /*ajax:{
                         url: '${contextPath}/sys/roomuseinfo/queryall',
                         dataSrc: ''
                         },*/
                        columns: [
                            {data: 'id'},
                            {data: 'roomInfo.roomNumber'},
                            {data: 'roomInfo.buildingInfo.buildingName'},
                            {data: 'roomInfo.buildingInfo.buildingAdress'},
                            {data: 'userName'},
                            {data: 'userCertificateTypeName'},
                            {data: 'userCertificateNumber'},
                            {data: 'lessorName'},
                            {data: 'lessorCertificateTypeName'},
                            {data: 'lessorCertificateNumber'}
                        ],
                        aoColumnDefs: [
                            {
                                "aTargets": [0], "mRender": function (data, type, full) {
                                return "<label class='position-relative'> <input type='checkbox' class='ace' value =" + data + "> <span class='lbl'></span></label>";
                            }
                            }, {
                                "aTargets": [1], "mRender": function (data, type, full) {
                                    return "<a href='/sys/sysuser/home#page/getroomuseinfo/" + full.roomInfo.id + "'>" + data + "</a>";
                                }
                            }
                        ],
                        //定义datables布局
                        "dom": "<'row'<'col-xs-3'l><'#mytool.col-xs-3'><'col-xs-6'f>r>" +
                        "t" +
                        "<'row'<'col-xs-6'i><'col-xs-6'p>>",
                        //初始化结束后的回调函数
                        initComplete: function () {
                            $("#mytool").append('<input type="button" id="query" class="btn btn-info btn-sm" data-toggle="modal" href="#mymodal" value="条件查询">');

                        }
                    });
                    //根据条件查询
                    $("#save").on("click", function () {
                        $("#cancel").click();
                        var data = {};
                        if($("#andor option:selected").text() == "精确查询")
                            data["flag"] = "AND";
                        else
                            data["flag"] = "OR";
                        $("#rules .form-group").each(function(){
                            var str = $(this).find("select option:selected")[0].text;
                            if(str == "房产所有人" && $(this).find("input").val()!= "")
                                data["$eq_houseTaxPerson"] = $(this).find("input").val();
                            else if(str == "使用人" && $(this).find("input").val()!= "")
                                data["$eq_userName"] = $(this).find("input").val();
                            else if(str == "出租人" && $(this).find("input").val()!= ""){
                                data["$eq_lessorName"] = $(this).find("input").val();
                            }
                            //精确查询
                            else if(str == "使用人证件号码" && $(this).find("input").val()!= "") {
                                data["$eq_userCertificateTypeName"] = $(this).find("select option:selected")[1].text;
                                data["$eq_userCertificateNumber"] = $(this).find("input").val();
                            }
                            else if(str == "房产所有人证件号码" && $(this).find("input").val()!= "") {
                                data["$eq_houseTaxCertificateTypeName"] = $(this).find("select option:selected")[1].text;
                                data["$eq_houseTaxCertificateNumber"] = $(this).find("input").val();
                            }
                            else if(str == "出租人证件号码" && $(this).find("input").val()!= "") {
                                data["$eq_lessorCertificateTypeName"] = $(this).find("select option:selected")[1].text;
                                data["$eq_lessorCertificateNumber"] = $(this).find("input").val();
                            }

                        })
                        $.ajax({
                            dataType: "json",
                            url: "${contextPath}/sys/roomuseinfo/conditionQuery",
                            type: "post",
                            data:data,
                            complete: function (xmlRequest) {
                                var tabledata = eval("(" + xmlRequest.responseText + ")");
                                dt.fnClearTable();
                                dt.fnAddData(tabledata);
                                dt.fnDraw();
                            }
                        })
                        $("#rules").empty();

                    })
                    //添加查询条件
                    $("#addrule").on("click", function () {
                        if($("#andor option:selected").text() == "模糊查询"){
                            $("#rules").append("<div class='form-group'><select><option>房产所有人</option><option>使用人</option><option>出租人</option></select><input class='input-medium'><a class='red' href='#'> <i class='ace-icon glyphicon glyphicon-remove bigger-150'></i></a></div>");
                        } else{
                            $("#rules").append("<div class='form-group'><select><option>房产所有人</option><option>使用人</option><option>出租人</option><option>房产所有人证件号码</option><option>使用人证件号码</option><option>出租人证件号码</option></select><input class='input-medium'><a class='red' href='#'> <i class='ace-icon glyphicon glyphicon-remove bigger-150'></i></a></div>");
                        }
                    })
                    //删除查询条件
                    $("form").on("click","div .red i",function(){
                        //console.log("remove");
                        $(this).closest(".form-group").empty();
                    });
                    //全选。
                    $(document).on('click', 'th input:checkbox', function () {
                        var that = this;
                        $(this).closest('table').find('tr > td:first-child input:checkbox').each(function () {
                            this.checked = that.checked;
                            $(this).closest('tr').toggleClass('selected');
                        });
                    });
                    //change事件
                    $("#andor").on("change",function(){
                        $("#rules").empty();
                    })
                    //精确查询时添加证件类型
                    $("#rules").on("change","select",function(){
                        //console.log("change");
                        var x = $(this).find("option:selected").text();
                        if(x =="房产所有人证件号码" || x=="使用人证件号码" || x == "出租人证件号码")
                        {
                            if($(this).next()[0].nodeName != "SELECT"){
                                var y = $(this).after("<select></select>").next();
                                $.getJSON("${contextPath}/sys/roomuseinfo/getcertificatetypeinfo",function(result){
                                    $.each(result,function(){
                                        //console.log(this.certificateTypeName);
                                        if(this.certificateTypeName == "居民身份证")
                                            y.append("<option value='" + this.certificateTypeCode + "' selected>" + this.certificateTypeName+"</option>");
                                        else
                                            y.append("<option value='" + this.certificateTypeCode + "'>" + this.certificateTypeName+"</option>");
                                    })
                                })
                            }
                        }
                        else{
                            var x = $(this).next();
                            if(x[0].nodeName == "SELECT")
                                x.remove();
                            }

                    })

                });

            });

</script>
