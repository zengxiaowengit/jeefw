package com.jeefw.service.sys.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jeefw.dao.sys.RoomInfoDao;
import com.jeefw.model.sys.RoomInfo;
import com.jeefw.service.sys.RoomInfoService;

import core.service.BaseService;

@Service
public class RoomInfoServiceImpl  extends BaseService<RoomInfo> implements RoomInfoService{
	
	private RoomInfoDao roomInfoDao;

	@Resource
	public void setRoomInfoDao(RoomInfoDao roomInfoDao) {
		this.roomInfoDao = roomInfoDao;
		this.dao = roomInfoDao;
	}
}
