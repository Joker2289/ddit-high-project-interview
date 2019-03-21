package kr.or.ddit.possesion_skills.model;

public class Possesion_skillsVo {
	private String pskill_code;		// 자격증코드
	private String user_id;			// 회원아이디
	private String pskill_name;		// 자격기술명
	private String issue_org;		// 발급처
	private String issue_date;		// 발급일자
	private String contents;		// 발급일자
	
	public Possesion_skillsVo() {
		// TODO Auto-generated constructor stub
	}

	public String getPskill_code() {
		return pskill_code;
	}

	public void setPskill_code(String pskill_code) {
		this.pskill_code = pskill_code;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getPskill_name() {
		return pskill_name;
	}

	public void setPskill_name(String pskill_name) {
		this.pskill_name = pskill_name;
	}

	public String getIssue_org() {
		return issue_org;
	}

	public void setIssue_org(String issue_org) {
		this.issue_org = issue_org;
	}

	public String getIssue_date() {
		return issue_date;
	}

	public void setIssue_date(String issue_date) {
		this.issue_date = issue_date;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	@Override
	public String toString() {
		return "Possesion_skillsVo [pskill_code=" + pskill_code + ", user_id=" + user_id + ", pskill_name="
				+ pskill_name + ", issue_org=" + issue_org + ", issue_date=" + issue_date + ", contents=" + contents
				+ "]";
	}
	
}
