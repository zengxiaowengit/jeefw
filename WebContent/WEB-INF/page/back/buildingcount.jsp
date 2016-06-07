<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>

<script src="${contextPath}/static/assets/js/echarts.common.min.js"></script>


<div class="page-header">
  <h1>
    楼宇信息 <small> <i class="ace-icon fa fa-angle-double-right"></i>
    房产信息统计
  </small>
  </h1>
</div>

<div id="user-pie" class="col-xs-6" style="width: 50%;height: 300px;position: relative"></div>

<div id="use-type-pie" class="col-xs-6" style="width: 50%;height: 300px;position: relative"></div>

<div class="col-xs-12">
  <div class="hr hr-18 dotted hr-double"></div>
</div>

<div id="tax" class="col-xs-6" style="width: 50%;height: 400px;position: relative"></div>

<div id="tax-sum" class="col-xs-6" style="width: 50%;height: 300px;position: relative"></div>

<script type="text/javascript">
  var scripts = [null ];
  $('.page-content-area').ace_ajax('loadScripts', scripts, function() {
    // inline scripts related to this page
    jQuery(function($) {
      var urlString = location.href;
      var str = urlString.split('/');
      var buildingId = parseInt(str[str.length-1]);
      //使用者
      $.ajax({
        dataType: "json",
        url: "${contextPath}/sys/buildinginfo/getUserPieData/"+buildingId,
        type: "post",
        complete: function(data) {
          data = eval("(" + data.responseText + ")");
          //console.log(data);
          var result = new Array();
          var legend = new Array();
          $.each(data,function(index,element){
            var obj = new Object();
            obj.name = element[0];
            obj.value = element[1];
            legend.push(element[0]);
            result.push(obj);
          })
          var option = {
            title : {
              text: '使用者',
              subtext: '房产信息统计',
              x:'center'
            },
            tooltip : {
              trigger: 'item',
              formatter: "{b} : {c} ({d}%)"
            },
            legend: {
              data:legend,
              orient: 'vertical',
              right: 'right'
            },
            series : [
              {
                name: '使用者',
                type: 'pie',
                radius : '55%',
                center: ['50%', '60%'],
                data:result,
                itemStyle: {
                  emphasis: {
                    shadowBlur: 10,
                    shadowOffsetX: 0,
                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                  }
                }
              }
            ],
            itemStyle: {
              normal: {
                // 阴影的大小
                shadowBlur: 200,
                // 阴影水平方向上的偏移
                shadowOffsetX: 0,
                // 阴影垂直方向上的偏移
                shadowOffsetY: 0,
                // 阴影颜色
                shadowColor: 'rgba(0, 0, 0, 0.5)',
                color: function (value){ return "#"+("00000"+((Math.random()*16777215+0.5)>>0).toString(16)).slice(-6); }
              }
            }
          };
          echarts.init(document.getElementById('user-pie')).setOption(option);


        }
      })

      //使用类型
      $.ajax({
        dataType: "json",
        url: "${contextPath}/sys/buildinginfo/getUseTypeData/"+buildingId,
        type: "post",
        complete: function(data) {
          data = eval("(" + data.responseText + ")");
          //console.log(data);
          var result = new Array();
          var legend = new Array();
          $.each(data,function(index,element){
            var obj = new Object();
            obj.name = element[0];
            obj.value = element[1];
            legend.push(element[0]);
            result.push(obj);
          })
          var option = {
            title : {
              text: '使用类型',
              subtext: '房产信息统计',
              x:'center'
            },
            tooltip : {
              trigger: 'item',
              formatter: "{b} : {c} ({d}%)"
            },
            legend: {
              data:legend,
              orient: 'vertical',
              right: 'right'
            },
            series : [
              {
                name: '使用类型',
                type: 'pie',
                radius : '55%',
                center: ['50%', '60%'],
                data:result,
                itemStyle: {
                  emphasis: {
                    shadowBlur: 10,
                    shadowOffsetX: 0,
                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                  }
                }
              }
            ],
            itemStyle: {
              normal: {
                // 阴影的大小
                shadowBlur: 200,
                // 阴影水平方向上的偏移
                shadowOffsetX: 0,
                // 阴影垂直方向上的偏移
                shadowOffsetY: 0,
                // 阴影颜色
                shadowColor: 'rgba(0, 0, 0, 0.5)',
                color: function (value){ return "#"+("00000"+((Math.random()*16777215+0.5)>>0).toString(16)).slice(-6); }
              }
            }
          };
          echarts.init(document.getElementById('use-type-pie')).setOption(option);

        }
      })

      //地税
      $.getJSON("${contextPath}/sys/buildinginfo/getTaxData/"+buildingId,function(data) {
        var data2 = new Array();
          for(var i = 0; i < 12;i++){
            data2.push((data[1][i]-data[0][i])/data[0][i]);
          }
         // console.log(data2);
          var option = {
            title: {
              text: '2014-2015年地税情况',
              x:'left'
            },
            tooltip: {},
            legend: {
              data: ['2014年','2015年','同比数'],
              x:'right'
            },
            xAxis: {
              data: ["1月", "2月", "3月", "4月", "5月", "6月", "7月", "8月", "9月", "10月", "11月", "12月"]
            },
            yAxis:  [
              {
                type: 'value',
                name: '纳税额(单位：元)',
                axisLabel: {
                  formatter: '{value}'
                }
              },{
                type: 'value',
                name: '同比数',
                axisLabel: {
                  formatter: '{value}'
                }
              }
            ],
            series: [{
              name: '2014年',
              type: 'bar',
              data: data[0]
            }, {
              name: '2015年',
              type: 'bar',
              data: data[1]
            },{
              name:'同比数',
              type:'line',
              yAxisIndex: 1,
              data:data2
            }],
            itemStyle: {
              normal: {
                // 阴影的大小
                shadowBlur: 200,
                // 阴影水平方向上的偏移
                shadowOffsetX: 0,
                // 阴影垂直方向上的偏移
                shadowOffsetY: 0,
                // 阴影颜色
                shadowColor: 'rgba(0, 0, 0, 0.5)'
              }
            }
          };
          echarts.init(document.getElementById('tax')).setOption(option);

      })
      //地税当年累计数，分税种
      $.getJSON("${contextPath}/sys/buildinginfo/getTaxSumData/"+buildingId,function(data) {
        //console.log(data);
        var result = new Array();
        var legend = new Array();
        $.each(data,function(index,element){
          var obj = new Object();
          obj.name = element[0];
          obj.value = element[1];
          result.push(obj);
          legend.push(element[0]);
        })
        //console.log(result);
        var option = {
          title : {
            text: '地税当年累计数',
            subtext: '房产信息统计',
            x:'center'
          },
          tooltip : {
            trigger: 'item',
            formatter: "{b} : {c} ({d}%)"
          },
          legend: {
            data:legend,
            orient: 'vertical',
            right: 'right'
          },
          series : [
            {
              name: '累计数',
              type: 'pie',
              radius : '55%',
              center: ['50%', '60%'],
              data:result,
              itemStyle: {
                emphasis: {
                  shadowBlur: 10,
                  shadowOffsetX: 0,
                  shadowColor: 'rgba(0, 0, 0, 0.5)'
                }
              }
            }
          ],
          itemStyle: {
            normal: {
              // 阴影的大小
              shadowBlur: 200,
              // 阴影水平方向上的偏移
              shadowOffsetX: 0,
              // 阴影垂直方向上的偏移
              shadowOffsetY: 0,
              // 阴影颜色
              shadowColor: 'rgba(0, 0, 0, 0.5)',
              color: function (value){ return "#"+("00000"+((Math.random()*16777215+0.5)>>0).toString(16)).slice(-6); }
            }
          }
        }
        echarts.init(document.getElementById('tax-sum')).setOption(option);

      })

    });
  });
</script>