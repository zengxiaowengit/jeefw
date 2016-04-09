package com.jeefw.model.sys;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.GenericGenerator;

import core.support.ExtJSBaseParameter;

/**
 * TaxAuthorityInfo entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "tax_authority_info", catalog = "jeefw")
@Cache(region = "all", usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
@JsonIgnoreProperties(value = { "maxResults", "firstResult", "topCount", "sortColumns", "cmd", "queryDynamicConditions", "sortedConditions", "dynamicProperties", "success", "message", "sortColumnsString", "flag" })
public class TaxAuthorityInfo extends ExtJSBaseParameter{

	// Fields

	private Integer id;
	private String taxAuthorityName;

	// Constructors

	/** default constructor */
	public TaxAuthorityInfo() {
	}

	/** full constructor */
	public TaxAuthorityInfo(String taxAuthorityName) {
		this.taxAuthorityName = taxAuthorityName;
	}

	// Property accessors
	@GenericGenerator(name = "generator", strategy = "increment")
	@Id
	@GeneratedValue(generator = "generator")
	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "tax_authority_name", nullable = false, length = 40)
	public String getTaxAuthorityName() {
		return this.taxAuthorityName;
	}

	public void setTaxAuthorityName(String taxAuthorityName) {
		this.taxAuthorityName = taxAuthorityName;
	}

}