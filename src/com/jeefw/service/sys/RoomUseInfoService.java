package com.jeefw.service.sys;

import java.util.List;

import com.jeefw.model.sys.RoomUseInfo;

import core.service.Service;

public interface RoomUseInfoService extends Service<RoomUseInfo>{
	public List<RoomUseInfo> CreateHQLQuery(String hql);
}
