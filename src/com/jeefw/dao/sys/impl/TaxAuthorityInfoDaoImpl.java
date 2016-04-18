package com.jeefw.dao.sys.impl;

import org.springframework.stereotype.Repository;

import com.jeefw.dao.sys.TaxAuthorityInfoDao;
import com.jeefw.model.sys.TaxAuthorityInfo;

import core.dao.BaseDao;

@Repository
public class TaxAuthorityInfoDaoImpl extends BaseDao<TaxAuthorityInfo> implements TaxAuthorityInfoDao{

	public TaxAuthorityInfoDaoImpl() {
		super(TaxAuthorityInfo.class);
	}

}
