package com.jeefw.dao.sys.impl;

import org.springframework.stereotype.Repository;

import com.jeefw.dao.sys.SysUserDao;
import com.jeefw.model.sys.SysUser;

import core.dao.BaseDao;

/**
 * 用户的数据持久层的实现类
 */
@Repository
public class SysUserDaoImpl extends BaseDao<SysUser> implements SysUserDao {

	public SysUserDaoImpl() {
		super(SysUser.class);
	}

}
