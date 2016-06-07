<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>

<script src="${contextPath}/static/assets/js/echarts.common.min.js"></script>


<div class="page-header">
  <h1>
    楼宇信息 <small> <i class="ace-icon fa fa-angle-double-right"></i>
    概况展示
  </small>
  </h1>
</div>


<div id="building-num" class="col-xs-6" style="width: 50%;height: 300px;position: relative"></div>

<div id="total-area" class="col-xs-6" style="width: 50%;height: 300px;position: relative"></div>

<div id="lessor-rate" class="col-xs-6" style="width: 50%;height: 300px;position: relative"></div>

<div id="tax-year" class="col-xs-6" style="width: 50%;height: 300px;position: relative"></div>


<script type="text/javascript">
  var scripts = [null ];
  $('.page-content-area').ace_ajax('loadScripts', scripts, function() {
    // inline scripts related to this page
    jQuery(function($) {
      //楼宇数量、总面积、出租率、年纳税额
      $.getJSON("${contextPath}/sys/buildinginfo/getShowData",function(result){
        //console.log(result);
        //楼宇数量
        var data = new Array();
        var legend = new Array();
        var option = null;
        $.each(result.buildingNum,function(index,val){
          //console.log(val);
          var obj = new Object();
          obj.name = val[0];
          obj.value = val[1];
          legend.push(val[0]);
          data.push(obj);
        })
        //console.log(data);
        //console.log(legend);
        option = {
          title : {
            text: '楼宇数量',
            subtext: '概况展示',
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
              data:data,
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
              color: function (value){return "#"+("00000"+((Math.random()*16777215+0.5)>>0).toString(16)).slice(-6); }
            }
          }
        }
        echarts.init(document.getElementById('building-num')).setOption(option);

        //总面积
        legend = new Array(),data = new Array();
        $.each(result.totalArea,function(index,val){
          //console.log(val);
          var obj = new Object();
          obj.name = val[0];
          obj.value = val[1];
          legend.push(val[0]);
          data.push(obj);
        })
        //console.log(data);
        //console.log(legend);
        option = {
          title : {
            text: '总面积',
            subtext: '概况展示',
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
              name: '总面积',
              type: 'pie',
              radius : '55%',
              center: ['50%', '60%'],
              data:data,
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
        echarts.init(document.getElementById('total-area')).setOption(option);

        //出租率
        legend = new Array(),data = new Array();
        $.each(result.lessored,function(index,val){
          //console.log(val);
          var obj = new Object();
          obj.name = val[0];
          obj.value = val[1]/result.allroom[index];
          legend.push(val[0]);
          data.push(obj);
        })
        //console.log(data);
        //console.log(legend);
        option = {
          title : {
            text: '出租率',
            subtext: '概况展示',
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
              name: '出租率',
              type: 'pie',
              radius : '55%',
              center: ['50%', '60%'],
              data:data,
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
        echarts.init(document.getElementById('lessor-rate')).setOption(option);

        //年纳税额
        legend = new Array(),data = new Array();
        $.each(result.tax,function(index,val){
          //console.log(val);
          var obj = new Object();
          obj.name = val[0];
          obj.value = val[1];
          legend.push(val[0]);
          data.push(obj);
        })
        //console.log(data);
        //console.log(legend);
        option = {
          title : {
            text: '年纳税额',
            subtext: '概况展示',
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
              name: '年纳税额',
              type: 'pie',
              radius : '55%',
              center: ['50%', '60%'],
              data:data,
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
        echarts.init(document.getElementById('tax-year')).setOption(option);


      });

    });
  });
</script>