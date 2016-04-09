package com.jeefw.model.sys;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Id;
import javax.persistence.Table;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import core.support.ExtJSBaseParameter;

/**
 * BuildingInfo entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "building_info", catalog = "jeefw")
@Cache(region = "all", usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
@JsonIgnoreProperties(value = { "maxResults", "firstResult", "topCount", "sortColumns", "cmd", "queryDynamicConditions", "sortedConditions", "dynamicProperties", "success", "message", "sortColumnsString", "flag" })
public class BuildingInfo extends ExtJSBaseParameter {

	// Fields

	private Integer id;
	private String buildingName;
	private Integer roomSum;
	private String buildingAdress;
	private String areaDivide;
	private String streetTown;
	private double longitude;
	private double latitude;

	// Constructors

	/** default constructor */
	public BuildingInfo() {
	}

	/** full constructor */
	public BuildingInfo(String buildingName, Integer roomSum,
			String buildingAdress, String areaDivide, String streetTown,
			double longitude, double latitude) {
		this.buildingName = buildingName;
		this.roomSum = roomSum;
		this.buildingAdress = buildingAdress;
		this.areaDivide = areaDivide;
		this.streetTown = streetTown;
		this.longitude = longitude;
		this.latitude = latitude;
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

}