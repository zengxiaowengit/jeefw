package com.jeefw.model.sys;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;
import javax.persistence.UniqueConstraint;

import org.codehaus.jackson.annotate.JsonAutoDetect;
import org.codehaus.jackson.annotate.JsonBackReference;
import org.codehaus.jackson.annotate.JsonIgnore;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import com.jeefw.model.sys.param.BuildingInfoParameter;

import core.support.ExtJSBaseParameter;

/**
 * BuildingInfo entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "building_info", catalog = "jeefw", uniqueConstraints = @UniqueConstraint(columnNames = "property_certificate_number"))
@JsonAutoDetect(fieldVisibility = JsonAutoDetect.Visibility.ANY)
@Cache(region = "all", usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
@JsonIgnoreProperties(value = { "maxResults", "firstResult", "topCount", "sortColumns", "cmd", "queryDynamicConditions", "sortedConditions", "dynamicProperties", "success", "message", "sortColumnsString", "flag" })
public class BuildingInfo extends ExtJSBaseParameter{

	// Fields

	private Integer id;
	@JsonBackReference
	private CertificateTypeInfo certificateTypeInfo;
	private String buildingName;
	private Integer roomSum;
	private String buildingAdress;
	private String areaDivide;
	private String streetTown;
	private double longitude;
	private double latitude;
	private Integer floorSum;
	private String buildingSourceNumber;
	private String propertyCertificateNumber;
	private String groundSourceNumber;
	private Date dateBegin;
	private Date dateEnd;
	private String housePropertyNumber;
	private String housePropertyName;
	private String houseCertificateTypeNumber;
	@JsonIgnore
	private Set<RoomInfo> roomInfos = new HashSet<RoomInfo>(0);
	
	private int houseCertificateTypeCode;

	// Constructors

	/** default constructor */
	public BuildingInfo() {
	}

	/** minimal constructor */
	public BuildingInfo(CertificateTypeInfo certificateTypeInfo,
			String buildingName, Integer roomSum, String buildingAdress,
			String areaDivide, String streetTown, double longitude,
			double latitude, Integer floorSum, String buildingSourceNumber,
			String propertyCertificateNumber, String groundSourceNumber,
			Date dateBegin, Date dateEnd, String housePropertyNumber,
			String housePropertyName, String houseCertificateTypeNumber,
			Integer houseCertificateTypeName) {
		this.certificateTypeInfo = certificateTypeInfo;
		this.buildingName = buildingName;
		this.roomSum = roomSum;
		this.buildingAdress = buildingAdress;
		this.areaDivide = areaDivide;
		this.streetTown = streetTown;
		this.longitude = longitude;
		this.latitude = latitude;
		this.floorSum = floorSum;
		this.buildingSourceNumber = buildingSourceNumber;
		this.propertyCertificateNumber = propertyCertificateNumber;
		this.groundSourceNumber = groundSourceNumber;
		this.dateBegin = dateBegin;
		this.dateEnd = dateEnd;
		this.housePropertyNumber = housePropertyNumber;
		this.housePropertyName = housePropertyName;
		this.houseCertificateTypeNumber = houseCertificateTypeNumber;
	}

	/** full constructor */
	public BuildingInfo(CertificateTypeInfo certificateTypeInfo,
			String buildingName, Integer roomSum, String buildingAdress,
			String areaDivide, String streetTown, double longitude,
			double latitude, Integer floorSum, String buildingSourceNumber,
			String propertyCertificateNumber, String groundSourceNumber,
			Date dateBegin, Date dateEnd, String housePropertyNumber,
			String housePropertyName, String houseCertificateTypeNumber,
			Integer houseCertificateTypeName, Set<RoomInfo> roomInfos) {
		this.certificateTypeInfo = certificateTypeInfo;
		this.buildingName = buildingName;
		this.roomSum = roomSum;
		this.buildingAdress = buildingAdress;
		this.areaDivide = areaDivide;
		this.streetTown = streetTown;
		this.longitude = longitude;
		this.latitude = latitude;
		this.floorSum = floorSum;
		this.buildingSourceNumber = buildingSourceNumber;
		this.propertyCertificateNumber = propertyCertificateNumber;
		this.groundSourceNumber = groundSourceNumber;
		this.dateBegin = dateBegin;
		this.dateEnd = dateEnd;
		this.housePropertyNumber = housePropertyNumber;
		this.housePropertyName = housePropertyName;
		this.houseCertificateTypeNumber = houseCertificateTypeNumber;
		this.roomInfos = roomInfos;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "house_certificate_type_id", nullable = false)
	public CertificateTypeInfo getCertificateTypeInfo() {
		return this.certificateTypeInfo; 
	}

	public void setCertificateTypeInfo(CertificateTypeInfo certificateTypeInfo) {
		this.certificateTypeInfo = certificateTypeInfo;
	}

	@Column(name = "building_name", nullable = false, length = 40)
	public String getBuildingName() {
		return this.buildingName;
	}

	public void setBuildingName(String buildingName) {
		this.buildingName = buildingName;
	}

	@Column(name = "room_sum", nullable = false)
	public Integer getRoomSum() {
		return this.roomSum;
	}

	public void setRoomSum(Integer roomSum) {
		this.roomSum = roomSum;
	}

	@Column(name = "building_adress", nullable = false, length = 100)
	public String getBuildingAdress() {
		return this.buildingAdress;
	}

	public void setBuildingAdress(String buildingAdress) {
		this.buildingAdress = buildingAdress;
	}

	@Column(name = "area_divide", nullable = false, length = 50)
	public String getAreaDivide() {
		return this.areaDivide;
	}

	public void setAreaDivide(String areaDivide) {
		this.areaDivide = areaDivide;
	}

	@Column(name = "street_town", nullable = false, length = 500)
	public String getStreetTown() {
		return this.streetTown;
	}

	public void setStreetTown(String streetTown) {
		this.streetTown = streetTown;
	}

	@Column(name = "longitude", nullable = false, precision = 22, scale = 0)
	public double getLongitude() {
		return this.longitude;
	}

	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}

	@Column(name = "latitude", nullable = false, precision = 22, scale = 0)
	public double getLatitude() {
		return this.latitude;
	}

	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}

	@Column(name = "floor_sum", nullable = false)
	public Integer getFloorSum() {
		return this.floorSum;
	}

	public void setFloorSum(Integer floorSum) {
		this.floorSum = floorSum;
	}

	@Column(name = "building_source_number", nullable = false, length = 30)
	public String getBuildingSourceNumber() {
		return this.buildingSourceNumber;
	}

	public void setBuildingSourceNumber(String buildingSourceNumber) {
		this.buildingSourceNumber = buildingSourceNumber;
	}

	@Column(name = "property_certificate_number", unique = true, nullable = false, length = 30)
	public String getPropertyCertificateNumber() {
		return this.propertyCertificateNumber;
	}

	public void setPropertyCertificateNumber(String propertyCertificateNumber) {
		this.propertyCertificateNumber = propertyCertificateNumber;
	}

	@Column(name = "ground_source_number", nullable = false, length = 30)
	public String getGroundSourceNumber() {
		return this.groundSourceNumber;
	}

	public void setGroundSourceNumber(String groundSourceNumber) {
		this.groundSourceNumber = groundSourceNumber;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "date_begin", nullable = false, length = 10)
	public Date getDateBegin() {
		return this.dateBegin;
	}

	public void setDateBegin(Date dateBegin) {
		this.dateBegin = dateBegin;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "date_end", nullable = false, length = 10)
	public Date getDateEnd() {
		return this.dateEnd;
	}

	public void setDateEnd(Date dateEnd) {
		this.dateEnd = dateEnd;
	}

	@Column(name = "house_property_number", nullable = false, length = 20)
	public String getHousePropertyNumber() {
		return this.housePropertyNumber;
	}

	public void setHousePropertyNumber(String housePropertyNumber) {
		this.housePropertyNumber = housePropertyNumber;
	}

	@Column(name = "house_property_name", nullable = false, length = 30)
	public String getHousePropertyName() {
		return this.housePropertyName;
	}

	public void setHousePropertyName(String housePropertyName) {
		this.housePropertyName = housePropertyName;
	}

	@Column(name = "house_certificate_type_number", nullable = false, length = 21)
	public String getHouseCertificateTypeNumber() {
		return this.houseCertificateTypeNumber;
	}

	public void setHouseCertificateTypeNumber(String houseCertificateTypeNumber) {
		this.houseCertificateTypeNumber = houseCertificateTypeNumber;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "buildingInfo")
	public Set<RoomInfo> getRoomInfos() {
		return this.roomInfos;
	}

	public void setRoomInfos(Set<RoomInfo> roomInfos) {
		this.roomInfos = roomInfos;
	}

	@Transient
	public int getHouseCertificateTypeCode() {
		return houseCertificateTypeCode;
	}

	public void setHouseCertificateTypeCode(int houseCertificateTypeCode) {
		this.houseCertificateTypeCode = houseCertificateTypeCode;
	}

}