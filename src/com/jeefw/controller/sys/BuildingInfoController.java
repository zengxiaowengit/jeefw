package com.jeefw.controller.sys;

import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.search.hcore.impl.HibernateSessionFactoryService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jeefw.core.Constant;
import com.jeefw.core.JavaEEFrameworkBaseController;
import com.jeefw.model.sys.BuildingInfo;
import com.jeefw.model.sys.CertificateTypeInfo;
import com.jeefw.service.sys.AuthorityService;
import com.jeefw.service.sys.BuildingInfoService;
import com.jeefw.service.sys.CertificateTypeInfoService;

import core.support.BaseParameter;


@Controller
@RequestMapping("/sys/buildinginfo")
public class BuildingInfoController extends JavaEEFrameworkBaseController<BuildingInfo> {
	private static final Log log = LogFactory.getLog(BuildingInfoController.class);
	@Resource
	private BuildingInfoService buildingInfoService;
	@Resource
	private CertificateTypeInfoService certificateTypeInfoService;
	
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
}





