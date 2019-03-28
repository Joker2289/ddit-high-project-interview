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
	
	private String profile_img;		// 프로필사진
	private String profile_path;	// 프로필경로
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
	public String getProfile_img() {
		return profile_img;
	}
	public void setProfile_img(String profile_img) {
		this.profile_img = profile_img;
	}
	public String getProfile_path() {
		return profile_path;
	}
	public void setProfile_path(String profile_path) {
		this.profile_path = profile_path;
	}
	
	@Override
	public String toString() {
		return "SignupUserVo [id=" + id + ", pass=" + pass + ", email=" + email + ", name=" + name + ", division="
				+ division + ", securityCode=" + securityCode + ", job_position=" + job_position + ", job_rank="
				+ job_rank + ", corporate_name=" + corporate_name + ", profile_img=" + profile_img + ", profile_path="
				+ profile_path + "]";
	}
	
	
	
	
}
