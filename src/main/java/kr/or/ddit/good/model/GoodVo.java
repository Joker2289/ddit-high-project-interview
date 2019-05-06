package kr.or.ddit.good.model;

public class GoodVo {
	
	private String good_code;	// 좋아요 번호
	private String mem_id;		// 회원아이디		
	private String ref_code;	// 참조코드
	private String division;	// 구분
	private String good_date;	// 좋아요 날짜
	private String mem_name;
	private String profile_path;
	private String mem_division;
	
	public GoodVo() {
		
	}

	public String getMem_division() {
		return mem_division;
	}
	public void setMem_division(String mem_division) {
		this.mem_division = mem_division;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getProfile_path() {
		return profile_path;
	}
	public void setProfile_path(String profile_path) {
		this.profile_path = profile_path;
	}
	public String getGood_code() {
		return good_code;
	}
	public void setGood_code(String good_code) {
		this.good_code = good_code;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getRef_code() {
		return ref_code;
	}
	public void setRef_code(String ref_code) {
		this.ref_code = ref_code;
	}
	public String getDivision() {
		return division;
	}
	public void setDivision(String division) {
		this.division = division;
	}
	public String getGood_date() {
		return good_date;
	}
	public void setGood_date(String good_date) {
		this.good_date = good_date;
	}
	@Override
	public String toString() {
		return "GoodVo [good_code=" + good_code + ", mem_id=" + mem_id + ", ref_code=" + ref_code + ", division="
				+ division + ", good_date=" + good_date + ", mem_name=" + mem_name + ", profile_path=" + profile_path
				+ ", mem_division=" + mem_division + "]";
	}
}
