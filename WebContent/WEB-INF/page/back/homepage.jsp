<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>


<div id="contentmap" class="col-xs-12" style="height:550px"></div>




<script type="text/javascript" src="${contextPath}/static/assets/js/BaiduMap.js"></script>

<script type="text/javascript">
var map = new BMap.Map("contentmap", 
		{mapType:BMAP_NORMAL_MAP},{minZoom:13,maxZoom:18});//卫星地图BMAP_SATELLITE_MAP
    var point = new BMap.Point(113.733311, 34.778249);
    map.centerAndZoom(point, 16);
    map.enableScrollWheelZoom();
    map.addControl(new BMap.NavigationControl());
    map.addControl(new BMap.MapTypeControl());
    map.setCenter(point);
    //map.setCurrentCity("郑州市");  //设置当前城市
    //ajax获取已有楼宇信息
   
    $.ajax({
			dataType : "json",
			url : "${contextPath}/sys/buildinginfo/getbuildinginfo",
			type : "post",
			success: function(msg) {
				 $.each(msg,function(idx,item){     
  				 	point = new BMap.Point(item.longitude,item.latitude);
  				 	var marker = new BMap.Marker(point);
					map.addOverlay(marker);
					
					//添加复杂覆盖物。
					function ComplexCustomOverlay(point, text, mouseoverText){
		      			this._point = point;
		      			this._text = text;
					    this._overText = mouseoverText;
					}
					ComplexCustomOverlay.prototype = new BMap.Overlay();
					ComplexCustomOverlay.prototype.initialize = function(map){
				      this._map = map;
				      var div = this._div = document.createElement("div");
				      div.style.position = "absolute";
				      div.style.zIndex = BMap.Overlay.getZIndex(this._point.lat);
				      div.style.backgroundColor = "#EE5D5B";
				      div.style.border = "1px solid #BC3B3A";
				      div.style.color = "white";
				      div.style.height = "18px";
				      div.style.padding = "2px";
				      div.style.lineHeight = "18px";
				      div.style.whiteSpace = "nowrap";
				      div.style.MozUserSelect = "none";
				      div.style.fontSize = "12px"
				      var span = this._span = document.createElement("span");
				      div.appendChild(span);
				      span.appendChild(document.createTextNode(this._text));      
				      var that = this;
				
				      var arrow = this._arrow = document.createElement("div");
				      arrow.style.background = "url(http://map.baidu.com/fwmap/upload/r/map/fwmap/static/house/images/label.png) no-repeat";
				      arrow.style.position = "absolute";
				      arrow.style.width = "11px";
				      arrow.style.height = "10px";
				      arrow.style.top = "22px";
				      arrow.style.left = "10px";
				      arrow.style.overflow = "hidden";
				      div.appendChild(arrow);
				     
				      div.onmouseover = function(){
				        this.style.backgroundColor = "#6BADCA";
				        this.style.borderColor = "#0000ff";
				        this.getElementsByTagName("span")[0].innerHTML = that._overText;
				        arrow.style.backgroundPosition = "0px -20px";
				      }
				
				      div.onmouseout = function(){
				        this.style.backgroundColor = "#EE5D5B";
				        this.style.borderColor = "#BC3B3A";
				        this.getElementsByTagName("span")[0].innerHTML = that._text;
				        arrow.style.backgroundPosition = "0px 0px";
				      }
				     
				     div.onclick = function(e){
				     	var src = $(e.srcElement).html();
				     	console.log(src);
					  	var x = map.getOverlays();
						console.log(x);
						$.each(x,function(){
							if(this._text==src){
								urlString = "${contextPath}/sys/buildinginfo/getbuildingid/"+this._point.lng+"/"+this._point.lat+"/1";
								console.log(urlString);
								$.ajax({
									dataType : "json",
									url : urlString,
									type : "post",
									complete : function(xmlRequest) {
										var returninfo = eval("(" + xmlRequest.responseText + ")");
										console.log(returninfo.result);
										if (returninfo.result > 0 ) {
											urlString = "${contextPath}/sys/sysuser/home#page/roomnav/"+returninfo.result;
											location.href=urlString;
										} else {
											alert("导航失败！");
										}
									}
								});
							}
						});
					  
						//alert("clicked");
					  }
				     	
				      map.getPanes().labelPane.appendChild(div);
				      
				      return div;
				    }
					ComplexCustomOverlay.prototype.draw = function(){
				      var map = this._map;
				      var pixel = map.pointToOverlayPixel(this._point);
				      this._div.style.left = pixel.x - parseInt(this._arrow.style.left) + "px";
				      this._div.style.top  = pixel.y - 30 + "px";
				    }
				    
				    ComplexCustomOverlay.prototype.addEventListener = function(event,fun){  
			            this._div['on'+event] = fun;  
			        }  
					var myCompOverlay = new ComplexCustomOverlay(point,item.buildingName,item.buildingName);
					
					map.addOverlay(myCompOverlay);
					
					/*var opts = {
	  				position : point,    // 指定文本标注所在的地理位置
	 			 	offset   : new BMap.Size(10, -10)    //设置文本偏移量
					};
					var label = new BMap.Label(item.buildingName, opts);  // 创建文本标注对象
					label.setStyle({ color : "black",
						fontSize : "10px",
					 	height : "20px",
					 	lineHeight : "20px",
			 			fontFamily:"微软雅黑"
		 			});
		 			map.addOverlay(label);   
		 			*/
				})
			},
			error: function(){
				alert("获取楼宇地图标注信息失败！");
			}
		});
    
    //以下点击添加楼宇
    function ZoomControl(){
	  // 默认停靠位置和偏移量
	  this.defaultAnchor = BMAP_ANCHOR_BOTTOM_RIGHT;
	  this.defaultOffset = new BMap.Size(10, 10);
	}

	// 通过JavaScript的prototype属性继承于BMap.Control
	ZoomControl.prototype = new BMap.Control();

	// 自定义控件必须实现自己的initialize方法,并且将控件的DOM元素返回
	// 在本方法中创建个div元素作为控件的容器,并将其添加到地图容器中
	ZoomControl.prototype.initialize = function(map){
	  // 创建一个DOM元素
	  var div = document.createElement("div");
	  // 添加文字说明
	  div.appendChild(document.createTextNode("添加写字楼"));
	  // 设置样式
	  div.style.cursor = "pointer";
	  div.style.border = "1px solid gray";
	  div.style.backgroundColor = "white";
	  // 绑定事件,点击一次放大两级
	  div.onclick = function(e){
		map.setDefaultCursor("crosshair");
		map.addEventListener("click",function(e){
			$("#lng").val(e.point.lng);
			$("#lat").val(e.point.lat);
			window.location.href="home#page/addbuilding";
		});
	  }
	 
	  // 添加DOM元素到地图中
	  map.getContainer().appendChild(div);
	  // 将DOM元素返回
	  return div;
	}
	// 创建控件
	var myZoomCtrl = new ZoomControl();
	// 添加到地图当中
	map.addControl(myZoomCtrl);
</script>
<script type="text/javascript">
	var scripts = [ null ]
	$('.page-content-area').ace_ajax('loadScripts', scripts, function() {
		// inline scripts related to this page
		jQuery(function($) {
		
		})
	});
</script>
