<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
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
            <table id="query-company-table"
                   class="table table-striped table-bordered table-hover">
                <thead>
                <tr>
                    <th class="center"><label class="position-relative">
                        <input type="checkbox" class="ace"/> <span class="lbl"></span></label>
                    </th>
                    <th>纳税人识别号</th>
                    <th>纳税人名称</th>
                    <th>纳税人状态</th>
                    <th>课征主体登记类型</th>
                    <th>登记注册类型</th>
                    <th>国地管户类型</th>
                    <th>单位隶属关系</th>
                    <th>行业</th>
                    <th>注册地址</th>
                    <th>注册地联系电话</th>
                    <th>生产经营地址</th>
                    <th>生产经营地联系电话</th>
                    <th>法定代表人姓名</th>
                    <th>法人证件类型</th>
                    <th>法人证件号码</th>
                    <th>登记日期</th>
                    <th>主管税务机关</th>
                    <th>主管税务所</th>
                    <th>税收管理员</th>
                    <th>街道乡镇</th>
                    <th>营改增纳税人类型</th>
                    <th>经营范围</th>
                    <th>会计制度</th>
                    <th>办证方式</th>
                    <th>核算方式</th>
                    <th>国有控股类型</th>
                    <th>国有投资比例</th>
                    <th>自然人投资比例</th>
                    <th>外资投资比例</th>
                    <th>注册资本</th>
                    <th>投资总额</th>
                    <th>合伙人数</th>
                    <th>总分机构类型</th>
                    <th>跨区财产税主体登记标志</th>
                    <th>批准设立机关</th>
                    <th>证照编号</th>
                    <th>开业设立日期</th>
                    <th>生产经营期限起</th>
                    <th>生产经营期限止</th>
                    <th>有效标志</th>
                    <th>登记序号</th>
                    <th>录入人</th>
                    <th>录入日期</th>
                    <th>修改人</th>
                    <th>修改日期</th>

                    <th></th>
                </tr>
                </thead>
                <tbody>
                <%--@elvariable id="companyInfoList" type="java.util.List"--%>
                <c:forEach items="${companyInfoList }" var="n">
                    <tr>
                        <td class='center'>
                            <label class='position-relative'>
                                <input id='b0' type='checkbox' class='ace' value='${ n.id}' />
                                <span class='lbl'></span>
                            </label>
                        </td>
                        <td>${n.taxpayerIndentifyNumber}</td>
                        <td>${n.taxpayerName}</td>
                        <td>${n.taxpayerStatus}</td>
                        <td>${n.taxSubjectRegisterType}</td>
                        <td>${n.registerType}</td>
                        <td>${n.localContryType}</td>
                        <td>${n.subordinateRelation}</td>
                        <td>${n.industry}</td>
                        <td>${n.registerAdress}</td>
                        <td>${n.registerAdressPhone}</td>
                        <td>${n.businessAdress}</td>
                        <td>${n.businessAdressPhone}</td>
                        <td>${n.legalPersonName}</td>
                        <td>${n.legalPersonCertificateTypeName}</td>
                        <td>${n.legalPersonCertificateNumber}</td>
                        <td>${n.registerDate}</td>
                        <td>${n.taxAuthority}</td>
                        <td>${n.taxSubAuthority}</td>
                        <td>${n.taxAdmin}</td>
                        <td>${n.streetTown}</td>
                        <td>${n.btToVatType}</td>
                        <td>${n.businessScope}</td>
                        <td>${n.accountingSystem}</td>
                        <td>${n.permitMethod}</td>
                        <td>${n.calculateMethod}</td>
                        <td>${n.stateOwnedControlType}</td>
                        <td>${n.stateOwnedInverstRate}</td>
                        <td>${n.naturalPersonInverstRate}</td>
                        <td>${n.foreignInverstRate}</td>
                        <td>${n.registerCapital}</td>
                        <td>${n.totalInverst}</td>
                        <td>${n.partnerNumber}</td>
                        <td>${n.totalSubOrgType}</td>
                        <td>${n.crossZoneTaxRegMark}</td>
                        <td>${n.permitEstablishAuthority}</td>
                        <td>${n.licenseNumber}</td>
                        <td>${n.openBusinessDate}</td>
                        <td>${n.businessBeginDate}</td>
                        <td>${n.businessEndDate}</td>
                        <td>${n.validMark}</td>
                        <td>${n.registerNumber}</td>
                        <td>${n.inputPerson}</td>
                        <td>${n.inputDate}</td>
                        <td>${n.modifiedPerson}</td>
                        <td>${n.modifiedDate}</td>

                        <td></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
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
                    var dt = $('#query-company-table').dataTable({
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
                        "sScrollX": "400%",
                        "bScrollCollapse": true
                    });

                    //全选。
                    $(document).on('click', 'th input:checkbox', function () {
                        var that = this;
                        $(this).closest('table').find('tr > td:first-child input:checkbox').each(function () {
                            this.checked = that.checked;
                            $(this).closest('tr').toggleClass('selected');
                        });

                    });

                });
            });
</script>