package com.jeefw.service.sys.impl;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;

import com.jeefw.dao.sys.RoomUseInfoDao;
import com.jeefw.model.sys.RoomUseInfo;
import com.jeefw.service.sys.RoomUseInfoService;

import core.service.BaseService;

import java.util.List;

@Service
public class RoomUseInfoServiceImpl extends BaseService<RoomUseInfo> implements RoomUseInfoService{
	
	private RoomUseInfoDao roomUseInfoDao;
	@Resource(name="sessionFactory")
	private SessionFactory sessionFactory;
	private Session session;

	public Session getSession() {
		if(session == null)
			setSession();
		return session;
	}
	public RoomUseInfoDao getRoomUseInfoDao() {
		return roomUseInfoDao;
	}

	@Resource
	public void setRoomUseInfoDao(RoomUseInfoDao roomUseInfoDao) {
		this.roomUseInfoDao = roomUseInfoDao;
		this.dao = roomUseInfoDao;
	}

	@Override
	public List CreateHQLQuery(String hql) {
		Query query = getSession().createQuery(hql);
		return query.list();
	}

	public void setSession() {
		this.session = sessionFactory.openSession();
	}
}
