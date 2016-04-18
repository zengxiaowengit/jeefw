package com.jeefw.model.sys.param;

import core.support.ExtJSBaseParameter;

public class CompanyInfoParameter extends ExtJSBaseParameter{

	private static final long serialVersionUID = -992336668550758502L;
	//法人的身份证件类型
	private String legalPersonCertificateTypeName;
	public String getLegalPersonCertificateTypeName() {
		return legalPersonCertificateTypeName;
	}
	public void setLegalPersonCertificateTypeName(
			String legalPersonCertificateTypeName) {
		this.legalPersonCertificateTypeName = legalPersonCertificateTypeName;
	}
}
