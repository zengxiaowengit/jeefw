package com.jeefw.service.sys;

import com.jeefw.model.sys.WarningInfo;
import core.service.Service;

/**
 * Created by XiaowenZeng on 16/6/12.
 */
public interface WarningInfoService extends Service<WarningInfo>{

    // 生成信息
    void GenerateWarnInfo();
}
