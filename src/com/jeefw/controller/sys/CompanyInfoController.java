package com.jeefw.controller.sys;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jeefw.core.JavaEEFrameworkBaseController;
import com.jeefw.model.sys.CompanyInfo;
import com.jeefw.service.sys.CompanyInfoService;

import core.support.BaseParameter;

@Controller
@RequestMapping("/sys/companyinfo")
public class CompanyInfoController extends JavaEEFrameworkBaseController<CompanyInfo>{
	@Resource
	private CompanyInfoService companyInfoService;
	
	@Override
	@RequestMapping(value = "/savecompanyinfo", method = { RequestMethod.POST, RequestMethod.GET })
	public void doSave(CompanyInfo entity, HttpServletRequest request, HttpServletResponse response) throws IOException {
		Map<String, Object> result = new HashMap<String, Object>();
		try{ 
			if(entity.getCmd()!= null && entity.getCmd().equals("edit")) {
				companyInfoService.update(entity);
			}
			else {
				companyInfoService.persist(entity);
			}
			result.put("result", 1);
		}catch(Exception e){
			result.put("result", -1);
		}	
		writeJSON(response, result);
	}

}
