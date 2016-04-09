package com.jeefw.model.sys;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import core.support.ExtJSBaseParameter;

/**
 * RoomInfo entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "room_info", catalog = "jeefw")
@Cache(region = "all", usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
@JsonIgnoreProperties(value = { "maxResults", "firstResult", "topCount", "sortColumns", "cmd", "queryDynamicConditions", "sortedConditions", "dynamicProperties", "success", "message", "sortColumnsString", "flag" })

public class RoomInfo extends ExtJSBaseParameter {

	// Fields

	private Integer id;
	private Integer buildingId;
	private Integer floor;
	private String roomNumber;
	private String buildingSourceNumber;
	private String propertyCertificateNumber;
	private String groundSourceNumber;
	private double originalValue;
	private double roomSize;
	private Date dateBegin;
	private Date dateEnd;
	private Integer housePropertyCertificateNumber;
	private String housePropertyCertificateName;
	private Integer certificateTypeId;
	private Integer certificateTypeNumber;
	private Integer valid;
	private String buildingAdress;
	private String areaDivide;
	private String streetTown;

	// Constructors

	/** default constructor */
	public RoomInfo() {
	}

	/** minimal constructor */
	public RoomInfo(Integer id, Integer buildingId, Integer floor,
			String roomNumber, double originalValue, double roomSize,
			Date dateBegin) {
		this.id = id;
		this.buildingId = buildingId;
		this.floor = floor;
		this.roomNumber = roomNumber;
		this.originalValue = originalValue;
		this.roomSize = roomSize;
		this.dateBegin = dateBegin;
	}

	/** full constructor */
	public RoomInfo(Integer id, Integer buildingId, Integer floor,
			String roomNumber, String buildingSourceNumber,
			String propertyCertificateNumber, String groundSourceNumber,
			double originalValue, double roomSize, Date dateBegin,
			Date dateEnd, Integer housePropertyCertificateNumber,
			String housePropertyCertificateName, Integer certificateTypeId,
			Integer certificateTypeNumber, Integer valid,
			String buildingAdress, String areaDivide, String streetTown) {
		this.id = id;
		this.buildingId = buildingId;
		this.floor = floor;
		this.roomNumber = roomNumber;
		this.buildingSourceNumber = buildingSourceNumber;
		this.propertyCertificateNumber = propertyCertificateNumber;
		this.groundSourceNumber = groundSourceNumber;
		this.originalValue = originalValue;
		this.roomSize = roomSize;
		this.dateBegin = dateBegin;
		this.dateEnd = dateEnd;
		this.housePropertyCertificateNumber = housePropertyCertificateNumber;
		this.housePropertyCertificateName = housePropertyCertificateName;
		this.certificateTypeId = certificateTypeId;
		this.certificateTypeNumber = certificateTypeNumber;
		this.valid = valid;
		this.buildingAdress = buildingAdress;
		this.areaDivide = areaDivide;
		this.streetTown = streetTown;
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

	@Column(name = "building_id", nullable = false)
	public Integer getBuildingId() {
		return this.buildingId;
	}

	public void setBuildingId(Integer buildingId) {
		this.buildingId = buildingId;
	}

	@Column(name = "floor", nullable = false)
	public Integer getFloor() {
		return this.floor;
	}

	public void setFloor(Integer floor) {
		this.floor = floor;
	}

	@Column(name = "room_number", nullable = false, length = 10)
	public String getRoomNumber() {
		return this.roomNumber;
	}

	public void setRoomNumber(String roomNumber) {
		this.roomNumber = roomNumber;
	}

	@Column(name = "building_source_number", length = 30)
	public String getBuildingSourceNumber() {
		return this.buildingSourceNumber;
	}

	public void setBuildingSourceNumber(String buildingSourceNumber) {
		this.buildingSourceNumber = buildingSourceNumber;
	}

	@Column(name = "property_certificate_number", length = 30)
	public String getPropertyCertificateNumber() {
		return this.propertyCertificateNumber;
	}

	public void setPropertyCertificateNumber(String propertyCertificateNumber) {
		this.propertyCertificateNumber = propertyCertificateNumber;
	}

	@Column(name = "ground_source_number", length = 30)
	public String getGroundSourceNumber() {
		return this.groundSourceNumber;
	}

	public void setGroundSourceNumber(String groundSourceNumber) {
		this.groundSourceNumber = groundSourceNumber;
	}

	@Column(name = "original_value", nullable = false, precision = 22, scale = 0)
	public double getOriginalValue() {
		return this.originalValue;
	}

	public void setOriginalValue(double originalValue) {
		this.originalValue = originalValue;
	}

	@Column(name = "room_size", nullable = false, precision = 22, scale = 0)
	public double getRoomSize() {
		return this.roomSize;
	}

	public void setRoomSize(double roomSize) {
		this.roomSize = roomSize;
	}

	@Column(name = "date_begin", nullable = false, length = 19)
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

	@Column(name = "house_ property_certificate_number")
	public Integer getHousePropertyCertificateNumber() {
		return this.housePropertyCertificateNumber;
	}

	public void setHousePropertyCertificateNumber(
			Integer housePropertyCertificateNumber) {
		this.housePropertyCertificateNumber = housePropertyCertificateNumber;
	}

	@Column(name = "house_ property_certificate_name")
	public String getHousePropertyCertificateName() {
		return this.housePropertyCertificateName;
	}

	public void setHousePropertyCertificateName(
			String housePropertyCertificateName) {
		this.housePropertyCertificateName = housePropertyCertificateName;
	}

	@Column(name = "certificate_type_id")
	public Integer getCertificateTypeId() {
		return this.certificateTypeId;
	}

	public void setCertificateTypeId(Integer certificateTypeId) {
		this.certificateTypeId = certificateTypeId;
	}

	@Column(name = "certificate_type_number")
	public Integer getCertificateTypeNumber() {
		return this.certificateTypeNumber;
	}

	public void setCertificateTypeNumber(Integer certificateTypeNumber) {
		this.certificateTypeNumber = certificateTypeNumber;
	}

	@Column(name = "valid")
	public Integer getValid() {
		return this.valid;
	}

	public void setValid(Integer valid) {
		this.valid = valid;
	}

	@Column(name = "building_adress")
	public String getBuildingAdress() {
		return this.buildingAdress;
	}

	public void setBuildingAdress(String buildingAdress) {
		this.buildingAdress = buildingAdress;
	}

	@Column(name = "area_divide")
	public String getAreaDivide() {
		return this.areaDivide;
	}

	public void setAreaDivide(String areaDivide) {
		this.areaDivide = areaDivide;
	}

	@Column(name = "street_town")
	public String getStreetTown() {
		return this.streetTown;
	}

	public void setStreetTown(String streetTown) {
		this.streetTown = streetTown;
	}

}