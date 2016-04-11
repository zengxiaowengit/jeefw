package com.jeefw.controller.sys;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jeefw.core.Constant;
import com.jeefw.core.JavaEEFrameworkBaseController;
import com.jeefw.model.sys.BuildingInfo;
import com.jeefw.model.sys.RoomInfo;
import com.jeefw.service.sys.RoomInfoService;



@Controller
@RequestMapping("/sys/roominfo")
public class RoomInfoController extends JavaEEFrameworkBaseController<RoomInfo> implements Constant{
	private static final Log log = LogFactory.getLog(RoomInfoController.class);
	
	@Resource
	private RoomInfoService roomInfoService;
	@RequestMapping(value = "/saveroominfo", method = { RequestMethod.POST, RequestMethod.GET })
	public void doSave(RoomInfo entity, HttpServletRequest request, HttpServletResponse response) throws IOException {
		Map<String, Object> result = new HashMap<String, Object>();
		try{ 
			roomInfoService.persist(entity);
			log.debug("RoomInfo persist Sucess.");
			result.put("result", 1);
		}catch(Exception e){
			log.debug("RoomInfo persist Failure.Catch Exception:");
			e.printStackTrace();
			result.put("result", -1);
		}	
	
	writeJSON(response, result);
	}
}
