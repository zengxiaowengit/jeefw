package com.jeefw.controller.sys;

import com.jeefw.core.JavaEEFrameworkBaseController;
import com.jeefw.model.sys.TaxRateInfo;
import com.jeefw.service.sys.TaxRateInfoService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by XiaowenZeng on 16/6/4.
 */
@Controller
@RequestMapping("/sys/taxrateinfo")
public class TaxRateInfoController extends JavaEEFrameworkBaseController<TaxRateInfo> {
    @Resource
    private TaxRateInfoService taxRateInfoService;

    // 保存建筑的实体Bean
    @RequestMapping(value = "/save", method = { RequestMethod.POST, RequestMethod.GET })
    public void doSave(TaxRateInfo entity, HttpServletRequest request, HttpServletResponse response) throws IOException {
        Map<String, Object> result = new HashMap<String, Object>();

        try{
            if(entity.getCmd()!= null && entity.getCmd().equalsIgnoreCase("EDIT")){
                taxRateInfoService.update(entity);
            }
            else{
                taxRateInfoService.persist(entity);
            }
            result.put("result", 1);
        }catch(Exception e){
            result.put("result", -1);
        }
        writeJSON(response, result);
    }

    @RequestMapping(value = "/delete/{id}", method = { RequestMethod.POST, RequestMethod.GET })
    public void DeleteBuildInfo(@PathVariable int id, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String, Object> result = new HashMap<String, Object>();
        try{
            taxRateInfoService.deleteByPK(id);
            result.put("result", 1);
        }catch(Exception e){
            result.put("result", -1);
        }
        writeJSON(response, result);
    }
}
