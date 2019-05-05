package kr.or.ddit.signup.model;

import java.util.Date;

public class SignupVo {
	
	//step1
	private String id;				// 회원아이디
	private String pass;		 	// 비밀번호
	private String email;		 	// 이메일
	private String name;			// 회원 이름
	private String division;		// 회원구분

	//step2
	private String securityCode;	// 인증코드
	
	//step4_career
	private String job_position;	// 직군
	private String job_rank;		// 직급
	private String corporate_name;	// 회사
	private Date   join_date;		// 입사일
	private Date   resign_date;		// 퇴사일
	
	//step4_education
	private String school_name;		// 학교명
	private String degree_name;		// 학위
	private String major;			// 전공
	private Date admission;			// 입학년도
	private Date graduation;		// 졸업(예정)년도
	private String grade;			// 학점
	
	//step3_corp
	private Date corp_birth;		// 창립일
	private String corp_type;		// 회사유형
	private String industry_type;	// 업계
	private String corp_size;		// 회사규모
	
	//step4_corp, step3
	private String addr1;			// 주소
	private String addr2;			// 상세주소
	private String zipcode;			// 우편번호
	private String telno;			// 전화번호
	private String location_data;	// 회사좌표
	
	//kakaoLogin
	private String kakaoId;
	private String kakaoProfile; 	//카카오 프로필
	private String kakaoName;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDivision() {
		return division;
	}
	public void setDivision(String division) {
		this.division = division;
	}
	public String getSecurityCode() {
		return securityCode;
	}
	public void setSecurityCode(String securityCode) {
		this.securityCode = securityCode;
	}
	public String getJob_position() {
		return job_position;
	}
	public void setJob_position(String job_position) {
		this.job_position = job_position;
	}
	public String getJob_rank() {
		return job_rank;
	}
	public void setJob_rank(String job_rank) {
		this.job_rank = job_rank;
	}
	public String getCorporate_name() {
		return corporate_name;
	}
	public void setCorporate_name(String corporate_name) {
		this.corporate_name = corporate_name;
	}
	public Date getJoin_date() {
		return join_date;
	}
	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}
	public Date getResign_date() {
		return resign_date;
	}
	public void setResign_date(Date resign_date) {
		this.resign_date = resign_date;
	}
	public String getSchool_name() {
		return school_name;
	}
	public void setSchool_name(String school_name) {
		this.school_name = school_name;
	}
	public String getDegree_name() {
		return degree_name;
	}
	public void setDegree_name(String degree_name) {
		this.degree_name = degree_name;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public Date getAdmission() {
		return admission;
	}
	public void setAdmission(Date admission) {
		this.admission = admission;
	}
	public Date getGraduation() {
		return graduation;
	}
	public void setGraduation(Date graduation) {
		this.graduation = graduation;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
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
	public String getCorp_size() {
		return corp_size;
	}
	public void setCorp_size(String corp_size) {
		this.corp_size = corp_size;
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
	public String getTelno() {
		return telno;
	}
	public void setTelno(String telno) {
		this.telno = telno;
	}
	public String getKakaoProfile() {
		return kakaoProfile;
	}
	public void setKakaoProfile(String kakaoProfile) {
		this.kakaoProfile = kakaoProfile;
	}
	public String getKakaoId() {
		return kakaoId;
	}
	public void setKakaoId(String kakaoId) {
		this.kakaoId = kakaoId;
	}
	public String getKakaoName() {
		return kakaoName;
	}
	public void setKakaoName(String kakaoName) {
		this.kakaoName = kakaoName;
	}
	public String getLocation_data() {
		return location_data;
	}
	public void setLocation_data(String location_data) {
		this.location_data = location_data;
	}
	@Override
	public String toString() {
		return "SignupVo [id=" + id + ", pass=" + pass + ", email=" + email + ", name=" + name + ", division="
				+ division + ", securityCode=" + securityCode + ", job_position=" + job_position + ", job_rank="
				+ job_rank + ", corporate_name=" + corporate_name + ", join_date=" + join_date + ", resign_date="
				+ resign_date + ", school_name=" + school_name + ", degree_name=" + degree_name + ", major=" + major
				+ ", admission=" + admission + ", graduation=" + graduation + ", grade=" + grade + ", corp_birth="
				+ corp_birth + ", corp_type=" + corp_type + ", industry_type=" + industry_type + ", corp_size="
				+ corp_size + ", addr1=" + addr1 + ", addr2=" + addr2 + ", zipcode=" + zipcode + ", telno=" + telno
				+ ", location_data=" + location_data + ", kakaoId=" + kakaoId + ", kakaoProfile=" + kakaoProfile
				+ ", kakaoName=" + kakaoName + "]";
	}

}
