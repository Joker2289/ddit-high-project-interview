package kr.or.ddit.salary_info.model;

public class Salary_infoVo {
	private String salary_code;		// 연봉정보글코드
	private String user_id;			// 작성자아이디
	private String corp_id;			// 회사아이디
	private String salary_info;		// 연봉정보
	private String job_position;	// 직군
	private String job_rank;		// 직급
	private String write_date;		// 작성일
	
	public Salary_infoVo() {
		// TODO Auto-generated constructor stub
	}

	public String getSalary_code() {
		return salary_code;
	}

	public void setSalary_code(String salary_code) {
		this.salary_code = salary_code;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getCorp_id() {
		return corp_id;
	}

	public void setCorp_id(String corp_id) {
		this.corp_id = corp_id;
	}

	public String getSalary_info() {
		return salary_info;
	}

	public void setSalary_info(String salary_info) {
		this.salary_info = salary_info;
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

	public String getWrite_date() {
		return write_date;
	}

	public void setWrite_date(String write_date) {
		this.write_date = write_date;
	}

	@Override
	public String toString() {
		return "Salary_infoVo [salary_code=" + salary_code + ", user_id=" + user_id + ", corp_id=" + corp_id
				+ ", salary_info=" + salary_info + ", job_position=" + job_position + ", job_rank=" + job_rank
				+ ", write_date=" + write_date + "]";
	}
	
}
