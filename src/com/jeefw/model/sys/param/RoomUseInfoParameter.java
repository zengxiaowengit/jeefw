package com.jeefw.model.sys.param;

import core.support.ExtJSBaseParameter;

public class RoomUseInfoParameter extends ExtJSBaseParameter{

	private static final long serialVersionUID = -7335598850867301486L;
	//房间号
	private String roomNumber;
	//使用者姓名
	private String userName;
	//系统管理员姓名
	private String sysUserName;
	//出租者证件类型
	private String lessorCertificateTypeName;
	//使用者证件类型
	private String userCertificateTypeName;
	public String getRoomNumber() {
		return roomNumber;
	}
	public void setRoomNumber(String roomNumber) {
		this.roomNumber = roomNumber;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getSysUserName() {
		return sysUserName;
	}
	public void setSysUserName(String sysUserName) {
		this.sysUserName = sysUserName;
	}
	public String getLessorCertificateTypeName() {
		return lessorCertificateTypeName;
	}
	public void setLessorCertificateTypeName(String lessorCertificateTypeName) {
		this.lessorCertificateTypeName = lessorCertificateTypeName;
	}
	public String getUserCertificateTypeName() {
		return userCertificateTypeName;
	}
	public void setUserCertificateTypeName(String userCertificateTypeName) {
		this.userCertificateTypeName = userCertificateTypeName;
	}
}
