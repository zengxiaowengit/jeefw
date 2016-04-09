package com.jeefw.controller.sys;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jeefw.core.Constant;
import com.jeefw.core.JavaEEFrameworkBaseController;
import com.jeefw.model.sys.BuildingInfo;
import com.jeefw.model.sys.SysUser;
import com.jeefw.service.sys.AuthorityService;
import com.jeefw.service.sys.BuildingInfoService;

import core.support.JqGridPageView;
import core.support.QueryResult;


@Controller
@RequestMapping("/sys/buildinginfo")
public class BuildingInfoController extends JavaEEFrameworkBaseController<BuildingInfo> implements Constant {
	private static final Log log = LogFactory.getLog(SysUserController.class);
	@Resource
	private BuildingInfoService buildingInfoService;
	@Resource
	private AuthorityService authorityService;
	
	
	
	// 保存建筑的实体Bean
	@RequestMapping(value = "/savebuildinginfo", method = { RequestMethod.POST, RequestMethod.GET })
	public void doSave(BuildingInfo entity, HttpServletRequest request, HttpServletResponse response) throws IOException {
		Map<String, Object> result = new HashMap<String, Object>();
			
			try{ 
				buildingInfoService.persist(entity);
				result.put("result", 1);
			}catch(Exception e){
				result.put("result", -1);
			}	
		
		writeJSON(response, result);
	}
	
	//获取json格式的楼宇数据
	@RequestMapping(value = "/getbuildinginfo", method = { RequestMethod.POST, RequestMethod.GET })
	public void getSysUser(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		List<BuildingInfo> list =  buildingInfoService.doQueryAll();
		writeJSON(response, list);
	}
	
	
	
	
	
	
}





