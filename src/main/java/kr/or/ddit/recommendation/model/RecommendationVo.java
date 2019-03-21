package kr.or.ddit.recommendation.model;

public class RecommendationVo {
	private String recom_code;		// 추천서코드
	private String user_id;			// 회원아이디
	private String recom_id;		// 추천인아이디
	private String recom_contents;	// 추천서내용
	private String recom_relation;	// 관계
	private String recom_date;		// 작성날짜

	public RecommendationVo() {
		// TODO Auto-generated constructor stub
	}

	public String getRecom_code() {
		return recom_code;
	}

	public void setRecom_code(String recom_code) {
		this.recom_code = recom_code;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getRecom_id() {
		return recom_id;
	}

	public void setRecom_id(String recom_id) {
		this.recom_id = recom_id;
	}

	public String getRecom_contents() {
		return recom_contents;
	}

	public void setRecom_contents(String recom_contents) {
		this.recom_contents = recom_contents;
	}

	public String getRecom_relation() {
		return recom_relation;
	}

	public void setRecom_relation(String recom_relation) {
		this.recom_relation = recom_relation;
	}

	public String getRecom_date() {
		return recom_date;
	}

	public void setRecom_date(String recom_date) {
		this.recom_date = recom_date;
	}

	@Override
	public String toString() {
		return "RecommendationVo [recom_code=" + recom_code + ", user_id=" + user_id + ", recom_id=" + recom_id
				+ ", recom_contents=" + recom_contents + ", recom_relation=" + recom_relation + ", recom_date="
				+ recom_date + "]";
	}
	
}
