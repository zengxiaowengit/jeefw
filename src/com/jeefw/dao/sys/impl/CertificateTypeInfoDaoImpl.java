package com.jeefw.dao.sys.impl;

import org.springframework.stereotype.Repository;

import com.jeefw.dao.sys.CertificateTypeInfoDao;
import com.jeefw.dao.sys.SysUserDao;
import com.jeefw.model.sys.CertificateTypeInfo;
import com.jeefw.model.sys.SysUser;

import core.dao.BaseDao;

@Repository
public class CertificateTypeInfoDaoImpl extends BaseDao<CertificateTypeInfo> implements CertificateTypeInfoDao {

	public CertificateTypeInfoDaoImpl() {
		super(CertificateTypeInfo.class);
	}

}
