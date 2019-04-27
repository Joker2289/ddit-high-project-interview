package kr.or.ddit.page.model;


public class Page_sourceVo {
	
	private String source_code;		// 소스 코드
	private String page_code;		// 페이지 코드
	private String source_contents;	// 소스 내용
	private String source_mode;		// 소스 언어
	private String source_theme;	// 소스 테마
	private String css_top; 		// css top 좌표
	private String css_left;		// css left 좌표
	
	public String getSource_code() {
		return source_code;
	}
	public void setSource_code(String source_code) {
		this.source_code = source_code;
	}
	public String getPage_code() {
		return page_code;
	}
	public void setPage_code(String page_code) {
		this.page_code = page_code;
	}
	public String getSource_contents() {
		return source_contents;
	}
	public void setSource_contents(String source_contents) {
		this.source_contents = source_contents;
	}
	public String getSource_mode() {
		return source_mode;
	}
	public void setSource_mode(String source_mode) {
		this.source_mode = source_mode;
	}
	public String getSource_theme() {
		return source_theme;
	}
	public void setSource_theme(String source_theme) {
		this.source_theme = source_theme;
	}
	public String getCss_top() {
		return css_top;
	}
	public void setCss_top(String css_top) {
		this.css_top = css_top;
	}
	public String getCss_left() {
		return css_left;
	}
	public void setCss_left(String css_left) {
		this.css_left = css_left;
	}
	@Override
	public String toString() {
		return "Page_sourceVo [source_code=" + source_code + ", page_code=" + page_code + ", source_contents="
				+ source_contents + ", source_mode=" + source_mode + ", source_theme=" + source_theme + ", css_top="
				+ css_top + ", css_left=" + css_left + "]";
	}

}
