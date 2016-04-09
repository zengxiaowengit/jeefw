package com.jeefw.service.sys.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jeefw.dao.sys.BuildingInfoDao;
import com.jeefw.model.sys.BuildingInfo;
import com.jeefw.service.sys.BuildingInfoService;

import core.service.BaseService;

@Service
public class BuildingInfoServiceImpl extends BaseService<BuildingInfo> implements BuildingInfoService{
	private BuildingInfoDao buildingInfoDao;

	@Resource
	public void setBuildingInfoDao(BuildingInfoDao buildingInfoDao) {
		this.buildingInfoDao = buildingInfoDao;
		this.dao = buildingInfoDao;
	}
	
}
