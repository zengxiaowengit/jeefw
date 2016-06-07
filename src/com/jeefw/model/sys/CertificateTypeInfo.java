package com.jeefw.model.sys;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.codehaus.jackson.annotate.JsonAutoDetect;
import org.codehaus.jackson.annotate.JsonIgnore;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import core.support.ExtJSBaseParameter;

/**
 * CertificateTypeInfo entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "certificate_type_info", catalog = "jeefw")
@JsonAutoDetect(fieldVisibility = JsonAutoDetect.Visibility.ANY)
@Cache(region = "all", usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
@JsonIgnoreProperties(value = { "maxResults", "firstResult", "topCount", "sortColumns", "cmd", "queryDynamicConditions", "sortedConditions", "dynamicProperties", "success", "message", "sortColumnsString", "flag" })
public class CertificateTypeInfo extends ExtJSBaseParameter {

	// Fields

	private Integer certificateTypeCode;
	private String certificateTypeName;
	@JsonIgnore
	private Set<BuildingInfo> buildingInfos = new HashSet<BuildingInfo>(0);

	// Property accessors
	@Id
	@Column(name = "certificate_type_code", unique = true, nullable = false)
	public Integer getCertificateTypeCode() {
		return this.certificateTypeCode;
	}
	// Constructors

	/** default constructor */
	public CertificateTypeInfo() {
	}

	/** minimal constructor */
	public CertificateTypeInfo(Integer certificateTypeCode,
			String certificateTypeName) {
		this.certificateTypeCode = certificateTypeCode;
		this.certificateTypeName = certificateTypeName;
	}

	/** full constructor */
	public CertificateTypeInfo(Integer certificateTypeCode,
			String certificateTypeName, Set<BuildingInfo> buildingInfos) {
		this.certificateTypeCode = certificateTypeCode;
		this.certificateTypeName = certificateTypeName;
		this.buildingInfos = buildingInfos;
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

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "certificateTypeInfo")
	public Set<BuildingInfo> getBuildingInfos() {
		return this.buildingInfos;
	}

	public void setBuildingInfos(Set<BuildingInfo> buildingInfos) {
		this.buildingInfos = buildingInfos;
	}

}