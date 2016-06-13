package com.jeefw.dao.sys.impl;

import com.jeefw.dao.sys.WarningInfoDao;
import com.jeefw.model.sys.WarningInfo;
import core.dao.BaseDao;
import org.springframework.stereotype.Repository;

/**
 * Created by XiaowenZeng on 16/6/12.
 */
@Repository
public class WarningInfoDaoImpl extends BaseDao<WarningInfo> implements WarningInfoDao{
    public WarningInfoDaoImpl() {
        super(WarningInfo.class);
    }
}
