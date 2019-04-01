package kr.or.ddit.corporation.model;

import java.util.Date;

public class CorporationVo {
	
	private String corp_code;		// 회사코드
	private String corp_id;			// 회사아이디
	private String corp_name;		// 회사명
	private String bg_img;			// 배경사진
	private String bg_path;			// 배경사진경로
	private String corp_logo;		// 로고
	private String logo_path;		// 로고경로
	private String addr1;			// 주소
	private String addr2;			// 상세주소
	private String zipcode;			// 우편번호
	private Date   corp_birth;		// 창립일
	private String corp_type;		// 회사유형
	private String industry_type;	// 업계
	private String corp_url;		// 회사URL
	private String corp_size;		// 회사규모
	private String corp_profile;	// 소개문구
	private String email;			// 이메일
	private String telno;			// 전화번호
	private String corp_location;	// 회사좌표
	
	public CorporationVo() {
		
	}

	@Override
	public String toString() {
		return "CorporationVo [corp_code=" + corp_code + ", corp_id=" + corp_id + ", corp_name=" + corp_name
				+ ", bg_img=" + bg_img + ", bg_path=" + bg_path + ", corp_logo=" + corp_logo + ", logo_path="
				+ logo_path + ", addr1=" + addr1 + ", addr2=" + addr2 + ", zipcode=" + zipcode + ", corp_birth="
				+ corp_birth + ", corp_type=" + corp_type + ", industry_type=" + industry_type + ", corp_url="
				+ corp_url + ", corp_size=" + corp_size + ", corp_profile=" + corp_profile + ", email=" + email
				+ ", telno=" + telno + ", corp_location=" + corp_location + "]";
	}

	public String getCorp_code() {
		return corp_code;
	}

	public void setCorp_code(String corp_code) {
		this.corp_code = corp_code;
	}

	public String getCorp_id() {
		return corp_id;
	}

	public void setCorp_id(String corp_id) {
		this.corp_id = corp_id;
	}

	public String getCorp_name() {
		return corp_name;
	}

	public void setCorp_name(String corp_name) {
		this.corp_name = corp_name;
	}

	public String getBg_img() {
		return bg_img;
	}

	public void setBg_img(String bg_img) {
		this.bg_img = bg_img;
	}

	public String getBg_path() {
		return bg_path;
	}

	public void setBg_path(String bg_path) {
		this.bg_path = bg_path;
	}

	public String getCorp_logo() {
		return corp_logo;
	}

	public void setCorp_logo(String corp_logo) {
		this.corp_logo = corp_logo;
	}

	public String getLogo_path() {
		return logo_path;
	}

	public void setLogo_path(String logo_path) {
		this.logo_path = logo_path;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public Date getCorp_birth() {
		return corp_birth;
	}

	public void setCorp_birth(Date corp_birth) {
		this.corp_birth = corp_birth;
	}

	public String getCorp_type() {
		return corp_type;
	}

	public void setCorp_type(String corp_type) {
		this.corp_type = corp_type;
	}

	public String getIndustry_type() {
		return industry_type;
	}

	public void setIndustry_type(String industry_type) {
		this.industry_type = industry_type;
	}

	public String getCorp_url() {
		return corp_url;
	}

	public void setCorp_url(String corp_url) {
		this.corp_url = corp_url;
	}

	public String getCorp_size() {
		return corp_size;
	}

	public void setCorp_size(String corp_size) {
		this.corp_size = corp_size;
	}

	public String getCorp_profile() {
		return corp_profile;
	}

	public void setCorp_profile(String corp_profile) {
		this.corp_profile = corp_profile;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTelno() {
		return telno;
	}

	public void setTelno(String telno) {
		this.telno = telno;
	}

	public String getCorp_location() {
		return corp_location;
	}

	public void setCorp_location(String corp_location) {
		this.corp_location = corp_location;
	}





}
