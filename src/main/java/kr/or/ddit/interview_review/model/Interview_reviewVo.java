package kr.or.ddit.interview_review.model;

public class Interview_reviewVo {
	
	private String ir_code;			// 면접후기코드
	private String user_id;			// 작성자아이디
	private String corp_id;			// 회사아이디
	private String job_position;	// 직군
	private String job_rank;		// 직급
	private String ir_contents;		// 리뷰내용
	private String hire_whether;	// 합격여부
	private String write_date;		// 작성일

	public Interview_reviewVo() {
		
	}

	public String getIr_code() {
		return ir_code;
	}

	public void setIr_code(String ir_code) {
		this.ir_code = ir_code;
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

	public String getIr_contents() {
		return ir_contents;
	}

	public void setIr_contents(String ir_contents) {
		this.ir_contents = ir_contents;
	}

	public String getHire_whether() {
		return hire_whether;
	}

	public void setHire_whether(String hire_whether) {
		this.hire_whether = hire_whether;
	}

	public String getWrite_date() {
		return write_date;
	}

	public void setWrite_date(String write_date) {
		this.write_date = write_date;
	}

	@Override
	public String toString() {
		return "Interview_reviewVo [ir_code=" + ir_code + ", user_id=" + user_id + ", corp_id=" + corp_id
				+ ", job_position=" + job_position + ", job_rank=" + job_rank + ", ir_contents=" + ir_contents
				+ ", hire_whether=" + hire_whether + ", write_date=" + write_date + "]";
	}

}
