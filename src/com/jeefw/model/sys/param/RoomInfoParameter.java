package com.jeefw.model.sys.param;

import core.support.ExtJSBaseParameter;


public class RoomInfoParameter extends ExtJSBaseParameter{
	
	private String buildingName;
	private String certificateTypeName;
	public String getBuildingName() {
		return buildingName;
	}
	public void setBuildingName(String buildingName) {
		this.buildingName = buildingName;
	}
	public String getCertificateTypeName() {
		return certificateTypeName;
	}
	public void setCertificateTypeName(String certificateTypeName) {
		this.certificateTypeName = certificateTypeName;
	}
}
