package com.jeefw.dao.sys.impl;

import com.jeefw.dao.sys.NoticeInfoDao;
import com.jeefw.model.sys.NoticeInfo;
import core.dao.BaseDao;
import org.springframework.stereotype.Repository;

/**
 * Created by XiaowenZeng on 16/6/12.
 */
@Repository
public class NoticeInfoDaoImpl extends BaseDao<NoticeInfo> implements NoticeInfoDao{
    public NoticeInfoDaoImpl() {
        super(NoticeInfo.class);
    }
}
