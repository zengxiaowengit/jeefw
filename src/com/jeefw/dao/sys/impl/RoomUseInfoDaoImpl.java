package com.jeefw.dao.sys.impl;

import org.springframework.stereotype.Repository;

import com.jeefw.dao.sys.RoomUseInfoDao;
import com.jeefw.model.sys.RoomUseInfo;

import core.dao.BaseDao;

@Repository
public class RoomUseInfoDaoImpl extends BaseDao<RoomUseInfo> implements RoomUseInfoDao{

	public RoomUseInfoDaoImpl() {
		super(RoomUseInfo.class);
	}

}
