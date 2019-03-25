package kr.or.ddit.award_history.model;

public class Award_historyVo {
	
	private String award_code;	// 수상이력코드
	private String user_id;		// 회원아이디
	private String award_name;	// 상이름
	private String award_org;	// 발급기관
	private String award_date;	// 수상일자
	private String contents;	// 설명
	
	public Award_historyVo() {
		
	}

	public String getAward_code() {
		return award_code;
	}

	public void setAward_code(String award_code) {
		this.award_code = award_code;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getAward_name() {
		return award_name;
	}

	public void setAward_name(String award_name) {
		this.award_name = award_name;
	}

	public String getAward_org() {
		return award_org;
	}

	public void setAward_org(String award_org) {
		this.award_org = award_org;
	}

	public String getAward_date() {
		return award_date;
	}

	public void setAward_date(String award_date) {
		this.award_date = award_date;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	@Override
	public String toString() {
		return "Award_historyVo [award_code=" + award_code + ", user_id=" + user_id + ", award_name=" + award_name
				+ ", award_org=" + award_org + ", award_date=" + award_date + ", contents=" + contents + "]";
	}
	
}
