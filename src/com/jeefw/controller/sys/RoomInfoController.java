package com.jeefw.controller.sys;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jeefw.core.Constant;
import com.jeefw.core.JavaEEFrameworkBaseController;
import com.jeefw.model.sys.BuildingInfo;
import com.jeefw.model.sys.RoomInfo;
import com.jeefw.service.sys.BuildingInfoService;
import com.jeefw.service.sys.RoomInfoService;



@Controller
@RequestMapping("/sys/roominfo")
public class RoomInfoController extends JavaEEFrameworkBaseController<RoomInfo> implements Constant{
	private static final Log log = LogFactory.getLog(RoomInfoController.class);
	@Resource
	private RoomInfoService roomInfoService;
	@Resource
	private BuildingInfoService buildingInfoService;
	
	//保存房间信息
	@RequestMapping(value = "/saveroom/{buildingId}/{floor}", method = { RequestMethod.POST, RequestMethod.GET })
	public void doSave(RoomInfo entity,@PathVariable int buildingId,@PathVariable int floor, HttpServletRequest request, HttpServletResponse response) throws IOException {
		Map<String, Object> result = new HashMap<String, Object>();
		try{ 
			BuildingInfo b = buildingInfoService.get(buildingId);
			entity.setBuildingInfo(b);
			entity.setFloor(floor);
			if(entity.getCmd()!= null && entity.getCmd().equals(CMD_EDIT)){
				roomInfoService.update(entity);
			}
			else
				roomInfoService.persist(entity);
			result.put("result", 1);
		}catch(Exception e){
			e.printStackTrace();
			result.put("result", -1);
		}	
	
	writeJSON(response, result);
	}
	
	//获取json格式的数据
	
	@RequestMapping(value = "/getroominfo", method = { RequestMethod.POST, RequestMethod.GET })
	public void GetRoomInfo(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		List<RoomInfo> list = roomInfoService.doQueryAll();
		writeJSON(response, list);
	}
	
	@RequestMapping(value = "/deleteroominfo/{id}", method = { RequestMethod.POST, RequestMethod.GET })
	public void DeleteRoomInfo(@PathVariable int id, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();
		try{ 
			roomInfoService.deleteByPK(id);
			result.put("result", 1);
		}catch(Exception e){
			result.put("result", -1);
		}
		log.debug(result);
		writeJSON(response, result);
	}
	
	
	
}
