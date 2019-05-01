package kr.or.ddit.corporate_review.model;

public class Corporate_reviewVo {
	
	private String cr_code;		// 기업리뷰코드
	private String user_id;		// 작성자아이디
	private String corp_id;		// 회사아이디
	private String job_rank;	// 직급
	private String cr_contents;	// 리뷰내용
	private String write_date;  // 작성일
	private String reviewCnt; // 리뷰 총 갯수
	
	public Corporate_reviewVo() {
		
	}

	public String getCr_code() {
		return cr_code;
	}

	public void setCr_code(String cr_code) {
		this.cr_code = cr_code;
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

	public String getJob_rank() {
		return job_rank;
	}

	public void setJob_rank(String job_rank) {
		this.job_rank = job_rank;
	}

	public String getCr_contents() {
		return cr_contents;
	}

	public void setCr_contents(String cr_contents) {
		this.cr_contents = cr_contents;
	}

	public String getWrite_date() {
		return write_date;
	}

	public void setWrite_date(String write_date) {
		this.write_date = write_date;
	}

	public String getReviewCnt() {
		return reviewCnt;
	}

	public void setReviewCnt(String reviewCnt) {
		this.reviewCnt = reviewCnt;
	}

	@Override
	public String toString() {
		return "Corporate_reviewVo [cr_code=" + cr_code + ", user_id=" + user_id + ", corp_id=" + corp_id
				+ ", job_rank=" + job_rank + ", cr_contents=" + cr_contents + ", write_date=" + write_date + "]";
	}
}
