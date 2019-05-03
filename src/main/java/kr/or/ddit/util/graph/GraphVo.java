package kr.or.ddit.util.graph;

public class GraphVo {
	
	private String user_id;
	private String user_name;
	private String profile_path;
	private String receive_accept;
	private String job_position;
	private String school_name;
	private String major;
	private String profile_contents;
	private String corp_code;
	
	public String getProfile_contents() {
		return profile_contents;
	}
	
	public String getCorp_code() {
		return corp_code;
	}
	public void setCorp_code(String corp_code) {
		this.corp_code = corp_code;
	}
	public void setProfile_contents(String profile_contents) {
		this.profile_contents = profile_contents;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getProfile_path() {
		return profile_path;
	}
	public void setProfile_path(String profile_path) {
		this.profile_path = profile_path;
	}
	public String getReceive_accept() {
		return receive_accept;
	}
	public void setReceive_accept(String receive_accept) {
		this.receive_accept = receive_accept;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getJob_position() {
		return job_position;
	}
	public void setJob_position(String job_position) {
		this.job_position = job_position;
	}
	public String getSchool_name() {
		return school_name;
	}
	public void setSchool_name(String school_name) {
		this.school_name = school_name;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	@Override
	public String toString() {
		return "GraphVo [user_id=" + user_id + ", user_name=" + user_name + ", profile_path=" + profile_path
				+ ", receive_accept=" + receive_accept + ", job_position=" + job_position + ", school_name="
				+ school_name + ", major=" + major + ", profile_contents=" + profile_contents + ", corp_code="
				+ corp_code + "]";
	}
}
