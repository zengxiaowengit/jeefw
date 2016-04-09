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
 * TaxInfo entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "tax_info", catalog = "jeefw")
@Cache(region = "all", usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
@JsonIgnoreProperties(value = { "maxResults", "firstResult", "topCount", "sortColumns", "cmd", "queryDynamicConditions", "sortedConditions", "dynamicProperties", "success", "message", "sortColumnsString", "flag" })
public class TaxInfo extends ExtJSBaseParameter {

	// Fields

	private Integer id;
	private String taxpayerIndentifyNumber;
	private String taxpayerName;
	private String taxTypeCode;
	private String taxType;
	private double total;
	private double jan;
	private double feb;
	private double mar;
	private double apr;
	private double may;
	private double jun;
	private double jul;
	private double aug;
	private double sep;
	private double oct;
	private double nov;
	private double dec;
	private Integer year;

	// Constructors

	/** default constructor */
	public TaxInfo() {
	}

	/** minimal constructor */
	public TaxInfo(String taxpayerIndentifyNumber, String taxpayerName,
			String taxTypeCode, String taxType, double total) {
		this.taxpayerIndentifyNumber = taxpayerIndentifyNumber;
		this.taxpayerName = taxpayerName;
		this.taxTypeCode = taxTypeCode;
		this.taxType = taxType;
		this.total = total;
	}

	/** full constructor */
	public TaxInfo(String taxpayerIndentifyNumber, String taxpayerName,
			String taxTypeCode, String taxType, double total, double jan,
			double feb, double mar, double apr, double may, double jun,
			double jul, double aug, double sep, double oct, double nov,
			double dec, Integer year) {
		this.taxpayerIndentifyNumber = taxpayerIndentifyNumber;
		this.taxpayerName = taxpayerName;
		this.taxTypeCode = taxTypeCode;
		this.taxType = taxType;
		this.total = total;
		this.jan = jan;
		this.feb = feb;
		this.mar = mar;
		this.apr = apr;
		this.may = may;
		this.jun = jun;
		this.jul = jul;
		this.aug = aug;
		this.sep = sep;
		this.oct = oct;
		this.nov = nov;
		this.dec = dec;
		this.year = year;
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

	@Column(name = "taxpayer_indentify_number", nullable = false, length = 15)
	public String getTaxpayerIndentifyNumber() {
		return this.taxpayerIndentifyNumber;
	}

	public void setTaxpayerIndentifyNumber(String taxpayerIndentifyNumber) {
		this.taxpayerIndentifyNumber = taxpayerIndentifyNumber;
	}

	@Column(name = "taxpayer_name", nullable = false, length = 60)
	public String getTaxpayerName() {
		return this.taxpayerName;
	}

	public void setTaxpayerName(String taxpayerName) {
		this.taxpayerName = taxpayerName;
	}

	@Column(name = "tax_type_code", nullable = false, length = 5)
	public String getTaxTypeCode() {
		return this.taxTypeCode;
	}

	public void setTaxTypeCode(String taxTypeCode) {
		this.taxTypeCode = taxTypeCode;
	}

	@Column(name = "tax_type", nullable = false, length = 30)
	public String getTaxType() {
		return this.taxType;
	}

	public void setTaxType(String taxType) {
		this.taxType = taxType;
	}

	@Column(name = "total", nullable = false, precision = 22, scale = 0)
	public double getTotal() {
		return this.total;
	}

	public void setTotal(double total) {
		this.total = total;
	}

	@Column(name = "jan", precision = 22, scale = 0)
	public double getJan() {
		return this.jan;
	}

	public void setJan(double jan) {
		this.jan = jan;
	}

	@Column(name = "feb", precision = 22, scale = 0)
	public double getFeb() {
		return this.feb;
	}

	public void setFeb(double feb) {
		this.feb = feb;
	}

	@Column(name = "mar", precision = 22, scale = 0)
	public double getMar() {
		return this.mar;
	}

	public void setMar(double mar) {
		this.mar = mar;
	}

	@Column(name = "apr", precision = 22, scale = 0)
	public double getApr() {
		return this.apr;
	}

	public void setApr(double apr) {
		this.apr = apr;
	}

	@Column(name = "may", precision = 22, scale = 0)
	public double getMay() {
		return this.may;
	}

	public void setMay(double may) {
		this.may = may;
	}

	@Column(name = "jun", precision = 22, scale = 0)
	public double getJun() {
		return this.jun;
	}

	public void setJun(double jun) {
		this.jun = jun;
	}

	@Column(name = "jul", precision = 22, scale = 0)
	public double getJul() {
		return this.jul;
	}

	public void setJul(double jul) {
		this.jul = jul;
	}

	@Column(name = "aug", precision = 22, scale = 0)
	public double getAug() {
		return this.aug;
	}

	public void setAug(double aug) {
		this.aug = aug;
	}

	@Column(name = "sep", precision = 22, scale = 0)
	public double getSep() {
		return this.sep;
	}

	public void setSep(double sep) {
		this.sep = sep;
	}

	@Column(name = "oct", precision = 22, scale = 0)
	public double getOct() {
		return this.oct;
	}

	public void setOct(double oct) {
		this.oct = oct;
	}

	@Column(name = "nov", precision = 22, scale = 0)
	public double getNov() {
		return this.nov;
	}

	public void setNov(double nov) {
		this.nov = nov;
	}

	@Column(name = "dec", precision = 22, scale = 0)
	public double getDec() {
		return this.dec;
	}

	public void setDec(double dec) {
		this.dec = dec;
	}

	@Column(name = "year")
	public Integer getYear() {
		return this.year;
	}

	public void setYear(Integer year) {
		this.year = year;
	}

}