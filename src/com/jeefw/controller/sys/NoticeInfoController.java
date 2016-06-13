package com.jeefw.controller.sys;

import com.jeefw.core.JavaEEFrameworkBaseController;
import com.jeefw.model.sys.BuildingInfo;
import com.jeefw.model.sys.NoticeInfo;
import com.jeefw.service.sys.NoticeInfoService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Created by XiaowenZeng on 16/6/13.
 */
@Controller
@RequestMapping("/sys/noticeinfo")
public class NoticeInfoController extends JavaEEFrameworkBaseController<NoticeInfo> {
    @Resource
    private NoticeInfoService noticeInfoService;

    @RequestMapping(value = "/getnoticeinfo", method = { RequestMethod.POST, RequestMethod.GET })
    public void GetBuildingInfo(HttpServletRequest request, HttpServletResponse response) throws Exception {
        List<NoticeInfo> list =  noticeInfoService.doQueryAll();
        writeJSON(response, list);
    }
}

