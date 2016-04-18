package com.jeefw.service.sys.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;

import com.jeefw.dao.sys.BuildingInfoDao;
import com.jeefw.model.sys.BuildingInfo;
import com.jeefw.service.sys.BuildingInfoService;

import core.service.BaseService;

@Service
public class BuildingInfoServiceImpl extends BaseService<BuildingInfo> implements BuildingInfoService{
	private BuildingInfoDao buildingInfoDao;
	@Resource(name="sessionFactory")
	private SessionFactory sessionFactory;
	private Session session;
	
	public Session getSession() {
		if(session == null)
			setSession();
		return session;
	}
	
	public void setSession() {
		this.session = sessionFactory.openSession();
	}
	
	@Resource
	public void setBuildingInfoDao(BuildingInfoDao buildingInfoDao) {
		this.buildingInfoDao = buildingInfoDao;
		this.dao = buildingInfoDao;
	}

	@Override
	public List CreateHQLQuery(String hql) {
		// TODO Auto-generated method stub
		Query query = getSession().createQuery(hql);
		return query.list();
	}
	
}
