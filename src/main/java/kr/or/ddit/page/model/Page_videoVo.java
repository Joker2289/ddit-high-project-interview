package kr.or.ddit.page.model;


public class Page_videoVo {
	
	private String video_code;		// 소스 코드
	private String page_code;		// 페이지 코드
	private String video_link;		// 소스 내용
	private String video_css_top; 		// css top 좌표
	private String video_css_left;		// css left 좌표
	public String getVideo_code() {
		return video_code;
	}
	public void setVideo_code(String video_code) {
		this.video_code = video_code;
	}
	public String getPage_code() {
		return page_code;
	}
	public void setPage_code(String page_code) {
		this.page_code = page_code;
	}
	public String getVideo_link() {
		return video_link;
	}
	public void setVideo_link(String video_link) {
		this.video_link = video_link;
	}
	public String getVideo_css_top() {
		return video_css_top;
	}
	public void setVideo_css_top(String video_css_top) {
		this.video_css_top = video_css_top;
	}
	public String getVideo_css_left() {
		return video_css_left;
	}
	public void setVideo_css_left(String video_css_left) {
		this.video_css_left = video_css_left;
	}
	@Override
	public String toString() {
		return "Page_videoVo [video_code=" + video_code + ", page_code=" + page_code + ", video_link=" + video_link
				+ ", video_css_top=" + video_css_top + ", video_css_left=" + video_css_left + "]";
	}
	
	
}
