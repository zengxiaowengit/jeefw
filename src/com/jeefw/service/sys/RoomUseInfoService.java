package com.jeefw.service.sys;

import com.jeefw.model.sys.RoomUseInfo;

import core.service.Service;

import java.util.List;

public interface RoomUseInfoService extends Service<RoomUseInfo>{
    public List CreateHQLQuery(String hql);
}
