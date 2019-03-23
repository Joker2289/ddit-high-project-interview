package kr.or.ddit.page.model;

public class PageVo {
	private String page_code;		// 페이지코드
	private String section_code;	// 섹션코드
	private String page_title;		// 페이지제목
	private String page_contents;	// 페이지내용
	private String write_date;		// 작성일
	private String scrap_count;		// 스크랩수
	@Override
	public String toString() {
		return "PageVo [page_code=" + page_code + ", section_code=" + section_code + ", page_title=" + page_title
				+ ", page_contents=" + page_contents + ", write_date=" + write_date + ", scrap_count=" + scrap_count
				+ "]";
	}
	public PageVo() {
		// TODO Auto-generated constructor stub
	}
	public String getPage_code() {
		return page_code;
	}
	public void setPage_code(String page_code) {
		this.page_code = page_code;
	}
	public String getSection_code() {
		return section_code;
	}
	public void setSection_code(String section_code) {
		this.section_code = section_code;
	}
	public String getPage_title() {
		return page_title;
	}
	public void setPage_title(String page_title) {
		this.page_title = page_title;
	}
	public String getPage_contents() {
		return page_contents;
	}
	public void setPage_contents(String page_contents) {
		this.page_contents = page_contents;
	}
	public String getWrite_date() {
		return write_date;
	}
	public void setWrite_date(String write_date) {
		this.write_date = write_date;
	}
	public String getScrap_count() {
		return scrap_count;
	}
	public void setScrap_count(String scrap_count) {
		this.scrap_count = scrap_count;
	}
	
}
