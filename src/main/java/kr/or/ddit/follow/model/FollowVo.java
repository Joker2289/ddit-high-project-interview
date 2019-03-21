package kr.or.ddit.follow.model;

public class FollowVo {
	
	private String follow_code;	// 팔로우코드
	private String mem_id;		// 회원아이디
	private String ref_keyword;	// 참조키워드
	private String division;	// 구분
	
	public FollowVo() {
		
	}

	public String getFollow_code() {
		return follow_code;
	}

	public void setFollow_code(String follow_code) {
		this.follow_code = follow_code;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getRef_keyword() {
		return ref_keyword;
	}

	public void setRef_keyword(String ref_keyword) {
		this.ref_keyword = ref_keyword;
	}

	public String getDivision() {
		return division;
	}

	public void setDivision(String division) {
		this.division = division;
	}

	@Override
	public String toString() {
		return "FollowVo [follow_code=" + follow_code + ", mem_id=" + mem_id + ", ref_keyword=" + ref_keyword
				+ ", division=" + division + "]";
	}
	
}
