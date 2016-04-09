package com.jeefw.model.sys;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.GenericGenerator;

import core.support.ExtJSBaseParameter;

/**
 * CompanyInfo entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "company_info", catalog = "jeefw")
@Cache(region = "all", usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
@JsonIgnoreProperties(value = { "maxResults", "firstResult", "topCount", "sortColumns", "cmd", "queryDynamicConditions", "sortedConditions", "dynamicProperties", "success", "message", "sortColumnsString", "flag" })
public class CompanyInfo extends ExtJSBaseParameter {

	// Fields

	private Integer id;
	private String taxpayerIndentifyNumber;
	private String taxpayerName;
	private String taxpayerStatus;
	private String taxSubjectRegisterType;
	private String registerType;
	private String localContryType;
	private String subordinateRelation;
	private String industry;
	private String registerAdress;
	private String registerAdressPhone;
	private String businessAdress;
	private String businessAdressPhone;
	private String legalPersonName;
	private Integer legalPersonCertificateTypeId;
	private String legalPersonCertificateNumber;
	private Date registerDate;
	private String taxAuthority;
	private String taxSubAuthority;
	private String taxAdmin;
	private String streetTown;
	private String btToVatType;
	private String businessScope;
	private String accountingSystem;
	private String permitMethod;
	private String calculateMethod;
	private String stateOwnedControlType;
	private float stateOwnedInverstRate;
	private float naturalPersonInverstRate;
	private float foreignInverstRate;
	private long registerCapital;
	private long totalInverst;
	private Integer partnerNumber;
	private String totalSubOrgType;
	private String crossZoneTaxRegMark;
	private String permitEstablishAuthority;
	private String licenseNumber;
	private Date openBusinessDate;
	private Date businessBeginDate;
	private Date businessEndDate;
	private String validMark;
	private long registerNumber;
	private String inputPerson;
	private Date inputDate;
	private String modifiedPerson;
	private Date modifiedDate;

	// Constructors

	/** default constructor */
	public CompanyInfo() {
	}

	/** minimal constructor */
	public CompanyInfo(String taxpayerIndentifyNumber, String taxpayerName,
			String taxpayerStatus, String legalPersonName,
			Integer legalPersonCertificateTypeId,
			String legalPersonCertificateNumber) {
		this.taxpayerIndentifyNumber = taxpayerIndentifyNumber;
		this.taxpayerName = taxpayerName;
		this.taxpayerStatus = taxpayerStatus;
		this.legalPersonName = legalPersonName;
		this.legalPersonCertificateTypeId = legalPersonCertificateTypeId;
		this.legalPersonCertificateNumber = legalPersonCertificateNumber;
	}

	/** full constructor */
	public CompanyInfo(String taxpayerIndentifyNumber, String taxpayerName,
			String taxpayerStatus, String taxSubjectRegisterType,
			String registerType, String localContryType,
			String subordinateRelation, String industry, String registerAdress,
			String registerAdressPhone, String businessAdress,
			String businessAdressPhone, String legalPersonName,
			Integer legalPersonCertificateTypeId,
			String legalPersonCertificateNumber, Date registerDate,
			String taxAuthority, String taxSubAuthority, String taxAdmin,
			String streetTown, String btToVatType, String businessScope,
			String accountingSystem, String permitMethod,
			String calculateMethod, String stateOwnedControlType,
			float stateOwnedInverstRate, float naturalPersonInverstRate,
			float foreignInverstRate, long registerCapital, long totalInverst,
			Integer partnerNumber, String totalSubOrgType,
			String crossZoneTaxRegMark, String permitEstablishAuthority,
			String licenseNumber, Date openBusinessDate,
			Date businessBeginDate, Date businessEndDate, String validMark,
			long registerNumber, String inputPerson, Date inputDate,
			String modifiedPerson, Date modifiedDate) {
		this.taxpayerIndentifyNumber = taxpayerIndentifyNumber;
		this.taxpayerName = taxpayerName;
		this.taxpayerStatus = taxpayerStatus;
		this.taxSubjectRegisterType = taxSubjectRegisterType;
		this.registerType = registerType;
		this.localContryType = localContryType;
		this.subordinateRelation = subordinateRelation;
		this.industry = industry;
		this.registerAdress = registerAdress;
		this.registerAdressPhone = registerAdressPhone;
		this.businessAdress = businessAdress;
		this.businessAdressPhone = businessAdressPhone;
		this.legalPersonName = legalPersonName;
		this.legalPersonCertificateTypeId = legalPersonCertificateTypeId;
		this.legalPersonCertificateNumber = legalPersonCertificateNumber;
		this.registerDate = registerDate;
		this.taxAuthority = taxAuthority;
		this.taxSubAuthority = taxSubAuthority;
		this.taxAdmin = taxAdmin;
		this.streetTown = streetTown;
		this.btToVatType = btToVatType;
		this.businessScope = businessScope;
		this.accountingSystem = accountingSystem;
		this.permitMethod = permitMethod;
		this.calculateMethod = calculateMethod;
		this.stateOwnedControlType = stateOwnedControlType;
		this.stateOwnedInverstRate = stateOwnedInverstRate;
		this.naturalPersonInverstRate = naturalPersonInverstRate;
		this.foreignInverstRate = foreignInverstRate;
		this.registerCapital = registerCapital;
		this.totalInverst = totalInverst;
		this.partnerNumber = partnerNumber;
		this.totalSubOrgType = totalSubOrgType;
		this.crossZoneTaxRegMark = crossZoneTaxRegMark;
		this.permitEstablishAuthority = permitEstablishAuthority;
		this.licenseNumber = licenseNumber;
		this.openBusinessDate = openBusinessDate;
		this.businessBeginDate = businessBeginDate;
		this.businessEndDate = businessEndDate;
		this.validMark = validMark;
		this.registerNumber = registerNumber;
		this.inputPerson = inputPerson;
		this.inputDate = inputDate;
		this.modifiedPerson = modifiedPerson;
		this.modifiedDate = modifiedDate;
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

	@Column(name = "taxpayer_indentify_number", nullable = false, length = 20)
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

	@Column(name = "taxpayer_status", nullable = false, length = 20)
	public String getTaxpayerStatus() {
		return this.taxpayerStatus;
	}

	public void setTaxpayerStatus(String taxpayerStatus) {
		this.taxpayerStatus = taxpayerStatus;
	}

	@Column(name = "tax_subject_register_type", length = 40)
	public String getTaxSubjectRegisterType() {
		return this.taxSubjectRegisterType;
	}

	public void setTaxSubjectRegisterType(String taxSubjectRegisterType) {
		this.taxSubjectRegisterType = taxSubjectRegisterType;
	}

	@Column(name = "register_type", length = 40)
	public String getRegisterType() {
		return this.registerType;
	}

	public void setRegisterType(String registerType) {
		this.registerType = registerType;
	}

	@Column(name = "local_contry_type", length = 20)
	public String getLocalContryType() {
		return this.localContryType;
	}

	public void setLocalContryType(String localContryType) {
		this.localContryType = localContryType;
	}

	@Column(name = "subordinate_relation", length = 20)
	public String getSubordinateRelation() {
		return this.subordinateRelation;
	}

	public void setSubordinateRelation(String subordinateRelation) {
		this.subordinateRelation = subordinateRelation;
	}

	@Column(name = "industry", length = 40)
	public String getIndustry() {
		return this.industry;
	}

	public void setIndustry(String industry) {
		this.industry = industry;
	}

	@Column(name = "register_adress", length = 100)
	public String getRegisterAdress() {
		return this.registerAdress;
	}

	public void setRegisterAdress(String registerAdress) {
		this.registerAdress = registerAdress;
	}

	@Column(name = "register_adress_phone", length = 12)
	public String getRegisterAdressPhone() {
		return this.registerAdressPhone;
	}

	public void setRegisterAdressPhone(String registerAdressPhone) {
		this.registerAdressPhone = registerAdressPhone;
	}

	@Column(name = "business_adress", length = 80)
	public String getBusinessAdress() {
		return this.businessAdress;
	}

	public void setBusinessAdress(String businessAdress) {
		this.businessAdress = businessAdress;
	}

	@Column(name = "business_adress_phone", length = 12)
	public String getBusinessAdressPhone() {
		return this.businessAdressPhone;
	}

	public void setBusinessAdressPhone(String businessAdressPhone) {
		this.businessAdressPhone = businessAdressPhone;
	}

	@Column(name = "legal_person_name", nullable = false, length = 15)
	public String getLegalPersonName() {
		return this.legalPersonName;
	}

	public void setLegalPersonName(String legalPersonName) {
		this.legalPersonName = legalPersonName;
	}

	@Column(name = "legal_person_certificate_type_id", nullable = false)
	public Integer getLegalPersonCertificateTypeId() {
		return this.legalPersonCertificateTypeId;
	}

	public void setLegalPersonCertificateTypeId(
			Integer legalPersonCertificateTypeId) {
		this.legalPersonCertificateTypeId = legalPersonCertificateTypeId;
	}

	@Column(name = "legal_person_certificate_number", nullable = false, length = 18)
	public String getLegalPersonCertificateNumber() {
		return this.legalPersonCertificateNumber;
	}

	public void setLegalPersonCertificateNumber(
			String legalPersonCertificateNumber) {
		this.legalPersonCertificateNumber = legalPersonCertificateNumber;
	}

	@Column(name = "register_date", length = 19)
	public Date getRegisterDate() {
		return this.registerDate;
	}

	public void setRegisterDate(Date registerDate) {
		this.registerDate = registerDate;
	}

	@Column(name = "tax_authority", length = 50)
	public String getTaxAuthority() {
		return this.taxAuthority;
	}

	public void setTaxAuthority(String taxAuthority) {
		this.taxAuthority = taxAuthority;
	}

	@Column(name = "tax_sub_authority", length = 80)
	public String getTaxSubAuthority() {
		return this.taxSubAuthority;
	}

	public void setTaxSubAuthority(String taxSubAuthority) {
		this.taxSubAuthority = taxSubAuthority;
	}

	@Column(name = "tax_admin", length = 15)
	public String getTaxAdmin() {
		return this.taxAdmin;
	}

	public void setTaxAdmin(String taxAdmin) {
		this.taxAdmin = taxAdmin;
	}

	@Column(name = "street_town", length = 40)
	public String getStreetTown() {
		return this.streetTown;
	}

	public void setStreetTown(String streetTown) {
		this.streetTown = streetTown;
	}

	@Column(name = "bt_to_vat_type", length = 20)
	public String getBtToVatType() {
		return this.btToVatType;
	}

	public void setBtToVatType(String btToVatType) {
		this.btToVatType = btToVatType;
	}

	@Column(name = "business_scope", length = 40)
	public String getBusinessScope() {
		return this.businessScope;
	}

	public void setBusinessScope(String businessScope) {
		this.businessScope = businessScope;
	}

	@Column(name = "accounting_system", length = 20)
	public String getAccountingSystem() {
		return this.accountingSystem;
	}

	public void setAccountingSystem(String accountingSystem) {
		this.accountingSystem = accountingSystem;
	}

	@Column(name = "permit_method", length = 20)
	public String getPermitMethod() {
		return this.permitMethod;
	}

	public void setPermitMethod(String permitMethod) {
		this.permitMethod = permitMethod;
	}

	@Column(name = "calculate_method", length = 30)
	public String getCalculateMethod() {
		return this.calculateMethod;
	}

	public void setCalculateMethod(String calculateMethod) {
		this.calculateMethod = calculateMethod;
	}

	@Column(name = "state_owned_control_type", length = 20)
	public String getStateOwnedControlType() {
		return this.stateOwnedControlType;
	}

	public void setStateOwnedControlType(String stateOwnedControlType) {
		this.stateOwnedControlType = stateOwnedControlType;
	}

	@Column(name = "state_owned_inverst_rate", precision = 12, scale = 0)
	public float getStateOwnedInverstRate() {
		return this.stateOwnedInverstRate;
	}

	public void setStateOwnedInverstRate(float stateOwnedInverstRate) {
		this.stateOwnedInverstRate = stateOwnedInverstRate;
	}

	@Column(name = "natural_person_inverst_rate", precision = 12, scale = 0)
	public float getNaturalPersonInverstRate() {
		return this.naturalPersonInverstRate;
	}

	public void setNaturalPersonInverstRate(float naturalPersonInverstRate) {
		this.naturalPersonInverstRate = naturalPersonInverstRate;
	}

	@Column(name = "foreign_inverst_rate", precision = 12, scale = 0)
	public float getForeignInverstRate() {
		return this.foreignInverstRate;
	}

	public void setForeignInverstRate(float foreignInverstRate) {
		this.foreignInverstRate = foreignInverstRate;
	}

	@Column(name = "register_capital")
	public long getRegisterCapital() {
		return this.registerCapital;
	}

	public void setRegisterCapital(long registerCapital) {
		this.registerCapital = registerCapital;
	}

	@Column(name = "total_inverst")
	public long getTotalInverst() {
		return this.totalInverst;
	}

	public void setTotalInverst(long totalInverst) {
		this.totalInverst = totalInverst;
	}

	@Column(name = "partner_number")
	public Integer getPartnerNumber() {
		return this.partnerNumber;
	}

	public void setPartnerNumber(Integer partnerNumber) {
		this.partnerNumber = partnerNumber;
	}

	@Column(name = "total_sub_org_type", length = 20)
	public String getTotalSubOrgType() {
		return this.totalSubOrgType;
	}

	public void setTotalSubOrgType(String totalSubOrgType) {
		this.totalSubOrgType = totalSubOrgType;
	}

	@Column(name = "cross_zone_tax_reg_mark", length = 10)
	public String getCrossZoneTaxRegMark() {
		return this.crossZoneTaxRegMark;
	}

	public void setCrossZoneTaxRegMark(String crossZoneTaxRegMark) {
		this.crossZoneTaxRegMark = crossZoneTaxRegMark;
	}

	@Column(name = "permit_establish_authority", length = 40)
	public String getPermitEstablishAuthority() {
		return this.permitEstablishAuthority;
	}

	public void setPermitEstablishAuthority(String permitEstablishAuthority) {
		this.permitEstablishAuthority = permitEstablishAuthority;
	}

	@Column(name = "license_number", length = 30)
	public String getLicenseNumber() {
		return this.licenseNumber;
	}

	public void setLicenseNumber(String licenseNumber) {
		this.licenseNumber = licenseNumber;
	}

	@Column(name = "open_business_date", length = 19)
	public Date getOpenBusinessDate() {
		return this.openBusinessDate;
	}

	public void setOpenBusinessDate(Date openBusinessDate) {
		this.openBusinessDate = openBusinessDate;
	}

	@Column(name = "business_begin_date", length = 19)
	public Date getBusinessBeginDate() {
		return this.businessBeginDate;
	}

	public void setBusinessBeginDate(Date businessBeginDate) {
		this.businessBeginDate = businessBeginDate;
	}

	@Column(name = "business_end_date", length = 19)
	public Date getBusinessEndDate() {
		return this.businessEndDate;
	}

	public void setBusinessEndDate(Date businessEndDate) {
		this.businessEndDate = businessEndDate;
	}

	@Column(name = "valid_mark")
	public String getValidMark() {
		return this.validMark;
	}

	public void setValidMark(String validMark) {
		this.validMark = validMark;
	}

	@Column(name = "register_number")
	public long getRegisterNumber() {
		return this.registerNumber;
	}

	public void setRegisterNumber(long registerNumber) {
		this.registerNumber = registerNumber;
	}

	@Column(name = "input_person", length = 15)
	public String getInputPerson() {
		return this.inputPerson;
	}

	public void setInputPerson(String inputPerson) {
		this.inputPerson = inputPerson;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "input_date", length = 10)
	public Date getInputDate() {
		return this.inputDate;
	}

	public void setInputDate(Date inputDate) {
		this.inputDate = inputDate;
	}

	@Column(name = "modified_person", length = 15)
	public String getModifiedPerson() {
		return this.modifiedPerson;
	}

	public void setModifiedPerson(String modifiedPerson) {
		this.modifiedPerson = modifiedPerson;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "modified_date", length = 10)
	public Date getModifiedDate() {
		return this.modifiedDate;
	}

	public void setModifiedDate(Date modifiedDate) {
		this.modifiedDate = modifiedDate;
	}

}