package com.jeefw.controller.sys;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jeefw.model.sys.CertificateTypeInfo;
import com.jeefw.service.sys.CertificateTypeInfoService;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jeefw.core.JavaEEFrameworkBaseController;
import com.jeefw.model.sys.RoomInfo;
import com.jeefw.model.sys.RoomUseInfo;
import com.jeefw.model.sys.SysUser;
import com.jeefw.service.sys.RoomInfoService;
import com.jeefw.service.sys.RoomUseInfoService;
import com.jeefw.service.sys.TaxRateInfoService;


@Controller
@RequestMapping("/sys/roomuseinfo")
public class RoomUseInfoController extends JavaEEFrameworkBaseController<RoomUseInfo>{
	private static final Log log = LogFactory.getLog(RoomUseInfoController.class);
	@Resource
	private RoomUseInfoService roomUseInfoService;
	@Resource
	private RoomInfoService RoomInfoService;
	@Resource
	private TaxRateInfoService taxRateInfoService;
	@Resource
	private CertificateTypeInfoService certificateTypeInfoService;
	@RequestMapping(value="/add/{roomId}", method = { RequestMethod.POST, RequestMethod.GET })
	public void RoomUseInfoAdd(RoomUseInfo entity, @PathVariable int roomId, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();
		try{ 
			SysUser sysUser = (SysUser) request.getSession().getAttribute(SESSION_SYS_USER);
			RoomInfo roomInfo = RoomInfoService.get(roomId);
			entity.setRoomInfo(roomInfo);
			entity.setSysUser(sysUser);
			entity.setTimeStamp(new Date());
			entity.setValid(1);
			if(entity.getUserHouseTaxed().equals("是")){
				entity.setHouseTaxPerson(entity.getUserName());
				entity.setHouseTaxCertificateTypeName(entity.getUserCertificateTypeName());
				entity.setHouseTaxCertificateNumber(entity.getUserCertificateNumber());
			}else if(entity.getLessorHouseTaxed().equals("是")){
				entity.setHouseTaxPerson(entity.getLessorName());
				entity.setHouseTaxCertificateTypeName(entity.getLessorCertificateTypeName());
				entity.setHouseTaxCertificateNumber(entity.getLessorCertificateNumber());
			}
			double taxYear = 0;//年纳税额
			if(entity.getUseType().equals("出租")){//出租
				if(entity.getTaxType().equals("个人出租住房")){
					taxYear = taxRateInfoService.queryByProerties("taxTypeName", "个人出租住房").get(0).getRate()
							* entity.getYearlyRental();
				}else{
					taxYear = taxRateInfoService.queryByProerties("taxTypeName", "其它房屋出租").get(0).getRate()
							* entity.getYearlyRental();
				}
			}else{
				taxYear = taxRateInfoService.queryByProerties("taxTypeName", "非出租").get(0).getRate()
						* (entity.getOrignalValue() - entity.getTaxFreeValue());
			}
			BigDecimal b = new BigDecimal(taxYear);  
			taxYear =  b.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();  
			entity.setTaxYear(taxYear);
			if(entity.getCmd().equals(CMD_EDIT))
				roomUseInfoService.update(entity);
			else
				roomUseInfoService.persist(entity);
			result.put("result", 1);
		}catch(Exception e){
			result.put("result", -1);
		}	
	log.debug(result);
	writeJSON(response, result);
	}
	
	
	@RequestMapping(value="/delete/{roomUseId}", method = { RequestMethod.POST, RequestMethod.GET })
	public void RoomUseInfoDelete(@PathVariable int roomUseId, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();
		try{
			roomUseInfoService.deleteByPK(roomUseId);
			result.put("result", 1);
		
		}catch(Exception e){
			result.put("result", -1);
		}

		writeJSON(response, result);
	}

	@RequestMapping(value="/conditionQuery", method = { RequestMethod.POST, RequestMethod.GET })
	public void RoomUseInfoConditionQuery(RoomUseInfo info,HttpServletRequest request, HttpServletResponse response)throws Exception{
		List<RoomUseInfo> list;
		Map<String,Integer> result = new HashMap<String, Integer>();
		try{
			list = roomUseInfoService.doQuery(info);
			writeJSON(response, list);

		}catch(Exception e){
			writeJSON(response,null);
		}

	}

	@RequestMapping(value="/queryall", method = { RequestMethod.POST, RequestMethod.GET })
	public void RoomUseInfoQueryAll(HttpServletRequest request, HttpServletResponse response)throws Exception{
		List<RoomUseInfo> list;
		Map<String,Integer> result = new HashMap<String, Integer>();
		try{
			list = roomUseInfoService.doQueryAll();
			result.put("result", 1);
			request.setAttribute("list",list);
			writeJSON(response,list);

		}catch(Exception e){
			request.setAttribute("list",null);
			result.put("result", -1);
			writeJSON(response,result);
		}
	}

	@RequestMapping(value="/getcertificatetypeinfo", method = { RequestMethod.POST, RequestMethod.GET })
	public void getCertificateTypeInfo(HttpServletRequest request, HttpServletResponse response)throws Exception {
		List<CertificateTypeInfo> list;
		try{
			list = certificateTypeInfoService.doQueryAll();
			writeJSON(response,list);
		}catch( Exception e){

		}

	}
}
