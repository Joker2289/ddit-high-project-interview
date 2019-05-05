package kr.or.ddit.career_info.model;

import java.util.Date;

public class Career_infoVo {
	
	private String career_code;		// 경력코드
	private String user_id;			// 회원아이디
	private String job_position;	// 직군
	private String job_rank;		// 직급
	private String corporate_name;	// 회사
	private String corp_local;		// 지역
	private Date   join_date;		// 입사일
	private Date   resign_date;		// 퇴사일
	private String contents;		// 설명
	private String corp_code;		// 회사코드
	private String currval;			// 현재 시퀀스값
	private String month;			// 현재 개월수
	private String logo_path;		// logo
	private String corp_id;			// 회사아이디
	
	public Career_infoVo() {
		
	}

	public String getCareer_code() {
		return career_code;
	}

	public void setCareer_code(String career_code) {
		this.career_code = career_code;
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

	public String getJob_rank() {
		return job_rank;
	}

	public void setJob_rank(String job_rank) {
		this.job_rank = job_rank;
	}

	public String getCorporate_name() {
		return corporate_name;
	}

	public void setCorporate_name(String corporate_name) {
		this.corporate_name = corporate_name;
	}

	public String getCorp_local() {
		return corp_local;
	}

	public void setCorp_local(String corp_local) {
		this.corp_local = corp_local;
	}

	public Date getJoin_date() {
		return join_date;
	}

	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}

	public Date getResign_date() {
		return resign_date;
	}

	public void setResign_date(Date resign_date) {
		this.resign_date = resign_date;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getCorp_code() {
		return corp_code;
	}

	public void setCorp_code(String corp_code) {
		this.corp_code = corp_code;
	}
	
	public String getCurrval() {
		return currval;
	}

	public void setCurrval(String currval) {
		this.currval = currval;
	}
	
	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}
	

	public String getLogo_path() {
		return logo_path;
	}

	public void setLogo_path(String logo_path) {
		this.logo_path = logo_path;
	}
	
	

	public String getCorp_id() {
		return corp_id;
	}

	public void setCorp_id(String corp_id) {
		this.corp_id = corp_id;
	}

	@Override
	public String toString() {
		return "Career_infoVo [career_code=" + career_code + ", user_id=" + user_id + ", job_position=" + job_position
				+ ", job_rank=" + job_rank + ", corporate_name=" + corporate_name + ", corp_local=" + corp_local
				+ ", join_date=" + join_date + ", resign_date=" + resign_date + ", contents=" + contents
				+ ", corp_code=" + corp_code + ", currval=" + currval + ", month=" + month + ", logo_path=" + logo_path
				+ ", corp_id=" + corp_id + "]";
	}

	

}
