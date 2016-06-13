package com.jeefw.service.sys.impl;

import com.jeefw.dao.sys.NoticeInfoDao;
import com.jeefw.model.sys.NoticeInfo;
import com.jeefw.model.sys.RoomUseInfo;
import com.jeefw.service.sys.NoticeInfoService;
import com.jeefw.service.sys.RoomUseInfoService;
import core.service.BaseService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * Created by XiaowenZeng on 16/6/12.
 */
@Service
public class NoticeInfoServiceImpl extends BaseService<NoticeInfo> implements NoticeInfoService {
    @Resource
    private NoticeInfoDao noticeInfoDao;
    @Resource
    private RoomUseInfoService roomUseInfoService;

    @Override
    @Transactional
    //低于平均租金、房产所有人纳税提醒。
    public void GenerateNoticeInfo() {
        try {
            noticeInfoDao.deleteByProperties("noticeType","低于平均租金");
            noticeInfoDao.deleteByProperties("noticeType","纳税提醒");
            //低于平均租金
            List buildingList = roomUseInfoService.CreateHQLQuery("select new RoomUseInfo( r.roomInfo.buildingInfo.id , SUM(r.yearlyRental)/count(1),r.roomInfo ) from RoomUseInfo as r WHERE ( r.useType = '出租') GROUP BY r.roomInfo.buildingInfo.id");
            for (int i = 0; i < buildingList.size(); i++) {
                RoomUseInfo r = (RoomUseInfo) buildingList.get(i);
                List noticeList = roomUseInfoService.CreateHQLQuery("select r from RoomUseInfo as r WHERE r.roomInfo.buildingInfo.id=" + r.getBid() + "AND r.useType='出租' AND r.yearlyRental < " + r.getAvg());
                for (int j = 0; j < noticeList.size(); j++) {
                    NoticeInfo entity = new NoticeInfo();
                    RoomUseInfo obj = (RoomUseInfo) noticeList.get(j);
                    entity.setMark(0);
                    entity.setNoticeType("低于平均租金");
                    entity.setNoticeContent(obj.getRoomInfo().getBuildingInfo().getBuildingName() + obj.getRoomInfo().getRoomNumber() + "的租金低于平均租金");
                    entity.setRoomUseId(obj.getId());
                    entity.setTimeStamp(new Date());
                    noticeInfoDao.persist(entity);
                }
            }
            //房产所有人纳税提醒。提前一个月(纳税期限之前的一个月)

            List noticeList = roomUseInfoService.CreateHQLQuery("SELECT r FROM RoomUseInfo as r WHERE r.userHouseTaxed='是' or r.lessorHouseTaxed='是' AND TIMESTAMPDIFF( month, NOW() , r.taxDeadline ) < 1");
            for (int j = 0; j < noticeList.size(); j++) {
                NoticeInfo entity = new NoticeInfo();
                RoomUseInfo obj = (RoomUseInfo) noticeList.get(j);
                entity.setMark(0);
                entity.setNoticeType("纳税提醒");
                entity.setNoticeContent("提醒" + obj.getHouseTaxPerson() + "缴纳" + obj.getRoomInfo().getBuildingInfo().getBuildingName() + obj.getRoomInfo().getRoomNumber() + "的房产税");
                entity.setRoomUseId(obj.getId());
                entity.setTimeStamp(new Date());
                noticeInfoDao.persist(entity);
            }


        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Resource
    public void setNoticeInfoDao(NoticeInfoDao noticeInfoDao) {
        this.noticeInfoDao = noticeInfoDao;
        this.dao = noticeInfoDao;
    }

    @Resource
    public void setRoomUseInfoService(RoomUseInfoService roomUseInfoService) {
        this.roomUseInfoService = roomUseInfoService;
    }


}
