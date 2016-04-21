package com.jeefw.service.sys.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jeefw.dao.sys.RoomUseInfoDao;
import com.jeefw.model.sys.RoomUseInfo;
import com.jeefw.service.sys.RoomUseInfoService;

import core.service.BaseService;

@Service
public class RoomUseInfoServiceImpl extends BaseService<RoomUseInfo> implements RoomUseInfoService{
	
	private RoomUseInfoDao roomUseInfoDao;

	public RoomUseInfoDao getRoomUseInfoDao() {
		return roomUseInfoDao;
	}

	@Resource
	public void setRoomUseInfoDao(RoomUseInfoDao roomUseInfoDao) {
		this.roomUseInfoDao = roomUseInfoDao;
		this.dao = roomUseInfoDao;
	}
}
