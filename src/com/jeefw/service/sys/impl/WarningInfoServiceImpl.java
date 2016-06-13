package com.jeefw.service.sys.impl;

import com.jeefw.dao.sys.WarningInfoDao;
import com.jeefw.model.sys.RoomUseInfo;
import com.jeefw.model.sys.WarningInfo;
import com.jeefw.service.sys.RoomUseInfoService;
import com.jeefw.service.sys.WarningInfoService;
import core.service.BaseService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * Created by XiaowenZeng on 16/6/12.
 */
@Service
public class WarningInfoServiceImpl extends BaseService<WarningInfo> implements WarningInfoService {

    @Resource
    private WarningInfoDao warningInfoDao;
    @Resource
    private RoomUseInfoService roomUseInfoService;

    @Override
    public void GenerateWarnInfo() {
        try {
            warningInfoDao.deleteByProperties("warningType", "房产租赁超期");
            //房产租赁超期
            List buildingList = roomUseInfoService.CreateHQLQuery("select r from RoomUseInfo as r WHERE ( r.useType = '出租' AND TIMESTAMPDIFF( day, NOW() , r.taxDeadline ) < 1)");
            for (int i = 0; i < buildingList.size(); i++) {
                RoomUseInfo r = (RoomUseInfo) buildingList.get(i);
                WarningInfo entity = new WarningInfo();
                entity.setMark(0);
                entity.setWarningType("房产租赁超期");
                entity.setWarningContent(r.getRoomInfo().getBuildingInfo().getBuildingName() + r.getRoomInfo().getRoomNumber() + "房产租赁超期");
                entity.setRoomUseId(r.getId());
                entity.setTimeStamp(new Date());
                warningInfoDao.persist(entity);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Resource
    public void setWarningInfoDao(WarningInfoDao warningInfoDao) {
        this.warningInfoDao = warningInfoDao;
        this.dao = warningInfoDao;
    }
}
