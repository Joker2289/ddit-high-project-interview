package kr.or.ddit.recruit.model;

public class RecruitVo {
	private String recruit_code;		// 채용공고코드
	private String corp_id;				// 회사아이디
	private String recruit_title;		// 제목
	private String job_type;			// 업무분야
	private String recruit_contents;	// 업무상세내용
	private String start_date;			// 시작일
	private String end_date;			// 종료일
	private String personnel;			// 모집인원
	private String job_rank;			// 직급
	private String emp_type;			// 고용형태
	private String app_type;			// 간편지원여부
	private String app_count;			// 지원자 수
	
	public RecruitVo() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "RecruitVo [recruit_code=" + recruit_code + ", corp_id=" + corp_id + ", recruit_title=" + recruit_title
				+ ", job_type=" + job_type + ", recruit_contents=" + recruit_contents + ", start_date=" + start_date
				+ ", end_date=" + end_date + ", personnel=" + personnel + ", job_rank=" + job_rank + ", emp_type="
				+ emp_type + ", app_type=" + app_type + ", app_count=" + app_count + "]";
	}

	public String getRecruit_code() {
		return recruit_code;
	}

	public void setRecruit_code(String recruit_code) {
		this.recruit_code = recruit_code;
	}

	public String getCorp_id() {
		return corp_id;
	}

	public void setCorp_id(String corp_id) {
		this.corp_id = corp_id;
	}

	public String getRecruit_title() {
		return recruit_title;
	}

	public void setRecruit_title(String recruit_title) {
		this.recruit_title = recruit_title;
	}

	public String getJob_type() {
		return job_type;
	}

	public void setJob_type(String job_type) {
		this.job_type = job_type;
	}

	public String getRecruit_contents() {
		return recruit_contents;
	}

	public void setRecruit_contents(String recruit_contents) {
		this.recruit_contents = recruit_contents;
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

	public String getPersonnel() {
		return personnel;
	}

	public void setPersonnel(String personnel) {
		this.personnel = personnel;
	}

	public String getJob_rank() {
		return job_rank;
	}

	public void setJob_rank(String job_rank) {
		this.job_rank = job_rank;
	}

	public String getEmp_type() {
		return emp_type;
	}

	public void setEmp_type(String emp_type) {
		this.emp_type = emp_type;
	}

	public String getApp_type() {
		return app_type;
	}

	public void setApp_type(String app_type) {
		this.app_type = app_type;
	}

	public String getApp_count() {
		return app_count;
	}

	public void setApp_count(String app_count) {
		this.app_count = app_count;
	}
	
}
