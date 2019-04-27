package kr.or.ddit.page.model;

public class Page_linkVo {
	
	private String link_code;			// 링크 코드
	private String page_code;			// 페이지 코드
	private String link_address;		// 링크 주소
	private String link_css_top; 		// css top 좌표
	private String link_css_left;		// css left 좌표
	
	public String getLink_code() {
		return link_code;
	}
	public void setLink_code(String link_code) {
		this.link_code = link_code;
	}
	public String getPage_code() {
		return page_code;
	}
	public void setPage_code(String page_code) {
		this.page_code = page_code;
	}
	public String getLink_address() {
		return link_address;
	}
	public void setLink_address(String link_address) {
		this.link_address = link_address;
	}
	public String getLink_css_top() {
		return link_css_top;
	}
	public void setLink_css_top(String link_css_top) {
		this.link_css_top = link_css_top;
	}
	public String getLink_css_left() {
		return link_css_left;
	}
	public void setLink_css_left(String link_css_left) {
		this.link_css_left = link_css_left;
	}
	@Override
	public String toString() {
		return "Page_linkVo [link_code=" + link_code + ", page_code=" + page_code + ", link_address=" + link_address
				+ ", link_css_top=" + link_css_top + ", link_css_left=" + link_css_left + "]";
	}
	
	
}
