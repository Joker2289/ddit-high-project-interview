package kr.or.ddit.page.model;

import java.util.Date;

public class PageVo {
	
	private String page_code;		// 페이지코드
	private String section_code;	// 섹션코드
	private String page_title;		// 페이지제목
	private String page_contents;	// 페이지내용
	private Date write_date;		// 작성일
	private String view_count; 		// 조회수
	private String page_thumbnail;	// 페이지 썸네일 이미지
	private String bg_color;		// 페이지 배경색
	
	
	private String user_id; 		// 작성자 ID
	private String portfolio_code;	// 포트폴리오 코드
	
	private String good_cnt;		// 좋아요 수
	private String comment_cnt;		// 댓글 수
	
	private String search_word;		//검색어

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

	public Date getWrite_date() {
		return write_date;
	}

	public void setWrite_date(Date write_date) {
		this.write_date = write_date;
	}

	public String getView_count() {
		return view_count;
	}

	public void setView_count(String view_count) {
		this.view_count = view_count;
	}

	public String getPage_thumbnail() {
		return page_thumbnail;
	}

	public void setPage_thumbnail(String page_thumbnail) {
		this.page_thumbnail = page_thumbnail;
	}

	public String getBg_color() {
		return bg_color;
	}

	public void setBg_color(String bg_color) {
		this.bg_color = bg_color;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getPortfolio_code() {
		return portfolio_code;
	}

	public void setPortfolio_code(String portfolio_code) {
		this.portfolio_code = portfolio_code;
	}

	public String getGood_cnt() {
		return good_cnt;
	}

	public void setGood_cnt(String good_cnt) {
		this.good_cnt = good_cnt;
	}

	public String getComment_cnt() {
		return comment_cnt;
	}

	public void setComment_cnt(String comment_cnt) {
		this.comment_cnt = comment_cnt;
	}

	public String getSearch_word() {
		return search_word;
	}

	public void setSearch_word(String search_word) {
		this.search_word = search_word;
	}

	@Override
	public String toString() {
		return "PageVo [page_code=" + page_code + ", section_code=" + section_code + ", page_title=" + page_title
				+ ", page_contents=" + page_contents + ", write_date=" + write_date + ", view_count=" + view_count
				+ ", page_thumbnail=" + page_thumbnail + ", bg_color=" + bg_color + ", user_id=" + user_id
				+ ", portfolio_code=" + portfolio_code + ", good_cnt=" + good_cnt + ", comment_cnt=" + comment_cnt
				+ ", search_word=" + search_word + "]";
	}

	
}
