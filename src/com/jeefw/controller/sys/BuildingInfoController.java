package com.jeefw.controller.sys;

import com.jeefw.core.JavaEEFrameworkBaseController;
import com.jeefw.model.sys.BuildingInfo;
import com.jeefw.model.sys.CertificateTypeInfo;
import com.jeefw.model.sys.RoomUseInfo;
import com.jeefw.service.sys.BuildingInfoService;
import com.jeefw.service.sys.CertificateTypeInfoService;
import com.jeefw.service.sys.RoomUseInfoService;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
@RequestMapping("/sys/buildinginfo")
public class BuildingInfoController extends JavaEEFrameworkBaseController<BuildingInfo> {
	private static final Log log = LogFactory.getLog(BuildingInfoController.class);
	@Resource
	private BuildingInfoService buildingInfoService;
	@Resource
	private CertificateTypeInfoService certificateTypeInfoService;
	@Resource
	private RoomUseInfoService roomUseInfoService;

	// 保存建筑的实体Bean
	@RequestMapping(value = "/savebuildinginfo", method = { RequestMethod.POST, RequestMethod.GET })
	public void doSave(BuildingInfo entity, HttpServletRequest request, HttpServletResponse response) throws IOException {
		Map<String, Object> result = new HashMap<String, Object>();
			
			try{ 
				CertificateTypeInfo c = certificateTypeInfoService.get(entity.getHouseCertificateTypeCode());
				entity.setCertificateTypeInfo(c);
				if(entity.getCmd()!= null && entity.getCmd().equals("EDIT")){
					BuildingInfo b = buildingInfoService.get(entity.getId());
					entity.setLongitude(b.getLongitude());
					entity.setLatitude(b.getLatitude());
					buildingInfoService.update(entity);
				}
				else{
					buildingInfoService.persist(entity);
				}
				result.put("result", 1);
			}catch(Exception e){
				result.put("result", -1);
			}	
		log.debug(result);
		writeJSON(response, result);
	}
	
	//获取json格式的楼宇数据
	
	@RequestMapping(value = "/getbuildinginfo", method = { RequestMethod.POST, RequestMethod.GET })
	public void GetBuildingInfo(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		List<BuildingInfo> list =  buildingInfoService.doQueryAll();
		writeJSON(response, list);
	}
	
	@RequestMapping(value = "/deletebuildinginfo", method = { RequestMethod.POST, RequestMethod.GET })
	public void DeleteBuildInfo(BuildingInfo entity, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();
		try{ 
			buildingInfoService.deleteByPK(entity.getId());
			result.put("result", 1);
		}catch(Exception e){
			result.put("result", -1);
		}	
		log.debug(result);
		writeJSON(response, result);
	}
	
