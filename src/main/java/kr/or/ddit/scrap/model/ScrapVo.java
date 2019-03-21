package kr.or.ddit.scrap.model;

public class ScrapVo {
	private String scrap_code;		// 스크랩코드
	private String page_code;		// 페이지코드
	private String user_id;			// 회원아이디
	private String write_id;		// 원본작성자
	private String scrap_title;		// 제목
	private String scrap_contents;	// 내용
	private String scrap_date;		// 스크랩날짜
	
	public ScrapVo() {
		// TODO Auto-generated constructor stub
	}

	public String getScrap_code() {
		return scrap_code;
	}

	public void setScrap_code(String scrap_code) {
		this.scrap_code = scrap_code;
	}

	public String getPage_code() {
		return page_code;
	}

	public void setPage_code(String page_code) {
		this.page_code = page_code;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getWrite_id() {
		return write_id;
	}

	public void setWrite_id(String write_id) {
		this.write_id = write_id;
	}

	public String getScrap_title() {
		return scrap_title;
	}

	public void setScrap_title(String scrap_title) {
		this.scrap_title = scrap_title;
	}

	public String getScrap_contents() {
		return scrap_contents;
	}

	public void setScrap_contents(String scrap_contents) {
		this.scrap_contents = scrap_contents;
	}

	public String getScrap_date() {
		return scrap_date;
	}

	public void setScrap_date(String scrap_date) {
		this.scrap_date = scrap_date;
	}

	@Override
	public String toString() {
		return "ScrapVo [scrap_code=" + scrap_code + ", page_code=" + page_code + ", user_id=" + user_id + ", write_id="
				+ write_id + ", scrap_title=" + scrap_title + ", scrap_contents=" + scrap_contents + ", scrap_date="
				+ scrap_date + "]";
	}
	
}
