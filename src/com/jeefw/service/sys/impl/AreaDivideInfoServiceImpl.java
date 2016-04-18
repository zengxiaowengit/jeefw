package com.jeefw.service.sys.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jeefw.dao.sys.AreaDivideInfoDao;
import com.jeefw.model.sys.AreaDivideInfo;
import com.jeefw.service.sys.AreaDivideInfoService;

import core.service.BaseService;
@Service
public class AreaDivideInfoServiceImpl extends BaseService<AreaDivideInfo> implements AreaDivideInfoService{

	private AreaDivideInfoDao areaDivideDao;

	public AreaDivideInfoDao getAreaDivideDao() {
		return areaDivideDao;
	}
	
	@Resource
	public void setAreaDivideDao(AreaDivideInfoDao areaDivideDao) {
		this.areaDivideDao = areaDivideDao;
		this.dao = areaDivideDao;
	}
}
