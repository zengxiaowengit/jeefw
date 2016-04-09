package com.jeefw.dao.sys.impl;

import org.springframework.stereotype.Repository;

import com.jeefw.dao.sys.BuildingInfoDao;
import com.jeefw.model.sys.BuildingInfo;

import core.dao.BaseDao;

@Repository
public class BuildingInfoDaoImpl  extends BaseDao<BuildingInfo> implements BuildingInfoDao{

	public BuildingInfoDaoImpl() {
		super(BuildingInfo.class);
	}

}
