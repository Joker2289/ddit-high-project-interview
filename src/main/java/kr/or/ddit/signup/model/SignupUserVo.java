package kr.or.ddit.signup.model;

public class SignupUserVo {
	
	//step1
	private String id;				// 회원아이디
	private String pass;		 	// 비밀번호
	private String email;		 	// 이메일
	private String name;			// 회원 이름
	private String division;		// 회원구분

	//step2
	private String securityCode;	// 인증코드
	
	//step3
	private String job_position;	// 직군
	private String job_rank;		// 직급
	private String corporate_name;	// 회사
	
	//step4
	private String school_name;		// 학교명
	private String degree_name;		// 학위
	private String major;			// 전공
	private String admission;		// 입학년도
	private String graduation;		// 졸업(예정)년도
	private String grade;			// 학점
	
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
	public String getAdmission() {
		return admission;
	}
	public void setAdmission(String admission) {
		this.admission = admission;
	}
	public String getGraduation() {
		return graduation;
	}
	public void setGraduation(String graduation) {
		this.graduation = graduation;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	@Override
	public String toString() {
		return "SignupUserVo [id=" + id + ", pass=" + pass + ", email=" + email + ", name=" + name + ", division="
				+ division + ", securityCode=" + securityCode + ", job_position=" + job_position + ", job_rank="
				+ job_rank + ", corporate_name=" + corporate_name + ", school_name=" + school_name + ", degree_name="
				+ degree_name + ", major=" + major + ", admission=" + admission + ", graduation=" + graduation
				+ ", grade=" + grade + "]";
	}
	
}
