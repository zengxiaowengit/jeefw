package com.jeefw.model.sys.param;

import core.support.ExtJSBaseParameter;

public class BuildingInfoParameter extends ExtJSBaseParameter{


	private String houseCertificateTypeName;
	private Integer houseCertificateTypeCode;
	public String getHouseCertificateTypeName() {
		return houseCertificateTypeName;
	}
	public void setHouseCertificateTypeName(String houseCertificateTypeName) {
		this.houseCertificateTypeName = houseCertificateTypeName;
	}
	public Integer getHouseCertificateTypeCode() {
		return houseCertificateTypeCode;
	}
	public void setHouseCertificateTypeCode(Integer houseCertificateTypeCode) {
		this.houseCertificateTypeCode = houseCertificateTypeCode;
	}
	
}
