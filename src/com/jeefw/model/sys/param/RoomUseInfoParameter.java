package com.jeefw.model.sys.param;

import core.support.ExtJSBaseParameter;

public class RoomUseInfoParameter extends ExtJSBaseParameter{

	private static final long serialVersionUID = -7335598850867301486L;
	
	private String $like_houseTaxPerson;
	private String $like_userName;
	private String $like_lessorName;
	private String $eq_userCertificateTypeName;
	private String $eq_userCertificateNumber;
	
	public String get$like_houseTaxPerson() {
		return $like_houseTaxPerson;
	}
	public void set$like_houseTaxPerson(String $like_houseTaxPerson) {
		this.$like_houseTaxPerson = $like_houseTaxPerson;
	}
	public String get$like_userName() {
		return $like_userName;
	}
	public void set$like_userName(String $like_userName) {
		this.$like_userName = $like_userName;
	}
	public String get$like_lessorName() {
		return $like_lessorName;
	}
	public void set$like_lessorName(String $like_lessorName) {
		this.$like_lessorName = $like_lessorName;
	}
	public String get$eq_userCertificateTypeName() {
		return $eq_userCertificateTypeName;
	}
	public void set$eq_userCertificateTypeName(
			String $eq_userCertificateTypeName) {
		this.$eq_userCertificateTypeName = $eq_userCertificateTypeName;
	}
	public String get$eq_userCertificateNumber() {
		return $eq_userCertificateNumber;
	}
	public void set$eq_userCertificateNumber(String $eq_userCertificateNumber) {
		this.$eq_userCertificateNumber = $eq_userCertificateNumber;
	}
}
