package com.jeefw.model.sys;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import core.support.ExtJSBaseParameter;

/**
 * RoomUseInfo entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "room_use_info", catalog = "jeefw")
@Cache(region = "all", usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
@JsonIgnoreProperties(value = { "maxResults", "firstResult", "topCount", "sortColumns", "cmd", "queryDynamicConditions", "sortedConditions", "dynamicProperties", "success", "message", "sortColumnsString", "flag" })
public class RoomUseInfo extends ExtJSBaseParameter {

	// Fields

	private Integer id;
	private Integer roomId;
	private Integer sysUserId;
	private Date timeStamp;
	private Integer valid;
	private String userName;
	private Integer userCertificateType;
	private String userCertificateNumber;
	private String useType;
	private double useSize;
	private String userHouseTaxed;
	private String lessorName;
	private Integer lessorCertificateTypeId;
	private String lessorCertificateNumber;
	private String lessorHouseTaxed;
	private String taxType;
	private double yearlyRental;
	private double orignalValue;
	private double taxFreeValue;
	private Date dateBegin;
	private Date dateEnd;
	private String comment;
	private String houseTaxPerson;
	private Integer houseTaxCertificateTypeId;
	private String houseTaxCertificateNumber;
	private double taxYear;
	private Date taxDeadline;

	// Constructors

	/** default constructor */
	public RoomUseInfo() {
	}

	/** minimal constructor */
	public RoomUseInfo(Integer id, Integer roomId, Integer sysUserId,
			Date timeStamp, Integer valid, String userName,
			Integer userCertificateType, String useType, double useSize,
			String userHouseTaxed, String lessorHouseTaxed, Date taxDeadline) {
		this.id = id;
		this.roomId = roomId;
		this.sysUserId = sysUserId;
		this.timeStamp = timeStamp;
		this.valid = valid;
		this.userName = userName;
		this.userCertificateType = userCertificateType;
		this.useType = useType;
		this.useSize = useSize;
		this.userHouseTaxed = userHouseTaxed;
		this.lessorHouseTaxed = lessorHouseTaxed;
		this.taxDeadline = taxDeadline;
	}

	/** full constructor */
	public RoomUseInfo(Integer id, Integer roomId, Integer sysUserId,
			Date timeStamp, Integer valid, String userName,
			Integer userCertificateType, String userCertificateNumber,
			String useType, double useSize, String userHouseTaxed,
			String lessorName, Integer lessorCertificateTypeId,
			String lessorCertificateNumber, String lessorHouseTaxed,
			String taxType, double yearlyRental, double orignalValue,
			double taxFreeValue, Date dateBegin, Date dateEnd, String comment,
			String houseTaxPerson, Integer houseTaxCertificateTypeId,
			String houseTaxCertificateNumber, double taxYear, Date taxDeadline) {
		this.id = id;
		this.roomId = roomId;
		this.sysUserId = sysUserId;
		this.timeStamp = timeStamp;
		this.valid = valid;
		this.userName = userName;
		this.userCertificateType = userCertificateType;
		this.userCertificateNumber = userCertificateNumber;
		this.useType = useType;
		this.useSize = useSize;
		this.userHouseTaxed = userHouseTaxed;
		this.lessorName = lessorName;
		this.lessorCertificateTypeId = lessorCertificateTypeId;
		this.lessorCertificateNumber = lessorCertificateNumber;
		this.lessorHouseTaxed = lessorHouseTaxed;
		this.taxType = taxType;
		this.yearlyRental = yearlyRental;
		this.orignalValue = orignalValue;
		this.taxFreeValue = taxFreeValue;
		this.dateBegin = dateBegin;
		this.dateEnd = dateEnd;
		this.comment = comment;
		this.houseTaxPerson = houseTaxPerson;
		this.houseTaxCertificateTypeId = houseTaxCertificateTypeId;
		this.houseTaxCertificateNumber = houseTaxCertificateNumber;
		this.taxYear = taxYear;
		this.taxDeadline = taxDeadline;
	}

	// Property accessors
	@Id
	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "room_id", nullable = false)
	public Integer getRoomId() {
		return this.roomId;
	}

	public void setRoomId(Integer roomId) {
		this.roomId = roomId;
	}

	@Column(name = "sys_user_id", nullable = false)
	public Integer getSysUserId() {
		return this.sysUserId;
	}

	public void setSysUserId(Integer sysUserId) {
		this.sysUserId = sysUserId;
	}

	@Column(name = "time_stamp", nullable = false, length = 19)
	public Date getTimeStamp() {
		return this.timeStamp;
	}

	public void setTimeStamp(Date timeStamp) {
		this.timeStamp = timeStamp;
	}

	@Column(name = "valid", nullable = false)
	public Integer getValid() {
		return this.valid;
	}

	public void setValid(Integer valid) {
		this.valid = valid;
	}

	@Column(name = "user_name", nullable = false, length = 60)
	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	@Column(name = "user_certificate_type", nullable = false)
	public Integer getUserCertificateType() {
		return this.userCertificateType;
	}

	public void setUserCertificateType(Integer userCertificateType) {
		this.userCertificateType = userCertificateType;
	}

	@Column(name = "user_certificate_number", length = 18)
	public String getUserCertificateNumber() {
		return this.userCertificateNumber;
	}

	public void setUserCertificateNumber(String userCertificateNumber) {
		this.userCertificateNumber = userCertificateNumber;
	}

	@Column(name = "use_type", nullable = false, length = 20)
	public String getUseType() {
		return this.useType;
	}

	public void setUseType(String useType) {
		this.useType = useType;
	}

	@Column(name = "use_size", nullable = false, precision = 22, scale = 0)
	public double getUseSize() {
		return this.useSize;
	}

	public void setUseSize(double useSize) {
		this.useSize = useSize;
	}

	@Column(name = "user_house_taxed", nullable = false, length = 10)
	public String getUserHouseTaxed() {
		return this.userHouseTaxed;
	}

	public void setUserHouseTaxed(String userHouseTaxed) {
		this.userHouseTaxed = userHouseTaxed;
	}

	@Column(name = "lessor_name", length = 60)
	public String getLessorName() {
		return this.lessorName;
	}

	public void setLessorName(String lessorName) {
		this.lessorName = lessorName;
	}

	@Column(name = "lessor_certificate_type_id")
	public Integer getLessorCertificateTypeId() {
		return this.lessorCertificateTypeId;
	}

	public void setLessorCertificateTypeId(Integer lessorCertificateTypeId) {
		this.lessorCertificateTypeId = lessorCertificateTypeId;
	}

	@Column(name = "lessor_certificate_number", length = 18)
	public String getLessorCertificateNumber() {
		return this.lessorCertificateNumber;
	}

	public void setLessorCertificateNumber(String lessorCertificateNumber) {
		this.lessorCertificateNumber = lessorCertificateNumber;
	}

	@Column(name = "lessor_house_taxed", nullable = false, length = 10)
	public String getLessorHouseTaxed() {
		return this.lessorHouseTaxed;
	}

	public void setLessorHouseTaxed(String lessorHouseTaxed) {
		this.lessorHouseTaxed = lessorHouseTaxed;
	}

	@Column(name = "tax_type", length = 20)
	public String getTaxType() {
		return this.taxType;
	}

	public void setTaxType(String taxType) {
		this.taxType = taxType;
	}

	@Column(name = "yearly_rental", precision = 22, scale = 0)
	public double getYearlyRental() {
		return this.yearlyRental;
	}

	public void setYearlyRental(double yearlyRental) {
		this.yearlyRental = yearlyRental;
	}

	@Column(name = "orignal_value", precision = 22, scale = 0)
	public double getOrignalValue() {
		return this.orignalValue;
	}

	public void setOrignalValue(double orignalValue) {
		this.orignalValue = orignalValue;
	}

	@Column(name = "tax_free_value", precision = 22, scale = 0)
	public double getTaxFreeValue() {
		return this.taxFreeValue;
	}

	public void setTaxFreeValue(double taxFreeValue) {
		this.taxFreeValue = taxFreeValue;
	}

	@Column(name = "date_begin", length = 19)
	public Date getDateBegin() {
		return this.dateBegin;
	}

	public void setDateBegin(Date dateBegin) {
		this.dateBegin = dateBegin;
	}

	@Column(name = "date_end", length = 19)
	public Date getDateEnd() {
		return this.dateEnd;
	}

	public void setDateEnd(Date dateEnd) {
		this.dateEnd = dateEnd;
	}

	@Column(name = "comment")
	public String getComment() {
		return this.comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	@Column(name = "house_tax_person", length = 60)
	public String getHouseTaxPerson() {
		return this.houseTaxPerson;
	}

	public void setHouseTaxPerson(String houseTaxPerson) {
		this.houseTaxPerson = houseTaxPerson;
	}

	@Column(name = "house_tax_certificate_type_id")
	public Integer getHouseTaxCertificateTypeId() {
		return this.houseTaxCertificateTypeId;
	}

	public void setHouseTaxCertificateTypeId(Integer houseTaxCertificateTypeId) {
		this.houseTaxCertificateTypeId = houseTaxCertificateTypeId;
	}

	@Column(name = "house_tax_certificate_number", length = 18)
	public String getHouseTaxCertificateNumber() {
		return this.houseTaxCertificateNumber;
	}

	public void setHouseTaxCertificateNumber(String houseTaxCertificateNumber) {
		this.houseTaxCertificateNumber = houseTaxCertificateNumber;
	}

	@Column(name = "tax_year", precision = 22, scale = 0)
	public double getTaxYear() {
		return this.taxYear;
	}

	public void setTaxYear(double taxYear) {
		this.taxYear = taxYear;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "tax_deadline", nullable = false, length = 10)
	public Date getTaxDeadline() {
		return this.taxDeadline;
	}

	public void setTaxDeadline(Date taxDeadline) {
		this.taxDeadline = taxDeadline;
	}

}