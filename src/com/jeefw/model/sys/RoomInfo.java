package com.jeefw.model.sys;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.codehaus.jackson.annotate.JsonBackReference;
import org.codehaus.jackson.annotate.JsonIgnore;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

import com.jeefw.model.sys.param.RoomInfoParameter;

/**
 * RoomInfo entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "room_info", catalog = "jeefw")
@Cache(region = "all", usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
@JsonIgnoreProperties(value = { "maxResults", "firstResult", "topCount", "sortColumns", "cmd", "queryDynamicConditions", "sortedConditions", "dynamicProperties", "success", "message", "sortColumnsString", "flag" })
public class RoomInfo extends RoomInfoParameter{

	// Fields

	private Integer id;
	@JsonBackReference
	private BuildingInfo buildingInfo;
	private Integer floor;
	private String roomNumber;
	private double originalValue;
	private double roomSize;
	private String taxAuthorityName;
	@JsonIgnore
	private Set<RoomUseInfo> roomUseInfos = new HashSet<RoomUseInfo>(0);

	

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

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "building_id", nullable = false)
	public BuildingInfo getBuildingInfo() {
		return this.buildingInfo;
	}

	public void setBuildingInfo(BuildingInfo buildingInfo) {
		this.buildingInfo = buildingInfo;
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

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "roomInfo")
	@LazyCollection(LazyCollectionOption.EXTRA)
	public Set<RoomUseInfo> getRoomUseInfos() {
		return this.roomUseInfos;
	}

	public void setRoomUseInfos(Set<RoomUseInfo> roomUseInfos) {
		this.roomUseInfos = roomUseInfos;
	}

	@Column(name = "tax_authority_name", nullable = true, length = 40)
	public String getTaxAuthorityName() {
		return taxAuthorityName;
	}

	public void setTaxAuthorityName(String taxAuthorityName) {
		this.taxAuthorityName = taxAuthorityName;
	}

}