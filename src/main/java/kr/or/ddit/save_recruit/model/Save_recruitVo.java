package kr.or.ddit.save_recruit.model;

public class Save_recruitVo {
	private String save_code;		// 저장코드
	private String recruit_code;	// 채용공고코드
	private String user_id;			// 회원아이디
	
	public Save_recruitVo() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "Save_recruitVo [save_code=" + save_code + ", recruit_code=" + recruit_code + ", user_id=" + user_id
				+ "]";
	}

	public String getSave_code() {
		return save_code;
	}

	public void setSave_code(String save_code) {
		this.save_code = save_code;
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
	
}
