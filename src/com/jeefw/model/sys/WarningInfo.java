package com.jeefw.model.sys;

import java.util.Date;

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
 * WarningInfo entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "warning_info", catalog = "jeefw")
@Cache(region = "all", usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
@JsonIgnoreProperties(value = { "maxResults", "firstResult", "topCount", "sortColumns", "cmd", "queryDynamicConditions", "sortedConditions", "dynamicProperties", "success", "message", "sortColumnsString", "flag" })
public class WarningInfo extends ExtJSBaseParameter {

	// Fields

	private Integer id;
	private Date timeStamp;
	private String warningType;
	private Integer roomId;
	private String warningContent;
	private Integer mark;

	// Constructors

	/** default constructor */
	public WarningInfo() {
	}

	/** full constructor */
	public WarningInfo(Date timeStamp, String warningType, Integer roomId,
			String warningContent, Integer mark) {
		this.timeStamp = timeStamp;
		this.warningType = warningType;
		this.roomId = roomId;
		this.warningContent = warningContent;
		this.mark = mark;
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

	@Column(name = "time_stamp", length = 19)
	public Date getTimeStamp() {
		return this.timeStamp;
	}

	public void setTimeStamp(Date timeStamp) {
		this.timeStamp = timeStamp;
	}

	@Column(name = "warning_type", length = 30)
	public String getWarningType() {
		return this.warningType;
	}

	public void setWarningType(String warningType) {
		this.warningType = warningType;
	}

	@Column(name = "room_id")
	public Integer getRoomId() {
		return this.roomId;
	}

	public void setRoomId(Integer roomId) {
		this.roomId = roomId;
	}

	@Column(name = "warning_content")
	public String getWarningContent() {
		return this.warningContent;
	}

	public void setWarningContent(String warningContent) {
		this.warningContent = warningContent;
	}

	@Column(name = "mark")
	public Integer getMark() {
		return this.mark;
	}

	public void setMark(Integer mark) {
		this.mark = mark;
	}

}