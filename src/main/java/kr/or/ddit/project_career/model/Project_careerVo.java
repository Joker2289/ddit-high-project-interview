package kr.or.ddit.project_career.model;

public class Project_careerVo {
	private String project_code;	// 프로젝트코드
	private String user_id;			// 회원아이디
	private String project_name;	// 프로젝트이름
	private String start_date;		// 시작일
	private String end_date;		// 종료일
	private String project_leader;	// 프로젝트리더
	private String project_url;		// 프로젝트URL
	private String contents;		// 설명

	public Project_careerVo() {
		// TODO Auto-generated constructor stub
	}

	public String getProject_code() {
		return project_code;
	}

	public void setProject_code(String project_code) {
		this.project_code = project_code;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getProject_name() {
		return project_name;
	}

	public void setProject_name(String project_name) {
		this.project_name = project_name;
	}

	public String getStart_date() {
		return start_date;
	}

	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}

	public String getEnd_date() {
		return end_date;
	}

	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}

	public String getProject_leader() {
		return project_leader;
	}

	public void setProject_leader(String project_leader) {
		this.project_leader = project_leader;
	}

	public String getProject_url() {
		return project_url;
	}

	public void setProject_url(String project_url) {
		this.project_url = project_url;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	@Override
	public String toString() {
		return "Project_careerVo [project_code=" + project_code + ", user_id=" + user_id + ", project_name="
				+ project_name + ", start_date=" + start_date + ", end_date=" + end_date + ", project_leader="
				+ project_leader + ", project_url=" + project_url + ", contents=" + contents + "]";
	}
	
}
