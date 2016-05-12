package com.jeefw.service.sys;

import java.util.List;

import org.hibernate.Query;

import com.jeefw.model.sys.BuildingInfo;

import core.service.Service;

public interface BuildingInfoService extends Service<BuildingInfo>{
	
	public List<BuildingInfo> CreateHQLQuery(String hql);
	
}
