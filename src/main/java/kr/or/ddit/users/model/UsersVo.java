package kr.or.ddit.users.model;

public class UsersVo {
	private String user_id;			// 회원아이디
	private String user_name;		// 회원이름
	private String bg_img;			// 배경사진
	private String bg_path;			// 배경사진경로
	private String profile_img;		// 프로필사진
	private String profile_path;	// 프로필사진경로
	private String addr1;			// 주소
	private String addr2;			// 상세주소
	private String zipcode;			// 우편번호
	private String email;			// 이메일
	private String telno;			// 전화번호
	private String user_birth;		// 생년월일
	private String persnal_url;		// 외부URL
	private String profile_contents;// 간단 소개글
	
	



	public UsersVo() {
		// TODO Auto-generated constructor stub
	}
	
	public String getProfile_contents() {
		return profile_contents;
	}

	public void setProfile_contents(String profile_contents) {
		this.profile_contents = profile_contents;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
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

	public String getUser_birth() {
		return user_birth;
	}

	public void setUser_birth(String user_birth) {
		this.user_birth = user_birth;
	}

	public String getPersnal_url() {
		return persnal_url;
	}

	public void setPersnal_url(String persnal_url) {
		this.persnal_url = persnal_url;
	}

	@Override
	public String toString() {
		return "UsersVo [user_id=" + user_id + ", user_name=" + user_name + ", bg_img=" + bg_img + ", bg_path="
				+ bg_path + ", profile_img=" + profile_img + ", profile_path=" + profile_path + ", addr1=" + addr1
				+ ", addr2=" + addr2 + ", zipcode=" + zipcode + ", email=" + email + ", telno=" + telno
				+ ", user_birth=" + user_birth + ", persnal_url=" + persnal_url + ", profile_contents="
				+ profile_contents + "]";
	}

}