	@RequestMapping(value = "/getbuildingid/{lng}/{lat}/1", method = { RequestMethod.POST, RequestMethod.GET })
	public void GetBuildingId(@PathVariable double lng,@PathVariable double lat,HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();
		String []propName = {"longitude","latitude"};
		Double []propValue = {lng,lat};
		try{ 
			int v = buildingInfoService.queryByProerties(propName, propValue).get(0).getId();
			result.put("result", v);
		}catch(Exception e){
			result.put("result", -1);
		}	
		writeJSON(response, result);
	}
	//使用者
	@RequestMapping(value = "/getUserPieData/{buildingId}", method = { RequestMethod.POST, RequestMethod.GET })
	public void GetUserPieData(@PathVariable int buildingId, HttpServletRequest request, HttpServletResponse response) throws Exception {
		try{
			List<RoomUseInfo> list = roomUseInfoService.CreateHQLQuery("SELECT userName,COUNT(id) AS id  FROM RoomUseInfo as r  where r.roomInfo.buildingInfo.id="+buildingId + "GROUP BY userName order by COUNT(id) desc");
			writeJSON(response, list);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	//适用类型
	@RequestMapping(value = "/getUseTypeData/{buildingId}", method = { RequestMethod.POST, RequestMethod.GET })
	public void GetUseTypeData(@PathVariable int buildingId,HttpServletRequest request, HttpServletResponse response) throws Exception {
		try{
			List<RoomUseInfo> list = roomUseInfoService.CreateHQLQuery("SELECT useType,COUNT(id) AS id  FROM RoomUseInfo as r  where r.roomInfo.buildingInfo.id="+buildingId +"GROUP BY useType order by COUNT(id) desc");
			writeJSON(response, list);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	//地税
	@RequestMapping(value = "/getTaxData/{buildingId}", method = { RequestMethod.POST, RequestMethod.GET })
	public void GetTaxData(@PathVariable int buildingId,HttpServletRequest request, HttpServletResponse response) throws Exception {
		try{
			List list = roomUseInfoService//.CreateHQLQuery("select * from RoomUseInfo");
					.CreateHQLQuery("select sum(t.jan),sum(t.feb),sum(t.mar),sum(t.apr),sum(t.may),sum(t.jun),sum(t.jul),sum(t.aug),sum(t.sep),sum(t.oct),sum(t.nov),sum(t.dec) from TaxInfo as t, RoomUseInfo as r where ((r.userName = t.taxpayerName or r.lessorName = t.taxpayerName) and t.year=2014 and r.roomInfo.buildingInfo.id="+buildingId+")");
			list.add(roomUseInfoService.CreateHQLQuery("select sum(t.jan),sum(t.feb),sum(t.mar),sum(t.apr),sum(t.may),sum(t.jun),sum(t.jul),sum(t.aug),sum(t.sep),sum(t.oct),sum(t.nov),sum(t.dec) from TaxInfo as t, RoomUseInfo as r where ((r.userName = t.taxpayerName or r.lessorName = t.taxpayerName) and t.year=2015 and r.roomInfo.buildingInfo.id="+buildingId + ")")
					.get(0));
			writeJSON(response, list);
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	//地税当年累计数
	@RequestMapping(value = "/getTaxSumData/{buildingId}", method = { RequestMethod.POST, RequestMethod.GET })
	public void GetTaxSumData(@PathVariable int buildingId,HttpServletRequest request, HttpServletResponse response) throws Exception {
		try{
			List<RoomUseInfo> list = roomUseInfoService//.CreateHQLQuery("select * from RoomUseInfo");
					.CreateHQLQuery("select t.taxType, t.total from TaxInfo as t,RoomUseInfo as r where ((t.taxpayerName = r.userName or t.taxpayerName = r.lessorName ) and r.roomInfo.buildingInfo.id=" + buildingId + ") group by t.taxType order by t.total desc");
			writeJSON(response, list);
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	//楼宇数量、总面积、出租率、年纳税额,按照区域分组
	@RequestMapping(value = "/getShowData", method = { RequestMethod.POST, RequestMethod.GET })
	public void GetShowData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		try{
			Map<String,Object> map = new HashMap<String, Object>();
			List list = roomUseInfoService//.CreateHQLQuery("select * from RoomUseInfo");
					.CreateHQLQuery("select b.areaDivide , count(id) from BuildingInfo as b group by b.areaDivide order by count(id) desc");
			map.put("buildingNum",list);
			list = roomUseInfoService.CreateHQLQuery("select r.buildingInfo.areaDivide, sum(r.roomSize) from RoomInfo as r group by r.buildingInfo.areaDivide order by count(r.roomSize) desc");
			map.put("totalArea",list);
			list = roomUseInfoService.CreateHQLQuery("select r.roomInfo.buildingInfo.areaDivide,count(distinct r.roomInfo.id) from RoomUseInfo as r group by r.roomInfo.buildingInfo.areaDivide order by count(distinct r.roomInfo.id) desc");
			map.put("lessored",list);
			list = roomUseInfoService.CreateHQLQuery("select count(r.id) from RoomInfo as r  group by r.buildingInfo.areaDivide order by count(r.id) desc");
			map.put("allroom",list);
			list = roomUseInfoService.CreateHQLQuery("select r.roomInfo.buildingInfo.areaDivide, sum(t.total) from TaxInfo as t, RoomUseInfo as r where (t.taxpayerName=r.userName or t.taxpayerName=r.lessorName) group by r.roomInfo.buildingInfo.areaDivide order by sum(t.total) desc");
			map.put("tax",list);
			writeJSON(response,map);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}





