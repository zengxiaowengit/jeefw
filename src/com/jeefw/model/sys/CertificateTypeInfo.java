package com.jeefw.model.sys;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import core.support.ExtJSBaseParameter;

/**
 * CertificateTypeInfo entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "certificate_type_info", catalog = "jeefw")
@Cache(region = "all", usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
@JsonIgnoreProperties(value = { "maxResults", "firstResult", "topCount", "sortColumns", "cmd", "queryDynamicConditions", "sortedConditions", "dynamicProperties", "success", "message", "sortColumnsString", "flag" })
public class CertificateTypeInfo extends ExtJSBaseParameter {

	// Fields

	private Integer certificateTypeCode;
	private String certificateTypeName;

	// Constructors

	/** default constructor */
	public CertificateTypeInfo() {
	}

	/** full constructor */
	public CertificateTypeInfo(Integer certificateTypeCode,
			String certificateTypeName) {
		this.certificateTypeCode = certificateTypeCode;
		this.certificateTypeName = certificateTypeName;
	}

	// Property accessors
	@Id
	@Column(name = "certificate_type_code", unique = true, nullable = false)
	public Integer getCertificateTypeCode() {
		return this.certificateTypeCode;
	}

	public void setCertificateTypeCode(Integer certificateTypeCode) {
		this.certificateTypeCode = certificateTypeCode;
	}

	@Column(name = "certificate_type_name", nullable = false, length = 40)
	public String getCertificateTypeName() {
		return this.certificateTypeName;
	}

	public void setCertificateTypeName(String certificateTypeName) {
		this.certificateTypeName = certificateTypeName;
	}

}