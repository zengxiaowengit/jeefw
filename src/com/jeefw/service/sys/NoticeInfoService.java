package com.jeefw.service.sys;

import com.jeefw.model.sys.NoticeInfo;
import core.service.Service;

/**
 * Created by XiaowenZeng on 16/6/12.
 */
public interface NoticeInfoService extends Service<NoticeInfo>{

    // 生成信息
    void GenerateNoticeInfo();
}
