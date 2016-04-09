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
 * TaxRateInfo entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "tax_rate_info", catalog = "jeefw")
@Cache(region = "all", usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
@JsonIgnoreProperties(value = { "maxResults", "firstResult", "topCount", "sortColumns", "cmd", "queryDynamicConditions", "sortedConditions", "dynamicProperties", "success", "message", "sortColumnsString", "flag" })
public class TaxRateInfo extends ExtJSBaseParameter {

	// Fields

	private Integer id;
	private String taxTypeName;
	private float rate;

	// Constructors

	/** default constructor */
	public TaxRateInfo() {
	}

	/** full constructor */
	public TaxRateInfo(String taxTypeName, float rate) {
		this.taxTypeName = taxTypeName;
		this.rate = rate;
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

	@Column(name = "tax_type_name", nullable = false, length = 40)
	public String getTaxTypeName() {
		return this.taxTypeName;
	}

	public void setTaxTypeName(String taxTypeName) {
		this.taxTypeName = taxTypeName;
	}

	@Column(name = "rate", nullable = false, precision = 12, scale = 0)
	public float getRate() {
		return this.rate;
	}

	public void setRate(float rate) {
		this.rate = rate;
	}

}