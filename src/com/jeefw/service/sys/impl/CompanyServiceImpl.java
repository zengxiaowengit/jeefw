package com.jeefw.service.sys.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jeefw.dao.sys.CompanyInfoDao;
import com.jeefw.model.sys.CompanyInfo;
import com.jeefw.service.sys.CompanyInfoService;

import core.service.BaseService;

@Service
public class CompanyServiceImpl extends BaseService<CompanyInfo> implements CompanyInfoService{
	
	private CompanyInfoDao companyInfoDao;

	public CompanyInfoDao getCompanyInfoDao() {
		return companyInfoDao;
	}

	@Resource
	public void setCompanyInfoDao(CompanyInfoDao companyInfoDao) {
		this.companyInfoDao = companyInfoDao;
		this.dao = companyInfoDao;
	}
}
