package kr.or.ddit.apply_recruit.model;

public class Apply_recruitVo {
	
	private String apply_code;		// 지원코드
	private String recruit_code;	// 채용공고코드
	private String user_id;			// 회원아이디
	
	public Apply_recruitVo() {
		
	}

	public String getApply_code() {
		return apply_code;
	}

	public void setApply_code(String apply_code) {
		this.apply_code = apply_code;
	}

	public String getRecruit_code() {
		return recruit_code;
	}

	public void setRecruit_code(String recruit_code) {
		this.recruit_code = recruit_code;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	@Override
	public String toString() {
		return "Apply_recruitVo [apply_code=" + apply_code + ", recruit_code=" + recruit_code + ", user_id=" + user_id
				+ "]";
	}
	
}
